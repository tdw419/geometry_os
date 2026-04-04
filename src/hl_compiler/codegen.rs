//! Code Generator — emits pixel VM opcodes from the AST.
//!
//! Strategy:
//! - Each function gets its own region in the texture.
//! - First function (typically `main`) is the entry point.
//! - Variables map to registers (simple first-fit allocator, 128 regs).
//! - Function calls use CALL/RET with a stack-based calling convention.
//! - The calling convention:
//!     - Args passed in registers r1, r2, r3, ... (up to 8 args)
//!     - Return value in r1
//!     - Caller-saved: r1-r9 (temporaries, args)
//!     - Callee-saved: r10-r31 (local variables survive calls)
//!
//! Memory layout for compiled programs:
//!   - Function bodies laid out sequentially
//!   - Each function has a prologue (set up frame) and epilogue
//!   - Global data area follows all functions

use std::collections::HashMap;

use super::parser::{AstNode, BinOp, Expr, FnDecl, Stmt, UnaryOp};
use crate::assembler::{self, op, Program};

/// Register allocation (r0-r27 available; r28-r30 reserved for call machinery).
const NUM_REGS: usize = 28;

/// Reserved registers for dynamic call frame management.
const ADDR_TMP_REG: u8 = 28; // Scratch address register
const ONE_REG: u8 = 29;      // Always holds 1 (for DSP increment/decrement)
const DSP_REG: u8 = 30;      // Data stack pointer (grows upward in pixel-index space)

/// Initial value for the data stack pointer (pixel index in high safe memory).
const DSP_INIT: u32 = 0x0F000; // 61,440 — well within 1 MB bounds

/// Code generator state.
pub struct CodeGenerator {
    /// Current register allocation: var_name -> reg
    locals: HashMap<String, u8>,
    /// Next available register
    next_reg: u8,
    /// Function table: name -> (start_addr, param_count)
    functions: HashMap<String, (usize, usize)>,
    /// Label counter for generating unique labels
    label_counter: u32,
}

impl CodeGenerator {
    pub fn new() -> Self {
        Self {
            locals: HashMap::new(),
            next_reg: 2, // r0 reserved, r1 = return value
            functions: HashMap::new(),
            label_counter: 0,
        }
    }

    fn fresh_label(&mut self, prefix: &str) -> String {
        let id = self.label_counter;
        self.label_counter += 1;
        format!("__{}_{}", prefix, id)
    }

    fn alloc_reg(&mut self) -> u8 {
        let r = self.next_reg;
        if r as usize >= NUM_REGS {
            panic!("Register overflow: too many variables");
        }
        self.next_reg += 1;
        r
    }

    fn reset_frame(&mut self) {
        self.locals.clear();
        self.next_reg = 2; // r0 reserved, r1 = return value
    }

    fn get_var_reg(&self, name: &str) -> Result<u8, String> {
        self.locals
            .get(name)
            .copied()
            .ok_or_else(|| format!("Undefined variable: {}", name))
    }

