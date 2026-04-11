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
//   .macro NAME param1, param2, ...   (define macro)
//   .endm                              (end macro)
//   NAME arg1, arg2                    (invoke macro)
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

use std::borrow::Cow;
use std::collections::{HashMap, HashSet};

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
        "IRET" => 0x68,
        "STI" => 0x74,
        "EDIT_DELETE" | "EDITDEL" => 0x6A,
        "SHR" => 0x6B,
        "EDIT_BLIT" | "EDITBLT" => 0x6C,
        "MUL" => 0x6D,
        "NOT" => 0x6E,
        "PUSH" => 0x70,
        "POP" => 0x72,
        "STB" => 0x73,

        // Process opcodes
        "FORK" => 0x6F,
        "EXIT" => 0x75,
        "GETPID" => 0x76,
        _ => return None,
    };
    Some(byte)
}

/// Parse a single argument token.
/// - r0..r31 → register index
/// - 0xNN → hex literal
/// Resolve a token through the constants map.
/// If the token (or parts of an expression) match a known constant, substitute.
fn resolve_constant<'a>(token: &'a str, constants: &HashMap<String, u32>) -> Cow<'a, str> {
    if constants.is_empty() {
        return Cow::Borrowed(token);
    }
    // Fast path: exact match on whole token
    if let Some(&val) = constants.get(token) {
        return Cow::Owned(val.to_string());
    }
    // Check if token is an expression containing constant names
    let has_operator = token.contains('+')
        || token.contains('-')
        || token.contains('*')
        || token.contains('/')
        || token.contains('(')
        || token.contains(')');
    if !has_operator {
        return Cow::Borrowed(token);
    }
    // Substitute constant names within expressions
    let mut result = token.to_string();
    // Sort by length descending so longer names are replaced first
    let mut names: Vec<&String> = constants.keys().collect();
    names.sort_by(|a, b| b.len().cmp(&a.len()));
    for name in names {
        // Only replace whole-word matches (alphanumeric boundary)
        let mut new_result = String::new();
        let mut i = 0;
        let bytes = result.as_bytes();
        while i < bytes.len() {
            // Check if we're at a word boundary before the constant name
            if i + name.len() <= bytes.len()
                && &result[i..i + name.len()] == name.as_str()
                && (i == 0 || !bytes[i - 1].is_ascii_alphanumeric())
                && (i + name.len() >= bytes.len()
                    || !bytes[i + name.len()].is_ascii_alphanumeric())
            {
                new_result.push_str(&constants[name].to_string());
                i += name.len();
            } else {
                new_result.push(bytes[i] as char);
                i += 1;
            }
        }
        result = new_result;
    }
    if result != token {
        Cow::Owned(result)
    } else {
        Cow::Borrowed(token)
    }
}

fn parse_arg(token: &str) -> Result<ArgToken, String> {
    parse_arg_with_constants(token, &HashMap::new())
}

fn parse_arg_with_constants(token: &str, constants: &HashMap<String, u32>) -> Result<ArgToken, String> {
    let resolved = resolve_constant(token, constants);
    let token = resolved.as_ref();

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
        return Err(format!(
            "unexpected token at position {} in '{}'",
            pos, expr
        ));
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
                if num_str == "0" && (chars.peek() == Some(&'x') || chars.peek() == Some(&'X')) {
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
                ));
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
        "BEQ" => Some(0),
        "BNE" => Some(1),
        "BLT" => Some(2),
        "BGE" => Some(3),
        "BLTU" => Some(4),
        "BGEU" => Some(5),
        "BAL" => Some(15), // unconditional branch
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

/// A data directive that emits raw pixel values (not an instruction).
#[derive(Debug, Clone)]
struct RawData {
    line: usize,
    /// Pixel values to emit verbatim.
    pixels: Vec<u32>,
}

/// Either an instruction or a data directive at a given address.
#[derive(Debug, Clone)]
enum EmitItem {
    Instr(RawInstr),
    Data(RawData),
}

/// Assemble source text into pixel values.
/// Parse a quoted string literal with escape sequences.
/// Input should start with `"` and end with `"`.
/// Supports: `\\`, `\"`, `\n`, `\0`, `\t`, `\xNN` (hex byte).
/// Returns the string as a Vec<u8>.
fn parse_string_literal(s: &str, line: usize) -> Result<Vec<u8>, AsmError> {
    let s = s.trim();
    if !s.starts_with('"') || !s.ends_with('"') || s.len() < 2 {
        return Err(AsmError {
            line,
            message: "expected quoted string literal".into(),
        });
    }
    let inner = &s[1..s.len() - 1];
    let mut bytes = Vec::new();
    let mut chars = inner.chars().peekable();
    while let Some(&ch) = chars.peek() {
        if ch == '\\' {
            chars.next(); // consume backslash
            match chars.next() {
                Some('\\') => bytes.push(b'\\'),
                Some('"') => bytes.push(b'"'),
                Some('n') => bytes.push(b'\n'),
                Some('0') => bytes.push(0),
                Some('t') => bytes.push(b'\t'),
                Some('r') => bytes.push(b'\r'),
                Some('x') => {
                    // \xNN hex escape
                    let hex: String = chars.by_ref().take(2).collect();
                    let val = u8::from_str_radix(&hex, 16).map_err(|e| AsmError {
                        line,
                        message: format!("invalid hex escape \\x{}: {}", hex, e),
                    })?;
                    bytes.push(val);
                }
                Some(other) => {
                    return Err(AsmError {
                        line,
                        message: format!("unknown escape sequence: \\{}", other),
                    });
                }
                None => {
                    return Err(AsmError {
                        line,
                        message: "unexpected end of string after \\".into(),
                    });
                }
            }
        } else {
            bytes.push(ch as u8);
            chars.next();
        }
    }
    Ok(bytes)
}

