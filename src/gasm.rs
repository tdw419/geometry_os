// .gasm Text Assembler -- parse text assembly into pixel programs
//
// This is the human interface to Geometry OS. Write .gasm files,
// assemble them into pixel programs, load them into the texture,
// and watch them execute.
//
// Syntax:
//   ; comment
//   label:
//   NOP
//   LDI r0, 42
//   LDI r1, 0xDEAD
//   LDI r2, 'H'
//   MOV r1, r0
//   LOAD r5, r0          ; r5 = mem[r0]
//   STORE r1, r5         ; mem[r1] = r5
//   ADD r0, r3
//   SUB r0, r3
//   MUL r0, r3
//   DIV r0, r3
//   JMP label
//   BNE r2, r4, label
//   BEQ r2, r4, label
//   BLT r2, r4, label
//   BGE r2, r4, label
//   CALL label
//   RET
//   HALT
//   ENTRY r0
//   CHAR r0, r1          ; blit character from font atlas
//   CHAR_AT r0, r1, r2   ; blit character from arbitrary atlas base address
//   BLIT r0, r1, 8       ; blit N pixels
//   DATA 0x12345678        ; raw 32-bit word
//
// The assembler is two-pass:
//   Pass 1: collect label positions (accounting for multi-pixel instructions)
//   Pass 2: emit pixels, resolving labels to relative offsets

use std::collections::HashMap;

use crate::assembler::{bcond, op, Program};

/// Assemble a .gasm source string into a pixel program.
///
/// Returns the assembled `Program` on success, or an error message.
pub fn assemble(source: &str) -> Result<Program, String> {
    let lines = parse_lines(source)?;
    let labels = pass1_collect_labels(&lines)?;
    pass2_emit(&lines, &labels)
}

/// A parsed line (after stripping comments and blank lines).
#[derive(Debug, Clone)]
enum Line {
    Label { name: String },
    Instruction {
        mnemonic: String,
        operands: Vec<String>,
        line_num: usize,
    },
}

/// Strip comments and blank lines, separate labels from instructions.
fn parse_lines(source: &str) -> Result<Vec<Line>, String> {
    let mut result = Vec::new();
    for (i, raw) in source.lines().enumerate() {
        let line_num = i + 1;
        // Strip inline comments (everything after ';')
        let line = match raw.find(';') {
            Some(pos) => &raw[..pos],
            None => raw,
        };
        let trimmed = line.trim();
        if trimmed.is_empty() {
            continue;
        }
        // Check for label (word followed by colon)
        if trimmed.ends_with(':') {
            let name = trimmed[..trimmed.len() - 1].trim().to_string();
            if name.is_empty() {
                return Err(format!("line {}: empty label", line_num));
            }
            result.push(Line::Label { name });
            continue;
        }
        // Parse instruction: first word is mnemonic, rest is operands
        let mut parts = trimmed.splitn(2, |c: char| c.is_whitespace());
        let mnemonic = parts.next().unwrap().to_uppercase();
        let rest = parts.next().unwrap_or("").trim();
        let operands = split_operands(rest);
        result.push(Line::Instruction {
            mnemonic,
            operands,
            line_num,
        });
    }
    Ok(result)
}

/// Split operand string by commas, trimming whitespace.
fn split_operands(s: &str) -> Vec<String> {
    s.split(',')
        .map(|p| p.trim().to_string())
        .filter(|p| !p.is_empty())
        .collect()
}

/// How many pixels an instruction emits.
/// Most are 1 pixel, but LDI/JMP/BRANCH/CALL/BLIT are 2 (instruction + data word).
fn instruction_size(mnemonic: &str) -> usize {
    match mnemonic {
        "LDI" | "JMP" | "BNE" | "BEQ" | "BLT" | "BGE" | "BLTU" | "BGEU" | "CALL" | "BLIT" | "SEND" => 2,
        _ => 1,
    }
}