    /// Generate code for the full program (all functions).
    pub fn generate(&mut self, ast: &AstNode) -> Result<Program, String> {
        if ast.functions.is_empty() {
            return Err("No functions defined".to_string());
        }

        // Two-pass approach:
        // Pass 1: Lay out all functions to know their addresses
        // Pass 2: Emit code with correct addresses for calls

        // For simplicity, we'll do a single pass with fixup.
        // Each function is compiled independently. The address of each function
        // is determined by the cumulative size of prior functions.

        // First, compute function sizes and addresses using placeholder compilation.
        let mut func_programs: Vec<(String, usize, Program)> = Vec::new();
        let mut offset = 0usize;

        // We need two passes: first to get sizes, second to resolve call addresses.
        // Do a preliminary compile to figure out sizes.
        for fn_decl in &ast.functions {
            let name = fn_decl.name.clone();
            let param_count = fn_decl.params.len();
            self.functions.insert(name.clone(), (offset, param_count));

            self.reset_frame();
            let mut prog = Program::new();

            // Bind parameters to registers r10, r11, r12, ...
            // r1 is reserved for return values, r2+ for temporaries.
            // This prevents callee return values from clobbering caller params.
            for (i, param) in fn_decl.params.iter().enumerate() {
                let reg = if i < 18 {
                    (i as u8) + 10 // r10, r11, r12, ...
                } else {
                    self.alloc_reg()
                };
                self.locals.insert(param.clone(), reg);
            }

            // Generate code for body
            for stmt in &fn_decl.body {
                self.gen_stmt(&mut prog, stmt)?;
            }

            // Ensure function ends with a return (implicit return 0)
            // If the last statement wasn't a return, add one.
            if !matches!(fn_decl.body.last(), Some(Stmt::Return(_))) {
                prog.ldi(1, 0); // r1 = 0
                prog.instruction(op::RET, 0, 0, 0);
            }

            let size = prog.pixels.len();
            func_programs.push((name, offset, prog));
            offset += size;
        }

        // Second pass: fix up CALL addresses now that we know offsets.
        // For now, the first approach works because calls are emitted as
        // direct address loads. We need to re-emit with correct addresses.
        //
        // Actually, we need a third approach: emit everything in one pass
        // but defer call address resolution.
        //
        // Simplest correct approach: compile twice.
        // First pass gets sizes, second pass gets correct addresses.

        self.functions.clear();
        let mut offset = 0usize;
        for (_, _, ref prog) in &func_programs {
            // Recalculate with same sizes
            offset += prog.pixels.len();
        }

        // Recompute function addresses
        offset = 0;
        for (name, _, ref prog) in &func_programs {
            let param_count = self.functions.len(); // temporary
            let pc = prog.pixels.len();
            self.functions.insert(name.clone(), (offset, 0));
            offset += pc;
        }

        // Re-count params
        for fn_decl in &ast.functions {
            if let Some(entry) = self.functions.get_mut(&fn_decl.name) {
                entry.1 = fn_decl.params.len();
            }
        }

        // Now compile again with correct function addresses
        let mut final_program = Program::new();
        self.functions.clear();
        let mut func_offsets: Vec<(String, usize, usize)> = Vec::new();

        // Calculate offsets
        let mut current_offset = 0usize;
        for (name, _, ref prog) in &func_programs {
            func_offsets.push((name.clone(), current_offset, prog.pixels.len()));
            self.functions.insert(name.clone(), (current_offset, 0));
            current_offset += prog.pixels.len();
        }

        // Set param counts
        for fn_decl in &ast.functions {
            if let Some(entry) = self.functions.get_mut(&fn_decl.name) {
                entry.1 = fn_decl.params.len();
            }
        }

        // Emit entry trampoline: init DSP + ONE, CALL main; HALT
        // This ensures RET from main() returns to HALT instead of falling through.
        let trampoline_start = final_program.pixels.len();
        // Initialize data stack pointer and constant-one register
        final_program.ldi(DSP_REG, DSP_INIT);
        final_program.ldi(ONE_REG, 1);
        let main_call_pc = final_program.pixels.len();
        final_program.instruction(op::CALL, 0, 0, 0);
        final_program.pixels.push(0); // placeholder for main address
        final_program.halt();
        let trampoline_size = final_program.pixels.len() - trampoline_start;

        // Shift all function addresses by trampoline size
        for (_, (addr, _)) in self.functions.iter_mut() {
            *addr += trampoline_size;
        }

        // Fix up the CALL target in the trampoline (main moved)
        let new_main_addr = self.functions.get("main").map(|(addr, _)| *addr).unwrap_or(0);
        final_program.pixels[main_call_pc + 1] = new_main_addr as u32;

        // Re-compile each function with correct call targets
        for fn_decl in &ast.functions {
            self.reset_frame();

            // Bind parameters to registers r10, r11, r12, ...
            for (i, param) in fn_decl.params.iter().enumerate() {
                let reg = if i < 18 {
                    (i as u8) + 10 // r10, r11, r12, ...
                } else {
                    self.alloc_reg()
                };
                self.locals.insert(param.clone(), reg);
            }

            for stmt in &fn_decl.body {
                self.gen_stmt(&mut final_program, stmt)?;
            }

            // Implicit return 0
            if !matches!(fn_decl.body.last(), Some(Stmt::Return(_))) {
                final_program.ldi(1, 0);
                final_program.instruction(op::RET, 0, 0, 0);
            }
        }

        Ok(final_program)
    }

