//! Standard Library — pre-assembled pixel programs for common routines.
//!
//! These routines are loaded into a reserved region of the texture at daemon
//! startup, making them available to all VMs via CALL with known addresses.
//!
//! # Memory Layout
//!
//! ```text
//! STDLIB_BASE .. STDLIB_BASE + STDLIB_MAX_SIZE - 1
//!   Routine 0: memset  (fill memory region with a value)
//!   Routine 1: memcpy  (copy memory region)
//!   Routine 2: strcmp   (compare two null-terminated strings)
//!   Routine 3: strlen   (length of null-terminated string)
//!   Routine 4: draw_rect (draw a filled rectangle to screen)
//! ```
//!
//! # Calling Convention
//!
//! All stdlib routines use the same convention as the hl_compiler:
//!   - Args in r10, r11, r12, ...
//!   - Return value in r1
//!   - Caller-saved: r1-r9
//!   - Callee-saved: r10-r31 (but stdlib uses r2-r9 as scratch)
//!
//! Users call via the hl_compiler's `emit_call_stdlib(name)` or by
//! loading the address from `Stdlib::routine_offset(name)`.

use crate::assembler::{self, op, Program};

/// Base address for stdlib routines in the texture (Hilbert pixel index).
pub const STDLIB_BASE: u32 = 0x00D00000;
/// Maximum size reserved for stdlib (1 MB in pixels = 64K pixels).
pub const STDLIB_MAX_SIZE: u32 = 0x00010000;

/// Routine identifiers and their offsets relative to STDLIB_BASE.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Routine {
    Memset = 0,
    Memcpy = 1,
    Strcmp = 2,
    Strlen = 3,
    DrawRect = 4,
}

impl Routine {
    pub fn all() -> &'static [Routine] {
        &[
            Routine::Memset,
            Routine::Memcpy,
            Routine::Strcmp,
            Routine::Strlen,
            Routine::DrawRect,
        ]
    }

    pub fn name(self) -> &'static str {
        match self {
            Routine::Memset => "memset",
            Routine::Memcpy => "memcpy",
            Routine::Strcmp => "strcmp",
            Routine::Strlen => "strlen",
            Routine::DrawRect => "draw_rect",
        }
    }

    pub fn from_name(name: &str) -> Option<Routine> {
        match name {
            "memset" => Some(Routine::Memset),
            "memcpy" => Some(Routine::Memcpy),
            "strcmp" => Some(Routine::Strcmp),
            "strlen" => Some(Routine::Strlen),
            "draw_rect" => Some(Routine::DrawRect),
            _ => None,
        }
    }
}

/// The compiled stdlib: all routines concatenated with an address table.
#[derive(Debug)]
pub struct Stdlib {
    /// The combined program pixels for all routines.
    pub program: Program,
    /// Offset (in pixels from start of program) for each routine.
    pub offsets: Vec<(Routine, u32)>,
}

impl Stdlib {
    /// Compile all stdlib routines into a single program.
    pub fn compile() -> Self {
        let mut combined = Program::new();
        let mut offsets = Vec::new();

        for routine in Routine::all() {
            let offset = combined.pixels.len() as u32;
            let prog = compile_routine(*routine);
            combined.pixels.extend_from_slice(&prog.pixels);
            offsets.push((*routine, offset));
        }

        Stdlib {
            program: combined,
            offsets,
        }
    }

    /// Get the absolute address (Hilbert pixel index) for a routine.
    pub fn routine_addr(&self, routine: Routine) -> u32 {
        for (r, offset) in &self.offsets {
            if *r == routine {
                return STDLIB_BASE + offset;
            }
        }
        panic!("Unknown routine: {:?}", routine);
    }

    /// Get the offset within the stdlib program for a routine.
    pub fn routine_offset(&self, routine: Routine) -> u32 {
        for (r, offset) in &self.offsets {
            if *r == routine {
                return *offset;
            }
        }
        panic!("Unknown routine: {:?}", routine);
    }
}

/// Compile a single stdlib routine.
fn compile_routine(routine: Routine) -> Program {
    match routine {
        Routine::Memset => compile_memset(),
        Routine::Memcpy => compile_memcpy(),
        Routine::Strcmp => compile_strcmp(),
        Routine::Strlen => compile_strlen(),
        Routine::DrawRect => compile_draw_rect(),
    }
}