/// Which section the assembler is currently emitting into.
#[derive(Debug, Clone, Copy, PartialEq)]
enum Section {
    Text,
    Data,
}

/// Returns the assembled program or the first error.
pub fn assemble(source: &str) -> Result<Assembled, AsmError> {
    assemble_inner(source, None)
}

/// Assemble a source file, resolving `.include` directives relative to the file's directory.
/// The `include_dirs` list provides additional search paths for included files.
pub fn assemble_file(
    path: &std::path::Path,
    include_dirs: &[&std::path::Path],
) -> Result<Assembled, AsmError> {
    let content = std::fs::read_to_string(path).map_err(|e| AsmError {
        line: 0,
        message: format!("cannot read '{}': {}", path.display(), e),
    })?;
    let base_dir = path.parent().unwrap_or(std::path::Path::new("."));
    let expanded = resolve_includes(&content, base_dir, include_dirs, &mut HashSet::new(), 0)?;
    assemble_inner(&expanded, Some(base_dir))
}

/// Recursively expand `.include "file"` directives in source text.
/// `base_dir` is where to resolve relative paths from.
/// `include_dirs` are additional search paths.
/// `seen` tracks already-included files to prevent circular includes.
/// `depth` prevents infinite recursion.
fn resolve_includes(
    source: &str,
    base_dir: &std::path::Path,
    include_dirs: &[&std::path::Path],
    seen: &mut HashSet<String>,
    depth: usize,
) -> Result<String, AsmError> {
    if depth > 16 {
        return Err(AsmError {
            line: 0,
            message: "include nesting too deep (>16)".into(),
        });
    }

    let mut result = String::new();
    for (line_num, raw_line) in source.lines().enumerate() {
        let line_num = line_num + 1;
        let trimmed = strip_comment(raw_line).trim();

        // Check for .include directive
        let upper = trimmed.to_uppercase();
        if upper.starts_with(".INCLUDE") {
            let rest = trimmed
                .strip_prefix(".include")
                .or_else(|| trimmed.strip_prefix(".INCLUDE"))
                .unwrap_or("")
                .trim();
            let filename = parse_string_literal(rest, line_num)?;
            let filename_str = String::from_utf8_lossy(&filename);

            // Search for file in base_dir then include_dirs
            let mut found_path: Option<std::path::PathBuf> = None;
            let candidate = base_dir.join(&*filename_str);
            if candidate.exists() {
                found_path = Some(candidate);
            } else {
                for dir in include_dirs {
                    let candidate = dir.join(&*filename_str);
                    if candidate.exists() {
                        found_path = Some(candidate);
                        break;
                    }
                }
            }

            let abs_path = found_path.ok_or_else(|| AsmError {
                line: line_num,
                message: format!("included file not found: {}", filename_str),
            })?;

            // Canonicalize for cycle detection
            let canonical = abs_path
                .canonicalize()
                .map(|p| p.to_string_lossy().into_owned())
                .unwrap_or_else(|_| abs_path.to_string_lossy().into_owned());

            if seen.contains(&canonical) {
                return Err(AsmError {
                    line: line_num,
                    message: format!("circular include: {}", filename_str),
                });
            }
            seen.insert(canonical);

            let included_content = std::fs::read_to_string(&abs_path).map_err(|e| AsmError {
                line: line_num,
                message: format!("cannot read '{}': {}", abs_path.display(), e),
            })?;

            let include_dir = abs_path.parent().unwrap_or(std::path::Path::new("."));
            let expanded = resolve_includes(
                &included_content,
                include_dir,
                include_dirs,
                seen,
                depth + 1,
            )?;

            result.push_str(&expanded);
            result.push('\n');
        } else {
            result.push_str(raw_line);
            result.push('\n');
        }
    }

    Ok(result)
}

/// A macro definition collected from source.
#[derive(Debug, Clone)]
struct MacroDef {
    name: String,
    params: Vec<String>,
    body_lines: Vec<String>,
}

