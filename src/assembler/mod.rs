// assembler -- Text to bytecode assembler for Geometry OS
//
// Reads assembly source text and produces a Vec<u32> of bytecode.
// This is the same assembler used by the canvas text surface (F8),
// the editor (F9), and the REPL (F6).
//
// Assembly syntax:
//   LDI r0, 10        ; load immediate
//   ADD r0, r1        ; add registers
//   HALT               ; stop execution
//   ; comment          ; lines starting with ; are ignored
//   label:             ; labels for jumps
//   JMP label          ; jump to label

mod core_ops;
mod formula_ops;
mod graphics_ops;
mod immediate_ops;
mod includes;
mod instructions;
mod system_ops;

/// Maximum number of errors to collect before stopping multi-error parse.
const MAX_ERRORS: usize = 50;

/// Opcodes that are deprecated and should emit warnings.
/// Maps uppercase opcode name to deprecation message.
const DEPRECATED_OPCODES: &[(&str, &str)] = &[
    (
        "PEEK",
        "use SCREENP (0x6D) instead for consistent dest-first arg order",
    ),
    // Add more deprecated opcodes here as needed
];

#[derive(Debug, Clone)]
pub struct AsmError {
    pub line: usize,
    pub column: Option<usize>,
    pub message: String,
}

impl AsmError {
    /// Create an error at a specific line with optional column.
    pub fn new(line: usize, message: impl Into<String>) -> Self {
        AsmError {
            line,
            column: None,
            message: message.into(),
        }
    }

    /// Create an error at a specific line and column.
    pub fn at_column(line: usize, column: usize, message: impl Into<String>) -> Self {
        AsmError {
            line,
            column: Some(column),
            message: message.into(),
        }
    }
}

impl std::fmt::Display for AsmError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self.column {
            Some(col) => write!(f, "line {} col {}: {}", self.line, col, self.message),
            None => write!(f, "line {}: {}", self.line, self.message),
        }
    }
}

impl std::error::Error for AsmError {}

/// A non-fatal assembly warning (e.g., deprecated opcodes).
#[derive(Debug, Clone)]
pub struct AsmWarning {
    pub line: usize,
    pub column: Option<usize>,
    pub message: String,
}

impl std::fmt::Display for AsmWarning {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self.column {
            Some(col) => write!(
                f,
                "line {} col {}: warning: {}",
                self.line, col, self.message
            ),
            None => write!(f, "line {}: warning: {}", self.line, self.message),
        }
    }
}

/// Result of a multi-error assembly pass.
/// Contains bytecode (may be partial/invalid if errors exist), labels,
/// warnings, and errors.
#[derive(Debug)]
pub struct AsmResult {
    pub pixels: Vec<u32>,
    /// Label name -> bytecode offset (address in RAM when loaded at base_addr).
    /// Available after assembly for subroutine-based testing.
    #[allow(dead_code)]
    pub labels: std::collections::HashMap<String, usize>,
    /// Non-fatal warnings collected during assembly.
    pub warnings: Vec<AsmWarning>,
}

impl AsmResult {
    pub fn is_empty(&self) -> bool {
        self.pixels.is_empty()
    }
}

/// Result type for multi-error assembly.
/// Ok(AsmResult) means assembly succeeded (may have warnings).
/// Err(Vec<AsmError>) means errors were found during assembly.
pub type MultiAsmResult = Result<AsmResult, (Vec<AsmError>, Vec<AsmWarning>)>;

/// Assemble source with an optional library search path for .include directives.
/// When `lib_dir` is Some, .include "file.asm" will look in that directory.
/// Returns first error on failure (backward compatible).
pub fn assemble_with_lib(
    source: &str,
    base_addr: usize,
    lib_dir: Option<&str>,
) -> Result<AsmResult, AsmError> {
    // Pre-process: resolve .include directives by inlining file contents
    let expanded = includes::resolve_includes(source, lib_dir, 0)?;
    assemble_inner(&expanded, base_addr).map_err(|(errors, _)| {
        // Return first error for backward compatibility
        errors
            .into_iter()
            .next()
            .unwrap_or_else(|| AsmError::new(0, "unknown assembly error"))
    })
}

/// Assemble source collecting ALL errors (multi-error mode).
/// Continues parsing after first error to report multiple issues.
/// Returns warnings even on failure.
pub fn assemble_multi(source: &str, base_addr: usize, lib_dir: Option<&str>) -> MultiAsmResult {
    // Pre-process: resolve .include directives by inlining file contents
    let expanded = match includes::resolve_includes(source, lib_dir, 0) {
        Ok(s) => s,
        Err(e) => return Err((vec![e], vec![])),
    };
    assemble_inner(&expanded, base_addr)
}

