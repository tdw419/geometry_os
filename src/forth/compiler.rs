// compiler.rs - Forth-to-GeOS-ASM compiler
//
// Memory layout:
//   0x1000  Code start (assembled bytecode)
//   0x3000  Forth data area (strings, buffers)
//   0x3800  Forth variables
//   0x3900  Forth return stack base (grows upward, max 256 entries)
//   Top of data stack: GeOS r30 (SP) - grows downward
//
// Register convention:
//   r0  - scratch / comparison results
//   r2-r5 - temporaries for compilation
//   r14 - DO/LOOP index register (inner loop)
//   r13 - DO/LOOP index register (outer loop, for J)
//   r15 - DO/LOOP limit register
//   r30 - data stack pointer (SP, GeOS convention)
//   r31 - link register (GeOS CALL/RET)

use std::collections::HashMap;

use crate::forth::lexer;

const DATA_BASE: u32 = 0x3000;
const VAR_BASE: u32 = 0x3800;
const DOT_QUOTE: &str = ".\"";

#[derive(Debug)]
pub struct CompileError {
    pub message: String,
    pub line: usize,
}

impl std::fmt::Display for CompileError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "line {}: {}", self.line, self.message)
    }
}

#[derive(Debug, Clone, PartialEq)]
enum State {
    Interpreting,
    Compiling,
}

pub struct Compiler {
    words: HashMap<String, String>,
    variables: HashMap<String, u32>,
    label_counter: u32,
    data_ptr: u32,
    var_ptr: u32,
    output: Vec<String>,
    state: State,
    current_word: Option<String>,
    current_word_label: Option<String>,
    if_depth: u32,
    do_depth: u32,
    loop_stack: Vec<LoopInfo>,
    begin_stack: Vec<String>,
    indent: usize,
}

#[derive(Debug, Clone)]
struct LoopInfo {
    begin_label: String,
    do_label: String,
}

impl Compiler {
    pub fn new() -> Self {
        Compiler {
            words: HashMap::new(),
            variables: HashMap::new(),
            label_counter: 0,
            data_ptr: DATA_BASE,
            var_ptr: VAR_BASE,
            output: Vec::new(),
            state: State::Interpreting,
            current_word: None,
            current_word_label: None,
            if_depth: 0,
            do_depth: 0,
            loop_stack: Vec::new(),
            begin_stack: Vec::new(),
            indent: 0,
        }
    }

    fn next_label(&mut self, prefix: &str) -> String {
        let label = format!("{}_{}", prefix, self.label_counter);
        self.label_counter += 1;
        label
    }

    fn emit(&mut self, line: &str) {
        let padding = "  ".repeat(self.indent);
        self.output.push(format!("{}{}", padding, line));
    }

    fn emit_comment(&mut self, text: &str) {
        self.emit(&format!("; {}", text));
    }

    /// Emit a store to a memory-mapped port (e.g., 0xFFB debug port).
    /// Uses r5 as scratch since the assembler doesn't support immediate addresses in STORE.
    fn emit_port_store(&mut self, port: u32, reg: &str, comment: &str) {
        self.emit(&format!("LDI r5, 0x{:X}", port));
        self.emit(&format!("STORE r5, {}    ; {}", reg, comment));
    }

    /// Main compile entry point. Returns GeOS assembly source.
    pub fn compile(&mut self, source: &str) -> Result<String, CompileError> {
        let tokens = lexer::tokenize(source);
        self.compile_tokens(&tokens)?;
        // Post-compilation validation: unclosed control structures
        if self.if_depth > 0 {
            return Err(CompileError {
                message: "IF without matching THEN".into(),
                line: 0,
            });
        }
        if self.do_depth > 0 {
            return Err(CompileError {
                message: "DO without matching LOOP".into(),
                line: 0,
            });
        }
        if !self.begin_stack.is_empty() {
            return Err(CompileError {
                message: "BEGIN without matching UNTIL/AGAIN/REPEAT".into(),
                line: 0,
            });
        }
        if let Some(ref name) = self.current_word {
            return Err(CompileError {
                message: format!("unterminated colon definition for '{}'", name),
                line: 0,
            });
        }
        self.emit("HALT");
        Ok(self.output.join("\n"))
    }

    fn compile_tokens(&mut self, tokens: &[lexer::Token]) -> Result<(), CompileError> {
        let mut i = 0;
        while i < tokens.len() {
            let tok = &tokens[i];
            let word = tok.text.as_str();

            match word {
                ":" => {
                    if self.state == State::Compiling {
                        return Err(CompileError {
                            message: "nested : definitions not allowed".into(),
                            line: tok.line,
                        });
                    }
                    i += 1;
                    if i >= tokens.len() {
                        return Err(CompileError {
                            message: ": expects a word name".into(),
                            line: tok.line,
                        });
                    }
                    let name = tokens[i].text.clone();
                    let label = self.next_label("word");
                    self.current_word = Some(name.clone());
                    self.current_word_label = Some(label.clone());
                    self.state = State::Compiling;
                    self.emit(&format!("{}:", label));
                    self.emit_comment(&format!(": {} ", name));
                    self.indent += 1;
                    i += 1;
                    continue;
                },
                ";" => {
                    if self.state != State::Compiling {
                        return Err(CompileError {
                            message: "; outside of : definition".into(),
                            line: tok.line,
                        });
                    }
                    self.indent -= 1;
                    self.emit("RET");
                    let name = self.current_word.take().unwrap();
                    let label = self.current_word_label.take().unwrap();
                    self.words.insert(name, label);
                    self.state = State::Interpreting;
                    i += 1;
                    continue;
                },
                "VARIABLE" => {
                    i += 1;
                    if i >= tokens.len() {
                        return Err(CompileError {
                            message: "VARIABLE expects a name".into(),
                            line: tok.line,
                        });
                    }
                    let var_name = tokens[i].text.clone();
                    let addr = self.var_ptr;
                    self.variables.insert(var_name.clone(), addr);
                    self.var_ptr += 4;
                    self.emit_comment(&format!("VARIABLE {} @ 0x{:04X}", var_name, addr));
                    i += 1;
                    continue;
                },
                _ => {},
            }

            match &self.state {
                State::Compiling => self.compile_word(word, tok.line)?,
                State::Interpreting => self.interpret_word(word, tok.line)?,
            }

            i += 1;
        }
        Ok(())
    }

    fn interpret_word(&mut self, word: &str, line: usize) -> Result<(), CompileError> {
        // In interpreting mode, bare code emits inline assembly (top-level / "main" section).
        // This is standard Forth: code outside : definitions runs immediately.
        self.compile_word(word, line)
    }

    fn compile_word(&mut self, word: &str, line: usize) -> Result<(), CompileError> {
        // --- Stack operations ---
        if self.try_core_word(word, line)? {
            return Ok(());
        }

        // --- String literal: ." ..." ---
        if word.starts_with(DOT_QUOTE) {
            self.compile_dot_quote(word);
            return Ok(());
        }

        // --- Variable access (pushes address) ---
        if let Some(&addr) = self.variables.get(word) {
            self.emit(&format!("LDI r2, 0x{:04X}       ; variable {}", addr, word));
            self.emit("PUSH r2");
            return Ok(());
        }

        // --- User-defined word call ---
        if let Some(label) = self.words.get(word) {
            self.emit(&format!("CALL {}", label));
            self.emit_comment(&format!("(call {})", word));
            return Ok(());
        }

        // --- Number literal ---
        if is_number(word) {
            if let Some(hex_str) = word.strip_prefix("0x").or_else(|| word.strip_prefix("$")) {
                if let Ok(n) = u32::from_str_radix(hex_str, 16) {
                    self.emit(&format!("LDI r2, 0x{:08X}", n));
                    self.emit("PUSH r2");
                    return Ok(());
                }
            }
            if let Ok(n) = word.parse::<i32>() {
                self.emit(&format!("LDI r2, {}", n));
                self.emit("PUSH r2");
                return Ok(());
            }
        }

        // --- Constants ---
        match word {
            "TRUE" => {
                self.emit("LDI r2, -1           ; TRUE");
                self.emit("PUSH r2");
                return Ok(());
            },
            "FALSE" => {
                self.emit("LDI r2, 0            ; FALSE");
                self.emit("PUSH r2");
                return Ok(());
            },
            _ => {},
        }

        Err(CompileError {
            message: format!("unknown word: {}", word),
            line,
        })
    }

