class Hangman
    attr_accessor :guesses, :lives, :word

    def initialize
        @guesses = []
        @lives = 7
        @word = words.sample
    end

    def words
        return [
            ['apple', "Granny Smith's finest"],
            ['donkey', "This creature slaves away for nothing"]
        ]
    end

    def start
        puts 'Welcome to a new game of Hangman!'
        puts "The word we want you to guess is #{@word.first.size} characters long."
        puts "You start with #{@lives} lives, and you lose 1 life for each character you guess incorrectly."
        puts 'You can exit at any point by typing in "Exit"'
    end

    def guess
        puts "You have #{@lives} lives remaining"
        print_teaser
        puts 'Guess a character'
        char = gets.chomp
        puts "\n"
        if char.downcase == 'exit'
            puts 'Thank you for playing'
            exit
        end
        if @word.first.include? char
            puts 'Good guess!'
            @guesses.push(char)
            if @guesses.uniq.length == @word.first.split('').uniq.length
                puts "Congratulations! You won with #{@lives} lives remaining!"
                exit
            end
        else
            puts 'Unlucky, try again!'
            @lives -= 1
            if @lives == 0
                puts "Game over! Better luck next time."
                exit
            end
        end
        guess
    end

    def print_teaser
        teaser_chars = []
        @word.first.split('').each do |char|
            if @guesses.include? char
                teaser_chars.push(char)
            else
                teaser_chars.push('_')
            end
        end
        puts teaser_chars.join(' ')
    end

    def play
        start
        guess
    end
end

hangman = Hangman.new
hangman.play