/// Find the position of the first ':' that is not inside a quoted string.
fn find_colon_outside_quotes(line: &str) -> Option<usize> {
    let mut in_quote: Option<char> = None;
    for (i, ch) in line.char_indices() {
        match in_quote {
            Some(q) if ch == q => in_quote = None,
            None if ch == '"' || ch == '\'' => in_quote = Some(ch),
            None if ch == ':' => return Some(i),
            _ => {},
        }
    }
    None
}
/// Emit data directives that may follow a label on the same line.
/// Returns Ok(Some(())) if `rest` matched and was emitted, Ok(None) if
/// it isn't a recognized directive (caller should fall through to
/// instruction parsing).
fn try_emit_directive(
    rest: &str,
    bytecode: &mut Vec<u32>,
    constants: &std::collections::HashMap<String, u32>,
    line_num: usize,
) -> Result<Option<()>, AsmError> {
    let lower = rest.to_lowercase();

    // .ascii "text" -- emit chars without null terminator
    if lower.starts_with(".ascii") && !lower.starts_with(".asciz") {
        let body = rest[6..].trim();
        if !((body.starts_with('"') && body.ends_with('"'))
            || (body.starts_with('\'') && body.ends_with('\'')))
        {
            return Err(AsmError::new(
                line_num,
                ".ascii requires a quoted string: .ascii \"text\"",
            ));
        }
        let s = &body[1..body.len() - 1];
        for ch in s.bytes() {
            bytecode.push(ch as u32);
        }
        return Ok(Some(()));
    }

    // .asciz "text" / .str "text" -- emit chars with null terminator
    if lower.starts_with(".asciz") || lower.starts_with(".str") {
        let prefix_len = if lower.starts_with(".asciz") { 6 } else { 4 };
        let body = rest[prefix_len..].trim();
        if !((body.starts_with('"') && body.ends_with('"'))
            || (body.starts_with('\'') && body.ends_with('\'')))
        {
            return Err(AsmError::new(
                line_num,
                "string directive requires a quoted string",
            ));
        }
        let s = &body[1..body.len() - 1];
        for ch in s.bytes() {
            bytecode.push(ch as u32);
        }
        bytecode.push(0);
        return Ok(Some(()));
    }

    // .byte v1, v2, ... / .db v1, v2, ...
    if lower.starts_with(".byte") || lower.starts_with(".db") {
        let prefix_len = if lower.starts_with(".byte") { 5 } else { 3 };
        let body = rest[prefix_len..].trim();
        if body.is_empty() {
            return Err(AsmError::new(
                line_num,
                "byte directive requires at least one value",
            ));
        }
        for part in body.split(',') {
            let val_str = part.trim();
            if val_str.is_empty() {
                continue;
            }
            match parse_imm(val_str, constants) {
                Ok(v) => bytecode.push(v & 0xFF),
                Err(e) => {
                    return Err(AsmError::new(
                        line_num,
                        format!("invalid byte value '{}': {}", val_str, e),
                    ));
                },
            }
        }
        return Ok(Some(()));
    }

    // .bank coord, dest -- emit BANK instruction (0x2C)
    if lower.starts_with(".bank") {
        let body = rest[5..].trim();
        let parts: Vec<&str> = body.split(',').collect();
        if parts.len() < 2 {
            return Err(AsmError::new(
                line_num,
                ".bank requires coord and dest: .bank 0x00010002, 0x5000",
            ));
        }

        let coord = parse_imm(parts[0].trim(), constants)
            .map_err(|e| AsmError::new(line_num, format!("invalid coord: {}", e)))?;
        let dest = parse_imm(parts[1].trim(), constants)
            .map_err(|e| AsmError::new(line_num, format!("invalid dest: {}", e)))?;

        bytecode.push(0x10); // LDI
        bytecode.push(28); // r28 (reserved for macro/internal)
        bytecode.push(coord);
        bytecode.push(0x2C); // BANK
        bytecode.push(28); // r28
        bytecode.push(dest);
        return Ok(Some(()));
    }

    Ok(None)
}

/// Backward-compatible assemble() with no library path.
pub fn assemble(source: &str, base_addr: usize) -> Result<AsmResult, AsmError> {
    assemble_with_lib(source, base_addr, None)
}

/// Check if an opcode is deprecated and return the deprecation message.
fn check_deprecated(opcode: &str) -> Option<&'static str> {
    let upper = opcode.to_uppercase();
    for &(name, msg) in DEPRECATED_OPCODES {
        if upper == name {
            return Some(msg);
        }
    }
    None
}

/// Find the 1-based column position of a token in a line.
fn find_token_column(line: &str, token: &str) -> Option<usize> {
    line.find(token).map(|pos| pos + 1) // 1-based column
}

