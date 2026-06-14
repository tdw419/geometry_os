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

        // String literal: ." ..."
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

        // String literal: S" ..."
        if ch == 'S' && matches!(chars.clone().nth(1), Some('"')) {
            chars.next(); // S
            chars.next(); // "
            col += 2;
            let mut string_text = String::new();
            string_text.push_str("S\""); // include the S" prefix
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

        // Inline assembly block: ASM{ ... }
        let is_asm_block = ch == 'A'
            && matches!(chars.clone().nth(1), Some('S'))
            && matches!(chars.clone().nth(2), Some('M'))
            && matches!(chars.clone().nth(3), Some('{'));
        if is_asm_block {
            // Consume "ASM{"
            chars.next(); // A
            chars.next(); // S
            chars.next(); // M
            chars.next(); // {
            col += 4;
            let mut asm_text = String::from("ASM{");
            let mut brace_depth = 1;
            while let Some(&c) = chars.peek() {
                chars.next();
                col += 1;
                if c == '\n' {
                    line += 1;
                    col = 1;
                }
                if c == '{' {
                    brace_depth += 1;
                } else if c == '}' {
                    brace_depth -= 1;
                    if brace_depth == 0 {
                        asm_text.push('}');
                        break;
                    }
                }
                asm_text.push(c);
            }
            tokens.push(Token::new(&asm_text, line, col));
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
        assert_eq!(
            texts,
            vec!["0", "42", "-7", "255", "0xFF", "0x1A3F", "$ABCD"]
        );
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
        assert_eq!(
            texts,
            vec![
                "DUP", "DROP", "SWAP", "OVER", "NIP", "TUCK", "ROT", "2DUP", "2DROP", "2SWAP",
                "?DUP"
            ]
        );
    }

    #[test]
    fn test_arithmetic_words() {
        let source = "+ - * / MOD /MOD NEGATE ABS MIN MAX 1+ 1- 2+ 2- 2* 2/";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(
            texts,
            vec![
                "+", "-", "*", "/", "MOD", "/MOD", "NEGATE", "ABS", "MIN", "MAX", "1+", "1-", "2+",
                "2-", "2*", "2/"
            ]
        );
    }

    #[test]
    fn test_comparison_words() {
        let source = "= <> < > <= >= 0= 0< 0>";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(
            texts,
            vec!["=", "<>", "<", ">", "<=", ">=", "0=", "0<", "0>"]
        );
    }

    #[test]
    fn test_control_flow_words() {
        let source = "IF ELSE THEN DO ?DO LOOP +LOOP I J LEAVE BEGIN UNTIL AGAIN WHILE REPEAT";
        let tokens = tokenize(source);
        let texts: Vec<&str> = tokens.iter().map(|t| t.text.as_str()).collect();
        assert_eq!(
            texts,
            vec![
                "IF", "ELSE", "THEN", "DO", "?DO", "LOOP", "+LOOP", "I", "J", "LEAVE", "BEGIN",
                "UNTIL", "AGAIN", "WHILE", "REPEAT"
            ]
        );
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
        assert_eq!(
            texts,
            vec!["AND", "OR", "XOR", "INVERT", "LSHIFT", "RSHIFT"]
        );
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
        assert_eq!(
            texts,
            vec![
                ":",
                "SQUARE",
                "DUP",
                "*",
                ";",
                ":",
                "CUBE",
                "DUP",
                "SQUARE",
                "*",
                ";",
                "10",
                "SQUARE",
                "20",
                "CUBE",
                ".\" hello\"",
            ]
        );
    }

    #[test]
    fn test_s_quote_string() {
        let tokens = tokenize("S\" hello\"");
        assert_eq!(tokens.len(), 1);
        assert_eq!(tokens[0].text, "S\" hello\"");
    }

    #[test]
    fn test_s_quote_empty() {
        let tokens = tokenize("S\" \"");
        assert_eq!(tokens.len(), 1);
        assert_eq!(tokens[0].text, "S\" \"");
    }

    #[test]
    fn test_s_quote_with_spaces() {
        let tokens = tokenize("S\" hello world\"");
        assert_eq!(tokens.len(), 1);
        assert!(tokens[0].text.starts_with("S\""));
        assert!(tokens[0].text.ends_with("\""));
    }

    #[test]
    fn test_s_quote_and_dot_quote_together() {
        let tokens = tokenize(".\" out\" S\" data\"");
        assert_eq!(tokens.len(), 2);
        assert_eq!(tokens[0].text, ".\" out\"");
        assert_eq!(tokens[1].text, "S\" data\"");
    }

    // ── Inline ASM blocks ──────────────────────────────────────────────

    #[test]
    fn test_asm_inline_single_line() {
        let tokens = tokenize("ASM{LDI r2, 0xFF}");
        assert_eq!(tokens.len(), 1);
        assert_eq!(tokens[0].text, "ASM{LDI r2, 0xFF}");
    }

    #[test]
    fn test_asm_inline_multi_line() {
        let tokens = tokenize("ASM{\n  LDI r2, 0xFF\n  STORE r5, r2\n}");
        assert_eq!(tokens.len(), 1);
        let text = &tokens[0].text;
        assert!(text.starts_with("ASM{"));
        assert!(text.ends_with("}"));
        assert!(text.contains("LDI r2, 0xFF"));
        assert!(text.contains("STORE r5, r2"));
    }

    #[test]
    fn test_asm_with_forth_words() {
        let tokens = tokenize("10 DUP ASM{LDI r2, 0x0F} AND");
        assert_eq!(tokens.len(), 4);
        assert_eq!(tokens[2].text, "ASM{LDI r2, 0x0F}");
        assert_eq!(tokens[3].text, "AND");
    }

    #[test]
    fn test_asm_empty_block() {
        let tokens = tokenize("ASM{}");
        assert_eq!(tokens.len(), 1);
        assert_eq!(tokens[0].text, "ASM{}");
    }
}