/// Pass 1: Walk the parsed lines and record the pixel offset for each label.
fn pass1_collect_labels(lines: &[Line]) -> Result<HashMap<String, usize>, String> {
    let mut labels = HashMap::new();
    let mut addr = 0usize;
    for line in lines {
        match line {
            Line::Label { name } => {
                if labels.contains_key(name) {
                    return Err(format!("duplicate label: '{}'", name));
                }
                labels.insert(name.clone(), addr);
            }
            Line::Instruction { mnemonic, line_num, .. } => {
                if mnemonic == "DATA" {
                    addr += 1;
                } else if !is_valid_mnemonic(mnemonic) {
                    return Err(format!("line {}: unknown instruction '{}'", line_num, mnemonic));
                } else {
                    addr += instruction_size(mnemonic);
                }
            }
        }
    }
    Ok(labels)
}

/// Pass 2: Emit pixel instructions, resolving labels.
fn pass2_emit(lines: &[Line], labels: &HashMap<String, usize>) -> Result<Program, String> {
    let mut prog = Program::new();
    let mut addr = 0usize;

    for line in lines {
        if let Line::Instruction {
            mnemonic,
            operands,
            line_num,
        } = line
        {
            emit_instruction(&mut prog, mnemonic, operands, addr, labels, *line_num)?;
            if mnemonic == "DATA" {
                addr += 1;
            } else {
                addr += instruction_size(mnemonic);
            }
        }
    }

    Ok(prog)
}

fn is_valid_mnemonic(m: &str) -> bool {
    matches!(
        m,
        "NOP"
            | "LDI"
            | "MOV"
            | "LOAD"
            | "STORE"
            | "ADD"
            | "SUB"
            | "MUL"
            | "DIV"
            | "JMP"
            | "BNE"
            | "BEQ"
            | "BLT"
            | "BGE"
            | "BLTU"
            | "BGEU"
            | "CALL"
            | "RET"
            | "HALT"
            | "ENTRY"
            | "CHAR"
            | "CHAR_AT"
            | "BLIT"
            | "SEND"
            | "RECV"
            | "SHR"
            | "OR"
            | "GLYPH_DEF"
            | "DATA"
    )
}

/// Parse a register operand: "r0" through "r127".
fn parse_reg(s: &str, line_num: usize, _operand_name: &str) -> Result<u8, String> {
    let s = s.trim();
    if !s.starts_with('r') && !s.starts_with('R') {
        return Err(format!(
            "line {}: expected register (r0-r127), got '{}'",
            line_num, s
        ));
    }
    let num: u8 = s[1..]
        .parse()
        .map_err(|_| format!("line {}: invalid register '{}'", line_num, s))?;
    if num > 127 {
        return Err(format!(
            "line {}: register out of range (r0-r127), got '{}'",
            line_num, s
        ));
    }
    Ok(num)
}

/// Parse an immediate value: decimal, hex (0x..), or char ('A').
fn parse_imm(s: &str, line_num: usize) -> Result<u32, String> {
    let s = s.trim();
    // Character literal: 'A' -> 65
    if s.starts_with('\'') && s.ends_with('\'') && s.len() == 3 {
        let ch = s.as_bytes()[1];
        return Ok(ch as u32);
    }
    // Hex: 0xDEAD
    if let Some(hex) = s.strip_prefix("0x").or_else(|| s.strip_prefix("0X")) {
        return u32::from_str_radix(hex, 16)
            .map_err(|_| format!("line {}: invalid hex literal '{}'", line_num, s));
    }
    // Decimal (possibly negative for offsets)
    let val: i64 = s
        .parse()
        .map_err(|_| format!("line {}: invalid integer '{}'", line_num, s))?;
    Ok(val as u32)
}

/// Resolve a label or immediate to an address.
fn resolve_label_or_imm(
    s: &str,
    line_num: usize,
    labels: &HashMap<String, usize>,
) -> Result<u32, String> {
    let s = s.trim();
    // Try as label first
    if let Some(&addr) = labels.get(s) {
        return Ok(addr as u32);
    }
    // Otherwise parse as immediate
    parse_imm(s, line_num)
}

