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
/// - 'c' → ASCII char value
/// - plain number → decimal literal
/// - label name → resolved later
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

    // Hex literal: 0xNN or 0xNNNN
    if let Some(hex) = token.strip_prefix("0x").or_else(|| token.strip_prefix("0X")) {
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

#[derive(Debug, Clone)]
enum ArgToken {
    Register(u32),
    Immediate(u32),
    Label(String),
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
        let opcode = mnemonic_to_opcode(mnemonic).ok_or_else(|| AsmError {
            line: line_num,
            message: format!("unknown mnemonic: {}", mnemonic),
        })?;

        let width = crate::opcodes::width(opcode);

        // Parse comma-separated arguments
        let arg_str = if parts.len() > 1 {
            parts[1..].join("")
        } else {
            String::new()
        };

        let arg_tokens: Vec<&str> = if arg_str.is_empty() {
            vec![]
        } else {
            arg_str.split(',').map(|s| s.trim()).filter(|s| !s.is_empty()).collect()
        };

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
            let value = match arg {
                ArgToken::Register(n) => *n,
                ArgToken::Immediate(v) => *v,
                ArgToken::Label(name) => {
                    *labels.get(name).ok_or_else(|| AsmError {
                        line: instr.line,
                        message: format!("undefined label: {}", name),
                    })? as u32
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
                op::JMP as u32, 0,
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
        assert_eq!(asm.pixels[11], 6); // BRANCH target = loop = 6
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
}