// ── memset(r10=dst_addr, r11=value, r12=count) ──
//
// Fills `count` pixels starting at `dst_addr` with `value`.
// Returns dst_addr in r1.
//
// Register usage:
//   r2 = current address
//   r3 = end address (dst_addr + count)
//   r4 = scratch for counter
fn compile_memset() -> Program {
    let mut p = Program::new();

    // r2 = dst_addr (r10)
    p.instruction(op::MOV, 0, 2, 10);
    // r3 = dst_addr + count
    p.instruction(op::MOV, 0, 3, 10);
    p.instruction(op::ADD, 0, 3, 12); // r3 = r10 + r12

    // Loop: while r2 < r3
    let loop_start = p.pixels.len();
    // Compare r2 < r3: branch to end if r2 >= r3
    p.instruction(op::BRANCH, assembler::bcond::BGE, 2, 3);
    p.pixels.push(0); // placeholder for offset to end
    let branch_pc = p.pixels.len() - 1;

    // STORE [r2], r11
    p.store(2, 11);
    // r2 += 1
    p.instruction(op::MOV, 0, 4, 0); // r4 = 0 (not needed, we use ONE approach)
    // Actually, we don't have INC. Use: add 1 via LDI
    p.ldi(4, 1);
    p.instruction(op::ADD, 0, 2, 4); // r2 += 1

    // Jump back to loop_start
    let jmp_pc = p.pixels.len();
    p.instruction(op::JMP, 0, 0, 0);
    let back_offset = loop_start as i32 - jmp_pc as i32;
    p.pixels.push(back_offset as u32);

    // End: return dst_addr in r1
    let end_pc = p.pixels.len();
    let branch_offset = (end_pc as i32) - ((branch_pc - 1) as i32);
    p.pixels[branch_pc] = branch_offset as u32;

    p.instruction(op::MOV, 0, 1, 10); // r1 = dst_addr
    p.instruction(op::RET, 0, 0, 0);

    p
}

// ── memcpy(r10=dst_addr, r11=src_addr, r12=count) ──
//
// Copies `count` pixels from src to dst (handles overlap by copying forward).
// Returns dst_addr in r1.
//
// Register usage:
//   r2 = current dst
//   r3 = current src
//   r4 = end address (dst + count)
//   r5 = scratch for loaded value
//   r6 = scratch for increment
fn compile_memcpy() -> Program {
    let mut p = Program::new();

    // r2 = dst, r3 = src
    p.instruction(op::MOV, 0, 2, 10);
    p.instruction(op::MOV, 0, 3, 11);
    // r4 = dst + count (end)
    p.instruction(op::MOV, 0, 4, 10);
    p.instruction(op::ADD, 0, 4, 12);

    // Loop: while r2 < r4
    let loop_start = p.pixels.len();
    p.instruction(op::BRANCH, assembler::bcond::BGE, 2, 4);
    p.pixels.push(0); // placeholder
    let branch_pc = p.pixels.len() - 1;

    // LOAD r5, [r3]
    p.load(5, 3);
    // STORE [r2], r5
    p.store(2, 5);

    // r2 += 1, r3 += 1
    p.ldi(6, 1);
    p.instruction(op::ADD, 0, 2, 6);
    p.instruction(op::ADD, 0, 3, 6);

    // Jump back
    let jmp_pc = p.pixels.len();
    p.instruction(op::JMP, 0, 0, 0);
    let back_offset = loop_start as i32 - jmp_pc as i32;
    p.pixels.push(back_offset as u32);

    // End
    let end_pc = p.pixels.len();
    let branch_offset = (end_pc as i32) - ((branch_pc - 1) as i32);
    p.pixels[branch_pc] = branch_offset as u32;

    p.instruction(op::MOV, 0, 1, 10); // return dst
    p.instruction(op::RET, 0, 0, 0);

    p
}

