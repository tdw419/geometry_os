//! Lexer for GeoLang — tokenizes source into a flat token stream.

use std::fmt;

/// Token kinds for GeoLang.
#[derive(Debug, Clone, PartialEq)]
pub enum TokenKind {
    // Literals
    Int(u64),
    Ident(String),

    // Keywords
    Fn,
    Let,
    Return,
    While,
    If,
    Else,
    True,
    False,

    // Operators
    Plus,       // +
    Minus,      // -
    Star,       // *
    Slash,      // /
    Eq,         // ==
    Ne,         // !=
    Lt,         // <
    Gt,         // >
    Le,         // <=
    Ge,         // >=
    Assign,     // =
    Not,        // !

    // Delimiters
    LParen,     // (
    RParen,     // )
    LBrace,     // {
    RBrace,     // }
    Comma,      // ,
    Semicolon,  // ;

    // Special
    Eof,
}

/// A token with location info.
#[derive(Debug, Clone)]
pub struct Token {
    pub kind: TokenKind,
    pub line: usize,
    pub col: usize,
}

impl fmt::Display for TokenKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            TokenKind::Int(n) => write!(f, "{}", n),
            TokenKind::Ident(s) => write!(f, "{}", s),
            TokenKind::Fn => write!(f, "fn"),
            TokenKind::Let => write!(f, "let"),
            TokenKind::Return => write!(f, "return"),
            TokenKind::While => write!(f, "while"),
            TokenKind::If => write!(f, "if"),
            TokenKind::Else => write!(f, "else"),
            TokenKind::True => write!(f, "true"),
            TokenKind::False => write!(f, "false"),
            TokenKind::Plus => write!(f, "+"),
            TokenKind::Minus => write!(f, "-"),
            TokenKind::Star => write!(f, "*"),
            TokenKind::Slash => write!(f, "/"),
            TokenKind::Eq => write!(f, "=="),
            TokenKind::Ne => write!(f, "!="),
            TokenKind::Lt => write!(f, "<"),
            TokenKind::Gt => write!(f, ">"),
            TokenKind::Le => write!(f, "<="),
            TokenKind::Ge => write!(f, ">="),
            TokenKind::Assign => write!(f, "="),
            TokenKind::Not => write!(f, "!"),
            TokenKind::LParen => write!(f, "("),
            TokenKind::RParen => write!(f, ")"),
            TokenKind::LBrace => write!(f, "{{"),
            TokenKind::RBrace => write!(f, "}}"),
            TokenKind::Comma => write!(f, ","),
            TokenKind::Semicolon => write!(f, ";"),
            TokenKind::Eof => write!(f, "<eof>"),
        }
    }
}

/// Lexer state.
pub struct Lexer {
    source: Vec<char>,
    pos: usize,
    line: usize,
    col: usize,
}

impl Lexer {
    pub fn new(source: &str) -> Self {
        Self {
            source: source.chars().collect(),
            pos: 0,
            line: 1,
            col: 1,
        }
    }

    fn peek(&self) -> Option<char> {
        self.source.get(self.pos).copied()
    }

    fn advance(&mut self) -> Option<char> {
        let ch = self.source.get(self.pos).copied();
        if let Some(c) = ch {
            self.pos += 1;
            if c == '\n' {
                self.line += 1;
                self.col = 1;
            } else {
                self.col += 1;
            }
        }
        ch
    }

    fn peek_at(&self, offset: usize) -> Option<char> {
        self.source.get(self.pos + offset).copied()
    }

    fn make_token(&self, kind: TokenKind) -> Token {
        Token {
            kind,
            line: self.line,
            col: self.col,
        }
    }

