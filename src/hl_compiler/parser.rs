//! Parser for GeoLang — recursive descent producing an AST.

use super::lexer::{Token, TokenKind};

/// Binary operators.
#[derive(Debug, Clone, PartialEq)]
pub enum BinOp {
    Add,
    Sub,
    Mul,
    Div,
    Eq,
    Ne,
    Lt,
    Gt,
    Le,
    Ge,
}

/// Unary operators.
#[derive(Debug, Clone, PartialEq)]
pub enum UnaryOp {
    Neg,
    Not,
}

/// Expressions.
#[derive(Debug, Clone)]
pub enum Expr {
    Int(u64),
    Bool(bool),
    Var(String),
    BinOp(BinOp, Box<Expr>, Box<Expr>),
    UnaryOp(UnaryOp, Box<Expr>),
    Call(String, Vec<Expr>),
}

/// Statements.
#[derive(Debug, Clone)]
pub enum Stmt {
    Let(String, Expr),
    Assign(String, Expr),
    /// Compound assignment: name op= expr (e.g., a += 1)
    AssignOp(String, BinOp, Expr),
    While(Expr, Block),
    If(Expr, Block, Option<Block>),
    Return(Option<Expr>),
    ExprStmt(Expr),
}

/// A block of statements.
pub type Block = Vec<Stmt>;

/// A function declaration.
#[derive(Debug, Clone)]
pub struct FnDecl {
    pub name: String,
    pub params: Vec<String>,
    pub body: Block,
}

/// Top-level AST node.
#[derive(Debug, Clone)]
pub struct AstNode {
    pub functions: Vec<FnDecl>,
}

/// Parser state.
pub struct Parser {
    tokens: Vec<Token>,
    pos: usize,
}

impl Parser {
    pub fn new(tokens: Vec<Token>) -> Self {
        Self { tokens, pos: 0 }
    }

    fn peek(&self) -> &TokenKind {
        &self.tokens[self.pos].kind
    }

    fn advance(&mut self) -> Token {
        let tok = self.tokens[self.pos].clone();
        if self.pos < self.tokens.len() - 1 {
            self.pos += 1;
        }
        tok
    }

    fn expect(&mut self, expected: &TokenKind) -> Result<Token, String> {
        let tok = self.tokens[self.pos].clone();
        if std::mem::discriminant(&tok.kind) == std::mem::discriminant(expected) {
            self.advance();
            Ok(tok)
        } else {
            Err(format!(
                "Expected {:?} but got {:?} at line {} col {}",
                expected, tok.kind, tok.line, tok.col
            ))
        }
    }

    fn expect_ident(&mut self) -> Result<String, String> {
        let tok = self.tokens[self.pos].clone();
        match &tok.kind {
            TokenKind::Ident(s) => {
                let name = s.clone();
                self.advance();
                Ok(name)
            }
            _ => Err(format!(
                "Expected identifier but got {:?} at line {} col {}",
                tok.kind, tok.line, tok.col
            )),
        }
    }

    /// Parse the full program.
    pub fn parse(mut self) -> Result<AstNode, String> {
        let mut functions = Vec::new();

        while *self.peek() != TokenKind::Eof {
            functions.push(self.parse_fn_decl()?);
        }

        if functions.is_empty() {
            return Err("Program must contain at least one function".to_string());
        }

        Ok(AstNode { functions })
    }

    fn parse_fn_decl(&mut self) -> Result<FnDecl, String> {
        self.expect(&TokenKind::Fn)?;
        let name = self.expect_ident()?;
        self.expect(&TokenKind::LParen)?;

        let mut params = Vec::new();
        if *self.peek() != TokenKind::RParen {
            params.push(self.expect_ident()?);
            while *self.peek() == TokenKind::Comma {
                self.advance();
                params.push(self.expect_ident()?);
            }
        }
        self.expect(&TokenKind::RParen)?;

        let body = self.parse_block()?;

        Ok(FnDecl { name, params, body })
    }

    fn parse_block(&mut self) -> Result<Block, String> {
        self.expect(&TokenKind::LBrace)?;
        let mut stmts = Vec::new();
        while *self.peek() != TokenKind::RBrace && *self.peek() != TokenKind::Eof {
            stmts.push(self.parse_stmt()?);
        }
        self.expect(&TokenKind::RBrace)?;
        Ok(stmts)
    }

    fn parse_stmt(&mut self) -> Result<Stmt, String> {
        match self.peek().clone() {
            TokenKind::Let => self.parse_let(),
            TokenKind::While => self.parse_while(),
            TokenKind::If => self.parse_if(),
            TokenKind::Return => self.parse_return(),
            TokenKind::Ident(_) => self.parse_ident_stmt(),
            _ => self.parse_expr_stmt(),
        }
    }