    fn gen_stmt(&mut self, prog: &mut Program, stmt: &Stmt) -> Result<(), String> {
        match stmt {
            Stmt::Let(name, expr) => {
                let reg = self.alloc_reg();
                self.emit_expr_to_reg(prog, expr, reg)?;
                self.locals.insert(name.clone(), reg);
            }
            Stmt::Assign(name, expr) => {
                let reg = self.get_var_reg(name)?;
                self.emit_expr_to_reg(prog, expr, reg)?;
            }
            Stmt::AssignOp(name, binop, expr) => {
                let reg = self.get_var_reg(name)?;
                // Evaluate RHS, add to current value
                let tmp = self.alloc_reg();
                self.emit_expr_to_reg(prog, expr, tmp)?;
                self.emit_binop(prog, binop, reg, tmp, reg)?;
                // Reset next_reg so tmp is "freed"
                self.next_reg -= 1;
            }
            Stmt::While(cond, body) => {
                let loop_start = self.fresh_label("while_start");
                let loop_end = self.fresh_label("while_end");

                // Mark loop start position
                let start_pc = prog.pixels.len();

                // Emit condition
                let cond_reg = self.alloc_reg();
                self.emit_expr_to_reg(prog, cond, cond_reg)?;

                // Compare cond_reg != 0, jump to end if false
                // We need: BRANCH(BEQ, cond_reg, r0, offset_to_end)
                // r0 is always 0
                // BRANCH emits 2 pixels: [BRANCH instruction] [offset]
                let branch_pc = prog.pixels.len();
                prog.instruction(op::BRANCH, assembler::bcond::BEQ, cond_reg, 0);
                prog.pixels.push(0); // placeholder for offset

                self.next_reg -= 1; // free cond_reg

                // Emit body
                for s in body {
                    self.gen_stmt(prog, s)?;
                }

                // Jump back to loop start
                let jmp_pc = prog.pixels.len();
                // JMP offset is relative to current PC
                let back_offset = start_pc as i32 - jmp_pc as i32;
                prog.instruction(op::JMP, 0, 0, 0);
                prog.pixels.push(back_offset as u32);

                // Fix up branch offset
                let end_pc = prog.pixels.len();
                let branch_offset = (end_pc as i32) - (branch_pc as i32);
                prog.pixels[branch_pc + 1] = branch_offset as u32;
            }
            Stmt::If(cond, then_block, else_block) => {
                let cond_reg = self.alloc_reg();
                self.emit_expr_to_reg(prog, cond, cond_reg)?;

                // BRANCH(BEQ, cond_reg, r0, offset_to_else_or_end)
                let branch_pc = prog.pixels.len();
                prog.instruction(op::BRANCH, assembler::bcond::BEQ, cond_reg, 0);
                prog.pixels.push(0); // placeholder
                self.next_reg -= 1;

                // Then block
                for s in then_block {
                    self.gen_stmt(prog, s)?;
                }

                match else_block {
                    Some(else_block) => {
                        // JMP over else block
                        let jmp_pc = prog.pixels.len();
                        prog.instruction(op::JMP, 0, 0, 0);
                        prog.pixels.push(0); // placeholder

                        // Fix up the BEQ to jump here (start of else)
                        let else_start = prog.pixels.len();
                        let branch_offset = (else_start as i32) - (branch_pc as i32);
                        prog.pixels[branch_pc + 1] = branch_offset as u32;

                        // Else block
                        for s in else_block {
                            self.gen_stmt(prog, s)?;
                        }

                        // Fix up the JMP to jump here (end of else)
                        let end_pc = prog.pixels.len();
                        let jmp_offset = (end_pc as i32) - (jmp_pc as i32);
                        prog.pixels[jmp_pc + 1] = jmp_offset as u32;
                    }
                    None => {
                        // Fix up the BEQ to jump here (end of if)
                        let end_pc = prog.pixels.len();
                        let branch_offset = (end_pc as i32) - (branch_pc as i32);
                        prog.pixels[branch_pc + 1] = branch_offset as u32;
                    }
                }
            }
            Stmt::Return(expr) => {
                match expr {
                    Some(expr) => {
                        self.emit_expr_to_reg(prog, expr, 1)?; // r1 = return value
                    }
                    None => {
                        prog.ldi(1, 0); // return 0
                    }
                }
                prog.instruction(op::RET, 0, 0, 0);
            }
            Stmt::ExprStmt(expr) => {
                let tmp = self.alloc_reg();
                self.emit_expr_to_reg(prog, expr, tmp)?;
                self.next_reg -= 1;
            }
        }
        Ok(())
    }