/// Emit a single instruction into the program.
fn emit_instruction(
    prog: &mut Program,
    mnemonic: &str,
    operands: &[String],
    current_addr: usize,
    labels: &HashMap<String, usize>,
    line_num: usize,
) -> Result<(), String> {
    match mnemonic {
        "NOP" => {
            prog.instruction(op::NOP, 0, 0, 0);
        }
        "LDI" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let reg = parse_reg(&operands[0], line_num, "register")?;
            let val = parse_imm(&operands[1], line_num)?;
            prog.ldi(reg, val);
        }
        "MOV" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.instruction(op::MOV, 0, dst, src);
        }
        "LOAD" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let src = parse_reg(&operands[1], line_num, "address")?;
            prog.load(dst, src);
        }
        "STORE" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let addr_reg = parse_reg(&operands[0], line_num, "address")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.store(addr_reg, src);
        }
        "ADD" => {
            emit_alu(op::ADD, mnemonic, operands, prog, line_num)?;
        }
        "SUB" => {
            emit_alu(op::SUB, mnemonic, operands, prog, line_num)?;
        }
        "MUL" => {
            emit_alu(op::MUL, mnemonic, operands, prog, line_num)?;
        }
        "DIV" => {
            emit_alu(op::DIV, mnemonic, operands, prog, line_num)?;
        }
        "JMP" => {
            expect_ops(mnemonic, operands, 1, line_num)?;
            let target = resolve_label_or_imm(&operands[0], line_num, labels)?;
            let offset = (target as i64) - (current_addr as i64);
            prog.jmp(offset as i32);
        }
        "BNE" => {
            emit_branch(bcond::BNE, mnemonic, operands, current_addr, labels, prog, line_num)?;
        }
        "BEQ" => {
            emit_branch(bcond::BEQ, mnemonic, operands, current_addr, labels, prog, line_num)?;
        }
        "BLT" => {
            emit_branch(bcond::BLT, mnemonic, operands, current_addr, labels, prog, line_num)?;
        }
        "BGE" => {
            emit_branch(bcond::BGE, mnemonic, operands, current_addr, labels, prog, line_num)?;
        }
        "BLTU" => {
            emit_branch(bcond::BLTU, mnemonic, operands, current_addr, labels, prog, line_num)?;
        }
        "BGEU" => {
            emit_branch(bcond::BGEU, mnemonic, operands, current_addr, labels, prog, line_num)?;
        }
        "CALL" => {
            expect_ops(mnemonic, operands, 1, line_num)?;
            let target = resolve_label_or_imm(&operands[0], line_num, labels)?;
            // CALL is [opcode 11, 0, 0, 0] followed by [addr as u32]
            prog.instruction(op::CALL, 0, 0, 0);
            prog.pixels.push(target);
        }
        "RET" => {
            prog.instruction(op::RET, 0, 0, 0);
        }
        "HALT" => {
            prog.halt();
        }
        "ENTRY" => {
            expect_ops(mnemonic, operands, 1, line_num)?;
            let reg = parse_reg(&operands[0], line_num, "register")?;
            prog.entry(reg);
        }
        "CHAR" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let ascii_reg = parse_reg(&operands[0], line_num, "ascii")?;
            let target_reg = parse_reg(&operands[1], line_num, "target")?;
            prog.char_blit(ascii_reg, target_reg);
        }
        "CHAR_AT" => {
            expect_ops(mnemonic, operands, 3, line_num)?;
            let ascii_reg = parse_reg(&operands[0], line_num, "ascii")?;
            let target_reg = parse_reg(&operands[1], line_num, "target")?;
            let atlas_base_reg = parse_reg(&operands[2], line_num, "atlas_base")?;
            prog.char_at_blit(ascii_reg, target_reg, atlas_base_reg);
        }
        "BLIT" => {
            expect_ops(mnemonic, operands, 3, line_num)?;
            let src = parse_reg(&operands[0], line_num, "source")?;
            let dst = parse_reg(&operands[1], line_num, "destination")?;
            let count = parse_imm(&operands[2], line_num)?;
            prog.blit(src, dst, count);
        }
        "SEND" => {
            expect_ops(mnemonic, operands, 3, line_num)?;
            let target_vm = parse_reg(&operands[0], line_num, "target_vm")?;
            let data_addr = parse_reg(&operands[1], line_num, "data_addr")?;
            let length = parse_imm(&operands[2], line_num)?;
            prog.send(target_vm, data_addr, length);
        }
        "RECV" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dest_addr = parse_reg(&operands[0], line_num, "dest_addr")?;
            let status = parse_reg(&operands[1], line_num, "status")?;
            prog.recv(dest_addr, status);
        }
        "SHR" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.shr(dst, src);
        }
        "OR" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.or(dst, src);
        }
        "GLYPH_DEF" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let charcode = parse_reg(&operands[0], line_num, "charcode")?;
            let bitmap_addr = parse_reg(&operands[1], line_num, "bitmap_addr")?;
            prog.glyph_def(charcode, bitmap_addr);
        }
        "DATA" => {
            expect_ops(mnemonic, operands, 1, line_num)?;
            let val = parse_imm(&operands[0], line_num)?;
            prog.pixels.push(val);
        }
        _ => {
            return Err(format!(
                "line {}: unknown instruction '{}'",
                line_num, mnemonic
            ));
        }
    }
    Ok(())
}

