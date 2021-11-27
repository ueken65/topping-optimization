def sum_prices(toppings)
  toppings.sum { |t| t[:price] }
end

puts 'トッピングやオプションメニューで満たしたい最低金額を半角数字で入力'
min_price = gets.to_i

puts "\n"
puts 'トッピングやオプションメニューの個数を半角数字で入力'
n = gets.to_i

toppings = []

puts "\n"
puts 'トッピングやオプションメニューの名前と金額を入力'
puts '例：'
puts 'やさい 310'
puts '納豆 210'
puts "\n"
n.times do
  name, price = gets.chomp.split(" ")
  toppings << {name: name, price: price.to_i}
end

puts "\n"

all_combi=[]
toppings.count
        .times do |i|
          next if i > 5
          all_combi += toppings.combination(i + 1).to_a
        end

all_combi.filter { |toppings| sum_prices(toppings) >= min_price }
         .sort { |a, b| sum_prices(a) <=> sum_prices(b) }
         .take(100)
         .each { |toppings| puts "¥#{sum_prices(toppings)} [#{toppings.map { |t| t[:name] }.join(',')}]" }