    /// Tokenize the entire source, returning all tokens.
    pub fn tokenize(mut self) -> Result<Vec<Token>, String> {
        let mut tokens = Vec::new();

        loop {
            // Skip whitespace and comments
            loop {
                match self.peek() {
                    Some(' ') | Some('\t') | Some('\r') | Some('\n') => {
                        self.advance();
                    }
                    Some('/') if self.peek_at(1) == Some('/') => {
                        // Line comment
                        while let Some(c) = self.peek() {
                            if c == '\n' { break; }
                            self.advance();
                        }
                    }
                    Some('/') if self.peek_at(1) == Some('*') => {
                        // Block comment
                        self.advance(); // /
                        self.advance(); // *
                        loop {
                            match self.peek() {
                                None => return Err("Unterminated block comment".to_string()),
                                Some('*') if self.peek_at(1) == Some('/') => {
                                    self.advance();
                                    self.advance();
                                    break;
                                }
                                _ => { self.advance(); }
                            }
                        }
                    }
                    _ => break,
                }
            }

            let ch = match self.peek() {
                Some(c) => c,
                None => {
                    tokens.push(self.make_token(TokenKind::Eof));
                    return Ok(tokens);
                }
            };

            let token = match ch {
                // Numbers
                '0'..='9' => {
                    let line = self.line;
                    let col = self.col;
                    let mut num = 0u64;
                    while let Some(c) = self.peek() {
                        if c.is_ascii_digit() {
                            num = num * 10 + (c as u64 - '0' as u64);
                            self.advance();
                        } else {
                            break;
                        }
                    }
                    Token { kind: TokenKind::Int(num), line, col }
                }

                // Identifiers and keywords
                'a'..='z' | 'A'..='Z' | '_' => {
                    let line = self.line;
                    let col = self.col;
                    let mut ident = String::new();
                    while let Some(c) = self.peek() {
                        if c.is_ascii_alphanumeric() || c == '_' {
                            ident.push(c);
                            self.advance();
                        } else {
                            break;
                        }
                    }
                    let kind = match ident.as_str() {
                        "fn" => TokenKind::Fn,
                        "let" => TokenKind::Let,
                        "return" => TokenKind::Return,
                        "while" => TokenKind::While,
                        "if" => TokenKind::If,
                        "else" => TokenKind::Else,
                        "true" => TokenKind::True,
                        "false" => TokenKind::False,
                        _ => TokenKind::Ident(ident),
                    };
                    Token { kind, line, col }
                }

                // Single/double-char operators
                '+' => { self.advance(); self.make_token(TokenKind::Plus) }
                '-' => { self.advance(); self.make_token(TokenKind::Minus) }
                '*' => { self.advance(); self.make_token(TokenKind::Star) }
                '/' => { self.advance(); self.make_token(TokenKind::Slash) }
                '(' => { self.advance(); self.make_token(TokenKind::LParen) }
                ')' => { self.advance(); self.make_token(TokenKind::RParen) }
                '{' => { self.advance(); self.make_token(TokenKind::LBrace) }
                '}' => { self.advance(); self.make_token(TokenKind::RBrace) }
                ',' => { self.advance(); self.make_token(TokenKind::Comma) }
                ';' => { self.advance(); self.make_token(TokenKind::Semicolon) }
                '!' => {
                    self.advance();
                    if self.peek() == Some('=') {
                        self.advance();
                        self.make_token(TokenKind::Ne)
                    } else {
                        self.make_token(TokenKind::Not)
                    }
                }
                '=' => {
                    self.advance();
                    if self.peek() == Some('=') {
                        self.advance();
                        self.make_token(TokenKind::Eq)
                    } else {
                        self.make_token(TokenKind::Assign)
                    }
                }
                '<' => {
                    self.advance();
                    if self.peek() == Some('=') {
                        self.advance();
                        self.make_token(TokenKind::Le)
                    } else {
                        self.make_token(TokenKind::Lt)
                    }
                }
                '>' => {
                    self.advance();
                    if self.peek() == Some('=') {
                        self.advance();
                        self.make_token(TokenKind::Ge)
                    } else {
                        self.make_token(TokenKind::Gt)
                    }
                }

                _ => {
                    return Err(format!(
                        "Unexpected character '{}' at line {} col {}",
                        ch, self.line, self.col
                    ));
                }
            };

            tokens.push(token);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic_tokens() {
        let src = "fn add(a, b) { return a + b; }";
        let tokens = Lexer::new(src).tokenize().unwrap();
        assert!(matches!(tokens[0].kind, TokenKind::Fn));
        assert!(matches!(tokens[1].kind, TokenKind::Ident(ref s) if s == "add"));
        assert!(matches!(tokens[2].kind, TokenKind::LParen));
    }

    #[test]
    fn test_operators() {
        let src = "<= >= == != + - * /";
        let tokens = Lexer::new(src).tokenize().unwrap();
        assert_eq!(tokens[0].kind, TokenKind::Le);
        assert_eq!(tokens[1].kind, TokenKind::Ge);
        assert_eq!(tokens[2].kind, TokenKind::Eq);
        assert_eq!(tokens[3].kind, TokenKind::Ne);
    }

    #[test]
    fn test_numbers() {
        let src = "42 0 9999";
        let tokens = Lexer::new(src).tokenize().unwrap();
        assert!(matches!(tokens[0].kind, TokenKind::Int(42)));
        assert!(matches!(tokens[1].kind, TokenKind::Int(0)));
        assert!(matches!(tokens[2].kind, TokenKind::Int(9999)));
    }

    #[test]
    fn test_comments() {
        let src = "// line comment\n42 /* block */ + 1";
        let tokens = Lexer::new(src).tokenize().unwrap();
        assert!(matches!(tokens[0].kind, TokenKind::Int(42)));
        assert!(matches!(tokens[1].kind, TokenKind::Plus));
        assert!(matches!(tokens[2].kind, TokenKind::Int(1)));
    }
}