/// Emit an ALU instruction (ADD, SUB, MUL, DIV).
fn emit_alu(
    opcode: u8,
    mnemonic: &str,
    operands: &[String],
    prog: &mut Program,
    line_num: usize,
) -> Result<(), String> {
    expect_ops(mnemonic, operands, 2, line_num)?;
    let dst = parse_reg(&operands[0], line_num, "destination")?;
    let src = parse_reg(&operands[1], line_num, "source")?;
    prog.instruction(opcode, 0, dst, src);
    Ok(())
}

/// Emit a conditional branch instruction.
fn emit_branch(
    cond: u8,
    mnemonic: &str,
    operands: &[String],
    current_addr: usize,
    labels: &HashMap<String, usize>,
    prog: &mut Program,
    line_num: usize,
) -> Result<(), String> {
    expect_ops(mnemonic, operands, 3, line_num)?;
    let r1 = parse_reg(&operands[0], line_num, "register 1")?;
    let r2 = parse_reg(&operands[1], line_num, "register 2")?;
    let target = resolve_label_or_imm(&operands[2], line_num, labels)?;
    let offset = (target as i64) - (current_addr as i64);
    prog.branch(cond, r1, r2, offset as i32);
    Ok(())
}

/// Check operand count.
fn expect_ops(
    mnemonic: &str,
    operands: &[String],
    expected: usize,
    line_num: usize,
) -> Result<(), String> {
    if operands.len() != expected {
        return Err(format!(
            "line {}: '{}' expects {} operand(s), got {}",
            line_num,
            mnemonic,
            expected,
            operands.len()
        ));
    }
    Ok(())
}