    /// Emit code to evaluate an expression and store the result in `dst_reg`.
    fn emit_expr_to_reg(&mut self, prog: &mut Program, expr: &Expr, dst_reg: u8) -> Result<(), String> {
        match expr {
            Expr::Int(n) => {
                prog.ldi(dst_reg, *n as u32);
            }
            Expr::Bool(b) => {
                prog.ldi(dst_reg, if *b { 1 } else { 0 });
            }
            Expr::Var(name) => {
                let src_reg = self.get_var_reg(name)?;
                if src_reg != dst_reg {
                    // MOV via: copy src to dst using ADD with zero
                    // Actually, opcode 2 = MOV rd, rs
                    prog.instruction(op::MOV, 0, dst_reg, src_reg);
                }
            }
            Expr::BinOp(binop, left, right) => {
                match binop {
                    // Comparisons must evaluate into SEPARATE temps because
                    // emit_binop writes LDI result_reg,1 before BRANCH,
                    // which would clobber left/right if they share a register.
                    BinOp::Eq | BinOp::Ne | BinOp::Lt | BinOp::Gt | BinOp::Le | BinOp::Ge => {
                        let left_tmp = self.alloc_reg();
                        let right_tmp = self.alloc_reg();
                        self.emit_expr_to_reg(prog, left, left_tmp)?;
                        self.emit_expr_to_reg(prog, right, right_tmp)?;
                        self.emit_binop(prog, binop, left_tmp, right_tmp, dst_reg)?;
                        self.next_reg -= 2;
                    }
                    _ => {
                        // Arithmetic: evaluate right operand into a temp FIRST,
                        // then left operand into dst_reg. This avoids clobbering
                        // the right operand when dst_reg aliases it (e.g. `b = a + b`).
                        let tmp = self.alloc_reg();
                        self.emit_expr_to_reg(prog, right, tmp)?;
                        self.emit_expr_to_reg(prog, left, dst_reg)?;
                        self.emit_binop(prog, binop, dst_reg, tmp, dst_reg)?;
                        self.next_reg -= 1;
                    }
                }
            }
            Expr::UnaryOp(unaryop, operand) => {
                match unaryop {
                    UnaryOp::Neg => {
                        // -x = 0 - x
                        self.emit_expr_to_reg(prog, operand, dst_reg)?;
                        // Need: dst = 0 - dst
                        // Emit: LDI tmp, 0; SUB dst, tmp
                        let zero_reg = self.alloc_reg();
                        prog.ldi(zero_reg, 0);
                        // We need SUB zero_reg, dst_reg but SUB is rd -= rs
                        // SUB(2, 1) means r2 -= r1... wait, let me check the opcode
                        // Actually: SUB rd, rs means rd = rd - rs
                        // So we need: tmp = 0; tmp -= dst; then MOV dst = tmp
                        // Or: we can just emit 0 - x using a trick
                        prog.instruction(op::SUB, 0, zero_reg, dst_reg);
                        // zero_reg now = 0 - dst_reg = -dst_reg
                        // Move to dst_reg
                        prog.instruction(op::MOV, 0, dst_reg, zero_reg);
                        self.next_reg -= 1;
                    }
                    UnaryOp::Not => {
                        // !x = (x == 0) ? 1 : 0
                        // Emit: evaluate x to dst, then check if dst == 0
                        self.emit_expr_to_reg(prog, operand, dst_reg)?;
                        // We need to produce 1 if dst==0, 0 otherwise.
                        // Tricky with just ADD/SUB... Use a comparison trick:
                        // Set a temp to 1. Branch if dst==0 to skip setting it to 0.
                        let one_reg = self.alloc_reg();
                        prog.ldi(one_reg, 1);
                        // if dst != 0, set one_reg to 0
                        let not_zero_pc = prog.pixels.len();
                        prog.instruction(op::BRANCH, assembler::bcond::BEQ, dst_reg, 0);
                        prog.pixels.push(0); // placeholder
                        prog.ldi(one_reg, 0); // it was non-zero, so ! = 0
                        let end_pc = prog.pixels.len();
                        let offset = (end_pc as i32) - (not_zero_pc as i32);
                        prog.pixels[not_zero_pc + 1] = offset as u32;
                        // Move result to dst
                        prog.instruction(op::MOV, 0, dst_reg, one_reg);
                        self.next_reg -= 1;
                    }
                }
            }
            Expr::Call(name, args) => {
                // Calling convention: params in r10..r27, return in r1.
                // Strategy: Use a dynamic data stack (r30=DSP, r29=ONE) to
                // save/restore registers across calls.
                //
                // Key: we advance DSP FIRST to reserve our frame, so that
                // evaluating args (which may involve nested calls) pushes
                // frames ABOVE our reserved space, not clobbering it.

                let eval_tmp = self.alloc_reg();
                let offset_tmp = self.alloc_reg();

                // Number of args (up to 18 passed in registers r10..r27)
                let num_args = args.len().min(18) as u32;

                // Save ALL registers r2..r27 (excluding r0,r1,reserved r28-r30).
                let first_reg: u8 = 2;
                let last_reg: u8 = 28;
                let num_regs_to_save = (last_reg - first_reg) as u32;
                let frame_size = num_args + num_regs_to_save;

                // Step 1: Save ALL registers r2..r27 at [DSP + num_args..)
                // Do this BEFORE evaluating args, so args can't clobber saved regs.
                for i in 0..num_regs_to_save {
                    let reg = first_reg + i as u8;
                    prog.instruction(op::MOV, 0, ADDR_TMP_REG, DSP_REG);
                    let offset = num_args + i;
                    if offset > 0 {
                        prog.ldi(offset_tmp, offset);
                        prog.instruction(op::ADD, 0, ADDR_TMP_REG, offset_tmp);
                    }
                    prog.store(ADDR_TMP_REG, reg);
                }

                // Step 2: Advance DSP by frame_size (reserve our frame)
                prog.ldi(ADDR_TMP_REG, frame_size);
                prog.instruction(op::ADD, 0, DSP_REG, ADDR_TMP_REG);

                // Step 3: Evaluate args and store at [DSP - frame_size + 0..num_args)
                // = the reserved space below our new DSP position.
                // Nested calls during evaluation push ABOVE DSP, leaving this safe.
                for (i, arg) in args.iter().enumerate() {
                    if i < 18 {
                        self.emit_expr_to_reg(prog, arg, eval_tmp)?;
                        // addr = DSP - frame_size + i
                        prog.instruction(op::MOV, 0, ADDR_TMP_REG, DSP_REG);
                        let back_offset = frame_size - i as u32;
                        prog.ldi(offset_tmp, back_offset);
                        prog.instruction(op::SUB, 0, ADDR_TMP_REG, offset_tmp);
                        prog.store(ADDR_TMP_REG, eval_tmp);
                    }
                }

                // Step 4: Load args from reserved space into callee's r10, r11, ...
                for (i, _) in args.iter().enumerate() {
                    if i < 18 {
                        prog.instruction(op::MOV, 0, ADDR_TMP_REG, DSP_REG);
                        let back_offset = frame_size - i as u32;
                        prog.ldi(offset_tmp, back_offset);
                        prog.instruction(op::SUB, 0, ADDR_TMP_REG, offset_tmp);
                        prog.load((i as u8) + 10, ADDR_TMP_REG);
                    }
                }

                // Step 5: CALL
                if let Some(&(addr, _)) = self.functions.get(name) {
                    prog.instruction(op::CALL, 0, 0, 0);
                    prog.pixels.push(addr as u32);
                } else {
                    return Err(format!("Undefined function: {}", name));
                }

                // Step 6: Retreat DSP by frame_size
                prog.ldi(ADDR_TMP_REG, frame_size);
                prog.instruction(op::SUB, 0, DSP_REG, ADDR_TMP_REG);

                // Step 7: Restore ALL registers from reserved space
                for i in 0..num_regs_to_save {
                    let reg = first_reg + i as u8;
                    prog.instruction(op::MOV, 0, ADDR_TMP_REG, DSP_REG);
                    let offset = num_args + i;
                    if offset > 0 {
                        prog.ldi(offset_tmp, offset);
                        prog.instruction(op::ADD, 0, ADDR_TMP_REG, offset_tmp);
                    }
                    prog.load(reg, ADDR_TMP_REG);
                }

                self.next_reg -= 2; // free eval_tmp and offset_tmp

                // Step 8: Move return value (r1) to dst_reg
                if dst_reg != 1 {
                    prog.instruction(op::MOV, 0, dst_reg, 1);
                }
            }
        }
        Ok(())
    }

