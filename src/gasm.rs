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
    assemble_with_frame_labels(source, &HashMap::new())
}

/// Assemble with frame labels for `@Name` resolution.
pub fn assemble_with_frame_labels(
    source: &str,
    frame_labels: &HashMap<String, usize>,
) -> Result<Program, String> {
    let lines = parse_lines(source)?;
    let labels = pass1_collect_labels(&lines)?;
    pass2_emit(&lines, &labels, frame_labels)
}

/// Assemble a multi-frame .gasm source string into a vector of Programs.
///
/// Frames are separated by a `---` line (three dashes). Each segment is
/// assembled independently (labels are local to each frame).
///
/// Frame labels (`@Name`) can be used in LDI immediates to reference frames
/// by name instead of index. Declare labels with `.frame "Name"` directives.
///
/// Returns a Vec of Programs, one per frame, on success.
pub fn assemble_filmstrip(source: &str) -> Result<Vec<Program>, String> {
    let (programs, _) = assemble_filmstrip_with_labels(source)?;
    Ok(programs)
}

/// Assemble a filmstrip and also return the frame label map.
///
/// Returns `(Vec<Program>, HashMap<String, usize>)` where the map contains
/// `.frame "Name"` directives mapped to their segment index. UI consumers
/// can use this to render symbolic frame names instead of raw indices.
pub fn assemble_filmstrip_with_labels(
    source: &str,
) -> Result<(Vec<Program>, HashMap<String, usize>), String> {
    // Pass 0: extract .frame "Name" directives and build label map
    let (cleaned, frame_labels) = pass0_frame_labels(source)?;

    let segments: Vec<&str> = cleaned.split("\n---\n").collect();
    if segments.len() < 2 {
        return Err(
            "Filmstrip source must contain at least 2 frames separated by '---'".into(),
        );
    }
    let mut programs = Vec::with_capacity(segments.len());
    for (i, seg) in segments.iter().enumerate() {
        let prog = assemble_with_frame_labels(seg, &frame_labels)
            .map_err(|e| format!("Frame {}: {}", i, e))?;
        programs.push(prog);
    }
    Ok((programs, frame_labels))
}

/// Pass 0: Scan source for `.frame "Name"` directives.
///
/// Builds a HashMap<String, usize> mapping label names to segment indices
/// (based on `---` separator positions). Returns the cleaned source with
/// `.frame` directives stripped.
fn pass0_frame_labels(source: &str) -> Result<(String, HashMap<String, usize>), String> {
    let mut frame_labels = HashMap::new();
    let mut cleaned_lines = Vec::new();
    let mut segment_index = 0usize;

    for (i, line) in source.lines().enumerate() {
        let trimmed = line.trim();

        // Check for .frame "Name" directive
        if trimmed.starts_with(".frame") {
            let rest = trimmed[6..].trim();
            // Extract quoted name
            if rest.starts_with('"') && rest.ends_with('"') && rest.len() >= 2 {
                let name = &rest[1..rest.len() - 1];
                if name.is_empty() {
                    return Err(format!("line {}: empty frame label name", i + 1));
                }
                if frame_labels.contains_key(name) {
                    return Err(format!(
                        "line {}: duplicate frame label '{}'",
                        i + 1,
                        name
                    ));
                }
                frame_labels.insert(name.to_string(), segment_index);
            } else {
                return Err(format!(
                    "line {}: .frame expects a quoted name, e.g. .frame \"Boot\"",
                    i + 1
                ));
            }
            continue; // strip the directive from output
        }

        // Track segment boundaries
        if trimmed == "---" {
            segment_index += 1;
        }

        cleaned_lines.push(line);
    }

    Ok((cleaned_lines.join("\n"), frame_labels))
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
    Directive {
        kind: DirectiveKind,
        line_num: usize,
    },
}

/// Assembler directives (GEO-73)
#[derive(Debug, Clone)]
enum DirectiveKind {
    /// .org 0xADDR -- set output pixel pointer to given address
    Org { addr: usize },
    /// .define NAME VALUE -- constant substitution
    Define { name: String, value: String },
    /// .include "filename" -- host-protocol file inclusion
    Include { filename: String },
}

