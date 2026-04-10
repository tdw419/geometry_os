// ═══════════════════════════════════════════════════════════════════════
// GEOMETRY OS ASSEMBLER
//
// Two-pass assembler that converts .gasm text into pixel sequences
// the VM can execute.
//
// Pass 1: Collect labels and compute addresses.
// Pass 2: Emit pixel values, resolving label references.
//
// Input syntax:
//   ; comment
//   LABEL:
//   .ORG 0x100
//   LDI r0, 42
//   ADD r0, r1
//   JMP loop
//   HALT
//
// Each instruction emits one pixel per position:
//   [opcode_byte] [arg1] [arg2] ...
//
// Register arguments: r0-r31 emit the raw index (0-31).
// Immediate values: decimal (42), hex (0x2A), or ASCII char ('*').
// Labels: resolved to pixel address on pass 2.
// ═══════════════════════════════════════════════════════════════════════

use std::collections::HashMap;

/// Assembly error with context.
#[derive(Debug, Clone)]
pub struct AsmError {
    pub line: usize,
    pub message: String,
}

impl std::fmt::Display for AsmError {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "line {}: {}", self.line, self.message)
    }
}

/// Result of assembling a source file.
#[derive(Debug, Clone)]
pub struct Assembled {
    /// Pixel values ready to load into VM RAM.
    pub pixels: Vec<u32>,
    /// The highest address written + 1.
    pub end_addr: usize,
    /// Labels and their addresses (for debugging/disassembly).
    pub labels: HashMap<String, usize>,
}

/// Look up a mnemonic name and return its opcode byte.
/// Case-insensitive.
fn mnemonic_to_opcode(name: &str) -> Option<u8> {
    let upper = name.to_uppercase();
    // Check primary (uppercase letter) opcodes by name
    let byte = match upper.as_str() {
        "ADD" => 0x41,
        "BRANCH" | "BEQ" | "BNE" | "BLT" | "BGE" | "BLTU" | "BGEU" => 0x42,
        "CALL" => 0x43,
        "DIV" => 0x44,
        "EXEC" => 0x45,
        "RECTF" => 0x46,
        "CIRCLEF" => 0x47,
        "HALT" => 0x48,
        "LDI" => 0x49,
        "JMP" => 0x4A,
        "SHL" => 0x4B,
        "LOAD" => 0x4C,
        "MOV" => 0x4D,
        "NOP" => 0x4E,
        "OR" => 0x4F,
        "PSET" => 0x50,
        "SPAWN" => 0x51,
        "RET" => 0x52,
        "STORE" | "ST" => 0x53,
        "TEXT" => 0x54,
        "SUB" => 0x55,
        "LINE" => 0x56,
        "BLIT" => 0x57,
        "XOR" => 0x58,
        "YIELD" => 0x59,
        "SPATIAL_SPAWN" | "SPAWNAT" => 0x5A,

        // Lowercase opcodes
        "AND" => 0x61,
        "MOD" => 0x62,
        "ISSUE_CREATE" | "ISSUE" => 0x63,
        "LDB" => 0x64,
        "EDIT_OVERWRITE" | "EDITOVW" => 0x65,
        "EDIT_INSERT" | "EDITINS" => 0x66,
        "PGET" => 0x67,
        "INT" => 0x69,
        "EDIT_DELETE" | "EDITDEL" => 0x6A,
        "SHR" => 0x6B,
        "EDIT_BLIT" | "EDITBLT" => 0x6C,
        "MUL" => 0x6D,
        "NOT" => 0x6E,
        "PUSH" => 0x70,
        "POP" => 0x72,
        "STB" => 0x73,
        _ => return None,
    };
    Some(byte)
}

