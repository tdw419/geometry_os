//! Higher-Level Language Compiler for Geometry OS
//!
//! Compiles "GeoLang" — a minimal C-like language — into pixel VM opcodes.
//! This is the bridge that makes the VM programmable by AI agents
//! without needing to write raw opcodes.
//!
//! # Language Overview
//!
//! ```text
//! fn fib(n) {
//!     if (n <= 1) { return n; }
//!     return fib(n - 1) + fib(n - 2);
//! }
//! ```
//!
//! Supports: functions, while loops, if/else, arithmetic, comparisons,
//! local variables, return statements, recursion.

pub mod lexer;
pub mod parser;
pub mod codegen;

use crate::assembler::Program;

pub use lexer::{Lexer, Token, TokenKind};
pub use parser::{Parser, AstNode, FnDecl, Stmt, Expr, BinOp, UnaryOp};
pub use codegen::CodeGenerator;

/// Compile GeoLang source into a pixel VM program.
pub fn compile(source: &str) -> Result<Program, String> {
    let tokens = Lexer::new(source).tokenize()?;
    let ast = Parser::new(tokens).parse()?;
    let program = CodeGenerator::new().generate(&ast)?;
    Ok(program)
}