fn assemble_inner(source: &str, base_addr: usize) -> MultiAsmResult {
    let mut bytecode: Vec<u32> = Vec::new();
    let mut labels: std::collections::HashMap<String, usize> = std::collections::HashMap::new();
    let mut label_refs: Vec<(usize, String, usize)> = Vec::new(); // (bytecode_pos, label_name, source_line)
    let mut constants: std::collections::HashMap<String, u32> = std::collections::HashMap::new();
    let mut errors: Vec<AsmError> = Vec::new();
    let mut warnings: Vec<AsmWarning> = Vec::new();

    // Pass 0: collect #define and .equ constants
    for (line_num, raw_line) in source.lines().enumerate() {
        let line = raw_line.trim();
        if line.is_empty() || line.starts_with(';') {
            continue;
        }
        let lower = line.to_lowercase();

        // Handle #define NAME VALUE
        if lower.starts_with("#define") {
            let tokens: Vec<&str> = line.split_whitespace().collect();
            if tokens.len() < 3 {
                errors.push(AsmError::new(
                    line_num + 1,
                    "#define requires NAME and VALUE",
                ));
                continue;
            }
            let name = tokens[1].to_string();
            // Constant value can be a literal or another constant
            match parse_imm(tokens[2], &constants) {
                Ok(val) => {
                    constants.insert(name, val);
                },
                Err(e) => {
                    errors.push(AsmError::new(
                        line_num + 1,
                        format!("invalid constant {}: {}", name, e),
                    ));
                },
            }
        }

        // Handle .equ NAME VALUE and .set NAME VALUE
        if lower.starts_with(".equ") || lower.starts_with(".set") {
            let tokens: Vec<&str> = line.split_whitespace().collect();
            if tokens.len() < 3 {
                let directive = if lower.starts_with(".equ") {
                    ".equ"
                } else {
                    ".set"
                };
                errors.push(AsmError::new(
                    line_num + 1,
                    format!("{} requires NAME and VALUE", directive),
                ));
                continue;
            }
            let name = tokens[1].to_string();
            // Constant value can be a literal or another constant
            match parse_imm(tokens[2], &constants) {
                Ok(val) => {
                    constants.insert(name, val);
                },
                Err(e) => {
                    errors.push(AsmError::new(
                        line_num + 1,
                        format!("invalid constant {}: {}", name, e),
                    ));
                },
            }
        }
    }

    // Early return if constant parsing had errors
    if !errors.is_empty() {
        return Err((errors, warnings));
    }

    // Pass 1: collect labels, emit bytecode, record label references
    for (line_num, raw_line) in source.lines().enumerate() {
        let line = raw_line.trim();
        if line.is_empty()
            || line.starts_with(';')
            || line.to_lowercase().starts_with("#define")
            || line.to_lowercase().starts_with(".equ")
            || line.to_lowercase().starts_with(".set")
        {
            continue;
        }

        // Strip inline comment before any further processing so that colons
        // inside comments are not misidentified as label delimiters.
        let line = if let Some(c) = line.find(';') {
            line[..c].trim()
        } else {
            line
        };
        if line.is_empty() {
            continue;
        }

        // .org addr -- advance bytecode position (pad with zeros)
        if line.to_lowercase().starts_with(".org") {
            let tokens: Vec<&str> = line.split_whitespace().collect();
            if tokens.len() < 2 {
                errors.push(AsmError::new(line_num + 1, ".org requires an address"));
                continue;
            }
            match parse_imm(tokens[1], &constants) {
                Ok(addr) => {
                    let target = addr as usize;
                    if target < bytecode.len() {
                        errors.push(AsmError::new(
                            line_num + 1,
                            format!(
                                ".org 0x{:X} is behind current position 0x{:X}",
                                target,
                                bytecode.len()
                            ),
                        ));
                    } else {
                        while bytecode.len() < target {
                            bytecode.push(0);
                        }
                    }
                },
                Err(e) => {
                    errors.push(AsmError::new(
                        line_num + 1,
                        format!("invalid .org address: {}", e),
                    ));
                },
            }
            continue;
        }

        // .byte val1, val2, ... -- emit raw byte values (each becomes a u32 word)
        if line.to_lowercase().starts_with(".byte") {
            let rest = line[5..].trim();
            let parts: Vec<&str> = rest.split(',').collect();
            if parts.is_empty() {
                errors.push(AsmError::new(
                    line_num + 1,
                    ".byte requires at least one value",
                ));
                continue;
            }
            for part in parts {
                let val_str = part.trim();
                match parse_imm(val_str, &constants) {
                    Ok(v) => bytecode.push(v & 0xFF),
                    Err(e) => {
                        errors.push(AsmError::new(
                            line_num + 1,
                            format!("invalid .byte value '{}': {}", val_str, e),
                        ));
                    },
                }
            }
            continue;
        }

        // .str "text" -- emit null-terminated string (each char as a u32 word)
        if line.to_lowercase().starts_with(".str") {
            let rest = line[4..].trim();
            if !((rest.starts_with('"') && rest.ends_with('"'))
                || (rest.starts_with('\'') && rest.ends_with('\'')))
            {
                errors.push(AsmError::new(
                    line_num + 1,
                    ".str requires a quoted string: .str \"text\"",
                ));
                continue;
            }
            let s = &rest[1..rest.len() - 1];
            for ch in s.bytes() {
                bytecode.push(ch as u32);
            }
            bytecode.push(0); // null terminator
            continue;
        }

        // .db val1, val2, ... -- alias for .byte (emit raw byte values as u32 words)
        if line.to_lowercase().starts_with(".db") {
            let rest = line[3..].trim();
            // Skip if it looks like a longer directive starting with .db (e.g. .dbprefix)
            if rest.is_empty() || rest.starts_with(',') {
                errors.push(AsmError::new(
                    line_num + 1,
                    ".db requires at least one value",
                ));
                continue;
            }
            let parts: Vec<&str> = rest.split(',').collect();
            for part in parts {
                let val_str = part.trim();
                if val_str.is_empty() {
                    continue;
                }
                match parse_imm(val_str, &constants) {
                    Ok(v) => bytecode.push(v & 0xFF),
                    Err(e) => {
                        errors.push(AsmError::new(
                            line_num + 1,
                            format!("invalid .db value '{}': {}", val_str, e),
                        ));
                    },
                }
            }
            continue;
        }

        // .asciz "text" -- emit null-terminated string (alias for .str)
        if line.to_lowercase().starts_with(".asciz") {
            let rest = line[6..].trim();
            if !((rest.starts_with('"') && rest.ends_with('"'))
                || (rest.starts_with('\'') && rest.ends_with('\'')))
            {
                errors.push(AsmError::new(
                    line_num + 1,
                    ".asciz requires a quoted string: .asciz \"text\"",
                ));
                continue;
            }
            let s = &rest[1..rest.len() - 1];
            for ch in s.bytes() {
                bytecode.push(ch as u32);
            }
            bytecode.push(0); // null terminator
            continue;
        }

        // .ascii "text" -- emit string WITHOUT null terminator (each char as u32 word)
        if line.to_lowercase().starts_with(".ascii") && !line.to_lowercase().starts_with(".asciz") {
            let rest = line[6..].trim();
            if !((rest.starts_with('"') && rest.ends_with('"'))
                || (rest.starts_with('\'') && rest.ends_with('\'')))
            {
                errors.push(AsmError::new(
                    line_num + 1,
                    ".ascii requires a quoted string: .ascii \"text\"",
                ));
                continue;
            }
            let s = &rest[1..rest.len() - 1];
            for ch in s.bytes() {
                bytecode.push(ch as u32);
            }
            // No null terminator -- that's the difference from .asciz
            continue;
        }

        // Check for label (colon outside quotes only)
        let colon_pos = find_colon_outside_quotes(line);
        let (label_name, rest) = if line.starts_with(':') {
            // Style: :label rest...
            let space_pos = line.find(|c: char| c.is_whitespace()).unwrap_or(line.len());
            let name = line[1..space_pos].trim().to_lowercase();
            let r = line[space_pos..].trim();
            (Some(name), r)
        } else if let Some(label_end) = colon_pos {
            // Style: label: rest...
            let before = &line[..label_end];
            // Only a label if it's the first word and no spaces before colon
            if !before.is_empty() && !before.contains(char::is_whitespace) {
                let name = before.trim().to_lowercase();
                let r = line[label_end + 1..].trim();
                (Some(name), r)
            } else {
                (None, line)
            }
        } else {
            (None, line)
        };

        if let Some(name) = label_name {
            labels.insert(name, bytecode.len());
            if rest.is_empty() || rest.starts_with(';') {
                continue;
            }

            // Allow directives after a label on the same line
            // (e.g. `msg: .ascii "hi"`). Anything else falls through to
            // instruction parsing.
            if let Ok(Some(_emitted)) =
                try_emit_directive(rest, &mut bytecode, &constants, line_num + 1)
            {
                continue;
            }

            // Check for deprecated opcodes
            let opcode_part = rest.split_whitespace().next().unwrap_or("");
            if let Some(dep_msg) = check_deprecated(opcode_part) {
                let col = find_token_column(rest, opcode_part);
                warnings.push(AsmWarning {
                    line: line_num + 1,
                    column: col,
                    message: format!("{} is deprecated: {}", opcode_part, dep_msg),
                });
            }

            // Parse instruction after label on same line
            if let Err(e) = instructions::parse_instruction(
                rest,
                &mut bytecode,
                &mut label_refs,
                line_num + 1,
                &constants,
            ) {
                // Try to determine column from the token that failed
                let col = find_error_column(rest, &e);
                errors.push(if let Some(c) = col {
                    AsmError::at_column(line_num + 1, c, e)
                } else {
                    AsmError::new(line_num + 1, e)
                });
                if errors.len() >= MAX_ERRORS {
                    return Err((errors, warnings));
                }
            }
            continue;
        }

        // Check for deprecated opcodes
        let opcode_part = line.split_whitespace().next().unwrap_or("");
        if let Some(dep_msg) = check_deprecated(opcode_part) {
            let col = find_token_column(line, opcode_part);
            warnings.push(AsmWarning {
                line: line_num + 1,
                column: col,
                message: format!("{} is deprecated: {}", opcode_part, dep_msg),
            });
        }

        if let Err(e) = instructions::parse_instruction(
            line,
            &mut bytecode,
            &mut label_refs,
            line_num + 1,
            &constants,
        ) {
            let col = find_error_column(line, &e);
            errors.push(if let Some(c) = col {
                AsmError::at_column(line_num + 1, c, e)
            } else {
                AsmError::new(line_num + 1, e)
            });
            if errors.len() >= MAX_ERRORS {
                return Err((errors, warnings));
            }
        }
    }

    // Pass 2: resolve label references (add base_addr so jumps target correct RAM address)
    for (pos, label_name, line) in &label_refs {
        if let Some(&target) = labels.get(label_name) {
            bytecode[*pos] = (base_addr + target) as u32;
        } else {
            errors.push(AsmError::new(
                *line,
                format!("undefined label: {}", label_name),
            ));
        }
    }

    if errors.is_empty() {
        Ok(AsmResult {
            pixels: bytecode,
            labels,
            warnings,
        })
    } else {
        Err((errors, warnings))
    }
}