/// Parse a single argument token.
/// - r0..r31 → register index
/// - 0xNN → hex literal
fn parse_arg(token: &str) -> Result<ArgToken, String> {
    // Register: r0, r1, ..., r31
    if let Some(rest) = token.strip_prefix('r') {
        if let Ok(n) = rest.parse::<u32>() {
            if n < 32 {
                return Ok(ArgToken::Register(n));
            }
        }
        // rN where N is not a valid register
    }

    // ASCII char literal: 'X' or '*' etc
    if token.starts_with('\'') && token.ends_with('\'') && token.len() == 3 {
        let ch = token.chars().nth(1).unwrap();
        return Ok(ArgToken::Immediate(ch as u32));
    }

    // Expression: try before hex/decimal in case token like "0x10+0x20"
    // Labels are purely alphanumeric+underscore, so any operator char means expression
    let has_operator = token.contains('+')
        || token.contains('-')
        || token.contains('*')
        || token.contains('/')
        || token.contains('(')
        || token.contains(')');
    if has_operator {
        if let Ok(val) = eval_expression(token) {
            return Ok(ArgToken::Immediate(val));
        }
    }

    // Hex literal: 0xNN or 0xNNNN (only if no expression operators)
    if let Some(hex) = token
        .strip_prefix("0x")
        .or_else(|| token.strip_prefix("0X"))
    {
        if let Ok(val) = u32::from_str_radix(hex, 16) {
            return Ok(ArgToken::Immediate(val));
        }
        return Err(format!("invalid hex literal: {}", token));
    }

    // Decimal number
    if let Ok(val) = token.parse::<u32>() {
        return Ok(ArgToken::Immediate(val));
    }

    // Label reference
    if token.chars().all(|c| c.is_alphanumeric() || c == '_') && !token.is_empty() {
        return Ok(ArgToken::Label(token.to_string()));
    }

    Err(format!("invalid argument: {}", token))
}

/// Evaluate a simple arithmetic expression with +, -, *, / and parentheses.
/// All arithmetic is unsigned u32. Division by zero returns an error.
fn eval_expression(expr: &str) -> Result<u32, String> {
    let tokens = tokenize_expr(expr)?;
    let (result, pos) = parse_add_sub(&tokens, 0)?;
    if pos != tokens.len() {
        return Err(format!("unexpected token at position {} in '{}'", pos, expr));
    }
    Ok(result)
}

/// Expression token types for recursive-descent parsing.
#[derive(Debug, Clone, PartialEq)]
enum ExprToken {
    Number(u32),
    Plus,
    Minus,
    Star,
    Slash,
    LParen,
    RParen,
}

/// Tokenize an expression string into ExprTokens.
fn tokenize_expr(expr: &str) -> Result<Vec<ExprToken>, String> {
    let mut tokens = Vec::new();
    let mut chars = expr.chars().peekable();

    while let Some(&ch) = chars.peek() {
        match ch {
            ' ' | '\t' => {
                chars.next();
            }
            '0'..='9' => {
                let mut num_str = String::new();
                while let Some(&d) = chars.peek() {
                    if d.is_ascii_digit() {
                        num_str.push(d);
                        chars.next();
                    } else {
                        break;
                    }
                }
                // Check for hex prefix: "0" followed by 'x'/'X'
                if num_str == "0"
                    && (chars.peek() == Some(&'x') || chars.peek() == Some(&'X'))
                {
                    chars.next(); // consume 'x'
                    let mut hex_str = String::new();
                    while let Some(&d) = chars.peek() {
                        if d.is_ascii_hexdigit() {
                            hex_str.push(d);
                            chars.next();
                        } else {
                            break;
                        }
                    }
                    let val = u32::from_str_radix(&hex_str, 16)
                        .map_err(|e| format!("bad hex '0x{}' in expression: {}", hex_str, e))?;
                    tokens.push(ExprToken::Number(val));
                } else {
                    let val = num_str.parse::<u32>().map_err(|e| {
                        format!("bad number '{}' in expression '{}': {}", num_str, expr, e)
                    })?;
                    tokens.push(ExprToken::Number(val));
                }
            }
            '+' => {
                chars.next();
                tokens.push(ExprToken::Plus);
            }
            '-' => {
                chars.next();
                tokens.push(ExprToken::Minus);
            }
            '*' => {
                chars.next();
                tokens.push(ExprToken::Star);
            }
            '/' => {
                chars.next();
                tokens.push(ExprToken::Slash);
            }
            '(' => {
                chars.next();
                tokens.push(ExprToken::LParen);
            }
            ')' => {
                chars.next();
                tokens.push(ExprToken::RParen);
            }
            _ => {
                return Err(format!(
                    "unexpected character '{}' in expression '{}'",
                    ch, expr
                ))
            }
        }
    }
    Ok(tokens)
}

