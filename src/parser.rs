// ═══════════════════════════════════════════════════════════════════════
// GLYPH EXPRESSION PARSER
//
// Recursive-descent parser for arithmetic, comparison, and logical
// expressions.  Produces a typed AST that tests can inspect.
//
// Precedence (low → high):
//   ||
//   &&
//   ==  !=
//   <  >  <=  >=
//   +  -
//   *  /  %
//   unary !  unary -
// ═══════════════════════════════════════════════════════════════════════

/// Binary operators recognised by the parser.
#[derive(Debug, Clone, PartialEq)]
pub enum BinOp {
    Add,
    Subtract,
    Multiply,
    Divide,
    Modulo,
    Less,
    LessEqual,
    Greater,
    GreaterEqual,
    Equal,
    NotEqual,
    And,
    Or,
}

/// Unary operators recognised by the parser.
#[derive(Debug, Clone, PartialEq)]
pub enum UnOp {
    Negate,
    Not,
}

/// Expression AST nodes.
#[derive(Debug, Clone, PartialEq)]
pub enum Expr {
    /// Integer literal.
    Int(i64),
    /// Boolean literal.
    Bool(bool),
    /// Variable / identifier reference.
    Ref(String),
    /// Binary operation: left op right.
    Binary {
        op: BinOp,
        left: Box<Expr>,
        right: Box<Expr>,
    },
    /// Unary operation: op operand.
    Unary {
        op: UnOp,
        operand: Box<Expr>,
    },
    /// Grouped expression (preserves source-level parens in the tree).
    Group(Box<Expr>),
}

/// Tokens produced by the lexer.
#[derive(Debug, Clone, PartialEq)]
enum Token {
    Int(i64),
    Bool(bool),
    Ident(String),
    Plus,
    Minus,
    Star,
    Slash,
    Percent,
    Lt,
    Le,
    Gt,
    Ge,
    Eq,
    Ne,
    And,
    Or,
    Bang,
    LParen,
    RParen,
}

/// Errors that can arise during parsing.
#[derive(Debug, Clone, PartialEq)]
pub struct ParseError {
    pub message: String,
}

impl std::fmt::Display for ParseError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "ParseError: {}", self.message)
    }
}

impl std::error::Error for ParseError {}

// ─── Lexer ────────────────────────────────────────────────────────────

fn lex(input: &str) -> Result<Vec<Token>, ParseError> {
    let mut tokens = Vec::new();
    let mut chars = input.chars().peekable();

    while let Some(&ch) = chars.peek() {
        match ch {
            ' ' | '\t' | '\r' | '\n' => {
                chars.next();
            }
            '0'..='9' => {
                let mut num = String::new();
                while let Some(&d) = chars.peek() {
                    if d.is_ascii_digit() {
                        num.push(d);
                        chars.next();
                    } else {
                        break;
                    }
                }
                tokens.push(Token::Int(num.parse::<i64>().unwrap()));
            }
            'a'..='z' | 'A'..='Z' | '_' => {
                let mut ident = String::new();
                while let Some(&c) = chars.peek() {
                    if c.is_ascii_alphanumeric() || c == '_' {
                        ident.push(c);
                        chars.next();
                    } else {
                        break;
                    }
                }
                match ident.as_str() {
                    "true" => tokens.push(Token::Bool(true)),
                    "false" => tokens.push(Token::Bool(false)),
                    _ => tokens.push(Token::Ident(ident)),
                }
            }
            '+' => { chars.next(); tokens.push(Token::Plus); }
            '-' => { chars.next(); tokens.push(Token::Minus); }
            '*' => { chars.next(); tokens.push(Token::Star); }
            '/' => { chars.next(); tokens.push(Token::Slash); }
            '%' => { chars.next(); tokens.push(Token::Percent); }
            '<' => {
                chars.next();
                if chars.peek() == Some(&'=') {
                    chars.next();
                    tokens.push(Token::Le);
                } else {
                    tokens.push(Token::Lt);
                }
            }
            '>' => {
                chars.next();
                if chars.peek() == Some(&'=') {
                    chars.next();
                    tokens.push(Token::Ge);
                } else {
                    tokens.push(Token::Gt);
                }
            }
            '=' => {
                chars.next();
                if chars.peek() == Some(&'=') {
                    chars.next();
                    tokens.push(Token::Eq);
                } else {
                    return Err(ParseError {
                        message: format!("unexpected character '=' (did you mean '==')?"),
                    });
                }
            }
            '!' => {
                chars.next();
                if chars.peek() == Some(&'=') {
                    chars.next();
                    tokens.push(Token::Ne);
                } else {
                    tokens.push(Token::Bang);
                }
            }
            '&' => {
                chars.next();
                if chars.peek() == Some(&'&') {
                    chars.next();
                    tokens.push(Token::And);
                } else {
                    return Err(ParseError {
                        message: "unexpected '&'; did you mean '&&'?".to_string(),
                    });
                }
            }
            '|' => {
                chars.next();
                if chars.peek() == Some(&'|') {
                    chars.next();
                    tokens.push(Token::Or);
                } else {
                    return Err(ParseError {
                        message: "unexpected '|'; did you mean '||'?".to_string(),
                    });
                }
            }
            '(' => { chars.next(); tokens.push(Token::LParen); }
            ')' => { chars.next(); tokens.push(Token::RParen); }
            _ => {
                return Err(ParseError {
                    message: format!("unexpected character '{}'", ch),
                });
            }
        }
    }

    Ok(tokens)
}