/// Try to determine the column of the error from the error message and line content.
/// Looks for register names, hex values, or opcode names mentioned in the error.
fn find_error_column(line: &str, error_msg: &str) -> Option<usize> {
    // Extract the first quoted or specific token from the error message
    // Common patterns: "invalid register: r99", "invalid number: foo", "unknown opcode: BLAH"

    // Pattern group 1: "prefix: token" where token can be found in the line
    for prefix in &[
        "invalid register: ",
        "invalid number: ",
        "invalid number or undefined constant: ",
        "invalid hex: ",
        "invalid binary: ",
        "unknown opcode: ",
        "undefined label: ",
        "invalid .byte value '",
        "invalid .db value '",
        "FORMULA: unknown op '",
        "invalid constant ",
        "invalid .org address: ",
        "invalid .byte ",
    ] {
        if let Some(pos) = error_msg.find(prefix) {
            let after = &error_msg[pos + prefix.len()..];
            // Get the token (strip trailing quotes, colons, or parenthesized detail)
            let token = after
                .trim_end_matches('\'')
                .trim_end_matches(':')
                .split_whitespace()
                .next()
                .unwrap_or("")
                .trim();
            if !token.is_empty() {
                // Case-insensitive search: error tokens may be uppercased
                // (e.g. "unknown opcode: BLAH" from instructions.rs .to_uppercase())
                // but the source line preserves original case.
                let upper_line = line.to_uppercase();
                let upper_token = token.to_uppercase();
                if let Some(col) = upper_line.find(&upper_token) {
                    return Some(col + 1); // 1-based
                }
            }
        }
    }

    // Pattern group 2: "OPCODE requires N arguments: ..." -- point to the opcode on the line
    // This covers the most common error type across all assembler sub-modules.
    // e.g. "LDI requires 2 arguments: LDI reg, imm" -> find "LDI" on the line
    if error_msg.contains(" requires ") && error_msg.contains(" argument") {
        // Extract the opcode name (first word before " requires")
        if let Some(requires_pos) = error_msg.find(" requires ") {
            let opcode_name = error_msg[..requires_pos].trim();
            if !opcode_name.is_empty() {
                // Try case-insensitive match on the line
                let upper_line = line.to_uppercase();
                let upper_opcode = opcode_name.to_uppercase();
                if let Some(col) = upper_line.find(&upper_opcode) {
                    return Some(col + 1); // 1-based
                }
            }
        }
    }

    // Pattern group 3: "OPCODE requires: ..." (formula_ops style)
    if error_msg.contains(" requires: ") {
        if let Some(requires_pos) = error_msg.find(" requires: ") {
            let opcode_name = error_msg[..requires_pos].trim();
            if !opcode_name.is_empty() {
                let upper_line = line.to_uppercase();
                let upper_opcode = opcode_name.to_uppercase();
                if let Some(col) = upper_line.find(&upper_opcode) {
                    return Some(col + 1);
                }
            }
        }
    }

    // Pattern group 4: "#define requires NAME and VALUE"
    if error_msg.contains("requires") {
        if let Some(space_pos) = error_msg.find(' ') {
            let first_word = &error_msg[..space_pos];
            if !first_word.is_empty() && line.find(first_word).is_some() {
                return line.find(first_word).map(|c| c + 1);
            }
        }
    }

    None
}