/// Parse addition and subtraction (lowest precedence).
/// Grammar: add_sub = mul_div (('+' | '-') mul_div)*
fn parse_add_sub(tokens: &[ExprToken], pos: usize) -> Result<(u32, usize), String> {
    let (mut result, mut pos) = parse_mul_div(tokens, pos)?;
    while pos < tokens.len() {
        match tokens[pos] {
            ExprToken::Plus => {
                let (right, new_pos) = parse_mul_div(tokens, pos + 1)?;
                result = result.wrapping_add(right);
                pos = new_pos;
            }
            ExprToken::Minus => {
                let (right, new_pos) = parse_mul_div(tokens, pos + 1)?;
                result = result.wrapping_sub(right);
                pos = new_pos;
            }
            _ => break,
        }
    }
    Ok((result, pos))
}

/// Parse multiplication and division (higher precedence).
/// Grammar: mul_div = primary (('*' | '/') primary)*
fn parse_mul_div(tokens: &[ExprToken], pos: usize) -> Result<(u32, usize), String> {
    let (mut result, mut pos) = parse_primary(tokens, pos)?;
    while pos < tokens.len() {
        match tokens[pos] {
            ExprToken::Star => {
                let (right, new_pos) = parse_primary(tokens, pos + 1)?;
                result = result.wrapping_mul(right);
                pos = new_pos;
            }
            ExprToken::Slash => {
                let (right, new_pos) = parse_primary(tokens, pos + 1)?;
                if right == 0 {
                    return Err("division by zero in expression".into());
                }
                result = result / right;
                pos = new_pos;
            }
            _ => break,
        }
    }
    Ok((result, pos))
}

/// Parse primary: number or parenthesized expression.
fn parse_primary(tokens: &[ExprToken], pos: usize) -> Result<(u32, usize), String> {
    if pos >= tokens.len() {
        return Err("unexpected end of expression".into());
    }
    match &tokens[pos] {
        ExprToken::Number(n) => Ok((*n, pos + 1)),
        ExprToken::LParen => {
            let (result, new_pos) = parse_add_sub(tokens, pos + 1)?;
            if new_pos >= tokens.len() || tokens[new_pos] != ExprToken::RParen {
                return Err("missing closing ')' in expression".into());
            }
            Ok((result, new_pos + 1))
        }
        _ => Err(format!(
            "expected number or '(' at position {} in expression",
            pos
        )),
    }
}

#[derive(Debug, Clone)]
enum ArgToken {
    Register(u32),
    Immediate(u32),
    Label(String),
    /// Packed BRANCH condition: (cond_code, r1_token, r2_token).
    /// Emitted as a single pixel: cond | (r1 << 16) | (r2 << 24).
    BranchCond(u8, Box<ArgToken>, Box<ArgToken>),
}

/// Return the condition code for a branch-alias mnemonic, or None.
fn branch_alias_cond(mnemonic: &str) -> Option<u8> {
    match mnemonic.to_uppercase().as_str() {
        "BEQ"  => Some(0),
        "BNE"  => Some(1),
        "BLT"  => Some(2),
        "BGE"  => Some(3),
        "BLTU" => Some(4),
        "BGEU" => Some(5),
        "BAL"  => Some(15),  // unconditional branch
        _ => None,
    }
}