    /// Emit a binary operation: dst = left OP right
    /// left_reg and right_reg already contain the operands.
    /// result goes into result_reg.
    fn emit_binop(&mut self, prog: &mut Program, binop: &BinOp, left_reg: u8, right_reg: u8, result_reg: u8) -> Result<(), String> {
        match binop {
            BinOp::Add => {
                // ADD rd, rs means rd = rd + rs
                // So we need left in result_reg, then ADD result_reg, right_reg
                if result_reg != left_reg {
                    prog.instruction(op::MOV, 0, result_reg, left_reg);
                }
                prog.instruction(op::ADD, 0, result_reg, right_reg);
            }
            BinOp::Sub => {
                if result_reg != left_reg {
                    prog.instruction(op::MOV, 0, result_reg, left_reg);
                }
                prog.instruction(op::SUB, 0, result_reg, right_reg);
            }
            BinOp::Mul => {
                if result_reg != left_reg {
                    prog.instruction(op::MOV, 0, result_reg, left_reg);
                }
                prog.instruction(op::MUL, 0, result_reg, right_reg);
            }
            BinOp::Div => {
                if result_reg != left_reg {
                    prog.instruction(op::MOV, 0, result_reg, left_reg);
                }
                prog.instruction(op::DIV, 0, result_reg, right_reg);
            }
            // Comparisons: emit BRANCH-based comparison
            // Result: result_reg = 1 if true, 0 if false
            BinOp::Eq | BinOp::Ne | BinOp::Lt | BinOp::Gt | BinOp::Le | BinOp::Ge => {
                // Strategy:
                //   Save operands into temps (result_reg may alias left_reg)
                //   LDI result_reg, 1
                //   BRANCH(inverse_cond, t1, t2, offset_to_false)
                //   JMP to_end
                //   false: LDI result_reg, 0
                //   end:
                //
                // We need to branch when the comparison is FALSE.
                // So the branch condition is the INVERSE of the desired comparison.

                // Save operands before overwriting result_reg
                let t1 = self.alloc_reg();
                let t2 = self.alloc_reg();
                prog.instruction(op::MOV, 0, t1, left_reg);
                prog.instruction(op::MOV, 0, t2, right_reg);

                prog.ldi(result_reg, 1);

                // (branch_cond, swap_operands): branch when comparison is FALSE
                let (cond, swap) = match binop {
                    BinOp::Eq => (assembler::bcond::BNE, false),  // false when !=
                    BinOp::Ne => (assembler::bcond::BEQ, false),  // false when ==
                    BinOp::Lt => (assembler::bcond::BGE, false),  // false when >=
                    BinOp::Gt => (assembler::bcond::BGE, true),   // a>b false when b>=a
                    BinOp::Le => (assembler::bcond::BLT, true),   // a<=b false when b<a
                    BinOp::Ge => (assembler::bcond::BLT, false),  // false when <
                    _ => unreachable!(),
                };

                let (br1, br2) = if swap {
                    (t2, t1)
                } else {
                    (t1, t2)
                };

                let branch_pc = prog.pixels.len();
                prog.instruction(op::BRANCH, cond, br1, br2);
                prog.pixels.push(0); // placeholder offset

                // Here: comparison was TRUE -> result_reg = 1, jump over false
                let jmp_pc = prog.pixels.len();
                prog.instruction(op::JMP, 0, 0, 0);
                prog.pixels.push(0); // placeholder

                // Branch target: comparison was FALSE -> result_reg = 0
                let false_pc = prog.pixels.len();
                let branch_offset = (false_pc as i32) - (branch_pc as i32);
                prog.pixels[branch_pc + 1] = branch_offset as u32;

                prog.ldi(result_reg, 0);

                let end_pc = prog.pixels.len();
                let jmp_offset = (end_pc as i32) - (jmp_pc as i32);
                prog.pixels[jmp_pc + 1] = jmp_offset as u32;

                // Free temp registers
                self.next_reg -= 2;
            }
        }
        Ok(())
    }
}