/// Parse register: "r0" -> 0, "r31" -> 31, "R5" -> 5, "[r30]" -> 30
pub(crate) fn parse_reg(s: &str) -> Result<usize, String> {
    let s = s.trim();
    // Strip brackets: [r30] -> r30
    let s = s.trim_start_matches('[').trim_end_matches(']');
    let lower = s.to_lowercase();
    if let Some(rest) = lower.strip_prefix('r') {
        if let Ok(n) = rest.parse::<usize>() {
            if n < 32 {
                return Ok(n);
            }
        }
    }
    Err(format!("invalid register: {}", s))
}

/// Parse immediate value: "10", "0xFF", "0b1010"
pub(crate) fn parse_imm(
    s: &str,
    constants: &std::collections::HashMap<String, u32>,
) -> Result<u32, String> {
    let s = s.trim();

    // Check constants first
    if let Some(&val) = constants.get(s) {
        return Ok(val);
    }

    // Case-insensitive fallback
    let s_lower = s.to_lowercase();
    if let Some((_, &val)) = constants.iter().find(|(k, _)| k.to_lowercase() == s_lower) {
        return Ok(val);
    }

    if s.starts_with("0x") || s.starts_with("0X") {
        u32::from_str_radix(&s[2..], 16).map_err(|_| format!("invalid hex: {}", s))
    } else if s.starts_with("0b") || s.starts_with("0B") {
        u32::from_str_radix(&s[2..], 2).map_err(|_| format!("invalid binary: {}", s))
    } else {
        s.parse::<u32>()
            .map_err(|_| format!("invalid number or undefined constant: {}", s))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_halt() {
        let result = assemble("HALT", 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x00]);
    }

    #[test]
    fn test_ldi() {
        let result = assemble("LDI r0, 42", 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 42]);
    }

    #[test]
    fn test_add() {
        let result = assemble("ADD r0, r1", 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x20, 0, 1]);
    }

    #[test]
    fn test_multiple_lines() {
        let src = "LDI r0, 10\nLDI r1, 20\nADD r0, r1\nHALT";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(
            result.pixels,
            vec![0x10, 0, 10, 0x10, 1, 20, 0x20, 0, 1, 0x00]
        );
    }

    #[test]
    fn test_comments() {
        let src = "; this is a comment\nLDI r0, 5 ; inline comment\nHALT";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 5, 0x00]);
    }

    #[test]
    fn test_labels() {
        let src = "start:\n  LDI r0, 1\n  JZ r0, start\n  HALT";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels[0..3], vec![0x10, 0, 1]); // LDI r0, 1
        assert_eq!(result.pixels[3], 0x31); // JZ
        assert_eq!(result.pixels[4], 0); // r0
        assert_eq!(result.pixels[5], 0); // -> start (bytecode addr 0)
    }

    #[test]
    fn test_hex_immediate() {
        let result = assemble("LDI r0, 0xFF", 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 255]);
    }

    #[test]
    fn test_unknown_opcode() {
        let result = assemble("BLAH r0", 0);
        assert!(result.is_err());
    }

    #[test]
    fn test_undefined_label() {
        let result = assemble("JMP nowhere", 0);
        assert!(result.is_err());
    }

    #[test]
    fn test_sub_mul_div() {
        let src = "SUB r1, r2\nMUL r3, r4\nDIV r5, r6";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels[0], 0x21);
        assert_eq!(result.pixels[3], 0x22);
        assert_eq!(result.pixels[6], 0x23);
    }

    #[test]
    fn test_sar() {
        let src = "SAR r1, r2";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x2B, 1, 2]);
    }

    #[test]
    fn test_define_constants() {
        let src = "#define SCREEN_WIDTH 256\n#define COLOR 0xFF0000\nLDI r0, SCREEN_WIDTH\nLDI r1, COLOR\nFILL r1";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(
            result.pixels,
            vec![0x10, 0, 256, 0x10, 1, 0xFF0000, 0x42, 1]
        );
    }

    #[test]
    fn test_nested_defines() {
        let src = "#define VAL1 10\n#define VAL2 VAL1\nLDI r0, VAL2";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 10]);
    }

    // ── Phase 443: .equ and .set Directive Tests ─────────────────────

    #[test]
    fn test_equ_directive() {
        let src = ".equ SCREEN_WIDTH 256\nLDI r0, SCREEN_WIDTH";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 256]);
    }

    #[test]
    fn test_set_directive() {
        let src = ".set MAX_X 255\nLDI r0, MAX_X";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 255]);
    }

    #[test]
    fn test_equ_and_set_together() {
        let src = ".equ SCREEN_WIDTH 256\n.set SCREEN_HEIGHT 256\nLDI r0, SCREEN_WIDTH\nADDI r0, SCREEN_HEIGHT";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 256, 0x1B, 0, 256]);
    }

    #[test]
    fn test_equ_with_hex_value() {
        let src = ".equ COLOR 0xFF0000\nLDI r0, COLOR";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 0xFF0000]);
    }

    #[test]
    fn test_equ_case_insensitive() {
        let src = ".equ MAX_X 100\nLDI r0, max_x\nLDI r1, MAX_X";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 100, 0x10, 1, 100]);
    }

    #[test]
    fn test_equ_missing_value() {
        let src = ".equ SCREEN_WIDTH\nLDI r0, SCREEN_WIDTH";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _) = result.unwrap_err();
        assert_eq!(errors.len(), 1); // .equ error
        assert!(errors[0].message.contains("requires NAME and VALUE"));
    }

    #[test]
    fn test_equ_with_reference_to_another_constant() {
        let src = ".equ BASE 10\n.equ OFFSET BASE\nLDI r0, OFFSET";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 10]);
    }

    #[test]
    fn test_equ_with_complex_expression() {
        let src = ".equ WIDTH 100\n.equ HEIGHT WIDTH\nLDI r0, WIDTH\nLDI r1, HEIGHT";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels, vec![0x10, 0, 100, 0x10, 1, 100]);
    }

    // ── Phase 381: Assembler Error Recovery Tests ──────────────────────────

    #[test]
    fn test_multi_error_collects_multiple_errors() {
        let src = "BLAH r0\nINVALID r1\nNOP";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _warnings) = result.unwrap_err();
        // Should have at least 2 errors (BLAH and INVALID)
        assert!(
            errors.len() >= 2,
            "expected >=2 errors, got {}",
            errors.len()
        );
        assert!(errors[0].message.contains("unknown opcode"));
        assert!(errors[1].message.contains("unknown opcode"));
    }

    #[test]
    fn test_multi_error_stops_at_max() {
        // Generate 60 lines of bad opcodes (more than MAX_ERRORS=50)
        let src: String = (0..60).map(|i| format!("BAD{}\n", i)).collect();
        let result = assemble_multi(&src, 0, None);
        assert!(result.is_err());
        let (errors, _) = result.unwrap_err();
        assert_eq!(errors.len(), MAX_ERRORS, "should cap at MAX_ERRORS");
    }

    #[test]
    fn test_multi_error_continues_after_bad_register() {
        let src = "LDI r99, 10\nNOP\nHALT";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _) = result.unwrap_err();
        // Should have the bad register error
        assert!(errors[0].message.contains("invalid register"));
    }

    #[test]
    fn test_error_has_column_number() {
        let src = "LDI r99, 10";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        // Column should point to "r99" (position 5 in "LDI r99, 10")
        assert!(err.column.is_some(), "error should have column number");
        let col = err.column.unwrap();
        assert_eq!(col, 5, "column should point to r99");
    }

    #[test]
    fn test_error_unknown_opcode_column() {
        let src = "  BLAH r0";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.column.is_some(), "error should have column number");
        let col = err.column.unwrap();
        // "BLAH" is at position 0 in the trimmed line (leading spaces stripped by assembler)
        assert_eq!(col, 1, "column should point to BLAH in trimmed line");
    }

    #[test]
    fn test_error_no_column_for_label_error() {
        let src = "JMP nowhere";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("undefined label"));
        // Label resolution happens after all lines are parsed, so no column
        // from the original line context
    }

    #[test]
    fn test_warnings_empty_on_success() {
        let result = assemble("NOP\nHALT", 0).unwrap();
        assert!(result.warnings.is_empty());
    }

    #[test]
    fn test_deprecated_opcode_warning() {
        // PEEK is deprecated in favor of SCREENP
        let src = "PEEK r1, r2, r3";
        let result = assemble_multi(src, 0, None);
        // Even if it assembles, check for warning
        match result {
            Ok(asm_result) => {
                assert_eq!(asm_result.warnings.len(), 1, "should have 1 warning");
                assert!(asm_result.warnings[0].message.contains("deprecated"));
                assert!(asm_result.warnings[0].message.contains("PEEK"));
            },
            Err((_, warnings)) => {
                // PEEK might not assemble correctly (depends on handler), but should still warn
                assert!(warnings.iter().any(|w| w.message.contains("deprecated")));
            },
        }
    }

    #[test]
    fn test_deprecated_warning_has_column() {
        let src = "  PEEK r1, r2, r3";
        let result = assemble_multi(src, 0, None);
        let warnings = match &result {
            Ok(asm) => &asm.warnings,
            Err((_, w)) => w,
        };
        assert!(
            !warnings.is_empty(),
            "should have warning for deprecated PEEK"
        );
        let w = &warnings[0];
        assert!(w.column.is_some(), "warning should have column number");
        assert_eq!(w.line, 1);
    }

    #[test]
    fn test_error_display_with_column() {
        let err = AsmError::at_column(5, 10, "bad register");
        let display = format!("{}", err);
        assert_eq!(display, "line 5 col 10: bad register");
    }

    #[test]
    fn test_error_display_without_column() {
        let err = AsmError::new(5, "bad register");
        let display = format!("{}", err);
        assert_eq!(display, "line 5: bad register");
    }

    #[test]
    fn test_warning_display() {
        let w = AsmWarning {
            line: 3,
            column: Some(5),
            message: "PEEK is deprecated".into(),
        };
        let display = format!("{}", w);
        assert_eq!(display, "line 3 col 5: warning: PEEK is deprecated");
    }

    #[test]
    fn test_warning_display_no_column() {
        let w = AsmWarning {
            line: 3,
            column: None,
            message: "something is deprecated".into(),
        };
        let display = format!("{}", w);
        assert_eq!(display, "line 3: warning: something is deprecated");
    }

    #[test]
    fn test_find_error_column_register() {
        let col = find_error_column("LDI r99, 10", "invalid register: r99");
        assert_eq!(col, Some(5));
    }

    #[test]
    fn test_find_error_column_opcode() {
        let col = find_error_column("  BLAH r0", "unknown opcode: BLAH");
        assert_eq!(col, Some(3));
    }

    #[test]
    fn test_find_error_column_hex() {
        let col = find_error_column("LDI r1, 0xZZZ", "invalid hex: 0xZZZ");
        // "0xZZZ" starts at index 8, so 1-based column is 9
        assert_eq!(col, Some(9));
    }

    #[test]
    fn test_find_error_column_none() {
        let col = find_error_column("some line", "generic error message");
        assert_eq!(col, None);
    }

    #[test]
    fn test_multi_error_preserves_good_code() {
        // Errors in lines 1 and 3, but line 2 should still emit bytecode
        let src = "BLAH r0\nNOP\nBAD r1";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _) = result.unwrap_err();
        assert!(errors.len() >= 2);
    }

    // ── Phase 395: Column-aware errors + integration tests ────────────────

    // --- Column detection for "requires N arguments" errors ---

    #[test]
    fn test_column_for_missing_args_ldi() {
        // "LDI requires 2 arguments" should point column to "LDI" on the line
        // Note: assemble_inner trims lines before passing to find_error_column
        let src = "  LDI r1";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.column.is_some(),
            "LDI missing-args error should have column"
        );
        let col = err.column.unwrap();
        // Line is trimmed to "LDI r1" before column detection, so "LDI" is at col 1
        assert_eq!(col, 1, "column should point to LDI in trimmed 'LDI r1'");
    }

    #[test]
    fn test_column_for_missing_args_store() {
        let src = "STORE r1";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.column.is_some(),
            "STORE missing-args error should have column"
        );
        assert_eq!(err.column.unwrap(), 1, "column should point to STORE");
    }

    #[test]
    fn test_column_for_missing_args_fill() {
        let src = "FILL";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.column.is_some(),
            "FILL missing-args error should have column"
        );
    }

    #[test]
    fn test_column_for_missing_args_text() {
        let src = "TEXT r1, r2";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.column.is_some(),
            "TEXT missing-args error should have column"
        );
    }

    #[test]
    fn test_column_for_missing_args_pset() {
        let src = "PSET r1, r2";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.column.is_some(), "PSET missing-args should have column");
    }

    #[test]
    fn test_column_for_bad_register_in_add() {
        let src = "ADD r1, r99";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.column.is_some(),
            "bad register error should have column"
        );
        // "r99" is at position 9 in "ADD r1, r99" -> 1-based col 10
        assert!(err.column.unwrap() >= 8, "column should be near r99");
    }

    #[test]
    fn test_column_for_unknown_opcode_case_insensitive() {
        let src = "blah r0";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.column.is_some());
    }

    // --- Column detection for formula_ops errors ---

    #[test]
    fn test_column_for_formula_unknown_op() {
        let src = "FORMULA 0, badop, 1, 2";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        // The error is "FORMULA: unknown op 'badop'" -- column should find 'badop' or FORMULA
        assert!(
            err.column.is_some(),
            "FORMULA unknown op should have column"
        );
    }

    #[test]
    fn test_column_for_formula_missing_args() {
        let src = "FORMULA 0, add";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        // "FORMULA requires: target_idx, op, dep0, [dep1, ...]"
        assert!(
            err.column.is_some(),
            "FORMULA missing deps should have column"
        );
    }

    #[test]
    fn test_column_for_formulareq_missing_arg() {
        let src = "FORMULAREM";
        let result = assemble(src, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(
            err.column.is_some(),
            "FORMULAREM missing arg should have column"
        );
    }

    // --- Multi-error recovery integration tests ---

    #[test]
    fn test_multi_error_from_different_modules() {
        // Errors from core_ops, graphics_ops, and system_ops in one source
        let src = "LDI\nPSET r1\nSPAWN\nNOP\nHALT";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _warnings) = result.unwrap_err();
        // Should have errors from LDI (core), PSET (graphics), SPAWN (system)
        assert!(
            errors.len() >= 3,
            "expected >=3 errors from different modules, got {}",
            errors.len()
        );
        // All errors should have line numbers
        for err in &errors {
            assert!(err.line >= 1, "error should have valid line number");
        }
    }

    #[test]
    fn test_multi_error_mixed_valid_invalid() {
        let src = "LDI r0, 1\nBAD_OP\nLDI r1, 2\nANOTHER_BAD\nHALT";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _) = result.unwrap_err();
        // Lines 2 and 4 are bad, lines 1,3,5 are good
        assert_eq!(errors.len(), 2, "should have exactly 2 errors");
        assert_eq!(errors[0].line, 2, "first error on line 2");
        assert_eq!(errors[1].line, 4, "second error on line 4");
    }

    #[test]
    fn test_multi_error_with_labels_and_bad_jumps() {
        let src = "start:\n  NOP\n  JMP bad_label\n  JMP also_bad\nHALT";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _) = result.unwrap_err();
        // Both JMP targets are undefined
        assert!(
            errors.len() >= 2,
            "expected >=2 undefined label errors, got {}",
            errors.len()
        );
    }

    #[test]
    fn test_multi_error_column_on_all_errors() {
        // All errors should ideally have column information
        let src = "BLAH r0\nLDI r99, 10\nNOP r0"; // NOP takes 0 args but r0 given (NOP ignores extras)
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, _warnings) = result.unwrap_err();
        // First two should have errors; NOP with extra args is fine (NOP ignores)
        assert!(errors.len() >= 2);
        // Check that column-aware errors work for multiple errors
        let with_col = errors.iter().filter(|e| e.column.is_some()).count();
        assert!(
            with_col >= 2,
            "at least 2 errors should have columns, got {}",
            with_col
        );
    }

    #[test]
    fn test_multi_error_max_cap() {
        // Generate 60 lines of bad opcodes to test MAX_ERRORS cap
        let src: String = (0..60).map(|i| format!("BAD{}\n", i)).collect();
        let result = assemble_multi(&src, 0, None);
        assert!(result.is_err());
        let (errors, _) = result.unwrap_err();
        assert_eq!(
            errors.len(),
            MAX_ERRORS,
            "should cap at MAX_ERRORS ({})",
            MAX_ERRORS
        );
    }

    #[test]
    fn test_multi_error_empty_source() {
        let result = assemble_multi("", 0, None);
        assert!(result.is_ok());
        let asm = result.unwrap();
        assert!(asm.pixels.is_empty());
        assert!(asm.warnings.is_empty());
    }

    #[test]
    fn test_multi_error_all_valid() {
        let src = "LDI r0, 10\nLDI r1, 20\nADD r0, r1\nHALT";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_ok());
        let asm = result.unwrap();
        assert!(!asm.pixels.is_empty());
        assert!(asm.warnings.is_empty());
    }

    // --- Warning system integration tests ---

    #[test]
    fn test_warning_in_assemble_multi_success() {
        // PEEK is deprecated but still valid -- should assemble with warning
        let src = "PEEK r1, r2, r3\nHALT";
        let result = assemble_multi(src, 0, None);
        // PEEK may or may not assemble successfully (depends on handler),
        // but should always produce a warning
        match result {
            Ok(asm) => {
                assert_eq!(asm.warnings.len(), 1);
                assert!(asm.warnings[0].message.contains("deprecated"));
                assert!(asm.warnings[0].message.contains("PEEK"));
                assert!(asm.warnings[0].line >= 1);
            },
            Err((_, warnings)) => {
                assert!(
                    warnings.iter().any(|w| w.message.contains("deprecated")),
                    "should have deprecation warning even on error"
                );
            },
        }
    }

    #[test]
    fn test_warnings_plus_errors_combined() {
        // Mix of deprecated opcode (warning) and invalid opcodes (errors)
        let src = "PEEK r1, r2, r3\nBLAH r0\nHALT";
        let result = assemble_multi(src, 0, None);
        assert!(result.is_err());
        let (errors, warnings) = result.unwrap_err();
        // Should have the error for BLAH
        assert!(!errors.is_empty(), "should have errors");
        // Should also have the warning for PEEK
        assert!(
            warnings.iter().any(|w| w.message.contains("deprecated")),
            "should have deprecation warning even with errors"
        );
    }

    #[test]
    fn test_multiple_deprecated_warnings() {
        // Multiple PEEK usages should each produce a warning
        let src = "PEEK r1, r2, r3\nPEEK r4, r5, r6\nHALT";
        let result = assemble_multi(src, 0, None);
        let warnings = match &result {
            Ok(asm) => &asm.warnings,
            Err((_, w)) => w,
        };
        let dep_count = warnings
            .iter()
            .filter(|w| w.message.contains("deprecated"))
            .count();
        assert!(
            dep_count >= 2,
            "should have >=2 deprecation warnings, got {}",
            dep_count
        );
    }

    #[test]
    fn test_assemble_returns_first_error_multi_returns_all() {
        let src = "BLAH r0\nINVALID r1\nNOP";
        // assemble() should return just the first error
        let single = assemble(src, 0);
        assert!(single.is_err());
        let single_err = single.unwrap_err();
        assert_eq!(single_err.line, 1);

        // assemble_multi() should return both errors
        let multi = assemble_multi(src, 0, None);
        assert!(multi.is_err());
        let (multi_errors, _) = multi.unwrap_err();
        assert!(
            multi_errors.len() >= 2,
            "multi should collect >=2 errors, got {}",
            multi_errors.len()
        );
    }

    #[test]
    fn test_assemble_with_lib_error_path() {
        let src = "BLAH r0";
        let result = assemble_with_lib(src, 0, None);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("unknown opcode"));
    }

    // --- find_error_column direct tests for new patterns ---

    #[test]
    fn test_find_column_requires_arguments() {
        // "LDI requires 2 arguments: LDI reg, imm" should find LDI
        let col = find_error_column("  LDI r1", "LDI requires 2 arguments: LDI reg, imm");
        assert_eq!(col, Some(3), "should point to LDI at col 3");
    }

    #[test]
    fn test_find_column_requires_arguments_case_insensitive() {
        let col = find_error_column("ldi r1", "LDI requires 2 arguments: LDI reg, imm");
        assert!(col.is_some(), "case-insensitive match should work");
    }

    #[test]
    fn test_find_column_requires_colon() {
        // "FORMULA requires: target_idx, ..." should find FORMULA
        let col = find_error_column(
            "FORMULA 0, add",
            "FORMULA requires: target_idx, op, dep0, [dep1, ...]",
        );
        assert!(col.is_some(), "requires: pattern should find opcode");
    }

    #[test]
    fn test_find_column_unknown_op_formula() {
        let col = find_error_column("FORMULA 0, badop, 1, 2", "FORMULA: unknown op 'badop'");
        assert!(col.is_some(), "FORMULA unknown op should have column");
    }

    #[test]
    fn test_find_column_invalid_constant() {
        let col = find_error_column(
            "#define FOO bar",
            "invalid constant FOO invalid number or undefined constant: bar",
        );
        assert!(col.is_some(), "invalid constant should have column");
    }

    #[test]
    fn test_find_column_store_requires_args() {
        let col = find_error_column("STORE", "STORE requires 2 arguments: STORE addr_reg, reg");
        assert!(col.is_some(), "STORE alone should point to STORE");
        assert_eq!(col, Some(1));
    }
}