// ── strcmp(r10=str1_addr, r11=str2_addr) ──
//
// Compares two null-terminated strings in memory.
// Returns in r1: 0 if equal, 1 if str1 > str2, -1 (u32 max) if str1 < str2.
//
// Register usage:
//   r2 = current addr1
//   r3 = current addr2
//   r4 = loaded char1
//   r5 = loaded char2
//   r6 = scratch (1 for increment)
fn compile_strcmp() -> Program {
    let mut p = Program::new();

    p.instruction(op::MOV, 0, 2, 10); // r2 = str1 addr
    p.instruction(op::MOV, 0, 3, 11); // r3 = str2 addr
    p.ldi(6, 1);                       // r6 = 1 (increment)

    // Loop: load chars, compare
    let loop_start = p.pixels.len();

    // Load chars
    p.load(4, 2); // r4 = *r2
    p.load(5, 3); // r5 = *r3

    // If r4 != 0, skip null check
    p.instruction(op::BRANCH, assembler::bcond::BNE, 4, 0);
    p.pixels.push(0); // placeholder: jump to r4_not_zero
    let bne1_pc = p.pixels.len() - 1;

    // r4 == 0, check r5
    p.instruction(op::BRANCH, assembler::bcond::BNE, 5, 0);
    p.pixels.push(0); // placeholder: jump to str1_less
    let bne2_pc = p.pixels.len() - 1;

    // Both zero -> equal, return 0
    p.ldi(1, 0);
    p.instruction(op::RET, 0, 0, 0);

    // r4 == 0 but r5 != 0 -> str1 < str2, return -1
    let str1_less = p.pixels.len();
    let offset = (str1_less as i32) - ((bne2_pc - 1) as i32);
    p.pixels[bne2_pc] = offset as u32;
    p.ldi(1, 0xFFFFFFFF);
    p.instruction(op::RET, 0, 0, 0);

    // r4 != 0: fix up bne1 to jump here
    let r4_not_zero = p.pixels.len();
    let offset = (r4_not_zero as i32) - ((bne1_pc - 1) as i32);
    p.pixels[bne1_pc] = offset as u32;

    // If chars equal, skip to advance/loop
    p.instruction(op::BRANCH, assembler::bcond::BEQ, 4, 5);
    p.pixels.push(0); // placeholder: jump to advance_and_loop
    let beq_same_pc = p.pixels.len() - 1;

    // Different: if r4 >= r5, return 1; else return -1
    p.instruction(op::BRANCH, assembler::bcond::BGE, 4, 5);
    p.pixels.push(0); // placeholder: jump to r4_gt_r5
    let blt_pc = p.pixels.len() - 1;

    // r4 < r5: return -1
    p.ldi(1, 0xFFFFFFFF);
    p.instruction(op::RET, 0, 0, 0);

    // r4 > r5: return 1
    let r4_gt_r5 = p.pixels.len();
    let offset = (r4_gt_r5 as i32) - ((blt_pc - 1) as i32);
    p.pixels[blt_pc] = offset as u32;
    p.ldi(1, 1);
    p.instruction(op::RET, 0, 0, 0);

    // Same chars: advance pointers and loop
    let advance_and_loop = p.pixels.len();
    // Fix up BEQ: when chars equal, jump here
    let offset = (advance_and_loop as i32) - ((beq_same_pc - 1) as i32);
    p.pixels[beq_same_pc] = offset as u32;
    p.instruction(op::ADD, 0, 2, 6); // r2 += 1
    p.instruction(op::ADD, 0, 3, 6); // r3 += 1

    // Jump back to loop
    let jmp_pc = p.pixels.len();
    p.instruction(op::JMP, 0, 0, 0);
    let back_offset = loop_start as i32 - jmp_pc as i32;
    p.pixels.push(back_offset as u32);

    p
}

// ── strlen(r10=str_addr) ──
//
// Returns the length of a null-terminated string in r1.
//
// Register usage:
//   r2 = current addr
//   r3 = count
//   r4 = loaded char
//   r5 = scratch (1)
fn compile_strlen() -> Program {
    let mut p = Program::new();

    p.instruction(op::MOV, 0, 2, 10); // r2 = str addr
    p.ldi(3, 0);                       // r3 = count = 0
    p.ldi(5, 1);                       // r5 = 1

    let loop_start = p.pixels.len();
    p.load(4, 2); // r4 = *r2

    // If r4 == 0, done
    p.instruction(op::BRANCH, assembler::bcond::BEQ, 4, 0);
    p.pixels.push(0); // placeholder: jump to end
    let branch_pc = p.pixels.len() - 1;

    // count++, addr++
    p.instruction(op::ADD, 0, 3, 5); // r3 += 1
    p.instruction(op::ADD, 0, 2, 5); // r2 += 1

    // Jump back
    let jmp_pc = p.pixels.len();
    p.instruction(op::JMP, 0, 0, 0);
    let back_offset = loop_start as i32 - jmp_pc as i32;
    p.pixels.push(back_offset as u32);

    // End: return count
    let end_pc = p.pixels.len();
    let branch_offset = (end_pc as i32) - ((branch_pc - 1) as i32);
    p.pixels[branch_pc] = branch_offset as u32;

    p.instruction(op::MOV, 0, 1, 3); // r1 = count
    p.instruction(op::RET, 0, 0, 0);

    p
}