    fn parse_let(&mut self) -> Result<Stmt, String> {
        self.expect(&TokenKind::Let)?;
        let name = self.expect_ident()?;
        self.expect(&TokenKind::Assign)?;
        let expr = self.parse_expr()?;
        self.expect(&TokenKind::Semicolon)?;
        Ok(Stmt::Let(name, expr))
    }

    fn parse_while(&mut self) -> Result<Stmt, String> {
        self.expect(&TokenKind::While)?;
        self.expect(&TokenKind::LParen)?;
        let cond = self.parse_expr()?;
        self.expect(&TokenKind::RParen)?;
        let body = self.parse_block()?;
        Ok(Stmt::While(cond, body))
    }

    fn parse_if(&mut self) -> Result<Stmt, String> {
        self.expect(&TokenKind::If)?;
        self.expect(&TokenKind::LParen)?;
        let cond = self.parse_expr()?;
        self.expect(&TokenKind::RParen)?;
        let then_block = self.parse_block()?;
        let else_block = if *self.peek() == TokenKind::Else {
            self.advance();
            Some(self.parse_block()?)
        } else {
            None
        };
        Ok(Stmt::If(cond, then_block, else_block))
    }

    fn parse_return(&mut self) -> Result<Stmt, String> {
        self.expect(&TokenKind::Return)?;
        let expr = if *self.peek() == TokenKind::Semicolon {
            None
        } else {
            Some(self.parse_expr()?)
        };
        self.expect(&TokenKind::Semicolon)?;
        Ok(Stmt::Return(expr))
    }

    /// Parse a statement that starts with an identifier — could be assignment
    /// or compound assignment or just an expression statement.
    fn parse_ident_stmt(&mut self) -> Result<Stmt, String> {
        // Save position so we can backtrack
        let save_pos = self.pos;
        let tok = self.tokens[self.pos].clone();

        if let TokenKind::Ident(name) = &tok.kind {
            let name = name.clone();
            self.advance();

            match self.peek() {
                TokenKind::Assign => {
                    self.advance();
                    let expr = self.parse_expr()?;
                    self.expect(&TokenKind::Semicolon)?;
                    return Ok(Stmt::Assign(name, expr));
                }
                TokenKind::Plus | TokenKind::Minus | TokenKind::Star | TokenKind::Slash => {
                    // Check if next is '=' (compound assignment)
                    let op_tok = self.tokens[self.pos].clone();
                    let next_pos = self.pos + 1;
                    if next_pos < self.tokens.len() {
                        if let TokenKind::Assign = &self.tokens[next_pos].kind {
                            let binop = match op_tok.kind {
                                TokenKind::Plus => BinOp::Add,
                                TokenKind::Minus => BinOp::Sub,
                                TokenKind::Star => BinOp::Mul,
                                TokenKind::Slash => BinOp::Div,
                                _ => unreachable!(),
                            };
                            self.advance(); // skip operator
                            self.advance(); // skip =
                            let expr = self.parse_expr()?;
                            self.expect(&TokenKind::Semicolon)?;
                            return Ok(Stmt::AssignOp(name, binop, expr));
                        }
                    }
                    // Not compound assign — fall through to expression
                }
                _ => {}
            }
        }

        // Backtrack and parse as expression statement
        self.pos = save_pos;
        self.parse_expr_stmt()
    }

    fn parse_expr_stmt(&mut self) -> Result<Stmt, String> {
        let expr = self.parse_expr()?;
        self.expect(&TokenKind::Semicolon)?;
        Ok(Stmt::ExprStmt(expr))
    }

    // ── Expression parsing (precedence climbing) ──

    fn parse_expr(&mut self) -> Result<Expr, String> {
        self.parse_comparison()
    }

    fn parse_comparison(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_addition()?;
        loop {
            let op = match self.peek() {
                TokenKind::Eq => BinOp::Eq,
                TokenKind::Ne => BinOp::Ne,
                TokenKind::Lt => BinOp::Lt,
                TokenKind::Gt => BinOp::Gt,
                TokenKind::Le => BinOp::Le,
                TokenKind::Ge => BinOp::Ge,
                _ => return Ok(left),
            };
            self.advance();
            let right = self.parse_addition()?;
            left = Expr::BinOp(op, Box::new(left), Box::new(right));
        }
    }

