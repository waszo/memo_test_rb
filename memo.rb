require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
   
    puts "拡張子を除いたファイルを入力してください。"
     file_name= gets.chomp
     
    puts "メモしたい内容を記入してください"
    puts "終了後、Ctrl + Dを押します。"
     input_memo = STDIN.read
     memo = input_memo.chomp
     CSV.open("#{file_name}.csv","w") do |csv|
     csv.puts ["#{memo}"]
    
   end   
  elsif memo_type == 2
     puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
      name= gets.chomp
      require 'csv'
      memo_list=CSV.read("#{name}.csv") 
      p memo_list
     puts"編集したい内容を入力してください"
     puts "終了後、Ctrl + D　を押します。"
      input_memo = STDIN.read
      memo = input_memo.chomp
      CSV.open("#{name}.csv","a") do |csv|
      csv.puts ["#{memo}"]
  end
  
 else
    puts"1か2の数字を入力してください"
end