/// Strip comments and blank lines, separate labels from instructions.
/// Also handles assembler directives (.org, .define, .include).
fn parse_lines(source: &str) -> Result<Vec<Line>, String> {
    // Pre-pass: extract .define directives and substitute constants
    let (defines, cleaned) = extract_defines(source)?;

    // Apply constant substitutions to the cleaned source
    let substituted = apply_defines(&cleaned, &defines);

    let mut result = Vec::new();
    for (i, raw) in substituted.lines().enumerate() {
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
        // Check for directives (lines starting with '.')
        if trimmed.starts_with('.') {
            let directive = parse_directive(trimmed, line_num)?;
            result.push(Line::Directive {
                kind: directive,
                line_num,
            });
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

/// Pre-pass: extract .define NAME VALUE directives from source.
/// Returns the defines map and the source with .define lines stripped.
fn extract_defines(source: &str) -> Result<(HashMap<String, String>, String), String> {
    let mut defines = HashMap::new();
    let mut cleaned = Vec::new();
    for (i, line) in source.lines().enumerate() {
        let line_num = i + 1;
        let trimmed = line.trim();
        // Strip comments first
        let trimmed = match trimmed.find(';') {
            Some(pos) => &trimmed[..pos],
            None => trimmed,
        };
        let trimmed = trimmed.trim();
        if trimmed.to_lowercase().starts_with(".define") {
            // .define NAME VALUE
            let rest = trimmed[7..].trim();
            let mut parts = rest.splitn(2, |c: char| c.is_whitespace());
            let name = parts.next().unwrap_or("").trim();
            let value = parts.next().unwrap_or("").trim();
            if name.is_empty() || value.is_empty() {
                return Err(format!(
                    "line {}: .define expects NAME and VALUE, e.g. .define FOO 42",
                    line_num
                ));
            }
            // Validate name: uppercase letters, digits, underscores
            if !name.chars().all(|c| c.is_ascii_uppercase() || c.is_ascii_digit() || c == '_')
                || name.starts_with(|c: char| c.is_ascii_digit())
            {
                return Err(format!(
                    "line {}: .define name must be UPPER_CASE (letters, digits, underscores, not starting with digit), got '{}'",
                    line_num, name
                ));
            }
            if defines.contains_key(name) {
                return Err(format!("line {}: duplicate .define '{}'", line_num, name));
            }
            defines.insert(name.to_string(), value.to_string());
            continue; // strip the directive
        }
        cleaned.push(line);
    }
    Ok((defines, cleaned.join("\n")))
}

/// Apply .define substitutions to source text.
/// Replaces all occurrences of defined names that appear as standalone tokens.
fn apply_defines(source: &str, defines: &HashMap<String, String>) -> String {
    if defines.is_empty() {
        return source.to_string();
    }
    let mut result = source.to_string();
    for (name, value) in defines {
        // Replace whole-word occurrences only (not inside other tokens)
        // We use a simple approach: split by word boundaries and replace
        let mut output = String::with_capacity(result.len());
        let mut i = 0;
        let bytes = result.as_bytes();
        while i < bytes.len() {
            // Check if we're at the start of a word that matches a define name
            let remaining = &result[i..];
            if remaining.starts_with(name.as_str()) {
                // Check word boundary: preceded by non-alphanumeric/underscore
                let preceded_by_word = i > 0
                    && {
                        let prev = bytes[i - 1];
                        prev.is_ascii_alphanumeric() || prev == b'_'
                    };
                // Check word boundary: followed by non-alphanumeric/underscore or end
                let end_pos = i + name.len();
                let followed_by_word = end_pos < bytes.len()
                    && {
                        let next = bytes[end_pos];
                        next.is_ascii_alphanumeric() || next == b'_'
                    };
                if !preceded_by_word && !followed_by_word {
                    output.push_str(value);
                    i += name.len();
                    continue;
                }
            }
            output.push(bytes[i] as char);
            i += 1;
        }
        result = output;
    }
    result
}

/// Parse a directive line (already trimmed, starts with '.').
fn parse_directive(trimmed: &str, line_num: usize) -> Result<DirectiveKind, String> {
    let mut parts = trimmed.splitn(2, |c: char| c.is_whitespace());
    let directive = parts.next().unwrap().to_lowercase();
    let rest = parts.next().unwrap_or("").trim();
    match directive.as_str() {
        ".org" => {
            let addr = parse_imm(rest, line_num)? as usize;
            Ok(DirectiveKind::Org { addr })
        }
        ".include" => {
            // .include "filename"
            if rest.starts_with('"') && rest.ends_with('"') && rest.len() >= 2 {
                let filename = rest[1..rest.len() - 1].to_string();
                if filename.is_empty() {
                    return Err(format!(
                        "line {}: .include expects a non-empty filename",
                        line_num
                    ));
                }
                Ok(DirectiveKind::Include { filename })
            } else {
                Err(format!(
                    "line {}: .include expects quoted filename, e.g. .include \"helpers.gasm\"",
                    line_num
                ))
            }
        }
        ".define" => {
            // Already handled in pre-pass; should not reach here
            Err(format!(
                "line {}: .define should have been processed in pre-pass",
                line_num
            ))
        }
        _ => Err(format!(
            "line {}: unknown directive '{}'",
            line_num, directive
        )),
    }
}

/// Split operand string by commas, trimming whitespace.
fn split_operands(s: &str) -> Vec<String> {
    s.split(',')
        .map(|p| p.trim().to_string())
        .filter(|p| !p.is_empty())
        .collect()
}

/// How many pixels an instruction emits.
/// Most are 1 pixel, but LDI/JMP/BRANCH/CALL/BLIT/RECTF/LINE are 2 (instruction + data word).
fn instruction_size(mnemonic: &str) -> usize {
    match mnemonic {
        "LDI" | "JMP" | "BNE" | "BEQ" | "BLT" | "BGE" | "BLTU" | "BGEU" | "CALL" | "BLIT"
        | "SEND" | "RECTF" | "LINE" | "SPATIAL_SPAWN" | "SEMANTIC_MERGE" | "BRANCH_PROB" | "ALTERNATE_PATH" => 2,
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
            Line::Directive { kind, .. } => {
                match kind {
                    DirectiveKind::Org { addr: new_addr } => {
                        addr = *new_addr;
                    }
                    DirectiveKind::Define { .. } | DirectiveKind::Include { .. } => {
                        // Preprocessor-like: no pixel output
                    }
                }
            }
        }
    }
    Ok(labels)
}

/// Pass 2: Emit pixel instructions, resolving labels.
fn pass2_emit(
    lines: &[Line],
    labels: &HashMap<String, usize>,
    frame_labels: &HashMap<String, usize>,
) -> Result<Program, String> {
    let mut prog = Program::new();
    let mut addr = 0usize;

    for line in lines {
        match line {
            Line::Instruction {
                mnemonic,
                operands,
                line_num,
            } => {
                emit_instruction(
                    &mut prog,
                    mnemonic,
                    operands,
                    addr,
                    labels,
                    frame_labels,
                    *line_num,
                )?;
                if mnemonic == "DATA" {
                    addr += 1;
                } else {
                    addr += instruction_size(mnemonic);
                }
            }
            Line::Directive { kind, line_num } => {
                match kind {
                    DirectiveKind::Org { addr: target_addr } => {
                        if *target_addr < addr {
                            return Err(format!(
                                "line {}: .org address {} is behind current address {} (backward .org not supported)",
                                line_num, target_addr, addr
                            ));
                        }
                        // Emit NOP padding pixels to reach target address
                        while addr < *target_addr {
                            prog.instruction(op::NOP, 0, 0, 0);
                            addr += 1;
                        }
                    }
                    DirectiveKind::Include { filename } => {
                        return Err(format!(
                            "line {}: .include '{}' requires host file resolution (not yet supported in standalone assembly)",
                            line_num, filename
                        ));
                    }
                    DirectiveKind::Define { .. } => {
                        // Already processed in pre-pass; no pixel output
                    }
                }
            }
            Line::Label { .. } => {
                // Labels don't emit pixels; pass
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
            | "AND"
            | "SHL"
            | "XOR"
            | "NOT"
            | "PSET"
            | "PGET"
            | "LDB"
            | "STB"
            | "MOD"
            | "YIELD"
            | "GLYPH_DEF"
            | "FRAME"
            | "RECTF"
            | "LINE"
            | "TEXT_STR"
            | "CIRCLEF"
            | "DATA"
            | "ISSUE_CREATE"
            | "ISSUE_PICK"
            | "ISSUE_UPDATE"
            | "ISSUE_LIST"
            | "SPAWN"
            | "SPATIAL_SPAWN"
            | "GLYPH_MUTATE"
            | "SEMANTIC_MERGE"
            | "BRANCH_PROB"
            | "CONFIDENCE_MARK"
            | "ALTERNATE_PATH"
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

/// Resolve a frame label reference (@Name) to a frame index.
fn resolve_frame_label(
    s: &str,
    line_num: usize,
    frame_labels: &HashMap<String, usize>,
) -> Option<Result<u32, String>> {
    let s = s.trim();
    if let Some(name) = s.strip_prefix('@') {
        match frame_labels.get(name) {
            Some(&idx) => Some(Ok(idx as u32)),
            None => Some(Err(format!(
                "line {}: unknown frame label '@{}'",
                line_num, name
            ))),
        }
    } else {
        None
    }
}

/// Emit a single instruction into the program.
fn emit_instruction(
    prog: &mut Program,
    mnemonic: &str,
    operands: &[String],
    current_addr: usize,
    labels: &HashMap<String, usize>,
    frame_labels: &HashMap<String, usize>,
    line_num: usize,
) -> Result<(), String> {
    match mnemonic {
        "NOP" => {
            prog.instruction(op::NOP, 0, 0, 0);
        }
        "LDI" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let reg = parse_reg(&operands[0], line_num, "register")?;
            let val = if let Some(result) =
                resolve_frame_label(&operands[1], line_num, frame_labels)
            {
                result?
            } else {
                parse_imm(&operands[1], line_num)?
            };
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
        "YIELD" => {
            prog.yield_op();
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
        "AND" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.instruction(op::AND, 0, dst, src);
        }
        "SHL" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.instruction(op::SHL, 0, dst, src);
        }
        "XOR" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.xor(dst, src);
        }
        "NOT" => {
            expect_ops(mnemonic, operands, 1, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            prog.not(dst);
        }
        "PSET" => {
            expect_ops(mnemonic, operands, 3, line_num)?;
            let x_reg = parse_reg(&operands[0], line_num, "x")?;
            let y_reg = parse_reg(&operands[1], line_num, "y")?;
            let color_reg = parse_reg(&operands[2], line_num, "color")?;
            prog.pset(x_reg, y_reg, color_reg);
        }
        "PGET" => {
            expect_ops(mnemonic, operands, 3, line_num)?;
            let dst_reg = parse_reg(&operands[0], line_num, "destination")?;
            let x_reg = parse_reg(&operands[1], line_num, "x")?;
            let y_reg = parse_reg(&operands[2], line_num, "y")?;
            prog.pget(dst_reg, x_reg, y_reg);
        }
        "GLYPH_DEF" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let charcode = parse_reg(&operands[0], line_num, "charcode")?;
            let bitmap_addr = parse_reg(&operands[1], line_num, "bitmap_addr")?;
            prog.glyph_def(charcode, bitmap_addr);
        }
        "FRAME" => {
            expect_ops(mnemonic, operands, 1, line_num)?;
            let target = parse_reg(&operands[0], line_num, "frame_target")?;
            prog.frame(target);
        }
        "LDB" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let dst = parse_reg(&operands[0], line_num, "destination")?;
            let addr = parse_reg(&operands[1], line_num, "address")?;
            prog.ldb(dst, addr);
        }
        "STB" => {
            expect_ops(mnemonic, operands, 2, line_num)?;
            let addr = parse_reg(&operands[0], line_num, "address")?;
            let src = parse_reg(&operands[1], line_num, "source")?;
            prog.stb(addr, src);
        }
        "MOD" => {
            emit_alu(op::MOD, mnemonic, operands, prog, line_num)?;
        }
        "RECTF" => {
            // RECTF r_x, r_y, packed_params -- 2 pixels: instruction + packed (w<<16|h) immediate
            expect_ops(mnemonic, operands, 3, line_num)?;
            let x = parse_reg(&operands[0], line_num, "x")?;
            let y = parse_reg(&operands[1], line_num, "y")?;
            let packed = parse_imm(&operands[2], line_num)?;
            prog.instruction(op::RECTF, x, y, 0);
            prog.pixels.push(packed);
        }
        "LINE" => {
            // LINE r_x0, r_y0, packed_endpoints -- 2 pixels: instruction + packed (x1<<16|y1) immediate
            expect_ops(mnemonic, operands, 3, line_num)?;
            let x0 = parse_reg(&operands[0], line_num, "x0")?;
            let y0 = parse_reg(&operands[1], line_num, "y0")?;
            let packed = parse_imm(&operands[2], line_num)?;
            prog.instruction(op::LINE, x0, y0, 0);
            prog.pixels.push(packed);
        }
        "TEXT_STR" => {
            // TEXT_STR r_addr, r_x, r_y
            expect_ops(mnemonic, operands, 3, line_num)?;
            let addr = parse_reg(&operands[0], line_num, "addr")?;
            let x = parse_reg(&operands[1], line_num, "x")?;
            let y = parse_reg(&operands[2], line_num, "y")?;
            prog.instruction(op::TEXT_STR, addr, x, y);
        }
        "CIRCLEF" => {
            // CIRCLEF r_cx, r_cy, r_radius
            expect_ops(mnemonic, operands, 3, line_num)?;
            let cx = parse_reg(&operands[0], line_num, "cx")?;
            let cy = parse_reg(&operands[1], line_num, "cy")?;
            let r = parse_reg(&operands[2], line_num, "radius")?;
            prog.instruction(op::CIRCLEF, cx, cy, r);
        }
        "DATA" => {
            expect_ops(mnemonic, operands, 1, line_num)?;
            let val = parse_imm(&operands[0], line_num)?;
            prog.pixels.push(val);
        }
        "ISSUE_CREATE" => {
            // ISSUE_CREATE r_title_addr, r_priority, assignee_id
            expect_ops(mnemonic, operands, 3, line_num)?;
            let title_addr = parse_reg(&operands[0], line_num, "title_addr")?;
            let priority = parse_reg(&operands[1], line_num, "priority")?;
            let assignee_id = parse_imm(&operands[2], line_num)? as u8;
            prog.issue_create(title_addr, priority, assignee_id);
        }
        "ISSUE_PICK" => {
            // ISSUE_PICK r_out_addr, r_filter, agent_vm_id
            expect_ops(mnemonic, operands, 3, line_num)?;
            let out_addr = parse_reg(&operands[0], line_num, "out_addr")?;
            let filter = parse_reg(&operands[1], line_num, "filter")?;
            let agent_vm_id = parse_imm(&operands[2], line_num)? as u8;
            prog.issue_pick(out_addr, filter, agent_vm_id);
        }
        "ISSUE_UPDATE" => {
            // ISSUE_UPDATE r_issue_id, r_new_status
            expect_ops(mnemonic, operands, 2, line_num)?;
            let issue_id = parse_reg(&operands[0], line_num, "issue_id")?;
            let new_status = parse_reg(&operands[1], line_num, "new_status")?;
            prog.issue_update(issue_id, new_status);
        }
        "ISSUE_LIST" => {
            // ISSUE_LIST r_out_addr, r_filter, max_results
            expect_ops(mnemonic, operands, 3, line_num)?;
            let out_addr = parse_reg(&operands[0], line_num, "out_addr")?;
            let filter = parse_reg(&operands[1], line_num, "filter")?;
            let max_results = parse_imm(&operands[2], line_num)? as u8;
            prog.issue_list(out_addr, filter, max_results);
        },
        "SPAWN" => {
            // SPAWN r_base_addr, r_entry_offset
            expect_ops(mnemonic, operands, 2, line_num)?;
            let base = parse_reg(&operands[0], line_num, "base_addr")?;
            let entry = parse_reg(&operands[1], line_num, "entry_offset")?;
            prog.instruction(op::SPAWN, 0, base, entry);
        },
        "SPATIAL_SPAWN" => {
            // SPATIAL_SPAWN r_dest_addr, r_size, r_source_addr -- 2 pixels
            expect_ops(mnemonic, operands, 3, line_num)?;
            let dest = parse_reg(&operands[0], line_num, "dest_addr")?;
            let size = parse_reg(&operands[1], line_num, "size")?;
            let source = parse_reg(&operands[2], line_num, "source_addr")?;
            prog.instruction(op::SPATIAL_SPAWN, size, dest, source);
            prog.pixels.push(source as u32); // data word: source register index
        },
        "GLYPH_MUTATE" => {
            // GLYPH_MUTATE r_target_addr, r_new_opcode
            expect_ops(mnemonic, operands, 2, line_num)?;
            let target = parse_reg(&operands[0], line_num, "target_addr")?;
            let new_opcode = parse_reg(&operands[1], line_num, "new_opcode")?;
            prog.glyph_mutate(target, new_opcode);
        },
        "SEMANTIC_MERGE" => {
            // SEMANTIC_MERGE r_cluster_a, r_cluster_b, r_dest -- 2 pixels
            expect_ops(mnemonic, operands, 3, line_num)?;
            let a = parse_reg(&operands[0], line_num, "cluster_a")?;
            let b = parse_reg(&operands[1], line_num, "cluster_b")?;
            let dest = parse_reg(&operands[2], line_num, "dest")?;
            prog.instruction(op::SEMANTIC_MERGE, 0, a, b);
            prog.pixels.push(dest as u32); // data word: dest register index
        },
        "BRANCH_PROB" => {
            // BRANCH_PROB r_prob, offset -- 2 pixels
            expect_ops(mnemonic, operands, 2, line_num)?;
            let prob = parse_reg(&operands[0], line_num, "probability")?;
            let offset = resolve_label_or_imm(&operands[1], line_num, labels)?;
            let rel = (offset as i64) - (current_addr as i64);
            prog.branch_prob(prob, rel as i32);
        },
        "CONFIDENCE_MARK" => {
            // CONFIDENCE_MARK r_block_id
            expect_ops(mnemonic, operands, 1, line_num)?;
            let block_id = parse_reg(&operands[0], line_num, "block_id")?;
            prog.confidence_mark(block_id);
        },
        "ALTERNATE_PATH" => {
            // ALTERNATE_PATH r_block_id, offset -- 2 pixels
            expect_ops(mnemonic, operands, 2, line_num)?;
            let block_id = parse_reg(&operands[0], line_num, "block_id")?;
            let offset = resolve_label_or_imm(&operands[1], line_num, labels)?;
            let rel = (offset as i64) - (current_addr as i64);
            prog.alternate_path(block_id, rel as i32);
        },
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
            op::YIELD => format!("{:4}: YIELD", i),
            op::SHR => format!("{:4}: SHR r{}, r{}", i, p1, p2),
            op::OR => format!("{:4}: OR r{}, r{}", i, p1, p2),
            op::AND => format!("{:4}: AND r{}, r{}", i, p1, p2),
            op::SHL => format!("{:4}: SHL r{}, r{}", i, p1, p2),
            op::XOR => format!("{:4}: XOR r{}, r{}", i, p1, p2),
            op::NOT => format!("{:4}: NOT r{}", i, p1),
            op::PSET => format!("{:4}: PSET r{}, r{}, r{}", i, p1, p2, stratum),
            op::PGET => format!("{:4}: PGET r{}, r{}, r{}", i, p2, stratum, p1),
            op::GLYPH_DEF => format!("{:4}: GLYPH_DEF r{}, r{}", i, p1, p2),
            op::FRAME => format!("{:4}: FRAME r{}", i, p1),
            op::ISSUE_CREATE => {
                format!("{:4}: ISSUE_CREATE r{}, r{}, {}", i, p1, p2, stratum)
            }
            op::ISSUE_PICK => {
                format!("{:4}: ISSUE_PICK r{}, r{}, agent={}", i, p1, p2, stratum)
            }
            op::ISSUE_UPDATE => {
                format!("{:4}: ISSUE_UPDATE r{}, r{}", i, p1, p2)
            }
            op::ISSUE_LIST => {
                format!("{:4}: ISSUE_LIST r{}, r{}, max={}", i, p1, p2, stratum)
            }
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

    // --- Frame Label Tests ---

    #[test]
    fn assemble_filmstrip_with_frame_labels() {
        let source = r#"
.frame "Idle"
LDI r0, 1
HALT
---
.frame "Explosion"
LDI r0, @Explosion
FRAME r0
HALT
---
.frame "Back"
LDI r0, @Idle
FRAME r0
HALT
"#;

        let programs = assemble_filmstrip(source).expect("should assemble");
        assert_eq!(programs.len(), 3);

        // Frame 0 ("Idle"): LDI r0, 1 + HALT = 3 pixels
        assert_eq!(programs[0].len(), 3);
        assert_eq!(programs[0].pixels[1], 1); // LDI value = 1

        // Frame 1 ("Explosion"): LDI r0, 1 + FRAME r0 + HALT = 4 pixels
        // @Explosion resolves to index 1
        assert_eq!(programs[1].len(), 4);
        assert_eq!(programs[1].pixels[1], 1); // LDI value = 1 (index of "Explosion")

        // Frame 2 ("Back"): LDI r0, 0 + FRAME r0 + HALT = 4 pixels
        // @Idle resolves to index 0
        assert_eq!(programs[2].len(), 4);
        assert_eq!(programs[2].pixels[1], 0); // LDI value = 0 (index of "Idle")
    }

    #[test]
    fn frame_label_self_reference() {
        // The ActionScript-style self-jump pattern
        let source = r#"
.frame "Boot"
LDI r0, @Loop
FRAME r0
HALT
---
.frame "Loop"
LDI r3, 1
ADD r1, r3
LDI r2, @Loop
FRAME r2
HALT
"#;

        let programs = assemble_filmstrip(source).expect("should assemble");
        assert_eq!(programs.len(), 2);

        // Frame 0 ("Boot"): LDI r0, 1 + FRAME r0 + HALT = 4 pixels
        // @Loop = index 1
        assert_eq!(programs[0].pixels[1], 1);

        // Frame 1 ("Loop"): LDI r3,1 + ADD r1,r3 + LDI r2,1 + FRAME r2 + HALT = 7 pixels
        // @Loop = index 1 (self-reference)
        assert_eq!(programs[1].pixels[4], 1); // LDI data word = 1
    }

    #[test]
    fn frame_label_unknown_error() {
        let source = r#"
LDI r0, @NonExistent
HALT
---
LDI r0, 0
HALT
"#;

        let result = assemble_filmstrip(source);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.contains("unknown frame label"),
            "expected frame label error, got: {}",
            err
        );
    }

    #[test]
    fn frame_label_duplicate_error() {
        let source = r#"
.frame "Boot"
LDI r0, 1
HALT
---
.frame "Boot"
LDI r0, 2
HALT
"#;

        let result = assemble_filmstrip(source);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.contains("duplicate frame label"),
            "expected duplicate error, got: {}",
            err
        );
    }

    #[test]
    fn frame_label_without_quotes_error() {
        let source = r#"
.frame Boot
LDI r0, 1
HALT
---
LDI r0, 0
HALT
"#;

        let result = assemble_filmstrip(source);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.contains(".frame expects a quoted name"),
            "expected quote error, got: {}",
            err
        );
    }

    #[test]
    fn filmstrip_without_labels_still_works() {
        // Existing filmstrip syntax must continue working
        let source = r#"
LDI r0, 0
HALT
---
LDI r0, 1
HALT
"#;

        let programs = assemble_filmstrip(source).expect("should assemble");
        assert_eq!(programs.len(), 2);
        assert_eq!(programs[0].pixels[1], 0);
        assert_eq!(programs[1].pixels[1], 1);
    }

    #[test]
    fn frame_labels_with_insertion_resilience() {
        // The "Flash Way" test: inserting a frame between Boot and Loop
        // shouldn't break label references
        let source = r#"
.frame "Boot"
LDI r0, @Prepare
FRAME r0
HALT
---
.frame "Prepare"
LDI r1, 42
LDI r0, @Loop
FRAME r0
HALT
---
.frame "Loop"
LDI r3, 1
ADD r1, r3
LDI r2, @Loop
FRAME r2
HALT
"#;

        let programs = assemble_filmstrip(source).expect("should assemble");
        assert_eq!(programs.len(), 3);

        // Boot -> Prepare: @Prepare = 1
        assert_eq!(programs[0].pixels[1], 1);

        // Prepare -> Loop: @Loop = 2
        assert_eq!(programs[1].pixels[3], 2);

        // Loop -> Loop: @Loop = 2 (self-reference)
        assert_eq!(programs[2].pixels[4], 2);
    }

    // ── C transpiler output tests (GEO-43) ─────────────────────────
    // These test that the Python c_transpiler output assembles and runs correctly.

    #[test]
    fn transpiler_factorial_5_is_120() {
        use crate::software_vm::SoftwareVm;

        let gasm = "; Generated by c_transpiler.py
;
; Function: factorial
func_factorial:
;   param: n -> r0
;   int result -> r8
LDI r31, 1
MOV r8, r31
while_1:
LDI r30, 1
BGE r30, r0, endwhile_2
MUL r8, r0
LDI r30, 1
SUB r0, r30
JMP while_1
endwhile_2:
MOV r0, r8
HALT
";

        let _program = assemble(gasm).expect("factorial.gasm should assemble");

        // Set r0=5 (input n=5), then jump to func_factorial
        let mut full = "LDI r0, 5\nJMP func_factorial\n".to_string();
        full.push_str(gasm);

        let program = assemble(&full).expect("full factorial program should assemble");
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let result = svm.vm_state(0).regs[0];
        assert_eq!(result, 120, "factorial(5) should be 120, got {}", result);
    }

    #[test]
    fn transpiler_max_returns_larger() {
        use crate::software_vm::SoftwareVm;

        let gasm = "; Function: max
func_max:
;   param: a -> r0
;   param: b -> r1
BGE r1, r0, else_1
HALT
JMP endif_2
else_1:
MOV r0, r1
HALT
endif_2:
";

        let mut full = "LDI r0, 10\nLDI r1, 25\nJMP func_max\n".to_string();
        full.push_str(gasm);

        let program = assemble(&full).expect("max program should assemble");
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let result = svm.vm_state(0).regs[0];
        assert_eq!(result, 25, "max(10, 25) should be 25, got {}", result);
    }

    #[test]
    fn transpiler_sum_to_6_is_15() {
        use crate::software_vm::SoftwareVm;

        let gasm = "; Function: sum_to
func_sum_to:
;   param: n -> r0
;   int sum -> r8
;   int i -> r9
LDI r31, 0
MOV r8, r31
LDI r30, 0
MOV r9, r30
for_1:
BGE r9, r0, endfor_2
ADD r8, r9
step_3:
LDI r29, 1
ADD r9, r29
JMP for_1
endfor_2:
MOV r0, r8
HALT
";

        let mut full = "LDI r0, 6\nJMP func_sum_to\n".to_string();
        full.push_str(gasm);

        let program = assemble(&full).expect("sum_to program should assemble");
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let result = svm.vm_state(0).regs[0];
        assert_eq!(result, 15, "sum_to(6) should be 15, got {}", result);
    }

    #[test]
    fn assemble_fibonacci() {
        let source = include_str!("../programs/fibonacci.gasm");
        let program = assemble(source).expect("fibonacci.gasm should assemble");

        use crate::software_vm::SoftwareVm;
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).halted, 1, "fibonacci should halt");

        let expected = [0u32, 1, 1, 2, 3, 5, 8, 13, 21, 34];
        for (i, &val) in expected.iter().enumerate() {
            let mem_val = svm.peek((500 + i) as u32);
            assert_eq!(mem_val, val, "Fib({}) should be {}, got {}", i, val, mem_val);
        }
    }

    #[test]
    fn assemble_bubble_sort() {
        let source = include_str!("../programs/bubble_sort.gasm");
        let program = assemble(source).expect("bubble_sort.gasm should assemble");

        use crate::software_vm::SoftwareVm;
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);

        // Run enough frames for the sort to complete
        for _ in 0..10 {
            svm.execute_frame();
        }

        assert_eq!(svm.vm_state(0).halted, 1, "bubble_sort should halt");

        // Array should be sorted: [1, 2, 3, 4, 5, 6, 7, 8]
        let expected = [1u32, 2, 3, 4, 5, 6, 7, 8];
        for (i, &val) in expected.iter().enumerate() {
            let mem_val = svm.peek((500 + i) as u32);
            assert_eq!(mem_val, val, "sorted[{}] should be {}, got {}", i, val, mem_val);
        }
    }

    #[test]
    fn assemble_test_counter() {
        let source = include_str!("../programs/test_counter.gasm");
        let program = assemble(source).expect("test_counter.gasm should assemble");

        use crate::software_vm::SoftwareVm;
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);

        for _ in 0..20 {
            svm.execute_frame();
        }

        assert_eq!(svm.vm_state(0).halted, 1, "test_counter should halt");
        let last_count = svm.peek(5000);
        assert_eq!(last_count, 9, "mem[5000] should be 9 (last counter value), got {}", last_count);
    }

    #[test]
    fn assemble_sum_natural() {
        let source = include_str!("../programs/sum_natural.gasm");
        let program = assemble(source).expect("sum_natural.gasm should assemble");

        use crate::software_vm::SoftwareVm;
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);

        for _ in 0..50 {
            svm.execute_frame();
        }

        assert_eq!(svm.vm_state(0).halted, 1, "sum_natural should halt");
        let sum = svm.peek(5000);
        // 1+2+3+...+10 = 55
        assert_eq!(sum, 55, "mem[5000] should be 55 (sum 1..10), got {}", sum);
    }
}