/// Disassemble a pixel program back into .gasm text.
///
/// Useful for debugging and inspection. Labels are not recovered;
/// addresses are shown as absolute values.
pub fn disassemble(pixels: &[u32]) -> Vec<String> {
    let mut lines = Vec::new();
    let mut i = 0;
    while i < pixels.len() {
        let pixel = pixels[i];
        let opcode = (pixel & 0xFF) as u8;
        let stratum = ((pixel >> 8) & 0xFF) as u8;
        let p1 = ((pixel >> 16) & 0xFF) as u8;
        let p2 = ((pixel >> 24) & 0xFF) as u8;

        let line = match opcode {
            op::NOP => format!("{:4}: NOP", i),
            op::LDI => {
                if i + 1 < pixels.len() {
                    let val = pixels[i + 1];
                    format!("{:4}: LDI r{}, 0x{:08X}", i, p1, val)
                } else {
                    format!("{:4}: LDI r{}, <missing data>", i, p1)
                }
            }
            op::MOV => format!("{:4}: MOV r{}, r{}", i, p1, p2),
            op::LOAD => format!("{:4}: LOAD r{}, [r{}]", i, p1, p2),
            op::STORE => format!("{:4}: STORE [r{}], r{}", i, p1, p2),
            op::ADD => format!("{:4}: ADD r{}, r{}", i, p1, p2),
            op::SUB => format!("{:4}: SUB r{}, r{}", i, p1, p2),
            op::MUL => format!("{:4}: MUL r{}, r{}", i, p1, p2),
            op::DIV => format!("{:4}: DIV r{}, r{}", i, p1, p2),
            op::JMP => {
                if i + 1 < pixels.len() {
                    let offset = pixels[i + 1] as i32;
                    let target = (i as i32 + offset) as i32;
                    format!("{:4}: JMP {} (addr {})", i, offset, target)
                } else {
                    format!("{:4}: JMP <missing data>", i)
                }
            }
            op::BRANCH => {
                let cond_name = match stratum {
                    bcond::BEQ => "BEQ",
                    bcond::BNE => "BNE",
                    bcond::BLT => "BLT",
                    bcond::BGE => "BGE",
                    bcond::BLTU => "BLTU",
                    bcond::BGEU => "BGEU",
                    _ => "B??",
                };
                if i + 1 < pixels.len() {
                    let offset = pixels[i + 1] as i32;
                    let target = (i as i32 + offset) as i32;
                    format!(
                        "{:4}: {} r{}, r{}, {} (addr {})",
                        i, cond_name, p1, p2, offset, target
                    )
                } else {
                    format!("{:4}: {} r{}, r{}, <missing data>", i, cond_name, p1, p2)
                }
            }
            op::CALL => {
                if i + 1 < pixels.len() {
                    let addr = pixels[i + 1];
                    format!("{:4}: CALL {}", i, addr)
                } else {
                    format!("{:4}: CALL <missing data>", i)
                }
            }
            op::RET => format!("{:4}: RET", i),
            op::HALT => format!("{:4}: HALT", i),
            op::ENTRY => format!("{:4}: ENTRY r{}", i, p1),
            op::CHAR => format!("{:4}: CHAR r{}, r{}", i, p1, p2),
            op::CHAR_AT => format!("{:4}: CHAR_AT r{}, r{}, r{}", i, p1, p2, stratum),
            op::BLIT => {
                if i + 1 < pixels.len() {
                    let count = pixels[i + 1];
                    format!("{:4}: BLIT r{}, r{}, {}", i, p1, p2, count)
                } else {
                    format!("{:4}: BLIT r{}, r{}, <missing data>", i, p1, p2)
                }
            }
            op::SEND => {
                if i + 1 < pixels.len() {
                    let length = pixels[i + 1];
                    format!("{:4}: SEND r{}, r{}, {}", i, p1, p2, length)
                } else {
                    format!("{:4}: SEND r{}, r{}, <missing data>", i, p1, p2)
                }
            }
            op::RECV => format!("{:4}: RECV r{}, r{}", i, p1, p2),
            op::SHR => format!("{:4}: SHR r{}, r{}", i, p1, p2),
            op::OR => format!("{:4}: OR r{}, r{}", i, p1, p2),
            op::GLYPH_DEF => format!("{:4}: GLYPH_DEF r{}, r{}", i, p1, p2),
            _ => format!("{:4}: ??? opcode={} raw=0x{:08X}", i, opcode, pixel),
        };

        lines.push(line);
        i += instruction_size_from_opcode(opcode);
    }
    lines
}