    fn parse_addition(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_multiplication()?;
        loop {
            let op = match self.peek() {
                TokenKind::Plus => BinOp::Add,
                TokenKind::Minus => BinOp::Sub,
                _ => return Ok(left),
            };
            self.advance();
            let right = self.parse_multiplication()?;
            left = Expr::BinOp(op, Box::new(left), Box::new(right));
        }
    }

    fn parse_multiplication(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_unary()?;
        loop {
            let op = match self.peek() {
                TokenKind::Star => BinOp::Mul,
                TokenKind::Slash => BinOp::Div,
                _ => return Ok(left),
            };
            self.advance();
            let right = self.parse_unary()?;
            left = Expr::BinOp(op, Box::new(left), Box::new(right));
        }
    }

    fn parse_unary(&mut self) -> Result<Expr, String> {
        match self.peek() {
            TokenKind::Minus => {
                self.advance();
                let expr = self.parse_unary()?;
                Ok(Expr::UnaryOp(UnaryOp::Neg, Box::new(expr)))
            }
            TokenKind::Not => {
                self.advance();
                let expr = self.parse_unary()?;
                Ok(Expr::UnaryOp(UnaryOp::Not, Box::new(expr)))
            }
            _ => self.parse_primary(),
        }
    }

    fn parse_primary(&mut self) -> Result<Expr, String> {
        let tok = self.tokens[self.pos].clone();
        match &tok.kind {
            TokenKind::Int(n) => {
                self.advance();
                Ok(Expr::Int(*n))
            }
            TokenKind::True => {
                self.advance();
                Ok(Expr::Bool(true))
            }
            TokenKind::False => {
                self.advance();
                Ok(Expr::Bool(false))
            }
            TokenKind::Ident(name) => {
                let name = name.clone();
                self.advance();
                // Check for function call
                if *self.peek() == TokenKind::LParen {
                    self.advance();
                    let mut args = Vec::new();
                    if *self.peek() != TokenKind::RParen {
                        args.push(self.parse_expr()?);
                        while *self.peek() == TokenKind::Comma {
                            self.advance();
                            args.push(self.parse_expr()?);
                        }
                    }
                    self.expect(&TokenKind::RParen)?;
                    Ok(Expr::Call(name, args))
                } else {
                    Ok(Expr::Var(name))
                }
            }
            TokenKind::LParen => {
                self.advance();
                let expr = self.parse_expr()?;
                self.expect(&TokenKind::RParen)?;
                Ok(expr)
            }
            _ => Err(format!(
                "Unexpected token {:?} at line {} col {}",
                tok.kind, tok.line, tok.col
            )),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn parse_src(src: &str) -> Result<AstNode, String> {
        let tokens = crate::hl_compiler::Lexer::new(src).tokenize()?;
        Parser::new(tokens).parse()
    }

    #[test]
    fn test_simple_function() {
        let ast = parse_src("fn add(a, b) { return a + b; }").unwrap();
        assert_eq!(ast.functions.len(), 1);
        assert_eq!(ast.functions[0].name, "add");
        assert_eq!(ast.functions[0].params, vec!["a", "b"]);
    }

    #[test]
    fn test_while_loop() {
        let ast = parse_src("fn count() { let x = 0; while (x < 10) { x = x + 1; } return x; }").unwrap();
        let body = &ast.functions[0].body;
        assert!(matches!(body[1], Stmt::While(_, _)));
    }

    #[test]
    fn test_if_else() {
        let ast = parse_src("fn check(n) { if (n > 0) { return 1; } else { return 0; } }").unwrap();
        let body = &ast.functions[0].body;
        assert!(matches!(body[0], Stmt::If(_, _, Some(_))));
    }

    #[test]
    fn test_expressions() {
        let ast = parse_src("fn f() { let x = 1 + 2 * 3 - 4 / 2; }").unwrap();
        assert_eq!(ast.functions[0].body.len(), 1);
    }

    #[test]
    fn test_function_call() {
        let ast = parse_src("fn main() { return fib(10); }").unwrap();
        match &ast.functions[0].body[0] {
            Stmt::Return(Some(Expr::Call(name, args))) => {
                assert_eq!(name, "fib");
                assert_eq!(args.len(), 1);
            }
            _ => panic!("Expected return with function call"),
        }
    }

    #[test]
    fn test_compound_assign() {
        let ast = parse_src("fn f() { let x = 0; x += 1; }").unwrap();
        match &ast.functions[0].body[1] {
            Stmt::AssignOp(name, BinOp::Add, _) => {
                assert_eq!(name, "x");
            }
            _ => panic!("Expected compound assignment"),
        }
    }
}
