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