    /// Try to compile a built-in Forth word. Returns true if handled.
    fn try_core_word(&mut self, word: &str, line: usize) -> Result<bool, CompileError> {
        // --- Stack manipulation ---
        match word {
            "DUP" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r2, [r30]       ; DUP: peek TOS");
                self.emit("PUSH r2");
                return Ok(true);
            },
            "DROP" => {
                self.emit("LDI r0, 1");
                self.emit("ADD r30, r0          ; DROP: pop TOS");
                return Ok(true);
            },
            "SWAP" => {
                self.emit("LOAD r4, [r30]       ; SWAP: TOS");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3          ; SP+1");
                self.emit("LOAD r5, [r30]       ; NOS");
                self.emit("STORE [r30], r4      ; TOS -> NOS slot");
                self.emit("SUB r30, r3          ; SP-1");
                self.emit("STORE [r30], r5      ; NOS -> TOS slot");
                return Ok(true);
            },
            "OVER" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]       ; OVER: peek TOS");
                self.emit("ADD r30, r2          ; SP+1");
                self.emit("LOAD r4, [r30]       ; peek NOS");
                self.emit("SUB r30, r2          ; SP-1");
                self.emit("PUSH r4              ; push copy of NOS");
                return Ok(true);
            },
            "NIP" => {
                // ( a b -- b ) remove second item
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3          ; SP+1");
                self.emit("LOAD r4, [r30]       ; NOS");
                self.emit("SUB r30, r3          ; SP-1");
                self.emit("STORE [r30], r4      ; NOS -> TOS");
                return Ok(true);
            },
            "TUCK" => {
                // ( a b -- b a b )
                self.emit("LOAD r4, [r30]       ; TOS = b");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3          ; SP+1");
                self.emit("LOAD r5, [r30]       ; NOS = a");
                self.emit("SUB r30, r3          ; SP-1");
                self.emit("PUSH r5              ; push a");
                self.emit("PUSH r4              ; push b");
                return Ok(true);
            },
            "ROT" => {
                // ( a b c -- b c a ) rotate third to top
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3          ; SP+1");
                self.emit("LOAD r5, [r30]       ; NOS = b");
                self.emit("ADD r30, r3          ; SP+2");
                self.emit("LOAD r6, [r30]       ; THIRD = a");
                self.emit("SUB r30, r3          ; SP+1");
                self.emit("STORE [r30], r6      ; THIRD -> NOS = a");
                self.emit("SUB r30, r3          ; SP-1");
                self.emit("STORE [r30], r5      ; NOS -> TOS = b");
                return Ok(true);
            },
            "2DUP" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]       ; TOS");
                self.emit("ADD r30, r2          ; SP+1");
                self.emit("LOAD r4, [r30]       ; NOS");
                self.emit("SUB r30, r2          ; SP-1");
                self.emit("PUSH r4");
                self.emit("PUSH r3");
                return Ok(true);
            },
            "2DROP" => {
                self.emit("LDI r0, 2");
                self.emit("ADD r30, r0          ; DROP 2");
                return Ok(true);
            },
            "2SWAP" => {
                self.emit("LOAD r4, [r30]       ; TOS2 = c");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("LOAD r5, [r30]       ; TOS1 = d");
                self.emit("ADD r30, r3");
                self.emit("LOAD r6, [r30]       ; NOS2 = a");
                self.emit("ADD r30, r3");
                self.emit("LOAD r7, [r30]       ; NOS1 = b");
                self.emit("SUB r30, r3");
                self.emit("STORE [r30], r4      ; a=c");
                self.emit("SUB r30, r3");
                self.emit("STORE [r30], r5      ; b=d");
                self.emit("SUB r30, r3");
                self.emit("STORE [r30], r6      ; c=a");
                self.emit("SUB r30, r3");
                self.emit("STORE [r30], r7      ; d=b");
                return Ok(true);
            },
            "?DUP" => {
                // DUP only if nonzero
                let lbl = self.next_label("qdup");
                self.emit("LOAD r2, [r30]");
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}_done", lbl));
                self.emit("PUSH r2");
                self.emit(&format!("{}_done:", lbl));
                return Ok(true);
            },
            "DEPTH" => {
                // Push current stack depth (simplified: we track SP vs initial SP)
                self.emit_comment("; DEPTH (simplified - pushes approximate stack depth)");
                self.emit("LDI r2, 0x4000      ; initial SP estimate");
                self.emit("SUB r2, r30          ; current depth");
                self.emit("PUSH r2");
                return Ok(true);
            },
            _ => {},
        }

        // --- Arithmetic ---
        match word {
            "+" => {
                self.emit("LOAD r4, [r30]       ; TOS (before SP move)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++ (consume NOS)");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("ADD r4, r3           ; TOS + NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "-" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("SUB r4, r3           ; TOS - NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "*" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("MUL r4, r3           ; TOS * NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "/" => {
                self.emit("LOAD r4, [r30]       ; TOS (dividend)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS (divisor)");
                self.emit("DIV r4, r3           ; TOS / NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "MOD" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("MOD r4, r3           ; TOS mod NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "/MOD" => {
                // ( a b -- rem quot )
                self.emit("LOAD r4, [r30]       ; TOS = a (dividend)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS = b (divisor)");
                self.emit("MOV r5, r4           ; r5 = quotient temp");
                self.emit("MOD r4, r3           ; remainder = a mod b");
                self.emit("STORE [r30], r4      ; push remainder");
                self.emit("PUSH r5              ; push quotient");
                return Ok(true);
            },
            "NEGATE" => {
                self.emit("LDI r2, 0");
                self.emit("LOAD r3, [r30]       ; TOS");
                self.emit("SUB r2, r3           ; 0 - TOS");
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "ABS" => {
                let lbl = self.next_label("abs");
                self.emit("LOAD r2, [r30]       ; TOS");
                self.emit("CMPI r2, 0");
                self.emit(&format!("BGE r0, {}_pos", lbl));
                self.emit("NEG r2");
                self.emit(&format!("{}_pos:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "MIN" => {
                let lbl = self.next_label("min");
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3           ; TOS < NOS?");
                self.emit(&format!("BLT r0, {}_keep", lbl));
                self.emit("MOV r4, r3           ; use NOS instead");
                self.emit(&format!("{}_keep:", lbl));
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "MAX" => {
                let lbl = self.next_label("max");
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3           ; TOS > NOS?");
                self.emit(&format!("BGE r0, {}_keep", lbl));
                self.emit("MOV r4, r3");
                self.emit(&format!("{}_keep:", lbl));
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "1+" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("ADD r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            "1-" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("SUB r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            "2+" => {
                self.emit("LDI r2, 2");
                self.emit("LOAD r3, [r30]");
                self.emit("ADD r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            "2-" => {
                self.emit("LDI r2, 2");
                self.emit("LOAD r3, [r30]");
                self.emit("SUB r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            "2*" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("SHL r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            "2/" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("SHR r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            "LSHIFT" => {
                // ( x n -- x<<n )
                self.emit("LOAD r4, [r30]       ; shift count (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; value (NOS)");
                self.emit("SHL r3, r4");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            "RSHIFT" => {
                self.emit("LOAD r4, [r30]       ; shift count (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; value (NOS)");
                self.emit("SHR r3, r4");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            _ => {},
        }

        // --- Bitwise ---
        match word {
            "AND" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("AND r4, r3");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "OR" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("OR r4, r3");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "XOR" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("XOR r4, r3");
                self.emit("STORE [r30], r4");
                return Ok(true);
            },
            "INVERT" => {
                self.emit("LDI r2, -1");
                self.emit("LOAD r3, [r30]");
                self.emit("XOR r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            },
            _ => {},
        }

        // --- Comparison ---
        match word {
            "=" => {
                let lbl = self.next_label("eq");
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3");
                self.emit(&format!("JZ r0, {}_yes", lbl));
                self.emit("LDI r2, 0");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_yes:", lbl));
                self.emit("LDI r2, 1");
                self.emit(&format!("{}_done:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "<>" => {
                let lbl = self.next_label("ne");
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3");
                self.emit(&format!("JZ r0, {}_no", lbl));
                self.emit("LDI r2, 1");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_no:", lbl));
                self.emit("LDI r2, 0");
                self.emit(&format!("{}_done:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "<" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3           ; TOS < NOS?");
                self.emit("MOV r2, r0");
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            ">" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r3, r4           ; NOS > TOS?");
                self.emit("MOV r2, r0");
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "<=" => {
                let lbl = self.next_label("le");
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3");
                self.emit(&format!("BLT r0, {}_yes", lbl));
                self.emit("CMP r4, r3");
                self.emit(&format!("JZ r0, {}_yes", lbl));
                self.emit("LDI r2, 0");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_yes:", lbl));
                self.emit("LDI r2, 1");
                self.emit(&format!("{}_done:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            ">=" => {
                let lbl = self.next_label("ge");
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3");
                self.emit(&format!("BGE r0, {}_yes", lbl));
                self.emit("LDI r2, 0");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_yes:", lbl));
                self.emit("LDI r2, 1");
                self.emit(&format!("{}_done:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "0=" => {
                let lbl = self.next_label("zeq");
                self.emit("LOAD r2, [r30]");
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}_yes", lbl));
                self.emit("LDI r2, 0");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_yes:", lbl));
                self.emit("LDI r2, 1");
                self.emit(&format!("{}_done:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "0<" => {
                self.emit("LOAD r2, [r30]");
                self.emit("LDI r3, 0");
                self.emit("CMP r2, r3");
                self.emit("MOV r2, r0");
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            "0>" => {
                let lbl = self.next_label("zerogt");
                self.emit("LOAD r2, [r30]");
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}_false", lbl));
                self.emit("LDI r2, 1");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_false:", lbl));
                self.emit("LDI r2, 0");
                self.emit(&format!("{}_done:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            },
            _ => {},
        }

        // --- Control flow: IF / ELSE / THEN ---
        match word {
            "IF" => {
                let lbl = self.next_label("if");
                self.emit("LOAD r2, [r30]       ; pop condition");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}_else", lbl));
                self.if_depth += 1;
                // Store the label for ELSE/THEN to find
                self.emit_comment(&format!("[IF_{}]", lbl));
                return Ok(true);
            },
            "ELSE" => {
                if self.if_depth == 0 {
                    return Err(CompileError {
                        message: "ELSE without matching IF".into(),
                        line,
                    });
                }
                // We need to find the matching IF label.
                // Use the last generated label (which was the IF label)
                let lbl = format!("if_{}", self.label_counter - 1);
                self.emit(&format!("JMP {}_then", lbl));
                self.emit(&format!("{}_else:", lbl));
                return Ok(true);
            },
            "THEN" => {
                if self.if_depth == 0 {
                    return Err(CompileError {
                        message: "THEN without matching IF".into(),
                        line,
                    });
                }
                let lbl = format!("if_{}", self.label_counter - 1);
                self.emit(&format!("{}_then:", lbl));
                self.if_depth -= 1;
                return Ok(true);
            },
            _ => {},
        }

        // --- Control flow: DO / LOOP / I / J ---
        match word {
            "DO" => {
                let lbl = self.next_label("do");
                // Pop limit (NOS) and initial index (TOS)
                self.emit("LOAD r4, [r30]       ; index (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; limit (was NOS)");
                self.emit("MOV r15, r3          ; r15 = limit");
                self.emit("MOV r14, r4          ; r14 = index");
                self.emit(&format!("{}_loop:", lbl));
                self.do_depth += 1;
                self.loop_stack.push(LoopInfo {
                    begin_label: format!("{}_loop", lbl),
                    do_label: lbl,
                });
                return Ok(true);
            },
            "?DO" => {
                // DO but skip if limit == index
                let lbl = self.next_label("qdo");
                self.emit("LOAD r4, [r30]       ; index (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; limit (NOS)");
                self.emit("CMP r3, r4");
                self.emit(&format!("JZ r0, {}_skip", lbl));
                self.emit("MOV r15, r3");
                self.emit("MOV r14, r4");
                self.emit(&format!("{}_loop:", lbl));
                self.do_depth += 1;
                self.loop_stack.push(LoopInfo {
                    begin_label: format!("{}_loop", lbl),
                    do_label: lbl.clone(),
                });
                return Ok(true);
            },
            "LOOP" => {
                let info = self.loop_stack.pop().ok_or(CompileError {
                    message: "LOOP without DO".into(),
                    line,
                })?;
                self.emit("LDI r2, 1");
                self.emit("ADD r14, r2          ; index++");
                self.emit("CMP r14, r15         ; index vs limit");
                self.emit(&format!("BLT r0, {}", info.begin_label));
                self.emit(&format!("{}_end:", info.do_label));
                self.do_depth -= 1;
                return Ok(true);
            },
            "+LOOP" => {
                let info = self.loop_stack.pop().ok_or(CompileError {
                    message: "+LOOP without DO".into(),
                    line,
                })?;
                self.emit("LOAD r2, [r30]       ; increment");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("ADD r14, r2          ; index += increment");
                self.emit("CMP r14, r15");
                self.emit(&format!("BLT r0, {}", info.begin_label));
                self.emit(&format!("{}_end:", info.do_label));
                self.do_depth -= 1;
                return Ok(true);
            },
            "I" => {
                self.emit("PUSH r14             ; I = current loop index");
                return Ok(true);
            },
            "J" => {
                self.emit("PUSH r13             ; J = outer loop index");
                return Ok(true);
            },
            "LEAVE" => {
                let info = self.loop_stack.last().ok_or(CompileError {
                    message: "LEAVE without DO".into(),
                    line,
                })?;
                self.emit(&format!("JMP {}_end", info.do_label));
                return Ok(true);
            },
            _ => {},
        }

        // --- Control flow: BEGIN / UNTIL / AGAIN / WHILE / REPEAT ---
        match word {
            "BEGIN" => {
                let lbl = self.next_label("begin");
                self.emit(&format!("{}:", lbl));
                self.begin_stack.push(lbl);
                return Ok(true);
            },
            "UNTIL" => {
                let lbl = self.begin_stack.pop().ok_or(CompileError {
                    message: "UNTIL without BEGIN".into(),
                    line,
                })?;
                self.emit("LOAD r2, [r30]       ; pop condition");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}", lbl)); // loop if false
                return Ok(true);
            },
            "AGAIN" => {
                let lbl = self.begin_stack.pop().ok_or(CompileError {
                    message: "AGAIN without BEGIN".into(),
                    line,
                })?;
                self.emit(&format!("JMP {}", lbl));
                return Ok(true);
            },
            "WHILE" => {
                let lbl = self.begin_stack.last().ok_or(CompileError {
                    message: "WHILE without BEGIN".into(),
                    line,
                })?;
                let lbl = lbl.clone();
                self.emit("LOAD r2, [r30]       ; pop condition");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}_exit", lbl)); // exit if false
                return Ok(true);
            },
            "REPEAT" => {
                let lbl = self.begin_stack.pop().ok_or(CompileError {
                    message: "REPEAT without BEGIN".into(),
                    line,
                })?;
                self.emit(&format!("JMP {}", lbl));
                self.emit(&format!("{}_exit:", lbl));
                return Ok(true);
            },
            _ => {},
        }

        // --- Memory ---
        match word {
            "@" => {
                self.emit("LOAD r2, [r30]       ; pop address");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("LOAD r2, [r2]        ; fetch [addr]");
                self.emit("PUSH r2");
                return Ok(true);
            },
            "!" => {
                self.emit("LOAD r4, [r30]       ; value (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; address (NOS)");
                self.emit("STORE [r3], r4       ; [addr] = value");
                return Ok(true);
            },
            "+!" => {
                self.emit("LOAD r4, [r30]       ; value (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; address (NOS)");
                self.emit("LOAD r5, [r3]        ; current");
                self.emit("ADD r5, r4");
                self.emit("STORE [r3], r5");
                return Ok(true);
            },
            "C@" => {
                self.emit("LOAD r2, [r30]       ; pop address");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("LOAD r2, [r2]        ; fetch u32");
                self.emit("ANDI r2, 0xFF        ; mask to byte");
                self.emit("PUSH r2");
                return Ok(true);
            },
            "C!" => {
                self.emit("LOAD r4, [r30]       ; value (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; address (NOS)");
                self.emit("ANDI r4, 0xFF        ; mask to byte");
                self.emit("STORE [r3], r4");
                return Ok(true);
            },
            "ALLOT" => {
                // ( n -- ) advance data pointer by n
                self.emit("LOAD r2, [r30]       ; n");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                // We track data_ptr on host side; at runtime this is a no-op
                // since the compiler pre-allocates the data area
                self.emit_comment("; ALLOT (handled at compile time)");
                return Ok(true);
            },
            "HERE" => {
                // Push current data pointer
                let hex_addr = format!("0x{:04X}", self.data_ptr);
                self.emit(&format!("LDI r2, {}      ; HERE", hex_addr));
                self.emit("PUSH r2");
                return Ok(true);
            },
            _ => {},
        }

        // --- Output ---
        match word {
            "." => {
                self.emit("LOAD r2, [r30]       ; pop number");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit_port_store(0xFFB, "r2", "write to debug port");
                return Ok(true);
            },
            "EMIT" => {
                self.emit("LOAD r2, [r30]       ; pop char");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit_port_store(0xFFB, "r2", "write char to debug port");
                return Ok(true);
            },
            "CR" => {
                self.emit("LDI r2, 10");
                self.emit_port_store(0xFFB, "r2", "newline");
                return Ok(true);
            },
            "SPACE" => {
                self.emit("LDI r2, 32");
                self.emit_port_store(0xFFB, "r2", "space");
                return Ok(true);
            },
            "SPACES" => {
                let lbl = self.next_label("spaces");
                self.emit("LOAD r2, [r30]       ; count");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit(&format!("{}_loop:", lbl));
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}_done", lbl));
                self.emit("LDI r4, 32");
                self.emit_port_store(0xFFB, "r4", "space in loop");
                self.emit("LDI r4, 1");
                self.emit("SUB r2, r4");
                self.emit(&format!("JMP {}_loop", lbl));
                self.emit(&format!("{}_done:", lbl));
                return Ok(true);
            },
            _ => {},
        }

        // --- String words ---
        match word {
            "TYPE" => {
                // ( addr len -- ) print len characters starting at addr
                let lbl = self.next_label("type");
                self.emit("LOAD r4, [r30]       ; len (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++ (consume len)");
                self.emit("LOAD r3, [r30]       ; addr (NOS)");
                self.emit("ADD r30, r2          ; SP++ (consume addr)");
                // r3 = current addr, r4 = remaining count
                self.emit(&format!("{}_loop:", lbl));
                self.emit("CMPI r4, 0");
                self.emit(&format!("JZ r0, {}_done", lbl));
                self.emit("LOAD r5, [r3]        ; fetch char from addr");
                self.emit_port_store(0xFFB, "r5", "TYPE: emit char");
                self.emit("LDI r6, 1");
                self.emit("ADD r3, r6           ; addr++");
                self.emit("SUB r4, r6           ; len--");
                self.emit(&format!("JMP {}_loop", lbl));
                self.emit(&format!("{}_done:", lbl));
                return Ok(true);
            },
            "COMPARE" => {
                // ( addr1 len1 addr2 len2 -- n )
                // Returns -1 if addr1 < addr2, 0 if equal, 1 if addr1 > addr2
                // Simplified: compares byte-by-byte up to min(len1, len2)
                let lbl = self.next_label("cmp");
                // Pop len2
                self.emit("LOAD r4, [r30]       ; len2 (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                // Pop addr2
                self.emit("LOAD r3, [r30]       ; addr2");
                self.emit("ADD r30, r2");
                // Pop len1
                self.emit("LOAD r5, [r30]       ; len1");
                self.emit("ADD r30, r2");
                // Pop addr1
                self.emit("LOAD r6, [r30]       ; addr1");
                self.emit("ADD r30, r2");
                // Use min(len1, len2) as loop count
                self.emit("MOV r7, r5           ; r7 = min(len1, len2)");
                self.emit("CMP r7, r4");
                self.emit(&format!("BLT r0, {}_min_ok", lbl));
                self.emit("MOV r7, r4           ; len2 is smaller");
                self.emit(&format!("{}_min_ok:", lbl));
                // r6 = addr1, r3 = addr2, r7 = count
                self.emit(&format!("{}_loop:", lbl));
                self.emit("CMPI r7, 0");
                self.emit(&format!("JZ r0, {}_same", lbl));
                self.emit("LOAD r8, [r6]        ; char from addr1");
                self.emit("LOAD r9, [r3]        ; char from addr2");
                self.emit("CMP r8, r9");
                self.emit(&format!("JZ r0, {}_next", lbl));
                // Different: return 1 if addr1 char > addr2 char, else -1
                self.emit(&format!("BGE r0, {}_gt", lbl));
                self.emit("LDI r2, -1           ; less than");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_gt:", lbl));
                self.emit("LDI r2, 1            ; greater than");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_next:", lbl));
                self.emit("LDI r10, 1");
                self.emit("ADD r6, r10          ; addr1++");
                self.emit("ADD r3, r10          ; addr2++");
                self.emit("SUB r7, r10          ; count--");
                self.emit(&format!("JMP {}_loop", lbl));
                self.emit(&format!("{}_same:", lbl));
                // All compared chars equal -- compare lengths
                self.emit("CMP r5, r4           ; len1 vs len2");
                self.emit(&format!("BGE r0, {}_len_ge", lbl));
                self.emit("LDI r2, -1           ; len1 < len2");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_len_ge:", lbl));
                self.emit("CMP r5, r4");
                self.emit(&format!("JZ r0, {}_eq", lbl));
                self.emit("LDI r2, 1            ; len1 > len2");
                self.emit(&format!("JMP {}_done", lbl));
                self.emit(&format!("{}_eq:", lbl));
                self.emit("LDI r2, 0            ; equal");
                self.emit(&format!("{}_done:", lbl));
                self.emit("PUSH r2              ; push result");
                return Ok(true);
            },
            _ => {},
        }

        // --- S" string literal ---
        if word.starts_with("S\"") {
            // S" text" -- push (addr, len) onto stack
            let inner = &word[2..];
            let text = inner.trim_end_matches('"');
            let len = text.len() as u32;
            let addr = self.data_ptr;

            // Emit string data at data_ptr
            self.emit_comment(&format!("S\" {}\" at 0x{:04X}, len={}", text, addr, len));
            for (i, ch) in text.chars().enumerate() {
                self.emit(&format!("LDI r2, {}          ; '{}'", ch as u32, ch));
                self.emit(&format!(
                    "LDI r3, 0x{:04X}     ; addr+{}",
                    addr + i as u32,
                    i
                ));
                self.emit("STORE r3, r2");
            }
            self.data_ptr += len + 1; // +1 for null terminator

            // Push addr and len
            self.emit(&format!("LDI r2, 0x{:04X}     ; S\" addr", addr));
            self.emit("PUSH r2");
            self.emit(&format!("LDI r2, {}           ; S\" len", len));
            self.emit("PUSH r2");
            return Ok(true);
        }

        // --- Array/memory words ---
        match word {
            "CELLS" => {
                // ( n -- n*cell_size ) On GeOS, cell size = 1 word = 1 u32
                // So CELLS is a no-op (identity), but we still emit it for clarity
                self.emit_comment("; CELLS (identity on GeOS -- cell=1 word)");
                return Ok(true);
            },
            "FILL" => {
                // ( addr len value -- ) fill len cells at addr with value
                let lbl = self.next_label("fill");
                // Pop value
                self.emit("LOAD r4, [r30]       ; value (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                // Pop len
                self.emit("LOAD r5, [r30]       ; len");
                self.emit("ADD r30, r2");
                // Pop addr
                self.emit("LOAD r3, [r30]       ; addr");
                self.emit("ADD r30, r2");
                // r3 = addr, r5 = remaining, r4 = value
                self.emit(&format!("{}_loop:", lbl));
                self.emit("CMPI r5, 0");
                self.emit(&format!("JZ r0, {}_done", lbl));
                self.emit("STORE r3, r4         ; [addr] = value");
                self.emit("LDI r6, 1");
                self.emit("ADD r3, r6           ; addr++");
                self.emit("SUB r5, r6           ; len--");
                self.emit(&format!("JMP {}_loop", lbl));
                self.emit(&format!("{}_done:", lbl));
                return Ok(true);
            },
            "ERASE" => {
                // ( addr len -- ) fill len cells at addr with 0
                let lbl = self.next_label("erase");
                // Pop len
                self.emit("LOAD r3, [r30]       ; len");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                // Pop addr
                self.emit("LOAD r4, [r30]       ; addr");
                self.emit("ADD r30, r2");
                self.emit(&format!("{}_loop:", lbl));
                self.emit("CMPI r3, 0");
                self.emit(&format!("JZ r0, {}_done", lbl));
                self.emit("LDI r5, 0");
                self.emit("STORE r4, r5         ; [addr] = 0");
                self.emit("LDI r6, 1");
                self.emit("ADD r4, r6           ; addr++");
                self.emit("SUB r3, r6           ; len--");
                self.emit(&format!("JMP {}_loop", lbl));
                self.emit(&format!("{}_done:", lbl));
                return Ok(true);
            },
            "BLANK" => {
                // ( addr len -- ) fill len cells with space (32)
                let lbl = self.next_label("blank");
                self.emit("LOAD r3, [r30]       ; len");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r4, [r30]       ; addr");
                self.emit("ADD r30, r2");
                self.emit(&format!("{}_loop:", lbl));
                self.emit("CMPI r3, 0");
                self.emit(&format!("JZ r0, {}_done", lbl));
                self.emit("LDI r5, 32           ; space");
                self.emit("STORE r4, r5");
                self.emit("LDI r6, 1");
                self.emit("ADD r4, r6");
                self.emit("SUB r3, r6");
                self.emit(&format!("JMP {}_loop", lbl));
                self.emit(&format!("{}_done:", lbl));
                return Ok(true);
            },
            "COUNT" => {
                // ( addr -- addr+1 len ) get length of counted string
                // A counted string has the length in the first byte
                self.emit("LOAD r2, [r30]       ; addr");
                self.emit("LOAD r3, [r2]        ; fetch first cell = length");
                self.emit("LDI r4, 1");
                self.emit("ADD r2, r4           ; addr+1 (skip count)");
                self.emit("STORE [r30], r2      ; replace addr with addr+1");
                self.emit("PUSH r3              ; push length");
                return Ok(true);
            },
            _ => {},
        }

        // --- Misc ---
        match word {
            "EXIT" => {
                self.emit("RET              ; EXIT");
                return Ok(true);
            },
            _ => {},
        }

        // --- Inline assembly: ASM{...} ---
        if word.starts_with("ASM{") && word.ends_with("}") {
            let inner = &word[4..word.len() - 1]; // strip ASM{ and }
            let trimmed = inner.trim();
            if !trimmed.is_empty() {
                for line in trimmed.lines() {
                    let trimmed_line = line.trim();
                    if !trimmed_line.is_empty() {
                        self.emit(trimmed_line);
                    }
                }
            }
            return Ok(true);
        }

        Ok(false)
    }

    fn compile_dot_quote(&mut self, word: &str) {
        let inner = &word[DOT_QUOTE.len()..];
        let text = inner.trim_end_matches('"');
        self.emit_comment(&format!("dotquote: {}", text));
        for ch in text.chars() {
            self.emit(&format!("LDI r2, {}", ch as u32));
            self.emit_port_store(0xFFB, "r2", "emit char");
        }
    }
}

/// Check if a string looks like a Forth number literal.
fn is_number(s: &str) -> bool {
    if s.starts_with("0x") || s.starts_with("0X") || s.starts_with('$') {
        return s.len() > 2 && u32::from_str_radix(&s[2..].replace('$', ""), 16).is_ok();
    }
    if s.starts_with('-') && s.len() > 1 {
        return s[1..].parse::<u32>().is_ok();
    }
    s.parse::<u32>().is_ok() || s.parse::<i32>().is_ok()
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Helper: compile Forth source and return the output assembly lines.
    fn compile_lines(source: &str) -> Result<Vec<String>, CompileError> {
        let mut compiler = Compiler::new();
        let asm = compiler.compile(source)?;
        Ok(asm.lines().map(|l| l.to_string()).collect())
    }

    // ── Basic compilation ──────────────────────────────────────────────

    #[test]
    fn test_empty_source() {
        let lines = compile_lines("").unwrap();
        // Empty source should still emit HALT
        assert!(lines.last().unwrap().contains("HALT"));
    }

    #[test]
    fn test_number_literal_decimal() {
        let lines = compile_lines("42").unwrap();
        // Should contain LDI r2, 42 and PUSH r2
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 42"));
        assert!(joined.contains("PUSH r2"));
    }

    #[test]
    fn test_number_literal_negative() {
        let lines = compile_lines("-7").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, -7"));
        assert!(joined.contains("PUSH r2"));
    }

    #[test]
    fn test_number_literal_hex() {
        let lines = compile_lines("0xFF $ABCD").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 0x000000FF"));
        assert!(joined.contains("LDI r2, 0x0000ABCD"));
    }

    #[test]
    fn test_constants_true_false() {
        let lines = compile_lines("TRUE FALSE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, -1           ; TRUE"));
        assert!(joined.contains("LDI r2, 0            ; FALSE"));
    }

    #[test]
    fn test_always_ends_with_halt() {
        let lines = compile_lines("42 DUP + .").unwrap();
        assert!(lines.last().unwrap().trim() == "HALT");
    }

    // ── Stack operations ───────────────────────────────────────────────

    #[test]
    fn test_dup_emits_peek_and_push() {
        let lines = compile_lines("DUP").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LOAD r2, [r30]"));
        assert!(joined.contains("PUSH r2"));
    }

    #[test]
    fn test_drop_emits_sp_increment() {
        let lines = compile_lines("DROP").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("ADD r30, r0"));
    }

    #[test]
    fn test_swap_emits_exchange() {
        let lines = compile_lines("SWAP").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LOAD r4, [r30]"));
        assert!(joined.contains("LOAD r5, [r30]"));
        assert!(joined.contains("STORE [r30], r4"));
        assert!(joined.contains("STORE [r30], r5"));
    }

    #[test]
    fn test_over_emits_nos_copy() {
        let lines = compile_lines("OVER").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("PUSH r4"));
    }

    #[test]
    fn test_rot_emits_third_rotation() {
        let lines = compile_lines("ROT").unwrap();
        let joined = lines.join("\n");
        // ROT accesses 3 stack slots (TOS, NOS, THIRD)
        assert!(joined.contains("LOAD r5, [r30]"));
        assert!(joined.contains("LOAD r6, [r30]"));
    }

    #[test]
    fn test_2dup_emits_two_copies() {
        let lines = compile_lines("2DUP").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("PUSH r4"));
        assert!(joined.contains("PUSH r3"));
    }

    #[test]
    fn test_2drop_emits_double_pop() {
        let lines = compile_lines("2DROP").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r0, 2"));
        assert!(joined.contains("ADD r30, r0"));
    }

    // ── Arithmetic ─────────────────────────────────────────────────────

    #[test]
    fn test_addition() {
        let lines = compile_lines("+").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("ADD r4, r3"));
    }

    #[test]
    fn test_subtraction() {
        let lines = compile_lines("-").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("SUB r4, r3"));
    }

    #[test]
    fn test_multiplication() {
        let lines = compile_lines("*").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("MUL r4, r3"));
    }

    #[test]
    fn test_division() {
        let lines = compile_lines("/").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("DIV r4, r3"));
    }

    #[test]
    fn test_modulo() {
        let lines = compile_lines("MOD").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("MOD r4, r3"));
    }

    #[test]
    fn test_increment_decrement() {
        let lines = compile_lines("1+ 1- 2+ 2-").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("ADD r3, r2")); // 1+
        assert!(joined.contains("SUB r3, r2")); // 1-
        assert!(joined.contains("LDI r2, 2")); // 2+
        assert!(joined.contains("LDI r2, 2")); // 2-
    }

    #[test]
    fn test_shift_double() {
        let lines = compile_lines("2* 2/").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("SHL r3, r2"));
        assert!(joined.contains("SHR r3, r2"));
    }

    #[test]
    fn test_negate() {
        let lines = compile_lines("NEGATE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("SUB r2, r3"));
    }

    #[test]
    fn test_abs() {
        let lines = compile_lines("ABS").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("BGE r0,"));
        assert!(joined.contains("NEG r2"));
    }

    // ── Bitwise ────────────────────────────────────────────────────────

    #[test]
    fn test_bitwise_ops() {
        let lines = compile_lines("AND OR XOR INVERT").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("AND r4, r3"));
        assert!(joined.contains("OR r4, r3"));
        assert!(joined.contains("XOR r4, r3"));
        assert!(joined.contains("XOR r3, r2"));
    }

    #[test]
    fn test_shift_ops() {
        let lines = compile_lines("LSHIFT RSHIFT").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("SHL r3, r4"));
        assert!(joined.contains("SHR r3, r4"));
    }

    // ── Comparison ─────────────────────────────────────────────────────

    #[test]
    fn test_equality() {
        let lines = compile_lines("=").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("CMP r4, r3"));
        assert!(joined.contains("JZ r0,"));
        assert!(joined.contains("LDI r2, 1")); // true branch
        assert!(joined.contains("LDI r2, 0")); // false branch
    }

    #[test]
    fn test_inequality() {
        let lines = compile_lines("<>").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("JZ r0,"));
        // <> returns true (1) when NOT equal, false (0) when equal
        assert!(joined.contains("LDI r2, 1")); // true branch
        assert!(joined.contains("LDI r2, 0")); // false branch
    }

    #[test]
    fn test_less_than() {
        let lines = compile_lines("<").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("CMP r4, r3"));
        // < uses MOV r2, r0 to copy CMP result (BLT is implicit in CMP)
        assert!(joined.contains("MOV r2, r0"));
    }

    #[test]
    fn test_greater_than() {
        let lines = compile_lines(">").unwrap();
        let joined = lines.join("\n");
        // > compares NOS > TOS: CMP r3, r4
        assert!(joined.contains("CMP r3, r4"));
        assert!(joined.contains("MOV r2, r0"));
    }

    // ── Output words ───────────────────────────────────────────────────

    #[test]
    fn test_dot_pops_and_stores() {
        let lines = compile_lines(".").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LOAD r2, [r30]"));
        assert!(joined.contains("ADD r30, r3"));
        assert!(joined.contains("STORE r5, r2"));
    }

    #[test]
    fn test_emit_pops_and_stores() {
        let lines = compile_lines("EMIT").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LOAD r2, [r30]"));
        assert!(joined.contains("STORE r5, r2"));
    }

    #[test]
    fn test_cr_emits_newline() {
        let lines = compile_lines("CR").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 10"));
        assert!(joined.contains("STORE r5, r2"));
    }

    #[test]
    fn test_space_emits_32() {
        let lines = compile_lines("SPACE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 32"));
    }

    // ── Word definitions ───────────────────────────────────────────────

    #[test]
    fn test_word_definition_and_call() {
        let lines = compile_lines(": SQUARE DUP * ; 10 SQUARE").unwrap();
        let joined = lines.join("\n");
        // Word definition should have a label and RET
        assert!(joined.contains("word_0:"));
        assert!(joined.contains("RET"));
        // Calling the word should emit CALL
        assert!(joined.contains("CALL word_0"));
    }

    #[test]
    fn test_word_calling_another_word() {
        let lines = compile_lines(": SQUARE DUP * ; : CUBE DUP SQUARE * ; 5 CUBE").unwrap();
        let joined = lines.join("\n");
        // CUBE should CALL SQUARE
        assert!(joined.contains("CALL word_1")); // CUBE calls SQUARE
    }

    #[test]
    fn test_word_definition_has_colon_semicolon_markers() {
        let lines = compile_lines(": FOO 42 . ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains(": FOO"));
        assert!(joined.contains("RET"));
    }

    #[test]
    fn test_nested_colon_definition_fails() {
        let result = compile_lines(": A : B 42 ; ;");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("nested"));
    }

    #[test]
    fn test_semicolon_outside_definition_fails() {
        let result = compile_lines(";");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("outside"));
    }

    // ── Control structures: IF/ELSE/THEN ───────────────────────────────

    #[test]
    fn test_if_then() {
        let lines = compile_lines(": TEST 10 20 > IF 42 THEN ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("CMPI r2, 0"));
        assert!(joined.contains("JZ r0,"));
    }

    #[test]
    fn test_if_else_then() {
        let lines = compile_lines(": TEST 10 20 > IF 42 ELSE 99 THEN ;").unwrap();
        let joined = lines.join("\n");
        // IF/ELSE/THEN should have conditional branch and JMP for ELSE
        assert!(joined.contains("JZ r0,"));
        assert!(joined.contains("JMP"));
    }

    #[test]
    fn test_if_without_then_fails() {
        let result = compile_lines(": TEST IF 42 ;");
        assert!(result.is_err());
    }

    #[test]
    fn test_else_without_if_fails() {
        let result = compile_lines(": TEST ELSE 42 THEN ;");
        assert!(result.is_err());
    }

    #[test]
    fn test_then_without_if_fails() {
        let result = compile_lines(": TEST THEN ;");
        assert!(result.is_err());
    }

    // ── Control structures: DO/LOOP ────────────────────────────────────

    #[test]
    fn test_do_loop() {
        let lines = compile_lines(": TEST 10 0 DO I . LOOP ;").unwrap();
        let joined = lines.join("\n");
        // DO/LOOP should have a loop label and branch
        assert!(joined.contains("DO_LOOP") || joined.contains("loop"));
        assert!(joined.contains("CMP r14, r15")); // loop termination uses CMP, not CMPI
    }

    #[test]
    fn test_do_without_loop_fails() {
        let result = compile_lines(": TEST 10 0 DO I . ;");
        assert!(result.is_err());
    }

    #[test]
    fn test_loop_without_do_fails() {
        let result = compile_lines(": TEST LOOP ;");
        assert!(result.is_err());
    }

    // ── Control structures: BEGIN/UNTIL ────────────────────────────────

    #[test]
    fn test_begin_until() {
        let lines = compile_lines(": TEST BEGIN DUP 1- DUP 0= UNTIL ;").unwrap();
        let joined = lines.join("\n");
        // BEGIN/UNTIL should have a backward JMP
        assert!(joined.contains("JMP"));
        assert!(joined.contains("CMPI r2, 0"));
    }

    #[test]
    fn test_begin_while_repeat() {
        let lines = compile_lines(": TEST BEGIN DUP 1- DUP 0= WHILE DROP . REPEAT ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("JZ r0,"));
        assert!(joined.contains("JMP"));
    }

    #[test]
    fn test_until_without_begin_fails() {
        let result = compile_lines(": TEST UNTIL ;");
        assert!(result.is_err());
    }

    #[test]
    fn test_repeat_without_begin_fails() {
        let result = compile_lines(": TEST REPEAT ;");
        assert!(result.is_err());
    }

    // ── Variables ──────────────────────────────────────────────────────

    #[test]
    fn test_variable_declaration() {
        let lines = compile_lines("VARIABLE COUNTER").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("VARIABLE COUNTER"));
        assert!(joined.contains("0x")); // address in hex
    }

    #[test]
    fn test_variable_access_pushes_address() {
        let lines = compile_lines("VARIABLE X X").unwrap();
        let joined = lines.join("\n");
        // After VARIABLE X, using X should push its address
        assert!(joined.contains("LDI r2, 0x"));
        assert!(joined.contains("PUSH r2"));
    }

    #[test]
    fn test_variable_without_name_fails() {
        let result = compile_lines("VARIABLE");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("expects a name"));
    }

    #[test]
    fn test_multiple_variables_sequential_addresses() {
        let lines = compile_lines("VARIABLE A VARIABLE B").unwrap();
        let joined = lines.join("\n");
        // Both variables should be declared with different addresses
        let var_count = joined.matches("VARIABLE").count();
        assert_eq!(var_count, 2);
    }

    // ── Memory access ──────────────────────────────────────────────────

    #[test]
    fn test_at_fetches_from_address() {
        let lines = compile_lines("@").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LOAD r2, [r2]"));
        assert!(joined.contains("PUSH r2"));
    }

    #[test]
    fn test_bang_stores_to_address() {
        let lines = compile_lines("!").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("STORE [r3], r4"));
    }

    #[test]
    fn test_plus_store() {
        let lines = compile_lines("+!").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("ADD r5, r4"));
        assert!(joined.contains("STORE [r3], r5"));
    }

    // ── Dot-quote strings ──────────────────────────────────────────────

    #[test]
    fn test_dot_quote_string() {
        let lines = compile_lines(".\" hello\"").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 104")); // 'h'
        assert!(joined.contains("LDI r2, 101")); // 'e'
        assert!(joined.contains("LDI r2, 108")); // 'l'
        assert!(joined.contains("LDI r2, 111")); // 'o'
    }

    // ── Error handling ─────────────────────────────────────────────────

    #[test]
    fn test_unknown_word_fails() {
        let result = compile_lines("FOOBAR");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("unknown word"));
        assert!(err.message.contains("FOOBAR"));
    }

    #[test]
    fn test_colon_without_name_fails() {
        let result = compile_lines(":");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("expects a word name"));
    }

    #[test]
    fn test_compile_error_includes_line_number() {
        let result = compile_lines("42\nFOOBAR\n99");
        assert!(result.is_err());
        let err = result.unwrap_err();
        // FOOBAR is on line 2
        assert_eq!(err.line, 2);
    }

    #[test]
    fn test_multiple_errors_first_wins() {
        let result = compile_lines("BOGUS1 BOGUS2");
        assert!(result.is_err());
        let err = result.unwrap_err();
        // Should report the first unknown word
        assert!(err.message.contains("BOGUS1"));
    }

    // ── Complex programs ───────────────────────────────────────────────

    #[test]
    fn test_factorial_word() {
        // Recursive words require forward references which this compiler
        // does not support. Test that attempting to call an undefined word
        // during compilation produces a clear error.
        let result = compile_lines(r#": FACT DUP 1 > IF DUP 1- FACT * ELSE DROP 1 THEN ;"#);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("unknown word: FACT"));
    }

    #[test]
    fn test_loops_and_conditionals_combined() {
        let lines = compile_lines(": COUNTDOWN 10 0 DO I 5 = IF 99 . THEN LOOP ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("IF") || joined.contains("JZ"));
        assert!(joined.contains("LOOP") || joined.contains("loop"));
    }

    #[test]
    fn test_inline_comment_ignored() {
        let lines1 = compile_lines("42 .").unwrap();
        let lines2 = compile_lines("42 ( ignored ) .").unwrap();
        // Both should produce equivalent output (minus comment lines)
        let non_comment1: Vec<_> = lines1.iter().filter(|l| !l.contains(';')).collect();
        let non_comment2: Vec<_> = lines2.iter().filter(|l| !l.contains(';')).collect();
        assert_eq!(non_comment1, non_comment2);
    }

    #[test]
    fn test_backslash_comment_ignored() {
        let lines1 = compile_lines("42 .").unwrap();
        let lines2 = compile_lines("\\ comment\n42 .").unwrap();
        let non_comment1: Vec<_> = lines1.iter().filter(|l| !l.contains(';')).collect();
        let non_comment2: Vec<_> = lines2.iter().filter(|l| !l.contains(';')).collect();
        assert_eq!(non_comment1, non_comment2);
    }

    // ── Label uniqueness ───────────────────────────────────────────────

    #[test]
    fn test_unique_labels_for_multiple_ifs() {
        let lines = compile_lines(": TEST 10 > IF 42 THEN 20 > IF 99 THEN ;").unwrap();
        let joined = lines.join("\n");
        // Should have 2 different IF label prefixes (not the same label twice)
        // IF/THEN generates _else: and _then: labels
        let if_labels: Vec<_> = joined
            .lines()
            .filter(|l| l.contains("_else:") || l.contains("_then:"))
            .collect();
        assert!(if_labels.len() >= 2);
        // Verify labels are unique (different counter values)
        let first = if_labels[0];
        let second = if_labels[1];
        assert_ne!(first, second);
    }
    #[test]
    fn test_unique_labels_for_multiple_words() {
        let lines = compile_lines(": A 1 ; : B 2 ; : C 3 ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("word_0"));
        assert!(joined.contains("word_1"));
        assert!(joined.contains("word_2"));
    }

    // ── String words: TYPE ────────────────────────────────────────────

    #[test]
    fn test_type_compiles() {
        let lines = compile_lines("S\" hello\" TYPE").unwrap();
        let joined = lines.join("\\n");
        // TYPE should emit a loop with label like type_0_loop, type_0_done
        assert!(joined.contains("type_"));
        assert!(joined.contains("_loop"));
        assert!(joined.contains("CMPI r4, 0"));
    }

    #[test]
    fn test_s_quote_compiles() {
        let lines = compile_lines("S\" test\"").unwrap();
        let joined = lines.join("\\n");
        // S" should store chars and push addr+len
        assert!(joined.contains("S\""));
        assert!(joined.contains("PUSH r2"));
    }

    #[test]
    fn test_s_quote_empty_string() {
        let lines = compile_lines("S\" \"").unwrap();
        let joined = lines.join("\\n");
        // Empty S" should still push addr and len=0
        assert!(joined.contains("LDI r2, 0")); // len = 0
        assert!(joined.contains("PUSH r2"));
    }

    #[test]
    fn test_s_quote_and_type_together() {
        let lines = compile_lines("S\" hi\" TYPE").unwrap();
        let joined = lines.join("\\n");
        // Should have both string storage and TYPE loop
        assert!(joined.contains("LDI r2, 104")); // 'h'
        assert!(joined.contains("LDI r2, 105")); // 'i'
        assert!(joined.contains("type_"));
    }

    #[test]
    fn test_compare_compiles() {
        let lines = compile_lines("S\" abc\" S\" abc\" COMPARE").unwrap();
        let joined = lines.join("\\n");
        // COMPARE should emit comparison loop
        assert!(joined.contains("cmp_"));
        assert!(joined.contains("LOAD r8, [r6]")); // char from addr1
        assert!(joined.contains("LOAD r9, [r3]")); // char from addr2
    }

    // ── Array/memory words: CELLS, FILL, ERASE ────────────────────────

    #[test]
    fn test_cells_compiles() {
        let lines = compile_lines("10 CELLS").unwrap();
        let joined = lines.join("\\n");
        // CELLS is identity on GeOS (cell=1 word), just a comment
        assert!(joined.contains("CELLS") || joined.contains("10"));
    }

    #[test]
    fn test_fill_compiles() {
        let lines = compile_lines("VARIABLE BUF BUF 10 0 FILL").unwrap();
        let joined = lines.join("\\n");
        // FILL should emit a fill loop with label like fill_0_loop
        assert!(joined.contains("fill_"));
        assert!(joined.contains("_loop"));
        assert!(joined.contains("STORE r3, r4")); // [addr] = value
    }

    #[test]
    fn test_erase_compiles() {
        let lines = compile_lines("VARIABLE BUF BUF 10 ERASE").unwrap();
        let joined = lines.join("\\n");
        // ERASE should emit a zero-fill loop
        assert!(joined.contains("erase_"));
        assert!(joined.contains("LDI r5, 0"));
    }

    #[test]
    fn test_blank_compiles() {
        let lines = compile_lines("VARIABLE BUF BUF 10 BLANK").unwrap();
        let joined = lines.join("\\n");
        // BLANK should fill with space (32)
        assert!(joined.contains("blank_"));
        assert!(joined.contains("LDI r5, 32"));
    }

    #[test]
    fn test_count_compiles() {
        let lines = compile_lines("VARIABLE STR STR COUNT").unwrap();
        let joined = lines.join("\\n");
        // COUNT should fetch first cell and push addr+1, len
        assert!(joined.contains("LOAD r3, [r2]")); // fetch length
        assert!(joined.contains("PUSH r3")); // push length
    }

    // ── Integration: multi-word Forth program ──────────────────────────

    #[test]
    fn test_integration_string_array_program() {
        // A program that uses S", TYPE, VARIABLE, FILL, and word definitions
        let source = r#"
VARIABLE BUF
: GREET S" hello" TYPE CR ;
: INITBUF BUF 8 0 FILL ;
GREET
INITBUF
"#;
        let lines = compile_lines(source).unwrap();
        let joined = lines.join("\\n");
        // Should contain TYPE loop, FILL loop, and string data
        assert!(joined.contains("type_"));
        assert!(joined.contains("fill_"));
        assert!(joined.contains("LDI r2, 104")); // 'h' in "hello"
        assert!(joined.contains("word_0")); // GREET word
        assert!(joined.contains("INITBUF")); // second word definition
    }

    #[test]
    fn test_integration_string_compare_program() {
        // Compare two strings
        let source = r#"S" abc" S" abc" COMPARE ."#;
        let lines = compile_lines(source).unwrap();
        let joined = lines.join("\\n");
        assert!(joined.contains("cmp_"));
        assert!(joined.contains("PUSH r2")); // result pushed
    }

    #[test]
    fn test_integration_array_with_cells() {
        // Create and fill an array using CELLS
        let source = r#"
VARIABLE ARR
ARR 10 CELLS 0 FILL
"#;
        let result = compile_lines(source);
        // Should compile successfully even if it uses CELLS
        assert!(result.is_ok());
        let joined = result.unwrap().join("\\n");
        assert!(joined.contains("fill_"));
    }

    // ── ASM inline assembly blocks ────────────────────────────────────

    #[test]
    fn test_asm_inline_basic() {
        let lines = compile_lines("ASM{LDI r2, 0xFF}").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 0xFF"));
    }

    #[test]
    fn test_asm_inline_multi_line() {
        let lines = compile_lines("ASM{\n  LDI r2, 0xFF\n  STORE r5, r2\n}").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 0xFF"));
        assert!(joined.contains("STORE r5, r2"));
    }

    #[test]
    fn test_asm_inline_within_word() {
        let lines = compile_lines(": T 10 ASM{LDI r2, 0x42} DROP ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 0x42"));
        assert!(joined.contains("RET"));
    }

    #[test]
    fn test_asm_inline_empty() {
        let lines = compile_lines("ASM{}").unwrap();
        // Empty ASM block should compile without emitting anything extra
        assert!(lines.last().unwrap().contains("HALT"));
    }

    #[test]
    fn test_asm_inline_multiple() {
        let lines = compile_lines("ASM{LDI r2, 42} ASM{LDI r3, 99}").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 42"));
        assert!(joined.contains("LDI r3, 99"));
    }

    #[test]
    fn test_asm_inline_with_forth() {
        let lines = compile_lines(": T 10 ASM{LDI r2, 0x0F} AND ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 0x0F"));
        assert!(joined.contains("AND"));
        assert!(joined.contains("RET"));
    }

    // ── Nested control structures ─────────────────────────────────────

    #[test]
    fn test_nested_if_else_inside_do_loop() {
        // IF/ELSE/THEN inside DO/LOOP
        let lines = compile_lines(": T 10 0 DO I 5 = IF 42 ELSE 99 THEN LOOP ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("JZ r0,")); // IF condition
        assert!(joined.contains("JMP")); // ELSE jump
        assert!(joined.contains("CMP r14, r15")); // LOOP termination
    }

    #[test]
    fn test_do_loop_inside_if_then() {
        // DO/LOOP inside IF/THEN
        let lines = compile_lines(": T 10 > IF 5 0 DO I . LOOP THEN ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("JZ r0,")); // IF
        assert!(joined.contains("CMP r14, r15")); // LOOP
        assert!(joined.contains("BLT r0,")); // LOOP branch
    }

    #[test]
    fn test_nested_do_loops_with_j() {
        // Outer DO/LOOP with inner DO/LOOP using J
        let lines = compile_lines(": T 3 0 DO 3 0 DO J . I . LOOP LOOP ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("PUSH r14")); // I
        assert!(joined.contains("PUSH r13")); // J
                                              // Should have two loop termination checks
        let loop_count = joined.matches("CMP r14, r15").count();
        assert_eq!(loop_count, 2);
    }

    #[test]
    fn test_nested_if_else_chain() {
        // IF inside IF inside IF
        let lines =
            compile_lines(": T DUP 10 > IF DUP 20 > IF 99 ELSE 50 THEN ELSE 0 THEN ;").unwrap();
        let joined = lines.join("\n");
        // Multiple IF conditions
        let jz_count = joined.matches("JZ r0,").count();
        assert!(jz_count >= 2);
    }

    #[test]
    fn test_do_loop_with_multiple_ifs() {
        // Multiple IF/THEN inside one DO/LOOP
        let lines =
            compile_lines(": T 10 0 DO I 3 = IF 111 THEN I 7 = IF 222 THEN LOOP ;").unwrap();
        let joined = lines.join("\n");
        let jz_count = joined.matches("JZ r0,").count();
        assert!(jz_count >= 2);
        assert!(joined.contains("CMP r14, r15"));
    }

    #[test]
    fn test_begin_until_inside_if_then() {
        // BEGIN/UNTIL inside IF/THEN
        let lines = compile_lines(": T 10 > IF BEGIN DUP 1- DUP 0= UNTIL THEN ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("JZ r0,")); // IF
        assert!(joined.contains("CMPI r2, 0")); // UNTIL condition
    }

    #[test]
    fn test_deeply_nested_control() {
        // DO/LOOP containing IF/THEN containing BEGIN/UNTIL
        let lines = compile_lines(": T 10 0 DO I 5 > IF 10 0 DO J . LOOP THEN LOOP ;").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("CMP r14, r15")); // outer LOOP
        assert!(joined.contains("JZ r0,")); // IF
        assert!(joined.contains("PUSH r13")); // J (from outer loop)
    }

    // ── String operation edge cases ───────────────────────────────────

    #[test]
    fn test_type_empty_str() {
        // TYPE with empty string should still compile
        let lines = compile_lines("S\"\" TYPE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("type_"));
    }

    #[test]
    fn test_compare_different_strings() {
        let lines = compile_lines("S\"abc\" S\"xyz\" COMPARE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("cmp_"));
        assert!(joined.contains("LOAD r8, [r6]"));
        assert!(joined.contains("LOAD r9, [r3]"));
    }

    #[test]
    fn test_compare_prefix_match() {
        // One string is prefix of another — tests the len comparison branch
        let lines = compile_lines("S\"abc\" S\"abcdef\" COMPARE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("cmp_"));
        assert!(joined.contains("CMP r5, r4")); // len comparison
    }

    #[test]
    fn test_compare_empty_strings() {
        // Both empty should compile and compare lengths
        let lines = compile_lines("S\"\" S\"\" COMPARE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("cmp_"));
    }

    #[test]
    fn test_dot_quote_empty() {
        // Empty ." should compile without errors
        let lines = compile_lines(".\"\"").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("HALT"));
    }

    #[test]
    fn test_multiple_s_quotes_unique_labels() {
        // Multiple S" generate different string labels
        let lines = compile_lines("S\"abc\" S\"xyz\" S\"hello\"").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("S\" abc\""));
        assert!(joined.contains("S\" xyz\""));
        assert!(joined.contains("S\" hello\""));
    }

    #[test]
    fn test_s_quote_with_special_chars() {
        // S" with digits and symbols
        let lines = compile_lines("S\"hello123!@#\" TYPE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 104")); // 'h'
        assert!(joined.contains("LDI r2, 51")); // '3'
        assert!(joined.contains("LDI r2, 33")); // '!'
        assert!(joined.contains("LDI r2, 64")); // '@'
        assert!(joined.contains("LDI r2, 35")); // '#'
    }

    #[test]
    fn test_type_single_character() {
        let lines = compile_lines("S\"x\" TYPE").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("LDI r2, 120")); // 'x'
        assert!(joined.contains("type_"));
    }

    // ── Error handling edge cases ──────────────────────────────────────

    #[test]
    fn test_begin_without_until_fails() {
        // BEGIN without matching UNTIL/AGAIN/REPEAT
        let result = compile_lines(": T BEGIN DUP 1+ ;");
        assert!(result.is_err());
    }

    #[test]
    fn test_again_without_begin_fails() {
        let result = compile_lines(": T AGAIN ;");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("AGAIN"));
    }

    #[test]
    fn test_while_without_repeat_fails() {
        let result = compile_lines(": T WHILE ;");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("WHILE"));
    }

    #[test]
    fn test_unterminated_colon_definition_fails() {
        // : without ; at end of source
        let result = compile_lines(": T 42 DUP +");
        assert!(result.is_err());
    }

    #[test]
    fn test_exit_outside_definition() {
        // EXIT should compile outside a definition (just emits RET)
        let lines = compile_lines("EXIT").unwrap();
        let joined = lines.join("\n");
        assert!(joined.contains("RET"));
    }

    #[test]
    fn test_leave_without_do_fails() {
        let result = compile_lines(": T LEAVE ;");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("LEAVE"));
    }

    #[test]
    fn test_unclosed_if_in_definition() {
        // IF without THEN closes at end of definition
        let result = compile_lines(": T 10 > IF 42 ;");
        assert!(result.is_err());
    }

    #[test]
    fn test_unclosed_do_in_definition() {
        // DO without LOOP
        let result = compile_lines(": T 10 0 DO I . ;");
        assert!(result.is_err());
    }

    #[test]
    fn test_else_without_if_in_compiling_state() {
        // ELSE when not inside IF context (even if inside a definition)
        let result = compile_lines(": T ELSE 42 THEN ;");
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("ELSE"));
    }

    #[test]
    fn test_then_at_top_level_fails() {
        // THEN outside any definition is still rejected
        let result = compile_lines("THEN");
        assert!(result.is_err());
    }
}