// ─── Recursive-descent parser ─────────────────────────────────────────

/// Top-level entry point: lex + parse an expression string.
pub fn parse_expression(input: &str) -> Result<Expr, ParseError> {
    let tokens = lex(input)?;
    if tokens.is_empty() {
        return Err(ParseError {
            message: "empty expression".to_string(),
        });
    }
    let mut pos = 0usize;
    let expr = parse_or(&tokens, &mut pos)?;
    if pos < tokens.len() {
        return Err(ParseError {
            message: format!("unexpected token after expression at position {}", pos),
        });
    }
    Ok(expr)
}

/// Parse only: given a pre-lexed token stream.
pub fn parse_expression_tokens(tokens: &[Token]) -> Result<Expr, ParseError> {
    if tokens.is_empty() {
        return Err(ParseError {
            message: "empty expression".to_string(),
        });
    }
    let mut pos = 0usize;
    let expr = parse_or(tokens, &mut pos)?;
    if pos < tokens.len() {
        return Err(ParseError {
            message: format!("unexpected token after expression at position {}", pos),
        });
    }
    Ok(expr)
}

fn peek(tokens: &[Token], pos: &usize) -> Option<&Token> {
    tokens.get(*pos)
}

fn advance(pos: &mut usize) {
    *pos += 1;
}

// ─── Precedence levels (low → high) ───────────────────────────────────

fn parse_or(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    let mut left = parse_and(tokens, pos)?;
    while let Some(Token::Or) = peek(tokens, pos) {
        advance(pos);
        let right = parse_and(tokens, pos)?;
        left = Expr::Binary {
            op: BinOp::Or,
            left: Box::new(left),
            right: Box::new(right),
        };
    }
    Ok(left)
}

fn parse_and(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    let mut left = parse_equality(tokens, pos)?;
    while let Some(Token::And) = peek(tokens, pos) {
        advance(pos);
        let right = parse_equality(tokens, pos)?;
        left = Expr::Binary {
            op: BinOp::And,
            left: Box::new(left),
            right: Box::new(right),
        };
    }
    Ok(left)
}

