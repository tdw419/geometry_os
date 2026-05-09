// lexer.rs — Forth tokenizer for geo_forth

/// A single Forth token with source location info.
#[derive(Debug, Clone)]
pub struct Token {
    pub text: String,
    pub line: usize,
    pub col: usize,
}

impl Token {
    pub fn new(text: &str, line: usize, col: usize) -> Self {
        Token {
            text: text.to_string(),
            line,
            col,
        }
    }
}

/// Tokenize Forth source into a flat list of tokens.
/// Comments: \ (line comment), ( ... ) (inline comment)
/// Strings: ." ... " (print string)
pub fn tokenize(source: &str) -> Vec<Token> {
    let mut tokens = Vec::new();
    let mut line = 1usize;
    let mut col = 1usize;
    let mut chars = source.chars().peekable();

    while let Some(&ch) = chars.peek() {
        // Whitespace
        if ch.is_whitespace() {
            if ch == '\n' {
                line += 1;
                col = 1;
            } else {
                col += 1;
            }
            chars.next();
            continue;
        }

        // Line comment: \ to end of line
        if ch == '\\' {
            chars.next();
            while let Some(&c) = chars.peek() {
                chars.next();
                if c == '\n' {
                    line += 1;
                    col = 1;
                    break;
                }
            }
            continue;
        }

        // Inline comment: ( ... )
        if ch == '(' && matches!(chars.clone().nth(1), Some(' ')) {
            chars.next(); // (
            chars.next(); // space
            col += 2;
            let mut depth = 1;
            while let Some(&c) = chars.peek() {
                chars.next();
                col += 1;
                if c == '\n' {
                    line += 1;
                    col = 1;
                }
                if c == '(' {
                    depth += 1;
                } else if c == ')' {
                    depth -= 1;
                    if depth == 0 {
                        break;
                    }
                }
            }
            continue;
        }

        // String literal: ." ... "
        if ch == '.' && matches!(chars.clone().nth(1), Some('"')) {
            chars.next(); // .
            chars.next(); // "
            col += 2;
            let mut string_text = String::new();
            string_text.push_str(".\""); // include the ." prefix
            while let Some(&c) = chars.peek() {
                chars.next();
                col += 1;
                if c == '\n' {
                    line += 1;
                    col = 1;
                }
                string_text.push(c);
                if c == '"' {
                    break;
                }
            }
            tokens.push(Token::new(&string_text, line, col));
            continue;
        }

        // Regular word
        let start_col = col;
        let mut word = String::new();
        while let Some(&c) = chars.peek() {
            if c.is_whitespace() || c == '\\' {
                break;
            }
            // Also break on ( for comment, but only if preceded by space
            if c == '(' && !word.is_empty() {
                break;
            }
            word.push(c);
            chars.next();
            col += 1;
        }

        if !word.is_empty() {
            tokens.push(Token::new(&word, line, start_col));
        }
    }

    tokens
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_empty_input() {
        let tokens = tokenize("");
        assert!(tokens.is_empty());
    }

    #[test]
    fn test_whitespace_only() {
        let tokens = tokenize("   \t  \n\n  ");
        assert!(tokens.is_empty());
    }

    #[test]
    fn test_single_word() {
        let tokens = tokenize("DUP");
        assert_eq!(tokens.len(), 1);
        assert_eq!(tokens[0].text, "DUP");
        assert_eq!(tokens[0].line, 1);
        assert_eq!(tokens[0].col, 1);
    }

    #[test]
    fn test_multiple_words() {
        let tokens = tokenize("1 2 + .");
        assert_eq!(tokens.len(), 4);
        assert_eq!(tokens[0].text, "1");
        assert_eq!(tokens[1].text, "2");
        assert_eq!(tokens[2].text, "+");
        assert_eq!(tokens[3].text, ".");
    }

    #[test]
    fn test_number_literals() {
        let tokens = tokenize("0 42 -7 255 0xFF 0x1A3F $ABCD");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["0", "42", "-7", "255", "0xFF", "0x1A3F", "$ABCD"]);
    }

    #[test]
    fn test_colon_definition() {
        let tokens = tokenize(": SQUARE DUP * ;");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec![":", "SQUARE", "DUP", "*", ";"]);
    }

    #[test]
    fn test_line_comment_backslash() {
        let tokens = tokenize("DUP \\ this is a comment\nDROP");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["DUP", "DROP"]);
        assert_eq!(tokens[0].line, 1);
        assert_eq!(tokens[1].line, 2);
    }

    #[test]
    fn test_inline_comment_paren() {
        let tokens = tokenize("DUP ( this is a comment ) DROP");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["DUP", "DROP"]);
    }

    #[test]
    fn test_inline_comment_multiline() {
        let tokens = tokenize("DUP ( comment\nspanning lines ) DROP");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["DUP", "DROP"]);
        // Line 2: newline increments line when parsing continues after the comment
        assert_eq!(tokens[1].line, 2);
    }

    #[test]
    fn test_dot_quote_string() {
        let tokens = tokenize(".\" hello world\"");
        assert_eq!(tokens.len(), 1);
        // Tokenizer preserves the space after ." prefix
        assert_eq!(tokens[0].text, ".\" hello world\"");
    }

    #[test]
    fn test_dot_quote_string_with_spaces() {
        let tokens = tokenize(".\"  foo bar  baz  \"");
        assert_eq!(tokens.len(), 1);
        assert!(tokens[0].text.starts_with(".\""));
        assert!(tokens[0].text.ends_with("\""));
    }

    #[test]
    fn test_dot_quote_multiline() {
        let tokens = tokenize(".\" line1\nline2\"");
        assert_eq!(tokens.len(), 1);
        // Line is set when the closing quote is found (line 2)
        assert_eq!(tokens[0].line, 2);
    }

    #[test]
    fn test_variable_declaration() {
        let tokens = tokenize("VARIABLE counter");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["VARIABLE", "counter"]);
    }

    #[test]
    fn test_line_tracking() {
        let tokens = tokenize("a\nb\nc");
        assert_eq!(tokens.len(), 3);
        assert_eq!(tokens[0].line, 1);
        assert_eq!(tokens[1].line, 2);
        assert_eq!(tokens[2].line, 3);
    }

    #[test]
    fn test_col_tracking() {
        let tokens = tokenize("hello world");
        assert_eq!(tokens[0].col, 1);
        assert_eq!(tokens[1].col, 7);
    }

    #[test]
    fn test_tab_separated_words() {
        let tokens = tokenize("one\ttwo\tthree");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["one", "two", "three"]);
    }

    #[test]
    fn test_stack_manipulation_words() {
        let source = "DUP DROP SWAP OVER NIP TUCK ROT 2DUP 2DROP 2SWAP ?DUP";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["DUP", "DROP", "SWAP", "OVER", "NIP", "TUCK", "ROT", "2DUP", "2DROP", "2SWAP", "?DUP"]);
    }

    #[test]
    fn test_arithmetic_words() {
        let source = "+ - * / MOD /MOD NEGATE ABS MIN MAX 1+ 1- 2+ 2- 2* 2/";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["+", "-", "*", "/", "MOD", "/MOD", "NEGATE", "ABS", "MIN", "MAX", "1+", "1-", "2+", "2-", "2*", "2/"]);
    }

    #[test]
    fn test_comparison_words() {
        let source = "= <> < > <= >= 0= 0< 0>";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["=", "<>", "<", ">", "<=", ">=", "0=", "0<", "0>"]);
    }

    #[test]
    fn test_control_flow_words() {
        let source = "IF ELSE THEN DO ?DO LOOP +LOOP I J LEAVE BEGIN UNTIL AGAIN WHILE REPEAT";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["IF", "ELSE", "THEN", "DO", "?DO", "LOOP", "+LOOP", "I", "J", "LEAVE", "BEGIN", "UNTIL", "AGAIN", "WHILE", "REPEAT"]);
    }

    #[test]
    fn test_memory_words() {
        let source = "@ ! +! C@ C! ALLOT HERE";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["@", "!", "+!", "C@", "C!", "ALLOT", "HERE"]);
    }

    #[test]
    fn test_output_words() {
        let source = ". EMIT CR SPACE SPACES";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec![".", "EMIT", "CR", "SPACE", "SPACES"]);
    }

    #[test]
    fn test_bitwise_words() {
        let source = "AND OR XOR INVERT LSHIFT RSHIFT";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["AND", "OR", "XOR", "INVERT", "LSHIFT", "RSHIFT"]);
    }

    #[test]
    fn test_constants() {
        let tokens = tokenize("TRUE FALSE");
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["TRUE", "FALSE"]);
    }

    #[test]
    fn test_paren_not_at_word_boundary() {
        // '(' without leading space should be part of a word, not a comment
        let tokens = tokenize("abc(def");
        // The '(' breaks the word because of the break condition at line 113
        // Actually: word="abc" then '(' starts but word is not empty so it breaks
        // Then '(' is consumed as a new word start (no leading space so not comment)
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["abc", "(def"]);
    }

    #[test]
    fn test_backslash_in_word() {
        // Backslash mid-word should break tokenization
        let tokens = tokenize("abc\\def");
        // '\' causes a break in the while loop (line 109), so "abc" is emitted
        // Then '\' triggers the comment handler which skips to end of line
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec!["abc"]);
    }

    #[test]
    fn test_complete_program() {
        let source = r#"
\ A simple Forth program
: SQUARE DUP * ;
: CUBE DUP SQUARE * ;
10 SQUARE
20 CUBE
." hello"
"#;
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(texts, vec![
            ":", "SQUARE", "DUP", "*", ";",
            ":", "CUBE", "DUP", "SQUARE", "*", ";",
            "10", "SQUARE",
            "20", "CUBE",
            ".\" hello\"",
        ]);
    }
}
