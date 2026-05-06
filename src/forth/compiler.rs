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
const RSP_BASE: u32 = 0x3900;
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
                }
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
                }
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
                }
                _ => {}
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
            }
            "FALSE" => {
                self.emit("LDI r2, 0            ; FALSE");
                self.emit("PUSH r2");
                return Ok(());
            }
            _ => {}
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
            }
            "DROP" => {
                self.emit("LDI r0, 1");
                self.emit("ADD r30, r0          ; DROP: pop TOS");
                return Ok(true);
            }
            "SWAP" => {
                self.emit("LOAD r4, [r30]       ; SWAP: TOS");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3          ; SP+1");
                self.emit("LOAD r5, [r30]       ; NOS");
                self.emit("STORE [r30], r4      ; TOS -> NOS slot");
                self.emit("SUB r30, r3          ; SP-1");
                self.emit("STORE [r30], r5      ; NOS -> TOS slot");
                return Ok(true);
            }
            "OVER" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]       ; OVER: peek TOS");
                self.emit("ADD r30, r2          ; SP+1");
                self.emit("LOAD r4, [r30]       ; peek NOS");
                self.emit("SUB r30, r2          ; SP-1");
                self.emit("PUSH r4              ; push copy of NOS");
                return Ok(true);
            }
            "NIP" => {
                // ( a b -- b ) remove second item
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3          ; SP+1");
                self.emit("LOAD r4, [r30]       ; NOS");
                self.emit("SUB r30, r3          ; SP-1");
                self.emit("STORE [r30], r4      ; NOS -> TOS");
                return Ok(true);
            }
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
            }
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
            }
            "2DUP" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]       ; TOS");
                self.emit("ADD r30, r2          ; SP+1");
                self.emit("LOAD r4, [r30]       ; NOS");
                self.emit("SUB r30, r2          ; SP-1");
                self.emit("PUSH r4");
                self.emit("PUSH r3");
                return Ok(true);
            }
            "2DROP" => {
                self.emit("LDI r0, 2");
                self.emit("ADD r30, r0          ; DROP 2");
                return Ok(true);
            }
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
            }
            "?DUP" => {
                // DUP only if nonzero
                let lbl = self.next_label("qdup");
                self.emit("LOAD r2, [r30]");
                self.emit("CMPI r2, 0");
                self.emit(&format!("JZ r0, {}_done", lbl));
                self.emit("PUSH r2");
                self.emit(&format!("{}_done:", lbl));
                return Ok(true);
            }
            "DEPTH" => {
                // Push current stack depth (simplified: we track SP vs initial SP)
                self.emit_comment("; DEPTH (simplified - pushes approximate stack depth)");
                self.emit("LDI r2, 0x4000      ; initial SP estimate");
                self.emit("SUB r2, r30          ; current depth");
                self.emit("PUSH r2");
                return Ok(true);
            }
            _ => {}
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
            }
            "-" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("SUB r4, r3           ; TOS - NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            }
            "*" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("MUL r4, r3           ; TOS * NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            }
            "/" => {
                self.emit("LOAD r4, [r30]       ; TOS (dividend)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS (divisor)");
                self.emit("DIV r4, r3           ; TOS / NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            }
            "MOD" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2          ; SP++");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("MOD r4, r3           ; TOS mod NOS");
                self.emit("STORE [r30], r4");
                return Ok(true);
            }
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
            }
            "NEGATE" => {
                self.emit("LDI r2, 0");
                self.emit("LOAD r3, [r30]       ; TOS");
                self.emit("SUB r2, r3           ; 0 - TOS");
                self.emit("STORE [r30], r2");
                return Ok(true);
            }
            "ABS" => {
                let lbl = self.next_label("abs");
                self.emit("LOAD r2, [r30]       ; TOS");
                self.emit("CMPI r2, 0");
                self.emit(&format!("BGE r0, {}_pos", lbl));
                self.emit("NEG r2");
                self.emit(&format!("{}_pos:", lbl));
                self.emit("STORE [r30], r2");
                return Ok(true);
            }
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
            }
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
            }
            "1+" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("ADD r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            "1-" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("SUB r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            "2+" => {
                self.emit("LDI r2, 2");
                self.emit("LOAD r3, [r30]");
                self.emit("ADD r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            "2-" => {
                self.emit("LDI r2, 2");
                self.emit("LOAD r3, [r30]");
                self.emit("SUB r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            "2*" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("SHL r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            "2/" => {
                self.emit("LDI r2, 1");
                self.emit("LOAD r3, [r30]");
                self.emit("SHR r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            "LSHIFT" => {
                // ( x n -- x<<n )
                self.emit("LOAD r4, [r30]       ; shift count (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; value (NOS)");
                self.emit("SHL r3, r4");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            "RSHIFT" => {
                self.emit("LOAD r4, [r30]       ; shift count (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; value (NOS)");
                self.emit("SHR r3, r4");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            _ => {}
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
            }
            "OR" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("OR r4, r3");
                self.emit("STORE [r30], r4");
                return Ok(true);
            }
            "XOR" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("XOR r4, r3");
                self.emit("STORE [r30], r4");
                return Ok(true);
            }
            "INVERT" => {
                self.emit("LDI r2, -1");
                self.emit("LOAD r3, [r30]");
                self.emit("XOR r3, r2");
                self.emit("STORE [r30], r3");
                return Ok(true);
            }
            _ => {}
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
            }
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
            }
            "<" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r4, r3           ; TOS < NOS?");
                self.emit("MOV r2, r0");
                self.emit("STORE [r30], r2");
                return Ok(true);
            }
            ">" => {
                self.emit("LOAD r4, [r30]       ; TOS");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; NOS");
                self.emit("CMP r3, r4           ; NOS > TOS?");
                self.emit("MOV r2, r0");
                self.emit("STORE [r30], r2");
                return Ok(true);
            }
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
            }
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
            }
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
            }
            "0<" => {
                self.emit("LOAD r2, [r30]");
                self.emit("LDI r3, 0");
                self.emit("CMP r2, r3");
                self.emit("MOV r2, r0");
                self.emit("STORE [r30], r2");
                return Ok(true);
            }
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
            }
            _ => {}
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
            }
            "ELSE" => {
                // We need to find the matching IF label.
                // Use the last generated label (which was the IF label)
                let lbl = format!("if_{}", self.label_counter - 1);
                self.emit(&format!("JMP {}_then", lbl));
                self.emit(&format!("{}_else:", lbl));
                return Ok(true);
            }
            "THEN" => {
                let lbl = format!("if_{}", self.label_counter - 1);
                self.emit(&format!("{}_then:", lbl));
                self.if_depth -= 1;
                return Ok(true);
            }
            _ => {}
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
            }
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
            }
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
            }
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
            }
            "I" => {
                self.emit("PUSH r14             ; I = current loop index");
                return Ok(true);
            }
            "J" => {
                self.emit("PUSH r13             ; J = outer loop index");
                return Ok(true);
            }
            "LEAVE" => {
                let info = self.loop_stack.last().ok_or(CompileError {
                    message: "LEAVE without DO".into(),
                    line,
                })?;
                self.emit(&format!("JMP {}_end", info.do_label));
                return Ok(true);
            }
            _ => {}
        }

        // --- Control flow: BEGIN / UNTIL / AGAIN / WHILE / REPEAT ---
        match word {
            "BEGIN" => {
                let lbl = self.next_label("begin");
                self.emit(&format!("{}:", lbl));
                self.begin_stack.push(lbl);
                return Ok(true);
            }
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
            }
            "AGAIN" => {
                let lbl = self.begin_stack.pop().ok_or(CompileError {
                    message: "AGAIN without BEGIN".into(),
                    line,
                })?;
                self.emit(&format!("JMP {}", lbl));
                return Ok(true);
            }
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
            }
            "REPEAT" => {
                let lbl = self.begin_stack.pop().ok_or(CompileError {
                    message: "REPEAT without BEGIN".into(),
                    line,
                })?;
                self.emit(&format!("JMP {}", lbl));
                self.emit(&format!("{}_exit:", lbl));
                return Ok(true);
            }
            _ => {}
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
            }
            "!" => {
                self.emit("LOAD r4, [r30]       ; value (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; address (NOS)");
                self.emit("STORE [r3], r4       ; [addr] = value");
                return Ok(true);
            }
            "+!" => {
                self.emit("LOAD r4, [r30]       ; value (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; address (NOS)");
                self.emit("LOAD r5, [r3]        ; current");
                self.emit("ADD r5, r4");
                self.emit("STORE [r3], r5");
                return Ok(true);
            }
            "C@" => {
                self.emit("LOAD r2, [r30]       ; pop address");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit("LOAD r2, [r2]        ; fetch u32");
                self.emit("ANDI r2, 0xFF        ; mask to byte");
                self.emit("PUSH r2");
                return Ok(true);
            }
            "C!" => {
                self.emit("LOAD r4, [r30]       ; value (TOS)");
                self.emit("LDI r2, 1");
                self.emit("ADD r30, r2");
                self.emit("LOAD r3, [r30]       ; address (NOS)");
                self.emit("ANDI r4, 0xFF        ; mask to byte");
                self.emit("STORE [r3], r4");
                return Ok(true);
            }
            "ALLOT" => {
                // ( n -- ) advance data pointer by n
                self.emit("LOAD r2, [r30]       ; n");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                // We track data_ptr on host side; at runtime this is a no-op
                // since the compiler pre-allocates the data area
                self.emit_comment("; ALLOT (handled at compile time)");
                return Ok(true);
            }
            "HERE" => {
                // Push current data pointer
                let hex_addr = format!("0x{:04X}", self.data_ptr);
                self.emit(&format!("LDI r2, {}      ; HERE", hex_addr));
                self.emit("PUSH r2");
                return Ok(true);
            }
            _ => {}
        }

        // --- Output ---
        match word {
            "." => {
                self.emit("LOAD r2, [r30]       ; pop number");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit_port_store(0xFFB, "r2", "write to debug port");
                return Ok(true);
            }
            "EMIT" => {
                self.emit("LOAD r2, [r30]       ; pop char");
                self.emit("LDI r3, 1");
                self.emit("ADD r30, r3");
                self.emit_port_store(0xFFB, "r2", "write char to debug port");
                return Ok(true);
            }
            "CR" => {
                self.emit("LDI r2, 10");
                self.emit_port_store(0xFFB, "r2", "newline");
                return Ok(true);
            }
            "SPACE" => {
                self.emit("LDI r2, 32");
                self.emit_port_store(0xFFB, "r2", "space");
                return Ok(true);
            }
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
            }
            _ => {}
        }

        // --- Misc ---
        match word {
            "EXIT" => {
                self.emit("RET              ; EXIT");
                return Ok(true);
            }
            _ => {}
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