/// Expand `.macro`/`.endm` definitions and invocations in the source.
/// Returns the expanded source with all macros inlined.
fn expand_macros(source: &str) -> Result<String, AsmError> {
    let mut macros: HashMap<String, MacroDef> = HashMap::new();
    let mut result_lines: Vec<String> = Vec::new();
    let mut current_macro: Option<MacroDef> = None;
    let mut macro_start_line: usize = 0;

    for (line_num, raw_line) in source.lines().enumerate() {
        let line_num = line_num + 1;
        let stripped = raw_line.trim();

        // If we're inside a macro definition, collect body lines
        if current_macro.is_some() {
            let upper = stripped.to_uppercase();
            if upper == ".ENDM" {
                // End of macro definition
                let def = current_macro.take().unwrap();
                if macros.contains_key(&def.name) {
                    return Err(AsmError {
                        line: macro_start_line,
                        message: format!("duplicate macro definition: {}", def.name),
                    });
                }
                macros.insert(def.name.clone(), def);
                continue;
            }
            // Add body line (preserve original indentation relative to macro)
            current_macro
                .as_mut()
                .unwrap()
                .body_lines
                .push(raw_line.to_string());
            continue;
        }

        // Check for .macro directive
        let upper = stripped.to_uppercase();
        if upper.starts_with(".MACRO") {
            let rest = stripped
                .strip_prefix(".macro")
                .or_else(|| stripped.strip_prefix(".MACRO"))
                .unwrap_or("")
                .trim();
            if rest.is_empty() {
                return Err(AsmError {
                    line: line_num,
                    message: ".macro requires a name".into(),
                });
            }
            let parts: Vec<&str> = rest.split_whitespace().collect();
            let name = parts[0].to_string();
            // Parameters come after the name, comma-separated
            let params: Vec<String> = if parts.len() > 1 {
                parts[1..]
                    .join("")
                    .split(',')
                    .map(|s| s.trim().to_string())
                    .filter(|s| !s.is_empty())
                    .collect()
            } else {
                vec![]
            };

            // Validate param names: no duplicates, must be identifiers
            let mut seen_params: HashSet<String> = HashSet::new();
            for p in &params {
                if !p.chars().all(|c| c.is_alphanumeric() || c == '_') || p.is_empty() {
                    return Err(AsmError {
                        line: line_num,
                        message: format!("invalid macro parameter name: '{}'", p),
                    });
                }
                if seen_params.contains(p) {
                    return Err(AsmError {
                        line: line_num,
                        message: format!("duplicate macro parameter: '{}'", p),
                    });
                }
                seen_params.insert(p.clone());
            }

            macro_start_line = line_num;
            current_macro = Some(MacroDef {
                name,
                params,
                body_lines: vec![],
            });
            continue;
        }

        // Not a directive -- check if this line is a macro invocation
        // A macro invocation starts with the macro name as the first token
        let first_token = stripped.split_whitespace().next().unwrap_or("");
        if let Some(def) = macros
            .get(first_token.to_uppercase().as_str())
            .or_else(|| macros.get(first_token))
        {
            // Parse invocation arguments (comma-separated, after the name)
            let after_name = stripped.strip_prefix(&def.name).unwrap_or("").trim();
            // Also try case-insensitive strip
            let after_name = if after_name.is_empty() && !stripped.starts_with(&def.name) {
                stripped.strip_prefix(first_token).unwrap_or("").trim()
            } else {
                after_name
            };

            let invoke_args: Vec<&str> = if after_name.is_empty() {
                vec![]
            } else {
                after_name
                    .split(',')
                    .map(|s| s.trim())
                    .filter(|s| !s.is_empty())
                    .collect()
            };

            if invoke_args.len() != def.params.len() {
                return Err(AsmError {
                    line: line_num,
                    message: format!(
                        "macro '{}' expects {} args, got {}",
                        def.name,
                        def.params.len(),
                        invoke_args.len()
                    ),
                });
            }

            // Expand the body: substitute \param with arg value
            for body_line in &def.body_lines {
                let mut expanded = body_line.clone();
                for (i, param) in def.params.iter().enumerate() {
                    let placeholder = format!("\\{}", param);
                    expanded = expanded.replace(&placeholder, invoke_args[i]);
                    // Also support \N (positional) syntax
                    let pos_placeholder = format!("\\{}", i + 1);
                    expanded = expanded.replace(&pos_placeholder, invoke_args[i]);
                }
                result_lines.push(expanded);
            }
            continue;
        }

        // Regular line -- pass through
        result_lines.push(raw_line.to_string());
    }

    // Check for unterminated macro
    if current_macro.is_some() {
        return Err(AsmError {
            line: macro_start_line,
            message: "unterminated .macro (missing .endm)".into(),
        });
    }

    Ok(result_lines.join("\n"))
}