/// A parsed but not yet resolved instruction.
#[derive(Debug, Clone)]
struct RawInstr {
    line: usize,
    opcode: u8,
    args: Vec<ArgToken>,
}

/// Assemble source text into pixel values.
/// Returns the assembled program or the first error.
pub fn assemble(source: &str) -> Result<Assembled, AsmError> {
    let mut labels: HashMap<String, usize> = HashMap::new();
    let mut instrs: Vec<(usize, RawInstr)> = Vec::new(); // (emit_addr, instr)
    let mut current_addr: usize = 0;

    // ── Pass 1: Parse lines, collect labels, compute addresses ──────
    for (line_num, raw_line) in source.lines().enumerate() {
        let line_num = line_num + 1; // 1-indexed
        let line = strip_comment(raw_line).trim();

        if line.is_empty() {
            continue;
        }

        // .ORG directive
        if let Some(rest) = line.strip_prefix(".ORG") {
            let addr_str = rest.trim();
            let addr = parse_number(addr_str).map_err(|e| AsmError {
                line: line_num,
                message: e,
            })?;
            current_addr = addr as usize;
            continue;
        }

        // Label definition (ends with ':')
        if line.ends_with(':') {
            let label = line.trim_end_matches(':').trim().to_string();
            if label.is_empty() {
                return Err(AsmError {
                    line: line_num,
                    message: "empty label".into(),
                });
            }
            labels.insert(label, current_addr);
            continue;
        }

        // Instruction
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.is_empty() {
            continue;
        }

        let mnemonic = parts[0];

        // Parse comma-separated arguments (shared by all paths below)
        let arg_str = if parts.len() > 1 { parts[1..].join("") } else { String::new() };
        let arg_tokens: Vec<&str> = if arg_str.is_empty() {
            vec![]
        } else {
            arg_str.split(',').map(|s| s.trim()).filter(|s| !s.is_empty()).collect()
        };

        // ── Branch aliases: BEQ r0, r1, label → BRANCH packed_cond, label ──
        if let Some(cond_code) = branch_alias_cond(mnemonic) {
            if arg_tokens.len() != 3 {
                return Err(AsmError {
                    line: line_num,
                    message: format!("{} expects 3 args (r1, r2, label), got {}", mnemonic, arg_tokens.len()),
                });
            }
            let r1 = parse_arg(arg_tokens[0]).map_err(|e| AsmError { line: line_num, message: e })?;
            let r2 = parse_arg(arg_tokens[1]).map_err(|e| AsmError { line: line_num, message: e })?;
            let target = parse_arg(arg_tokens[2]).map_err(|e| AsmError { line: line_num, message: e })?;
            instrs.push((current_addr, RawInstr {
                line: line_num,
                opcode: crate::opcodes::op::BRANCH,
                args: vec![ArgToken::BranchCond(cond_code, Box::new(r1), Box::new(r2)), target],
            }));
            current_addr += crate::opcodes::width(crate::opcodes::op::BRANCH);
            continue;
        }

        let opcode = mnemonic_to_opcode(mnemonic).ok_or_else(|| AsmError {
            line: line_num,
            message: format!("unknown mnemonic: {}", mnemonic),
        })?;

        let width = crate::opcodes::width(opcode);

        // Validate argument count
        let expected_args = width - 1;
        if arg_tokens.len() != expected_args {
            return Err(AsmError {
                line: line_num,
                message: format!(
                    "{} expects {} args, got {}",
                    mnemonic, expected_args, arg_tokens.len()
                ),
            });
        }

        let args: Vec<ArgToken> = arg_tokens
            .iter()
            .map(|t| parse_arg(t))
            .collect::<Result<Vec<_>, _>>()
            .map_err(|e| AsmError {
                line: line_num,
                message: e,
            })?;

        instrs.push((
            current_addr,
            RawInstr {
                line: line_num,
                opcode,
                args,
            },
        ));

        current_addr += width;
    }

    // ── Pass 2: Emit pixels, resolve labels ─────────────────────────
    let end_addr = instrs
        .last()
        .map(|(addr, instr)| *addr + crate::opcodes::width(instr.opcode))
        .unwrap_or(0);

    let mut pixels = vec![0u32; end_addr];

    for (addr, instr) in &instrs {
        pixels[*addr] = instr.opcode as u32;

        for (i, arg) in instr.args.iter().enumerate() {
            let pixel_addr = addr + 1 + i;
            let is_addr_arg = matches!(
                instr.opcode,
                crate::opcodes::op::JMP | crate::opcodes::op::BRANCH | crate::opcodes::op::CALL,
            ) && i == instr.args.len() - 1;

            let value = match arg {
                ArgToken::Register(n) => *n,
                ArgToken::Immediate(v) => {
                    // Mark address args as absolute for JMP/BRANCH/CALL.
                    if is_addr_arg { *v | 0x80000000 } else { *v }
                }
                ArgToken::Label(name) => {
                    let addr = *labels.get(name).ok_or_else(|| AsmError {
                        line: instr.line,
                        message: format!("undefined label: {}", name),
                    })? as u32;
                    // Set bit 31 for address args so VM treats them as absolute,
                    // not relative (canvas-typed bytes never have bit 31 set).
                    if is_addr_arg { addr | 0x80000000 } else { addr }
                }
                ArgToken::BranchCond(cond, r1_tok, r2_tok) => {
                    let resolve = |tok: &ArgToken| -> Result<u32, AsmError> {
                        match tok {
                            ArgToken::Register(n) => Ok(*n),
                            ArgToken::Immediate(v) => Ok(*v),
                            _ => Err(AsmError { line: instr.line, message: "branch condition register must be r0-r31".into() }),
                        }
                    };
                    let r1 = resolve(r1_tok)?;
                    let r2 = resolve(r2_tok)?;
                    (*cond as u32) | (r1 << 16) | (r2 << 24)
                }
            };
            if pixel_addr < pixels.len() {
                pixels[pixel_addr] = value;
            }
        }
    }

    Ok(Assembled {
        pixels,
        end_addr,
        labels,
    })
}