/// How many pixels an instruction consumes based on its opcode.
fn instruction_size_from_opcode(opcode: u8) -> usize {
    match opcode {
        op::LDI | op::JMP | op::BRANCH | op::CALL | op::BLIT | op::SEND => 2,
        _ => 1,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::assembler;

    #[test]
    fn assemble_self_replicator() {
        // The canonical self-replicator written in .gasm
        let source = r#"
            ; Self-replicator: copies 18 pixels from addr 0 to addr 100
            LDI r0, 0          ; source start
            LDI r1, 100        ; destination
            LDI r2, 0          ; counter
            LDI r3, 1          ; increment
            LDI r4, 18         ; program length
            loop:
                LOAD r5, r0    ; r5 = mem[r0]
                STORE r1, r5   ; mem[r1] = r5
                ADD r0, r3     ; r0 += 1
                ADD r1, r3     ; r1 += 1
                ADD r2, r3     ; r2 += 1
                BNE r2, r4, loop
            HALT
        "#;

        let assembled = assemble(source).expect("assembly should succeed");
        let reference = assembler::self_replicator();

        assert_eq!(
            assembled.len(),
            reference.len(),
            "assembled length should match reference ({})",
            reference.len()
        );
        // Check all non-offset pixels match exactly
        // Pixel 16 is the BNE offset: gasm targets the label precisely (offset=-5, addr 10)
        // while the reference uses a hand-written offset of -7 (jumps to addr 8).
        // Both are semantically correct; gasm is more precise.
        for (i, (a, r)) in assembled.pixels.iter().zip(reference.pixels.iter()).enumerate() {
            if i == 16 {
                // BNE offset pixel -- verify it's a valid backward branch
                let offset_a = *a as i32;
                let offset_r = *r as i32;
                assert!(offset_a < 0, "gasm BNE offset should be negative (backward), got {}", offset_a);
                assert!(offset_r < 0, "reference BNE offset should be negative (backward), got {}", offset_r);
            } else {
                assert_eq!(a, r, "pixel {} mismatch: gasm={} reference={}", i, a, r);
            }
        }
        // Verify the assembled program actually runs correctly in the software VM
        use crate::software_vm::SoftwareVm;
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &assembled.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).halted, 1, "should halt");

        // Verify the copy happened: pixels at addr 100 should match addr 0
        for (i, expected) in assembled.pixels.iter().enumerate() {
            assert_eq!(svm.peek((100 + i) as u32), *expected,
                "pixel at addr {} should be copied", 100 + i);
        }
    }

    #[test]
    fn assemble_hello_world() {
        let source = r#"
            LDI r0, 'H'
            LDI r1, 5000
            CHAR r0, r1
            LDI r0, 'E'
            LDI r1, 5010
            CHAR r0, r1
            LDI r0, 'L'
            LDI r1, 5020
            CHAR r0, r1
            LDI r0, 'L'
            LDI r1, 5030
            CHAR r0, r1
            LDI r0, 'O'
            LDI r1, 5040
            CHAR r0, r1
            HALT
        "#;

        let assembled = assemble(source).expect("assembly should succeed");
        let reference = assembler::hello_world();

        assert_eq!(assembled.len(), 26);
        assert_eq!(assembled.pixels, reference.pixels);
    }

    #[test]
    fn assemble_chain_replicator() {
        let source = r#"
            ENTRY r0
            MOV r1, r0
            LDI r6, 100
            ADD r1, r6
            LDI r2, 0
            LDI r3, 1
            LDI r4, 19
            loop:
                LOAD r5, r0
                STORE r1, r5
                ADD r0, r3
                ADD r1, r3
                ADD r2, r3
                BNE r2, r4, loop
            HALT
        "#;

        let assembled = assemble(source).expect("assembly should succeed");
        let reference = assembler::chain_replicator();

        assert_eq!(assembled.len(), 19);
        assert_eq!(assembled.pixels, reference.pixels);
    }

    #[test]
    fn assemble_with_hex_and_char() {
        let source = r#"
            LDI r0, 0xDEAD
            LDI r1, 'Z'
            HALT
        "#;

        let prog = assemble(source).expect("should assemble");
        assert_eq!(prog.len(), 5); // LDI(2) + LDI(2) + HALT(1) = 5

        // Check the hex value was parsed correctly
        assert_eq!(prog.pixels[1], 0xDEAD);
        // Check the char value was parsed correctly
        assert_eq!(prog.pixels[3], 'Z' as u32);
    }

    #[test]
    fn assemble_forward_jump() {
        let source = r#"
            JMP skip
            NOP
            NOP
            skip:
            HALT
        "#;

        let prog = assemble(source).expect("should assemble");
        // JMP at addr 0 (2 pixels), NOP at 2, NOP at 3, HALT at 4
        // JMP target = 4, offset = 4 - 0 = 4
        assert_eq!(prog.pixels[0] & 0xFF, op::JMP as u32);
        assert_eq!(prog.pixels[1], 4); // offset to addr 4
    }

    #[test]
    fn assemble_call_ret() {
        let source = r#"
            CALL helper
            HALT
            helper:
                LDI r0, 42
                RET
        "#;

        let prog = assemble(source).expect("should assemble");
        // CALL at addr 0 (2 pixels), HALT at 2, LDI at 3 (2 pixels), RET at 5
        // CALL target = addr 3
        assert_eq!(prog.pixels[0] & 0xFF, op::CALL as u32);
        assert_eq!(prog.pixels[1], 3); // target address
    }

    #[test]
    fn assemble_errors_on_unknown_instruction() {
        let source = "INVALID r0, r1";
        assert!(assemble(source).is_err());
    }

    #[test]
    fn assemble_errors_on_bad_register() {
        let source = "ADD r0, x1";
        assert!(assemble(source).is_err());
    }

    #[test]
    fn assemble_errors_on_wrong_operand_count() {
        let source = "ADD r0";
        assert!(assemble(source).is_err());
    }

    #[test]
    fn assemble_errors_on_undefined_label() {
        let source = "JMP nonexistent";
        assert!(assemble(source).is_err());
    }

    #[test]
    fn assemble_errors_on_duplicate_label() {
        let source = r#"
            foo:
            NOP
            foo:
            HALT
        "#;
        assert!(assemble(source).is_err());
    }

    #[test]
    fn disassemble_roundtrip() {
        let prog = assembler::self_replicator();
        let lines = disassemble(&prog.pixels);

        // 18 pixels = 5 LDI(2px each) + LOAD + STORE + 3 ADD + BNE(2px) + HALT
        // = 5 + 1 + 1 + 3 + 1 + 1 = 12 logical instruction lines
        assert_eq!(lines.len(), 12, "should produce 12 disassembly lines");

        // First instruction should be LDI
        assert!(lines[0].contains("LDI"), "first line should be LDI, got: {}", lines[0]);
        // Should contain a HALT
        assert!(lines.iter().any(|l| l.contains("HALT")));
        // Should contain a BNE (the loop branch)
        assert!(lines.iter().any(|l| l.contains("BNE")));
        // Should contain LOAD and STORE
        assert!(lines.iter().any(|l| l.contains("LOAD")));
        assert!(lines.iter().any(|l| l.contains("STORE")));
    }

    #[test]
    fn assemble_data_directive() {
        let source = r#"
            LDI r0, 0
            DATA 0x12345678
            HALT
        "#;

        let prog = assemble(source).expect("should assemble");
        // LDI r0, 0 = 2 pixels, DATA = 1 pixel, HALT = 1 pixel = 4 total
        assert_eq!(prog.len(), 4);
        assert_eq!(prog.pixels[2], 0x12345678);
    }

    #[test]
    fn assemble_all_branch_conditions() {
        let source = r#"
            BEQ r0, r1, target
            BNE r0, r1, target
            BLT r0, r1, target
            BGE r0, r1, target
            BLTU r0, r1, target
            BGEU r0, r1, target
            target:
            HALT
        "#;

        let prog = assemble(source).expect("should assemble");
        // 6 branches * 2 pixels + 1 HALT = 13
        assert_eq!(prog.len(), 13);

        // Check condition codes are encoded correctly
        assert_eq!((prog.pixels[0] >> 8) & 0xFF, bcond::BEQ as u32); // BEQ
        assert_eq!((prog.pixels[2] >> 8) & 0xFF, bcond::BNE as u32); // BNE
        assert_eq!((prog.pixels[4] >> 8) & 0xFF, bcond::BLT as u32); // BLT
        assert_eq!((prog.pixels[6] >> 8) & 0xFF, bcond::BGE as u32); // BGE
        assert_eq!((prog.pixels[8] >> 8) & 0xFF, bcond::BLTU as u32); // BLTU
        assert_eq!((prog.pixels[10] >> 8) & 0xFF, bcond::BGEU as u32); // BGEU
    }

    #[test]
    fn assemble_alu_ops() {
        let source = r#"
            ADD r0, r1
            SUB r2, r3
            MUL r4, r5
            DIV r6, r7
            HALT
        "#;

        let prog = assemble(source).expect("should assemble");
        assert_eq!(prog.len(), 5);
        assert_eq!(prog.pixels[0] & 0xFF, op::ADD as u32);
        assert_eq!(prog.pixels[1] & 0xFF, op::SUB as u32);
        assert_eq!(prog.pixels[2] & 0xFF, op::MUL as u32);
        assert_eq!(prog.pixels[3] & 0xFF, op::DIV as u32);
    }
}