/// Inner assembly implementation. Takes optional base_dir for error context.
fn assemble_inner(
    source: &str,
    _base_dir: Option<&std::path::Path>,
) -> Result<Assembled, AsmError> {
    // Expand macros before assembly
    let source = expand_macros(source)?;
    let mut labels: HashMap<String, usize> = HashMap::new();
    let mut constants: HashMap<String, u32> = HashMap::new();
    let mut items: Vec<(usize, EmitItem)> = Vec::new(); // (emit_addr, item)
    let mut current_addr: usize = 0;
    let mut data_addr: usize = 0;
    let mut section: Section = Section::Text;
    let mut data_initialized: bool = false;

    // ── Pass 1: Parse lines, collect labels, compute addresses ──────
    for (line_num, raw_line) in source.lines().enumerate() {
        let line_num = line_num + 1; // 1-indexed
        let line = strip_comment(raw_line).trim();

        if line.is_empty() {
            continue;
        }

        // ── Constant definition: NAME = value ──
        // Must be uppercase, start with letter/underscore, contain only alphanumeric/underscore
        if let Some(eq_pos) = line.find(" = ") {
            let (name, value_str) = line.split_at(eq_pos);
            let name = name.trim();
            let value_str = value_str[3..].trim(); // skip " = "
            // Validate: name must start with uppercase letter or underscore,
            // contain only alphanumeric/underscore, and not be a register name
            let valid_name = !name.is_empty()
                && !name.starts_with('r')
                && name.chars().next().map_or(false, |c| c.is_ascii_uppercase() || c == '_')
                && name.chars().all(|c| c.is_ascii_alphanumeric() || c == '_');
            if valid_name {
                if let Ok(val) = parse_number(value_str) {
                    constants.insert(name.to_string(), val);
                    continue;
                }
            }
        }

        // .TEXT directive -- switch to code section (default)
        let upper_line = line.to_uppercase();
        if upper_line == ".TEXT" {
            section = Section::Text;
            // If data was already emitted, advance text past it to avoid overlap
            if data_initialized && current_addr < data_addr {
                current_addr = data_addr;
            }
            continue;
        }

        // .DATA directive -- switch to data section
        if upper_line == ".DATA" {
            section = Section::Data;
            if !data_initialized {
                // First time entering .data: start after current code
                data_addr = current_addr;
                data_initialized = true;
            }
            continue;
        }

        // .ORG directive -- sets address for the current section
        if let Some(rest) = line.strip_prefix(".ORG") {
            let addr_str = rest.trim();
            let addr = parse_number(addr_str).map_err(|e| AsmError {
                line: line_num,
                message: e,
            })?;
            match section {
                Section::Text => current_addr = addr as usize,
                Section::Data => {
                    data_addr = addr as usize;
                    data_initialized = true;
                }
            }
            continue;
        }

        // Active emit address for the current section
        let emit_addr = match section {
            Section::Text => current_addr,
            Section::Data => data_addr,
        };

        // .ASCIZ directive: .asciz "hello" → emits ASCII bytes + null terminator
        // Each character becomes one u32 pixel value.
        if let Some(rest) = line
            .strip_prefix(".asciz")
            .or_else(|| line.strip_prefix(".ASCIZ"))
        {
            let bytes = parse_string_literal(rest.trim(), line_num)?;
            let mut pixels: Vec<u32> = bytes.iter().map(|&b| b as u32).collect();
            pixels.push(0); // null terminator
            let data_len = pixels.len();
            items.push((
                emit_addr,
                EmitItem::Data(RawData {
                    line: line_num,
                    pixels,
                }),
            ));
            match section {
                Section::Text => current_addr += data_len,
                Section::Data => data_addr += data_len,
            }
            continue;
        }

        // .WORD directive: .word 42 or .word 1,2,3 → emits one or more u32 values
        if let Some(rest) = line
            .strip_prefix(".word")
            .or_else(|| line.strip_prefix(".WORD"))
        {
            let mut pixels: Vec<u32> = Vec::new();
            for token in rest.split(',') {
                let token = token.trim();
                if token.is_empty() {
                    continue;
                }
                match parse_number(token) {
                    Ok(val) => pixels.push(val),
                    Err(_) => {
                        return Err(AsmError {
                            line: line_num,
                            message: format!("invalid .word value: '{}'", token),
                        })
                    }
                }
            }
            let data_len = pixels.len();
            items.push((
                emit_addr,
                EmitItem::Data(RawData {
                    line: line_num,
                    pixels,
                }),
            ));
            match section {
                Section::Text => current_addr += data_len,
                Section::Data => data_addr += data_len,
            }
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
            labels.insert(label, emit_addr);
            continue;
        }

        // Instruction
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.is_empty() {
            continue;
        }

        let mnemonic = parts[0];

        // Parse comma-separated arguments (shared by all paths below)
        let arg_str = if parts.len() > 1 {
            parts[1..].join("")
        } else {
            String::new()
        };
        let arg_tokens: Vec<&str> = if arg_str.is_empty() {
            vec![]
        } else {
            arg_str
                .split(',')
                .map(|s| s.trim())
                .filter(|s| !s.is_empty())
                .collect()
        };

        // ── Branch aliases: BEQ r0, r1, label → BRANCH packed_cond, label ──
        if let Some(cond_code) = branch_alias_cond(mnemonic) {
            if arg_tokens.len() != 3 {
                return Err(AsmError {
                    line: line_num,
                    message: format!(
                        "{} expects 3 args (r1, r2, label), got {}",
                        mnemonic,
                        arg_tokens.len()
                    ),
                });
            }
            let r1 = parse_arg_with_constants(arg_tokens[0], &constants).map_err(|e| AsmError {
                line: line_num,
                message: e,
            })?;
            let r2 = parse_arg_with_constants(arg_tokens[1], &constants).map_err(|e| AsmError {
                line: line_num,
                message: e,
            })?;
            let target = parse_arg_with_constants(arg_tokens[2], &constants).map_err(|e| AsmError {
                line: line_num,
                message: e,
            })?;
            let branch_width = crate::opcodes::width(crate::opcodes::op::BRANCH);
            items.push((
                emit_addr,
                EmitItem::Instr(RawInstr {
                    line: line_num,
                    opcode: crate::opcodes::op::BRANCH,
                    args: vec![
                        ArgToken::BranchCond(cond_code, Box::new(r1), Box::new(r2)),
                        target,
                    ],
                }),
            ));
            match section {
                Section::Text => current_addr += branch_width,
                Section::Data => data_addr += branch_width,
            }
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
                    mnemonic,
                    expected_args,
                    arg_tokens.len()
                ),
            });
        }

        let args: Vec<ArgToken> = arg_tokens
            .iter()
            .map(|t| parse_arg_with_constants(t, &constants))
            .collect::<Result<Vec<_>, _>>()
            .map_err(|e| AsmError {
                line: line_num,
                message: e,
            })?;

        items.push((
            emit_addr,
            EmitItem::Instr(RawInstr {
                line: line_num,
                opcode,
                args,
            }),
        ));

        match section {
            Section::Text => current_addr += width,
            Section::Data => data_addr += width,
        }
    }

    // ── Pass 2: Emit pixels, resolve labels ─────────────────────────
    let item_size = |item: &EmitItem| -> usize {
        match item {
            EmitItem::Instr(instr) => crate::opcodes::width(instr.opcode),
            EmitItem::Data(data) => data.pixels.len(),
        }
    };

    let end_addr = items
        .last()
        .map(|(addr, item)| *addr + item_size(item))
        .unwrap_or(0);

    let mut pixels = vec![0u32; end_addr];

    for (addr, item) in &items {
        match item {
            EmitItem::Data(data) => {
                for (i, &val) in data.pixels.iter().enumerate() {
                    let pa = *addr + i;
                    if pa < pixels.len() {
                        pixels[pa] = val;
                    }
                }
            }
            EmitItem::Instr(instr) => {
                pixels[*addr] = instr.opcode as u32;

                for (i, arg) in instr.args.iter().enumerate() {
                    let pixel_addr = addr + 1 + i;
                    let is_addr_arg = matches!(
                        instr.opcode,
                        crate::opcodes::op::JMP
                            | crate::opcodes::op::BRANCH
                            | crate::opcodes::op::CALL
                            | crate::opcodes::op::STI,
                    ) && i == instr.args.len() - 1;

                    let value = match arg {
                        ArgToken::Register(n) => *n,
                        ArgToken::Immediate(v) => {
                            if is_addr_arg {
                                *v | 0x80000000
                            } else {
                                *v
                            }
                        }
                        ArgToken::Label(name) => {
                            let label_addr = *labels.get(name).ok_or_else(|| AsmError {
                                line: instr.line,
                                message: format!("undefined label: {}", name),
                            })? as u32;
                            if is_addr_arg {
                                label_addr | 0x80000000
                            } else {
                                label_addr
                            }
                        }
                        ArgToken::BranchCond(cond, r1_tok, r2_tok) => {
                            let resolve = |tok: &ArgToken| -> Result<u32, AsmError> {
                                match tok {
                                    ArgToken::Register(n) => Ok(*n),
                                    ArgToken::Immediate(v) => Ok(*v),
                                    _ => Err(AsmError {
                                        line: instr.line,
                                        message: "branch condition register must be r0-r31".into(),
                                    }),
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
        s.parse::<u32>()
            .map_err(|e| format!("bad number '{}': {}", s, e))
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
                op::JMP as u32,
                0 | 0x80000000,
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
                op::LDI as u32,
                0,
                5, // addr 0-2
                op::LDI as u32,
                1,
                3, // addr 3-5
                op::ADD as u32,
                0,
                1,               // addr 6-8
                op::HALT as u32, // addr 9
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
        assert_eq!(cond_pixel & 0xFF, 0); // BEQ = 0
        assert_eq!((cond_pixel >> 16) & 0xFF, 0); // r1 = r0 = index 0
        assert_eq!((cond_pixel >> 24) & 0xFF, 1); // r2 = r1 = index 1
        assert_eq!(asm.pixels[2], 0 | 0x80000000); // target = loop = addr 0 (absolute)
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
        assert_eq!(cond_pixel & 0xFF, 1); // BNE = 1
        assert_eq!((cond_pixel >> 16) & 0xFF, 2); // r2
        assert_eq!((cond_pixel >> 24) & 0xFF, 3); // r3
        assert_eq!(asm.pixels[3], 0 | 0x80000000); // target = loop = addr 0 (absolute)
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
        assert_eq!(asm.pixels[3], 0 | 0x80000000); // target = addr 0 (absolute)
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

    // ── .ASCIZ directive tests ────────────────────────────────────

    #[test]
    fn asciz_simple_string() {
        let asm = assemble(".asciz \"Hi\"").unwrap();
        assert_eq!(asm.pixels, vec![b'H' as u32, b'i' as u32, 0]);
    }

    #[test]
    fn asciz_empty_string() {
        // Empty string → just a null terminator
        let asm = assemble(".asciz \"\"").unwrap();
        assert_eq!(asm.pixels, vec![0]);
    }

    #[test]
    fn asciz_with_label() {
        let src = "\
msg:
    .asciz \"Hello\"
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.labels.get("msg"), Some(&0));
        assert_eq!(
            asm.pixels,
            vec![
                b'H' as u32,
                b'e' as u32,
                b'l' as u32,
                b'l' as u32,
                b'o' as u32,
                0,
            ]
        );
    }

    #[test]
    fn asciz_after_code() {
        let src = "\
    HALT
msg:
    .asciz \"OK\"
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.labels.get("msg"), Some(&1)); // HALT is width 1
        assert_eq!(asm.pixels[0], op::HALT as u32);
        assert_eq!(asm.pixels[1], b'O' as u32);
        assert_eq!(asm.pixels[2], b'K' as u32);
        assert_eq!(asm.pixels[3], 0);
    }

    #[test]
    fn asciz_with_org() {
        let src = "\
    HALT
    .ORG 0x100
msg:
    .asciz \"Hi\"
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.labels.get("msg"), Some(&0x100));
        assert_eq!(asm.end_addr, 0x103); // 0x100 + 3 bytes (H, i, \0)
        assert_eq!(asm.pixels[0x100], b'H' as u32);
        assert_eq!(asm.pixels[0x101], b'i' as u32);
        assert_eq!(asm.pixels[0x102], 0);
    }

    #[test]
    fn asciz_escape_sequences() {
        let src = r#".asciz "A\nB""#;
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels, vec![b'A' as u32, b'\n' as u32, b'B' as u32, 0]);
    }

    #[test]
    fn asciz_escape_null() {
        let src = r#".asciz "A\0B""#;
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels, vec![b'A' as u32, 0, b'B' as u32, 0]);
    }

    #[test]
    fn asciz_escape_backslash_and_quote() {
        let src = r#".asciz "a\\b\"c""#;
        let asm = assemble(src).unwrap();
        assert_eq!(
            asm.pixels,
            vec![
                b'a' as u32,
                b'\\' as u32,
                b'b' as u32,
                b'"' as u32,
                b'c' as u32,
                0
            ]
        );
    }

    #[test]
    fn asciz_case_insensitive() {
        let asm1 = assemble(".asciz \"X\"").unwrap();
        let asm2 = assemble(".ASCIZ \"X\"").unwrap();
        assert_eq!(asm1.pixels, asm2.pixels);
    }

    #[test]
    fn asciz_with_text_opcode_and_label_ref() {
        // Load address of string label into register, then use TEXT
        let src = "\
    LDI r1, 10
    LDI r2, 20
    LDI r3, msg
    TEXT r1, r2, r3
    HALT
msg:
    .asciz \"Hi\"
";
        let asm = assemble(src).unwrap();
        // msg should be at addr: LDI(3) + LDI(3) + LDI(3) + TEXT(4) + HALT(1) = 14
        assert_eq!(asm.labels.get("msg"), Some(&14));
        // LDI r3, msg → loads address 14 as immediate
        // addr 6-8 is LDI r3, msg
        assert_eq!(asm.pixels[6], op::LDI as u32); // opcode
        assert_eq!(asm.pixels[7], 3); // r3
        assert_eq!(asm.pixels[8], 14); // msg address
    }

    #[test]
    fn asciz_error_unterminated_string() {
        let err = assemble(".asciz \"hello").unwrap_err();
        assert!(err.message.contains("quoted string"));
    }

    #[test]
    fn asciz_error_unknown_escape() {
        let err = assemble(r#".asciz "\q""#).unwrap_err();
        assert!(err.message.contains("unknown escape"));
    }

    // ── .data / .text section directive tests ────────────────────────

    #[test]
    fn text_directive_is_default() {
        // Code without any section directive should behave identically
        let src = "HALT";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels, vec![op::HALT as u32]);
    }

    #[test]
    fn data_section_strings_after_code() {
        // .data places strings after code by default
        let src = "\
    HALT
    .data
msg:
    .asciz \"Hi\"
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.labels.get("msg"), Some(&1)); // HALT is width 1, so data starts at 1
        assert_eq!(asm.pixels[0], op::HALT as u32);
        assert_eq!(asm.pixels[1], b'H' as u32);
        assert_eq!(asm.pixels[2], b'i' as u32);
        assert_eq!(asm.pixels[3], 0); // null terminator
    }

    #[test]
    fn data_with_org_sets_data_start() {
        // .ORG inside .data sets the data start address
        let src = "\
    HALT
    .data
    .ORG 0x100
msg:
    .asciz \"OK\"
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.labels.get("msg"), Some(&0x100));
        assert_eq!(asm.pixels[0x100], b'O' as u32);
        assert_eq!(asm.pixels[0x101], b'K' as u32);
        assert_eq!(asm.pixels[0x102], 0);
    }

    #[test]
    fn text_data_text_roundtrip() {
        // Switch between .text and .data sections
        let src = "\
    LDI r0, 1
    .data
msg:
    .asciz \"AB\"
    .text
    HALT
";
        let asm = assemble(src).unwrap();
        // LDI r0, 1 at addr 0-2 (width 3)
        // .data: msg at addr 3 (follows code)
        //   'A' at 3, 'B' at 4, null at 5
        // .text resumes PAST data, so HALT at addr 6
        assert_eq!(asm.labels.get("msg"), Some(&3));
        assert_eq!(asm.pixels[0], op::LDI as u32);
        assert_eq!(asm.pixels[1], 0); // r0
        assert_eq!(asm.pixels[2], 1); // immediate
        // HALT at text addr 6 (after data at 3-5)
        assert_eq!(asm.pixels[6], op::HALT as u32);
    }

    #[test]
    fn data_section_with_explicit_org_separates_code_and_data() {
        // The recommended pattern: use .ORG in .data to separate from code
        let src = "\
    .text
    LDI r3, msg
    TEXT r0, r1, r3
    HALT
    .data
    .ORG 0x200
msg:
    .asciz \"Hello\"
";
        let asm = assemble(src).unwrap();
        // Code: LDI(3) + TEXT(4) + HALT(1) = 8 bytes at 0..8
        // Data: "Hello\0" at 0x200
        assert_eq!(asm.labels.get("msg"), Some(&0x200));
        // LDI r3, msg: opcode at 0, r3 at 1, msg immediate at 2
        assert_eq!(asm.pixels[0], op::LDI as u32);
        assert_eq!(asm.pixels[1], 3); // r3
        assert_eq!(asm.pixels[2], 0x200); // msg address = 512
    }

    #[test]
    fn data_section_case_insensitive() {
        let src1 = ".DATA\nHALT";
        let src2 = ".data\nHALT";
        // Both should parse (but HALT in .data is unusual -- it's legal)
        let asm1 = assemble(src1).unwrap();
        let asm2 = assemble(src2).unwrap();
        assert_eq!(asm1.pixels, asm2.pixels);
    }

    #[test]
    fn text_directive_case_insensitive() {
        let src1 = ".TEXT\nHALT";
        let src2 = ".text\nHALT";
        let asm1 = assemble(src1).unwrap();
        let asm2 = assemble(src2).unwrap();
        assert_eq!(asm1.pixels, asm2.pixels);
    }

    #[test]
    fn multiple_data_entries() {
        // Multiple .asciz entries in .data section
        let src = "\
    HALT
    .data
    .ORG 0x100
s1:
    .asciz \"A\"
s2:
    .asciz \"B\"
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.labels.get("s1"), Some(&0x100)); // 'A', 0
        assert_eq!(asm.labels.get("s2"), Some(&0x102)); // 'B', 0
        assert_eq!(asm.pixels[0x100], b'A' as u32);
        assert_eq!(asm.pixels[0x101], 0);
        assert_eq!(asm.pixels[0x102], b'B' as u32);
        assert_eq!(asm.pixels[0x103], 0);
    }

    #[test]
    fn data_section_label_in_code_reference() {
        // Code references a label defined in .data section
        let src = "\
    .text
    LDI r3, greeting
    HALT
    .data
    .ORG 0x50
greeting:
    .asciz \"Yo\"
";
        let asm = assemble(src).unwrap();
        // LDI r3, greeting: loads address 0x50
        assert_eq!(asm.labels.get("greeting"), Some(&0x50));
        assert_eq!(asm.pixels[2], 0x50); // LDI r3 immediate = greeting addr
    }

    // ── .include directive tests ─────────────────────────────────────

    #[test]
    fn include_simple_file() {
        // Create temp files for include test
        let tmp_dir = std::env::temp_dir().join("geo_os_include_test");
        std::fs::create_dir_all(&tmp_dir).unwrap();

        let lib_path = tmp_dir.join("lib.gasm");
        std::fs::write(&lib_path, "HALT\n").unwrap();

        let main_path = tmp_dir.join("main.gasm");
        std::fs::write(&main_path, ".include \"lib.gasm\"\n").unwrap();

        let asm = assemble_file(&main_path, &[]).unwrap();
        assert_eq!(asm.pixels, vec![op::HALT as u32]);

        // Cleanup
        let _ = std::fs::remove_dir_all(&tmp_dir);
    }

    #[test]
    fn include_inlines_before_rest() {
        let tmp_dir = std::env::temp_dir().join("geo_os_include_order");
        std::fs::create_dir_all(&tmp_dir).unwrap();

        let lib_path = tmp_dir.join("lib.gasm");
        std::fs::write(&lib_path, "LDI r0, 10\n").unwrap();

        let main_path = tmp_dir.join("main.gasm");
        std::fs::write(&main_path, ".include \"lib.gasm\"\nADD r0, r0\nHALT\n").unwrap();

        let asm = assemble_file(&main_path, &[]).unwrap();
        // LDI r0, 10 at 0-2 (width 3)
        // ADD r0, r0 at 3-5 (width 3)
        // HALT at 6 (width 1)
        assert_eq!(asm.pixels[0], op::LDI as u32);
        assert_eq!(asm.pixels[2], 10);
        assert_eq!(asm.pixels[3], op::ADD as u32);
        assert_eq!(asm.pixels[6], op::HALT as u32);

        let _ = std::fs::remove_dir_all(&tmp_dir);
    }

    #[test]
    fn include_with_labels() {
        // Included file defines a label that main file references
        let tmp_dir = std::env::temp_dir().join("geo_os_include_labels");
        std::fs::create_dir_all(&tmp_dir).unwrap();

        let lib_path = tmp_dir.join("lib.gasm");
        std::fs::write(&lib_path, "NOP\nstart:\n").unwrap();

        let main_path = tmp_dir.join("main.gasm");
        std::fs::write(&main_path, ".include \"lib.gasm\"\nJMP start\nHALT\n").unwrap();

        let asm = assemble_file(&main_path, &[]).unwrap();
        assert_eq!(asm.labels.get("start"), Some(&1)); // NOP at 0, start at 1
        assert_eq!(asm.pixels[2], 1 | 0x80000000); // JMP start = addr 1 (absolute)

        let _ = std::fs::remove_dir_all(&tmp_dir);
    }

    #[test]
    fn include_nested() {
        // a.gasm includes b.gasm which has actual code
        let tmp_dir = std::env::temp_dir().join("geo_os_include_nested");
        std::fs::create_dir_all(&tmp_dir).unwrap();

        let inner_path = tmp_dir.join("inner.gasm");
        std::fs::write(&inner_path, "LDI r0, 42\n").unwrap();

        let outer_path = tmp_dir.join("outer.gasm");
        std::fs::write(&outer_path, ".include \"inner.gasm\"\n").unwrap();

        let main_path = tmp_dir.join("main.gasm");
        std::fs::write(&main_path, ".include \"outer.gasm\"\nHALT\n").unwrap();

        let asm = assemble_file(&main_path, &[]).unwrap();
        assert_eq!(asm.pixels[0], op::LDI as u32);
        assert_eq!(asm.pixels[2], 42);
        assert_eq!(asm.pixels[3], op::HALT as u32);

        let _ = std::fs::remove_dir_all(&tmp_dir);
    }

    #[test]
    fn include_file_not_found() {
        let tmp_dir = std::env::temp_dir().join("geo_os_include_notfound");
        std::fs::create_dir_all(&tmp_dir).unwrap();

        let main_path = tmp_dir.join("main.gasm");
        std::fs::write(&main_path, ".include \"nonexistent.gasm\"\n").unwrap();

        let err = assemble_file(&main_path, &[]).unwrap_err();
        assert!(err.message.contains("not found"));

        let _ = std::fs::remove_dir_all(&tmp_dir);
    }

    #[test]
    fn include_case_insensitive() {
        let tmp_dir = std::env::temp_dir().join("geo_os_include_case");
        std::fs::create_dir_all(&tmp_dir).unwrap();

        let lib_path = tmp_dir.join("lib.gasm");
        std::fs::write(&lib_path, "HALT\n").unwrap();

        let main_path = tmp_dir.join("main.gasm");
        std::fs::write(&main_path, ".INCLUDE \"lib.gasm\"\n").unwrap();

        let asm = assemble_file(&main_path, &[]).unwrap();
        assert_eq!(asm.pixels, vec![op::HALT as u32]);

        let _ = std::fs::remove_dir_all(&tmp_dir);
    }

    // ── Macro directive tests ──────────────────────────────────────────

    #[test]
    fn macro_simple_no_params() {
        // A parameterless macro that just expands to HALT
        let src = "\
.macro STOP
HALT
.endm
STOP
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels, vec![op::HALT as u32]);
    }

    #[test]
    fn macro_with_one_param() {
        // LDI_REG r0 → LDI r0, 42  (hardcoded value in body)
        let src = "\
.macro SET42 reg
LDI \\reg, 42
.endm
SET42 r0
HALT
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels, vec![op::LDI as u32, 0, 42, op::HALT as u32]);
    }

    #[test]
    fn macro_with_two_params() {
        // ADD3 a, b → LDI r0, a  /  LDI r1, b  /  ADD r0, r1
        let src = "\
.macro ADD3 a, b
LDI r0, \\a
LDI r1, \\b
ADD r0, r1
.endm
ADD3 10, 20
HALT
";
        let asm = assemble(src).unwrap();
        // LDI r0, 10 → [LDI, 0, 10]
        // LDI r1, 20 → [LDI, 1, 20]
        // ADD r0, r1  → [ADD, 0, 1]
        // HALT
        assert_eq!(
            asm.pixels,
            vec![
                op::LDI as u32,
                0,
                10,
                op::LDI as u32,
                1,
                20,
                op::ADD as u32,
                0,
                1,
                op::HALT as u32,
            ]
        );
    }

    #[test]
    fn macro_invoked_multiple_times() {
        let src = "\
.macro LOAD_VAL reg, val
LDI \\reg, \\val
.endm
LOAD_VAL r0, 5
LOAD_VAL r1, 10
LOAD_VAL r2, 15
HALT
";
        let asm = assemble(src).unwrap();
        // 3 × LDI (3 wide each) + HALT (1) = 10 pixels
        assert_eq!(asm.pixels[0], op::LDI as u32);
        assert_eq!(asm.pixels[2], 5);
        assert_eq!(asm.pixels[3], op::LDI as u32);
        assert_eq!(asm.pixels[5], 10);
        assert_eq!(asm.pixels[6], op::LDI as u32);
        assert_eq!(asm.pixels[8], 15);
        assert_eq!(asm.pixels[9], op::HALT as u32);
    }

    #[test]
    fn macro_positional_params() {
        // \1 and \2 should work as positional aliases
        let src = "\
.macro PAIR first, second
LDI r0, \\1
LDI r1, \\2
.endm
PAIR 100, 200
HALT
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels[2], 100);
        assert_eq!(asm.pixels[5], 200);
    }

    #[test]
    fn macro_runs_in_vm() {
        // Macro that loads two values and adds them, result should be in r0
        let src = "\
.macro LOAD_ADD a, b
LDI r0, \\a
LDI r1, \\b
ADD r0, r1
.endm
LOAD_ADD 7, 3
HALT
";
        let asm = assemble(src).unwrap();
        let mut vm = crate::vm::Vm::new(4096);
        vm.load_program(&asm.pixels);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 10); // 7 + 3 = 10
    }

    #[test]
    fn macro_with_label_in_body() {
        // Macro body uses a label -- each invocation expands it
        let src = "\
.macro LOAD_LOOP val
LDI r0, \\val
loop:
NOP
.endm
LOAD_LOOP 42
HALT
";
        let asm = assemble(src).unwrap();
        // LDI r0, 42 (3) + NOP (1) + HALT (1) = 5
        assert_eq!(asm.pixels[0], op::LDI as u32);
        assert_eq!(asm.pixels[2], 42);
        assert_eq!(asm.pixels[3], op::NOP as u32);
        assert_eq!(asm.pixels[4], op::HALT as u32);
        // Label "loop" should be at addr 3
        assert_eq!(asm.labels.get("loop"), Some(&3));
    }

    #[test]
    fn macro_case_insensitive_directive() {
        let src1 = ".macro M1\nHALT\n.endm\nM1\n";
        let src2 = ".MACRO M1\nHALT\n.ENDM\nM1\n";
        let asm1 = assemble(src1).unwrap();
        let asm2 = assemble(src2).unwrap();
        assert_eq!(asm1.pixels, asm2.pixels);
    }

    #[test]
    fn macro_before_and_after_code() {
        let src = "\
.macro INC reg
LDI r15, 1
ADD \\reg, r15
.endm
LDI r0, 10
INC r0
HALT
";
        let asm = assemble(src).unwrap();
        let mut vm = crate::vm::Vm::new(4096);
        vm.load_program(&asm.pixels);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 11); // 10 + 1 = 11
    }

    #[test]
    fn macro_error_no_name() {
        let err = assemble(".macro\nHALT\n.endm\n").unwrap_err();
        assert!(err.message.contains("requires a name"));
    }

    #[test]
    fn macro_error_unterminated() {
        let err = assemble(".macro FOO\nHALT\n").unwrap_err();
        assert!(err.message.contains("unterminated"));
    }

    #[test]
    fn macro_error_wrong_arg_count() {
        let src = "\
.macro PAIR a, b
LDI r0, \\a
LDI r1, \\b
.endm
PAIR 1
";
        let err = assemble(src).unwrap_err();
        assert!(err.message.contains("expects 2 args, got 1"));
    }

    #[test]
    fn macro_error_duplicate_definition() {
        let src = "\
.macro FOO
HALT
.endm
.macro FOO
NOP
.endm
FOO
";
        let err = assemble(src).unwrap_err();
        assert!(err.message.contains("duplicate macro"));
    }

    #[test]
    fn macro_error_duplicate_param() {
        let src = "\
.macro FOO x, x
HALT
.endm
FOO 1, 2
";
        let err = assemble(src).unwrap_err();
        assert!(err.message.contains("duplicate macro parameter"));
    }

    #[test]
    fn macro_with_comment_in_body() {
        let src = "\
.macro LOAD reg, val
; load value into register
LDI \\reg, \\val
.endm
LOAD r0, 99
HALT
";
        let asm = assemble(src).unwrap();
        assert_eq!(asm.pixels[0], op::LDI as u32);
        assert_eq!(asm.pixels[1], 0);
        assert_eq!(asm.pixels[2], 99);
    }

    #[test]
    fn macro_empty_body() {
        // Macro with no body lines -- invocation expands to nothing
        let src = "\
.macro NOTHING
.endm
HALT
NOTHING
NOP
";
        let asm = assemble(src).unwrap();
        // HALT at 0, then NOP at 1 (NOTHING expanded to nothing)
        assert_eq!(asm.pixels[0], op::HALT as u32);
        assert_eq!(asm.pixels[1], op::NOP as u32);
    }

    #[test]
    fn macro_does_not_shadow_opcodes() {
        // A macro name should NOT shadow an opcode name since macro expansion
        // is purely textual. But if someone names a macro "ADD", it WILL match
        // because macro lookup happens before opcode parsing.
        // This is by design -- assembler macros are textual.
        // Test that a uniquely-named macro works alongside real opcodes.
        let src = "\
.macro MYADD rd, rs
ADD \\rd, \\rs
.endm
LDI r0, 5
LDI r1, 3
MYADD r0, r1
HALT
";
        let asm = assemble(src).unwrap();
        let mut vm = crate::vm::Vm::new(4096);
        vm.load_program(&asm.pixels);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 8);
    }
}