#[cfg(test)]
mod integration_tests {

    use super::*;
    use crate::software_vm::SoftwareVm;
    use crate::hl_compiler::{Lexer, Parser};

    /// Helper: compile GeoLang source, run on software VM until halted, return VM state.
    fn compile_and_run(source: &str) -> crate::vm::VmState {
        let tokens = Lexer::new(source).tokenize().expect("tokenize failed");
        let ast = Parser::new(tokens).parse().expect("parse failed");
        let program = CodeGenerator::new().generate(&ast).expect("codegen failed");
        
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        
        // Run up to 100 frames (100 * 1024 = 102400 cycles) to handle complex programs
        for _ in 0..100 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        svm.vm_state(0).clone()
    }

    // ── Test 1: Fibonacci (recursive) ──

    #[test]
    fn test_fibonacci_recursive() {
        let source = r#"
fn fib(n) {
    if (n <= 1) { return n; }
    return fib(n - 1) + fib(n - 2);
}
fn main() {
    return fib(5);
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED"); // 2 = HALTED
        // fib(5) = 5
        eprintln!("fib(5) result: r1={}", vm.regs[1]);
        assert_eq!(vm.regs[1], 5, "fib(5) should return 5 in r1");
    }

    // ── Test 2: Loop-based sum (1 + 2 + ... + N) ──

    #[test]
    fn test_loop_sum() {
        let source = r#"
fn main() {
    let sum = 0;
    let i = 1;
    while (i <= 100) {
        sum = sum + i;
        i = i + 1;
    }
    return sum;
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        // sum(1..100) = 5050
        assert_eq!(vm.regs[1], 5050, "sum(1..100) should return 5050");
    }

    // ── Test 3: Factorial (recursive) ──

    #[test]
    fn test_factorial() {
        let source = r#"
fn fact(n) {
    if (n <= 1) { return 1; }
    return n * fact(n - 1);
}
fn main() {
    return fact(10);
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        // 10! = 3628800
        assert_eq!(vm.regs[1], 3628800, "fact(10) should return 3628800");
    }

    // ── Test 4: If/else with compound assignment ──

    #[test]
    fn test_if_else_compound() {
        let source = r#"
fn main() {
    let x = 10;
    let y = 20;
    let max = 0;
    if (x > y) {
        max = x;
    } else {
        max = y;
    }
    return max;
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        assert_eq!(vm.regs[1], 20, "max(10, 20) should return 20");
    }

    // ── Test 5: Nested loops (multiplication by repeated addition) ──

    #[test]
    fn test_nested_loops() {
        let source = r#"
fn main() {
    let result = 0;
    let i = 0;
    while (i < 12) {
        let j = 0;
        while (j < 7) {
            result += 1;
            j += 1;
        }
        i += 1;
    }
    return result;
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        // 12 * 7 = 84
        assert_eq!(vm.regs[1], 84, "12 * 7 should return 84");
    }

    // ── Test 6: Multiple functions with calls ──

    #[test]
    fn test_multi_function() {
        let source = r#"
fn square(x) {
    return x * x;
}
fn sum_of_squares(a, b) {
    return square(a) + square(b);
}
fn main() {
    return sum_of_squares(3, 4);
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        // 3^2 + 4^2 = 9 + 16 = 25
        assert_eq!(vm.regs[1], 25, "sum_of_squares(3,4) should return 25");
    }

    // ── Test 7: Boolean logic / negation ──

    #[test]
    fn test_boolean_not() {
        let source = r#"
fn main() {
    let a = 5;
    let b = 0;
    let result = 0;
    if (!b) {
        if (!!a) {
            result = 1;
        }
    }
    return result;
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        assert_eq!(vm.regs[1], 1, "!0 && !!5 should be truthy => result=1");
    }

    // ── Test 8: Sorting algorithm (bubble sort on values in memory) ──
    // Since we don't have arrays in GeoLang yet, we do a 5-element sort
    // using named variables — the algorithm is still a real sort.

    #[test]
    fn test_bubble_sort_five_elements() {
        let source = r#"
fn main() {
    // Five values to sort
    let a = 5;
    let b = 3;
    let c = 1;
    let d = 4;
    let e = 2;

    // Bubble sort: 5 passes
    let pass = 0;
    while (pass < 5) {
        // Compare and swap adjacent pairs
        if (a > b) {
            let tmp = a;
            a = b;
            b = tmp;
        }
        if (b > c) {
            let tmp = b;
            b = c;
            c = tmp;
        }
        if (c > d) {
            let tmp = c;
            c = d;
            d = tmp;
        }
        if (d > e) {
            let tmp = d;
            d = e;
            e = tmp;
        }
        pass += 1;
    }

    // Return e (the largest) — should be 5
    // But let's verify all: return a * 10000 + b * 1000 + c * 100 + d * 10 + e
    // = 1*10000 + 2*1000 + 3*100 + 4*10 + 5 = 12345
    return a * 10000 + b * 1000 + c * 100 + d * 10 + e;
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        assert_eq!(vm.regs[1], 12345, "sorted [5,3,1,4,2] should produce 12345 encoded");
    }
}

#[cfg(test)]
mod debug_tests {
    use super::*;
    use crate::software_vm::SoftwareVm;
    use crate::hl_compiler::{Lexer, Parser};

    fn compile_and_run(source: &str) -> crate::vm::VmState {
        let tokens = Lexer::new(source).tokenize().expect("tokenize failed");
        let ast = Parser::new(tokens).parse().expect("parse failed");
        let mut gen = CodeGenerator::new();
        let program = gen.generate(&ast).expect("codegen failed");
        
        eprintln!("\n=== Generated program: {} pixels ===", program.pixels.len());
        for (i, p) in program.pixels.iter().enumerate() {
            eprintln!("  [{:4}] {}", i, p);
        }
        eprintln!("=== Function table ===");
        for (name, (addr, params)) in &gen.functions {
            eprintln!("  {} @ {} ({} params)", name, addr, params);
        }
        
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        
        for _ in 0..100 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        let state = svm.vm_state(0).clone();
        eprintln!("\n=== VM state ===");
        eprintln!("  halted={}, state={}", state.halted, state.state);
        for i in 0..32 {
            if state.regs[i] != 0 {
                eprintln!("  r{} = {}", i, state.regs[i]);
            }
        }
        state
    }

    #[test]
    fn debug_multi_function() {
        let source = r#"
fn square(x) {
    return x * x;
}
fn sum_of_squares(a, b) {
    return square(a) + square(b);
}
fn main() {
    return sum_of_squares(3, 4);
}
"#;
        let vm = compile_and_run(source);
        assert_eq!(vm.regs[1], 25, "sum_of_squares(3,4) should return 25, got {}", vm.regs[1]);
    }
}