fn parse_equality(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    let mut left = parse_comparison(tokens, pos)?;
    loop {
        match peek(tokens, pos) {
            Some(Token::Eq) => {
                advance(pos);
                let right = parse_comparison(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Equal,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            Some(Token::Ne) => {
                advance(pos);
                let right = parse_comparison(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::NotEqual,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            _ => break,
        }
    }
    Ok(left)
}

fn parse_comparison(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    let mut left = parse_additive(tokens, pos)?;
    loop {
        match peek(tokens, pos) {
            Some(Token::Lt) => {
                advance(pos);
                let right = parse_additive(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Less,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            Some(Token::Le) => {
                advance(pos);
                let right = parse_additive(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::LessEqual,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            Some(Token::Gt) => {
                advance(pos);
                let right = parse_additive(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Greater,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            Some(Token::Ge) => {
                advance(pos);
                let right = parse_additive(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::GreaterEqual,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            _ => break,
        }
    }
    Ok(left)
}

fn parse_additive(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    let mut left = parse_multiplicative(tokens, pos)?;
    loop {
        match peek(tokens, pos) {
            Some(Token::Plus) => {
                advance(pos);
                let right = parse_multiplicative(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Add,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            Some(Token::Minus) => {
                advance(pos);
                let right = parse_multiplicative(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Subtract,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            _ => break,
        }
    }
    Ok(left)
}

fn parse_multiplicative(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    let mut left = parse_unary(tokens, pos)?;
    loop {
        match peek(tokens, pos) {
            Some(Token::Star) => {
                advance(pos);
                let right = parse_unary(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Multiply,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            Some(Token::Slash) => {
                advance(pos);
                let right = parse_unary(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Divide,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            Some(Token::Percent) => {
                advance(pos);
                let right = parse_unary(tokens, pos)?;
                left = Expr::Binary {
                    op: BinOp::Modulo,
                    left: Box::new(left),
                    right: Box::new(right),
                };
            }
            _ => break,
        }
    }
    Ok(left)
}

fn parse_unary(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    match peek(tokens, pos) {
        Some(Token::Minus) => {
            advance(pos);
            let operand = parse_unary(tokens, pos)?;
            Ok(Expr::Unary {
                op: UnOp::Negate,
                operand: Box::new(operand),
            })
        }
        Some(Token::Bang) => {
            advance(pos);
            let operand = parse_unary(tokens, pos)?;
            Ok(Expr::Unary {
                op: UnOp::Not,
                operand: Box::new(operand),
            })
        }
        _ => parse_primary(tokens, pos),
    }
}

fn parse_primary(tokens: &[Token], pos: &mut usize) -> Result<Expr, ParseError> {
    match peek(tokens, pos).cloned() {
        Some(Token::Int(n)) => {
            advance(pos);
            Ok(Expr::Int(n))
        }
        Some(Token::Bool(b)) => {
            advance(pos);
            Ok(Expr::Bool(b))
        }
        Some(Token::Ident(name)) => {
            advance(pos);
            Ok(Expr::Ref(name))
        }
        Some(Token::LParen) => {
            advance(pos);
            let inner = parse_or(tokens, pos)?;
            match peek(tokens, pos) {
                Some(Token::RParen) => {
                    advance(pos);
                    Ok(Expr::Group(Box::new(inner)))
                }
                _ => Err(ParseError {
                    message: "expected closing ')'".to_string(),
                }),
            }
        }
        Some(Token::RParen) => Err(ParseError {
            message: "unexpected closing ')'".to_string(),
        }),
        _ => Err(ParseError {
            message: format!("expected expression at position {}", pos),
        }),
    }
}

// ─── Convenience helpers for tests ────────────────────────────────────

/// Shortcut to build a variable reference.
pub fn var(name: &str) -> Expr {
    Expr::Ref(name.to_string())
}

/// Shortcut to build an integer literal.
pub fn int(n: i64) -> Expr {
    Expr::Int(n)
}

/// Shortcut to build a bool literal.
pub fn bool_(b: bool) -> Expr {
    Expr::Bool(b)
}

/// Shortcut to build a binary expression.
pub fn bin(op: BinOp, left: Expr, right: Expr) -> Expr {
    Expr::Binary {
        op,
        left: Box::new(left),
        right: Box::new(right),
    }
}

/// Shortcut to build a unary expression.
pub fn unary(op: UnOp, operand: Expr) -> Expr {
    Expr::Unary {
        op,
        operand: Box::new(operand),
    }
}

/// Shortcut to build a grouped expression.
pub fn group(inner: Expr) -> Expr {
    Expr::Group(Box::new(inner))
}