/// Strip a line comment (; everything after).
fn strip_comment(line: &str) -> &str {
    if let Some(pos) = line.find(';') {
        &line[..pos]
    } else {
        line
    }
}

/// Parse a number (decimal or 0x hex).
fn parse_number(s: &str) -> Result<u32, String> {
    let s = s.trim();
    if let Some(hex) = s.strip_prefix("0x").or_else(|| s.strip_prefix("0X")) {
        u32::from_str_radix(hex, 16).map_err(|e| format!("bad hex '{}': {}", s, e))
    } else {
        s.parse::<u32>().map_err(|e| format!("bad number '{}': {}", s, e))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::opcodes::op;

    #[test]
    fn simple_halt() {
        let asm = assemble("HALT").unwrap();
        assert_eq!(asm.pixels, vec![op::HALT as u32]);
    }

    #[test]
    fn ldi_with_immediate() {
        let asm = assemble("LDI r0, 42").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 42]);
    }

    #[test]
    fn ldi_with_ascii_char() {
        let asm = assemble("LDI r0, '*'").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 42]); // '*' = 0x2A = 42
    }

    #[test]
    fn ldi_with_hex() {
        let asm = assemble("LDI r0, 0x2A").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 42]);
    }

    #[test]
    fn add_two_registers() {
        let asm = assemble("ADD r0, r1").unwrap();
        assert_eq!(asm.pixels, vec![op::ADD as u32, 0, 1]);
    }

    #[test]
    fn store_alias() {
        let asm = assemble("STORE r1, r0").unwrap();
        assert_eq!(asm.pixels, vec![op::STORE as u32, 1, 0]);
    }

    #[test]
    fn st_alias() {
        let asm = assemble("ST r1, r0").unwrap();
        assert_eq!(asm.pixels, vec![op::STORE as u32, 1, 0]);
    }

    #[test]
    fn label_and_jump() {
        let src = "\
loop:
    NOP
    JMP loop
    HALT
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.labels.get("loop"), Some(&0));
        // NOP at addr 0 (width 1)
        // JMP at addr 1 (width 2: opcode + addr)
        // addr arg = loop = 0
        // HALT at addr 3
        assert_eq!(
            asm.pixels,
            vec![
                op::NOP as u32,
                op::JMP as u32, 0 | 0x80000000,
                op::HALT as u32,
            ]
        );
    }

    #[test]
    fn org_directive() {
        let src = "\
.ORG 0x10
HALT
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.end_addr, 0x11);
        assert_eq!(asm.pixels[0x10], op::HALT as u32);
    }

    #[test]
    fn comment_stripped() {
        let asm = assemble("HALT ; stop everything").unwrap();
        assert_eq!(asm.pixels, vec![op::HALT as u32]);
    }

    #[test]
    fn full_program() {
        let src = "\
; Load 5 into r0, 3 into r1, add, halt
LDI r0, 5
LDI r1, 3
ADD r0, r1
HALT
";
        let asm = assemble(src).unwrap();
        assert_eq!(
            asm.pixels,
            vec![
                op::LDI as u32, 0, 5,       // addr 0-2
                op::LDI as u32, 1, 3,       // addr 3-5
                op::ADD as u32, 0, 1,       // addr 6-8
                op::HALT as u32,            // addr 9
            ]
        );
        assert_eq!(asm.end_addr, 10);
    }

    #[test]
    fn branch_with_label() {
        let src = "\
start:
    LDI r0, 0
    LDI r1, 1
loop:
    ADD r0, r1
    BRANCH 0, loop
    HALT
";
        let asm = assemble(src).unwrap();
        // start = addr 0
        // LDI r0, 0   → addrs 0,1,2
        // LDI r1, 1   → addrs 3,4,5
        // loop = addr 6
        // ADD r0, r1  → addrs 6,7,8
        // BRANCH 0, loop → addrs 9,10,11
        // HALT → addr 12
        assert_eq!(asm.labels.get("start"), Some(&0));
        assert_eq!(asm.labels.get("loop"), Some(&6));
        assert_eq!(asm.pixels[11], 6 | 0x80000000); // BRANCH target = loop = 6 (absolute)
    }

    #[test]
    fn beq_alias() {
        // BEQ r0, r1, loop — branch if r0 == r1
        // packed cond_pixel: cond=0, r1=0, r2=1 → 0x01000000
        let src = "\
loop:
    BEQ r0, r1, loop
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels[0], op::BRANCH as u32);
        let cond_pixel = asm.pixels[1];
        assert_eq!(cond_pixel & 0xFF, 0);          // BEQ = 0
        assert_eq!((cond_pixel >> 16) & 0xFF, 0);  // r1 = r0 = index 0
        assert_eq!((cond_pixel >> 24) & 0xFF, 1);  // r2 = r1 = index 1
        assert_eq!(asm.pixels[2], 0 | 0x80000000);              // target = loop = addr 0 (absolute)
    }

    #[test]
    fn bne_alias() {
        let src = "\
loop:
    NOP
    BNE r2, r3, loop
";
        let asm = assemble(src).unwrap();
        // NOP at 0, BRANCH at 1
        assert_eq!(asm.pixels[1], op::BRANCH as u32);
        let cond_pixel = asm.pixels[2];
        assert_eq!(cond_pixel & 0xFF, 1);          // BNE = 1
        assert_eq!((cond_pixel >> 16) & 0xFF, 2);  // r2
        assert_eq!((cond_pixel >> 24) & 0xFF, 3);  // r3
        assert_eq!(asm.pixels[3], 0 | 0x80000000);              // target = loop = addr 0 (absolute)
    }

    #[test]
    fn blt_bge_blt_bgeu_aliases_parse() {
        assert!(assemble("BLT r0, r1, end\nend:\nHALT").is_ok());
        assert!(assemble("BGE r0, r1, end\nend:\nHALT").is_ok());
        assert!(assemble("BLTU r0, r1, end\nend:\nHALT").is_ok());
        assert!(assemble("BGEU r0, r1, end\nend:\nHALT").is_ok());
    }

    #[test]
    fn bal_unconditional_assembles() {
        let src = "
target:
    NOP
    BAL r0, r0, target
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels[1], op::BRANCH as u32);
        let cond_pixel = asm.pixels[2];
        assert_eq!(cond_pixel & 0xFF, 15); // BAL = 15
        assert_eq!(asm.pixels[3], 0 | 0x80000000);       // target = addr 0 (absolute)
    }

    #[test]
    fn branch_alias_wrong_arg_count() {
        let err = assemble("BEQ r0, loop").unwrap_err();
        assert!(err.message.contains("3 args"));
    }

    #[test]
    fn error_unknown_mnemonic() {
        let err = assemble("BLAH r0").unwrap_err();
        assert_eq!(err.line, 1);
        assert!(err.message.contains("unknown mnemonic"));
    }

    #[test]
    fn error_wrong_arg_count() {
        let err = assemble("ADD r0").unwrap_err();
        assert!(err.message.contains("expects 2 args"));
    }

    #[test]
    fn error_undefined_label() {
        let err = assemble("JMP nowhere").unwrap_err();
        assert!(err.message.contains("undefined label"));
    }

    #[test]
    fn register_r31() {
        let asm = assemble("LDI r31, 99").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 31, 99]);
    }

    // ── Expression evaluation tests ────────────────────────────────

    #[test]
    fn expr_simple_addition() {
        let asm = assemble("LDI r0, 2+3").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 5]);
    }

    #[test]
    fn expr_subtraction() {
        let asm = assemble("LDI r0, 10-3").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 7]);
    }

    #[test]
    fn expr_multiplication() {
        let asm = assemble("LDI r0, 4*8").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 32]);
    }

    #[test]
    fn expr_division() {
        let asm = assemble("LDI r0, 100/4").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 25]);
    }

    #[test]
    fn expr_precedence_mul_before_add() {
        // 2 + 3 * 4 = 2 + 12 = 14 (not 20)
        let asm = assemble("LDI r0, 2+3*4").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 14]);
    }

    #[test]
    fn expr_parentheses_override_precedence() {
        // (2 + 3) * 4 = 20
        let asm = assemble("LDI r0, (2+3)*4").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 20]);
    }

    #[test]
    fn expr_complex() {
        // (10 - 2) * (3 + 4) = 8 * 7 = 56
        let asm = assemble("LDI r0, (10-2)*(3+4)").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 56]);
    }

    #[test]
    fn expr_spaces_around_operators() {
        let asm = assemble("LDI r0, 2 + 3").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 5]);
    }

    #[test]
    fn expr_chained_additions() {
        // 1 + 2 + 3 + 4 = 10
        let asm = assemble("LDI r0, 1+2+3+4").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 10]);
    }

    #[test]
    fn expr_with_hex_in_addition() {
        // 0x10 + 0x20 = 48
        let asm = assemble("LDI r0, 0x10+0x20").unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 48]);
    }

    #[test]
    fn expr_in_rectf() {
        // Expression should work in any immediate argument
        // RECTF has width 5: opcode, x, y, w, h
        let asm = assemble("RECTF r0, r1, 10+5, 20+3").unwrap();
        assert_eq!(asm.pixels[3], 15); // w = 10+5 = 15
        assert_eq!(asm.pixels[4], 23); // h = 20+3 = 23
    }

    #[test]
    fn expr_in_ldi_runs_correctly() {
        // LDI r0, 2+3 should produce r0=5 when executed
        let src = "\
            LDI r0, 2+3\n\
            HALT\n\
        ";
        let asm = assemble(src).unwrap();
        let mut vm = crate::vm::Vm::new(4096);
        vm.load_program(&asm.pixels);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 5);
    }
}