// ── draw_rect(r10=x, r11=y, r12=width, r13=height, r14=color) ──
//
// Draws a filled rectangle to the screen using PSET.
// Returns 0 in r1.
//
// Register usage:
//   r2 = current y (outer loop)
//   r3 = y + height (outer bound)
//   r4 = current x (inner loop)
//   r5 = x + width (inner bound)
//   r6 = scratch (1)
fn compile_draw_rect() -> Program {
    let mut p = Program::new();

    p.ldi(6, 1);                       // r6 = 1
    p.instruction(op::MOV, 0, 2, 11);  // r2 = y (current)
    // r3 = y + height
    p.instruction(op::MOV, 0, 3, 11);
    p.instruction(op::ADD, 0, 3, 13);

    // Outer loop: while r2 < r3
    let outer_start = p.pixels.len();
    p.instruction(op::BRANCH, assembler::bcond::BGE, 2, 3);
    p.pixels.push(0); // placeholder
    let outer_branch_pc = p.pixels.len() - 1;

    // Inner loop: r4 = x, r5 = x + width
    p.instruction(op::MOV, 0, 4, 10); // r4 = x
    p.instruction(op::MOV, 0, 5, 10);
    p.instruction(op::ADD, 0, 5, 12); // r5 = x + width

    let inner_start = p.pixels.len();
    p.instruction(op::BRANCH, assembler::bcond::BGE, 4, 5);
    p.pixels.push(0); // placeholder
    let inner_branch_pc = p.pixels.len() - 1;

    // PSET r4, r2, r14 (x, y, color)
    p.instruction(op::PSET, 0, 4, 2);
    p.pixels.push(14 as u32); // color register in data word

    // r4 += 1
    p.instruction(op::ADD, 0, 4, 6);

    // Jump back inner
    let inner_jmp = p.pixels.len();
    p.instruction(op::JMP, 0, 0, 0);
    let back = inner_start as i32 - inner_jmp as i32;
    p.pixels.push(back as u32);

    // End inner: fix up branch
    let inner_end = p.pixels.len();
    let offset = (inner_end as i32) - ((inner_branch_pc - 1) as i32);
    p.pixels[inner_branch_pc] = offset as u32;

    // r2 += 1 (next row)
    p.instruction(op::ADD, 0, 2, 6);

    // Jump back outer
    let outer_jmp = p.pixels.len();
    p.instruction(op::JMP, 0, 0, 0);
    let back = outer_start as i32 - outer_jmp as i32;
    p.pixels.push(back as u32);

    // End outer: fix up branch
    let outer_end = p.pixels.len();
    let offset = (outer_end as i32) - ((outer_branch_pc - 1) as i32);
    p.pixels[outer_branch_pc] = offset as u32;

    // Return 0
    p.ldi(1, 0);
    p.instruction(op::RET, 0, 0, 0);

    p
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::software_vm::SoftwareVm;

    /// Load stdlib at STDLIB_BASE, then run a user program.
    fn setup_stdlib_vm() -> (Stdlib, SoftwareVm) {
        let stdlib = Stdlib::compile();
        let mut svm = SoftwareVm::new();
        svm.load_program(STDLIB_BASE, &stdlib.program.pixels);
        (stdlib, svm)
    }

    /// Run a caller program that sets up args and CALLs a stdlib routine.
    fn run_caller(svm: &mut SoftwareVm, _stdlib: &Stdlib, _routine: Routine, caller: &Program) -> crate::vm::VmState {
        let caller_addr = STDLIB_BASE + STDLIB_MAX_SIZE; // place caller after stdlib
        svm.load_program(caller_addr, &caller.pixels);
        svm.spawn_vm(0, caller_addr);

        for _ in 0..100 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        svm.vm_state(0).clone()
    }

    // ── memset test ──

    #[test]
    fn test_memset() {
        let (stdlib, mut svm) = setup_stdlib_vm();
        let memset_addr = stdlib.routine_addr(Routine::Memset);

        // Set up a data region at some address
        let data_base: u32 = 0x00100000;
        for i in 0..10 {
            svm.poke(data_base + i, 0);
        }

        // Caller: set args, call memset, halt
        let mut caller = Program::new();
        caller.ldi(10, data_base);  // r10 = dst
        caller.ldi(11, 42);         // r11 = value
        caller.ldi(12, 10);         // r12 = count
        caller.instruction(op::CALL, 0, 0, 0);
        caller.pixels.push(memset_addr);
        caller.halt();

        let state = run_caller(&mut svm, &stdlib, Routine::Memset, &caller);

        // Verify all 10 pixels are 42
        for i in 0..10 {
            assert_eq!(svm.peek(data_base + i), 42,
                "Pixel {} should be 42 after memset", i);
        }
    }

    // ── memcpy test ──

    #[test]
    fn test_memcpy() {
        let (stdlib, mut svm) = setup_stdlib_vm();
        let memcpy_addr = stdlib.routine_addr(Routine::Memcpy);

        let src_base: u32 = 0x00100000;
        let dst_base: u32 = 0x00110000;

        // Write source data
        for i in 0..5 {
            svm.poke(src_base + i, 100 + i);
        }

        let mut caller = Program::new();
        caller.ldi(10, dst_base);    // r10 = dst
        caller.ldi(11, src_base);    // r11 = src
        caller.ldi(12, 5);           // r12 = count
        caller.instruction(op::CALL, 0, 0, 0);
        caller.pixels.push(memcpy_addr);
        caller.halt();

        let _state = run_caller(&mut svm, &stdlib, Routine::Memcpy, &caller);

        // Verify copy
        for i in 0..5 {
            assert_eq!(svm.peek(dst_base + i), 100 + i,
                "Pixel {} should be {} after memcpy", i, 100 + i);
        }
    }

    // ── strlen test ──

    #[test]
    fn test_strlen() {
        let (stdlib, mut svm) = setup_stdlib_vm();
        let strlen_addr = stdlib.routine_addr(Routine::Strlen);

        let str_addr: u32 = 0x00100000;
        // Write "hello" = [104, 101, 108, 108, 111, 0]
        let hello: &[u32] = &[104, 101, 108, 108, 111, 0];
        for (i, &ch) in hello.iter().enumerate() {
            svm.poke(str_addr + i as u32, ch);
        }

        let mut caller = Program::new();
        caller.ldi(10, str_addr);     // r10 = str addr
        caller.instruction(op::CALL, 0, 0, 0);
        caller.pixels.push(strlen_addr);
        caller.halt();

        let state = run_caller(&mut svm, &stdlib, Routine::Strlen, &caller);
        assert_eq!(state.regs[1], 5, "strlen(\"hello\") should be 5");
    }

    // ── strcmp test ──

    #[test]
    fn test_strcmp_equal() {
        let (stdlib, mut svm) = setup_stdlib_vm();
        let strcmp_addr = stdlib.routine_addr(Routine::Strcmp);

        let s1: u32 = 0x00100000;
        let s2: u32 = 0x00110000;
        // "abc"
        for (i, &ch) in [97u32, 98, 99, 0].iter().enumerate() {
            svm.poke(s1 + i as u32, ch);
            svm.poke(s2 + i as u32, ch);
        }

        let mut caller = Program::new();
        caller.ldi(10, s1);
        caller.ldi(11, s2);
        caller.instruction(op::CALL, 0, 0, 0);
        caller.pixels.push(strcmp_addr);
        caller.halt();

        let state = run_caller(&mut svm, &stdlib, Routine::Strcmp, &caller);
        assert_eq!(state.regs[1], 0, "strcmp(\"abc\", \"abc\") should return 0 (equal)");
    }

    #[test]
    fn test_strcmp_less() {
        let (stdlib, mut svm) = setup_stdlib_vm();
        let strcmp_addr = stdlib.routine_addr(Routine::Strcmp);

        let s1: u32 = 0x00100000;
        let s2: u32 = 0x00110000;
        // s1 = "aab", s2 = "abc"
        for (i, &ch) in [97u32, 97, 98, 0].iter().enumerate() {
            svm.poke(s1 + i as u32, ch);
        }
        for (i, &ch) in [97u32, 98, 99, 0].iter().enumerate() {
            svm.poke(s2 + i as u32, ch);
        }

        let mut caller = Program::new();
        caller.ldi(10, s1);
        caller.ldi(11, s2);
        caller.instruction(op::CALL, 0, 0, 0);
        caller.pixels.push(strcmp_addr);
        caller.halt();

        let state = run_caller(&mut svm, &stdlib, Routine::Strcmp, &caller);
        assert_eq!(state.regs[1], 0xFFFFFFFF, "strcmp(\"aab\", \"abc\") should return -1 (less)");
    }

    // ── Compilation smoke test ──

    #[test]
    fn test_stdlib_compiles() {
        let stdlib = Stdlib::compile();
        assert!(!stdlib.program.pixels.is_empty(), "Stdlib should have pixels");
        assert_eq!(stdlib.offsets.len(), 5, "Should have 5 routines");

        // Check all routines have non-zero size
        for i in 0..stdlib.offsets.len() - 1 {
            let start = stdlib.offsets[i].1 as usize;
            let end = stdlib.offsets[i + 1].1 as usize;
            assert!(end > start, "Routine {} should have non-zero size", stdlib.offsets[i].0.name());
        }

        // Total size should fit in reserved region
        assert!(stdlib.program.pixels.len() as u32 <= STDLIB_MAX_SIZE,
            "Stdlib should fit in reserved region");
    }
}
