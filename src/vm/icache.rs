// icache.rs -- Instruction Cache for Hot Loop Performance
//
// Pre-decodes instructions (opcode + operands) and caches them by PC address.
// Hot loops that repeatedly execute the same instructions skip the per-operand
// fetch() calls and branch directly to cached execution paths.
//
// Strategy:
// - Direct-mapped: Vec<Option<DecodedInstruction>> indexed by PC
// - Lazy population: decode only after ICACHE_HOT_THRESHOLD visits to same PC
// - Generation-based invalidation: STORE to code memory bumps generation,
//   stale entries are detected and refreshed on next access
// - Only cacheable opcodes (ALU, branch, load/store, mov, cmp) are cached.
//   Complex opcodes (FRAME, syscalls, graphics) are not cached because their
//   fetch overhead is negligible vs execution cost.

use super::types::*;
use super::Vm;

impl Vm {
    /// Check if an opcode is cacheable. Only simple, fixed-format opcodes
    /// benefit from caching. Complex opcodes with variable behavior during
    /// fetch or heavy execution cost are excluded.
    #[inline]
    pub fn is_icacheable(opcode: u32) -> bool {
        match opcode {
            // ALU: rd, rs (2 operands)
            0x20..=0x29 | 0x2B => true, // ADD..MOD, SAR
            // ALU: rd (1 operand)
            0x2A => true, // NEG
            // Branches: addr (1 operand)
            0x30 => true, // JMP
            0x33 => true, // CALL
            // Branches: reg, addr (2 operands)
            0x31..=0x32 => true, // JZ, JNZ
            0x35..=0x36 => true, // BLT, BGE
            // No operands
            0x34 => true, // RET
            // Memory: reg, imm (2 operands)
            0x10 => true, // LDI
            // Memory: reg, addr_reg (2 operands)
            0x11 | 0x12 => true, // LOAD, STORE
            // MOV (0x51), CMP (0x50): rd, rs (2 operands)
            0x50 | 0x51 => true,
            // Stack: reg (1 operand)
            0x60 | 0x61 => true, // PUSH, POP
            // NOP, HALT (0 operands)
            0x00 | 0x01 => true,
            // Everything else: not cacheable (complex, variable behavior)
            _ => false,
        }
    }

    /// Determine the number of operand words for a cacheable opcode.
    /// Returns 0 for opcodes with no operands (HALT, NOP, RET).
    /// Panics if called with a non-cacheable opcode.
    #[inline]
    pub fn icache_operand_count(opcode: u32) -> u8 {
        match opcode {
            0x00 | 0x01 | 0x34 => 0, // HALT, NOP, RET
            0x2A | 0x30 | 0x33 | 0x60 | 0x61 => 1, // NEG, JMP, CALL, PUSH, POP
            0x10 | 0x11 | 0x12 | 0x50 | 0x51 => 2, // LDI, LOAD, STORE, CMP, MOV
            0x20..=0x29 | 0x2B => 2, // ADD..MOD, SAR
            0x31 | 0x32 | 0x35 | 0x36 => 2, // JZ, JNZ, BLT, BGE
            _ => 0, // unreachable for cacheable opcodes
        }
    }

    /// Decode instruction at current PC and populate the cache entry.
    /// Reads the opcode and all operand words from RAM, stores them in a
    /// DecodedInstruction, and advances PC past the full instruction.
    /// Returns the decoded instruction.
    #[inline]
    pub(super) fn icache_decode(&mut self, pc_addr: usize) -> DecodedInstruction {
        let opcode = self.ram[pc_addr];
        let num_ops = Self::icache_operand_count(opcode) as usize;
        let mut ops = [0u32; 4];

        // Read operand words directly from RAM (no fetch() overhead)
        for i in 0..num_ops {
            let addr = pc_addr + 1 + i;
            if addr < self.ram.len() {
                ops[i] = self.ram[addr];
            }
        }

        DecodedInstruction {
            opcode,
            ops,
            num_ops: num_ops as u8,
            generation: self.icache_generation,
        }
    }

    /// Try to look up a cached instruction at the given PC.
    /// Returns Some(decoded) if cache hit with valid generation.
    /// Returns None on miss or stale entry.
    #[inline]
    pub fn icache_lookup(&self, pc_addr: usize) -> Option<DecodedInstruction> {
        if pc_addr >= self.icache.len() {
            return None;
        }
        self.icache[pc_addr].and_then(|entry| {
            if entry.generation == self.icache_generation {
                Some(entry)
            } else {
                None // stale -- code was modified
            }
        })
    }

    /// Store a decoded instruction in the cache at the given PC.
    #[inline]
    pub fn icache_store(&mut self, pc_addr: usize, decoded: DecodedInstruction) {
        if pc_addr < self.icache.len() {
            self.icache[pc_addr] = Some(decoded);
        }
    }

    /// Invalidate cache entries in a range of PC addresses.
    /// Called when STORE writes to code memory to prevent stale cached
    /// instructions from being used.
    /// Uses generation-based invalidation for efficiency: just bumps the
    /// global generation counter rather than clearing individual entries.
    #[inline]
    pub fn icache_invalidate_range(&mut self, _start: usize, _end: usize) {
        // Generation-based invalidation: all existing entries become stale.
        // This is O(1) vs O(range_size) for per-entry clearing.
        self.icache_generation = self.icache_generation.wrapping_add(1);
    }

    /// Clear the entire instruction cache. Called on VM reset.
    pub fn icache_clear(&mut self) {
        for entry in self.icache.iter_mut() {
            *entry = None;
        }
        for freq in self.icache_freq.iter_mut() {
            *freq = 0;
        }
        self.icache_generation = 0;
        self.icache_hits = 0;
        self.icache_misses = 0;
    }

    /// Execute a cached instruction using pre-decoded operands.
    /// This is the fast path for hot loops. Operands are already fetched,
    /// so we just execute the operation directly.
    /// Returns:
    ///   Some(true)  = instruction executed, continue
    ///   Some(false) = halt (HALT opcode)
    ///   None        = not a cacheable instruction or uncacheable execution
    ///                 (falls through to normal step() match)
    #[inline]
    pub fn icache_execute(&mut self, decoded: &DecodedInstruction) -> Option<bool> {
        let opcode = decoded.opcode;
        let ops = &decoded.ops;

        match opcode {
            // HALT
            0x00 => {
                self.halted = true;
                return Some(false);
            }

            // NOP
            0x01 => {}

            // LDI reg, imm
            0x10 => {
                let reg = ops[0] as usize;
                if reg < NUM_REGS {
                    self.regs[reg] = ops[1];
                }
            }

            // LOAD reg, addr_reg
            0x11 => {
                let reg = ops[0] as usize;
                let addr_reg = ops[1] as usize;
                if reg < NUM_REGS && addr_reg < NUM_REGS {
                    let vaddr = self.regs[addr_reg];
                    match self.translate_va_or_fault(vaddr) {
                        Some(addr) => {
                            // Handle special ports
                            if addr == 0xFFB {
                                if self.current_pid == self.focused_pid {
                                    self.regs[reg] = self.key_bitmask;
                                } else {
                                    self.regs[reg] = 0;
                                }
                            } else if addr == 0xFFE {
                                self.regs[reg] = self.frame_count;
                            } else if addr >= CANVAS_RAM_BASE
                                && addr < CANVAS_RAM_BASE + CANVAS_RAM_SIZE
                            {
                                self.regs[reg] = self.canvas_buffer[addr - CANVAS_RAM_BASE];
                            } else if addr < self.ram.len() {
                                self.regs[reg] = self.ram[addr];
                                self.log_access(addr, MemAccessKind::Read);
                            } else {
                                self.trigger_segfault();
                                return Some(false);
                            }
                        }
                        None => {
                            self.trigger_segfault();
                            return Some(false);
                        }
                    }
                }
            }

            // STORE addr_reg, reg  (matches ops_memory.rs: fetch addr_reg first, reg second)
            0x12 => {
                let addr_reg = ops[0] as usize;
                let reg = ops[1] as usize;
                if reg < NUM_REGS && addr_reg < NUM_REGS {
                    let val = self.regs[reg];
                    let vaddr = self.regs[addr_reg];
                    match self.translate_va_or_fault(vaddr) {
                        Some(addr) => {
                            if addr >= CANVAS_RAM_BASE
                                && addr < CANVAS_RAM_BASE + CANVAS_RAM_SIZE
                            {
                                self.canvas_buffer[addr - CANVAS_RAM_BASE] = val;
                            } else if addr < self.ram.len() {
                                // Invalidate instruction cache if writing to code memory
                                if addr < self.icache.len() && val != self.ram[addr] {
                                    self.icache_invalidate_range(addr, addr + 1);
                                }
                                self.ram[addr] = val;
                                self.log_access(addr, MemAccessKind::Write);
                            } else {
                                self.trigger_segfault();
                                return Some(false);
                            }
                        }
                        None => {
                            self.trigger_segfault();
                            return Some(false);
                        }
                    }
                }
            }

            // CMP rd, rs -- sets r0 to -1 if rd < rs, 0 if equal, 1 if rd > rs
            0x50 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[0] = match self.regs[rd].cmp(&self.regs[rs]) {
                        std::cmp::Ordering::Less => 0xFFFFFFFF,
                        std::cmp::Ordering::Equal => 0,
                        std::cmp::Ordering::Greater => 1,
                    };
                }
            }

            // MOV rd, rs
            0x51 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[rd] = self.regs[rs];
                }
            }

            // ADD rd, rs
            0x20 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_add(self.regs[rs]);
                }
            }

            // SUB rd, rs
            0x21 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_sub(self.regs[rs]);
                }
            }

            // MUL rd, rs
            0x22 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_mul(self.regs[rs]);
                }
            }

            // DIV rd, rs
            0x23 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS && self.regs[rs] != 0 {
                    self.regs[rd] /= self.regs[rs];
                }
            }

            // AND rd, rs
            0x24 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[rd] &= self.regs[rs];
                }
            }

            // OR rd, rs
            0x25 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[rd] |= self.regs[rs];
                }
            }

            // XOR rd, rs
            0x26 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    self.regs[rd] ^= self.regs[rs];
                }
            }

            // SHL rd, rs
            0x27 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    let shift = self.regs[rs] % 32;
                    self.regs[rd] = self.regs[rd].wrapping_shl(shift);
                }
            }

            // SHR rd, rs
            0x28 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    let shift = self.regs[rs] % 32;
                    self.regs[rd] = self.regs[rd].wrapping_shr(shift);
                }
            }

            // MOD rd, rs
            0x29 => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS && self.regs[rs] != 0 {
                    self.regs[rd] %= self.regs[rs];
                }
            }

            // NEG rd
            0x2A => {
                let rd = ops[0] as usize;
                if rd < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_neg();
                }
            }

            // SAR rd, rs
            0x2B => {
                let rd = ops[0] as usize;
                let rs = ops[1] as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    let shift = self.regs[rs] % 32;
                    self.regs[rd] = ((self.regs[rd] as i32) >> shift) as u32;
                }
            }

            // JMP addr
            0x30 => {
                self.pc = ops[0];
                return Some(true);
            }

            // JZ reg, addr
            0x31 => {
                let reg = ops[0] as usize;
                if reg < NUM_REGS && self.regs[reg] == 0 {
                    self.pc = ops[1];
                    return Some(true);
                }
            }

            // JNZ reg, addr
            0x32 => {
                let reg = ops[0] as usize;
                if reg < NUM_REGS && self.regs[reg] != 0 {
                    self.pc = ops[1];
                    return Some(true);
                }
            }

            // CALL addr
            0x33 => {
                if NUM_REGS > 0 {
                    self.regs[31] = self.pc;
                }
                self.pc = ops[0];
                return Some(true);
            }

            // RET
            0x34 => {
                self.pc = self.regs[31];
                return Some(true);
            }

            // BLT reg, addr
            0x35 => {
                if self.regs[0] == 0xFFFFFFFF {
                    self.pc = ops[1];
                    return Some(true);
                }
            }

            // BGE reg, addr
            0x36 => {
                if self.regs[0] != 0xFFFFFFFF {
                    self.pc = ops[1];
                    return Some(true);
                }
            }

            // PUSH reg
            0x60 => {
                let reg = ops[0] as usize;
                if reg < NUM_REGS {
                    let sp = self.regs[30];
                    if sp > 0 {
                        let new_sp = sp - 1;
                        match self.translate_va_or_fault(new_sp) {
                            Some(addr) if addr < self.ram.len() => {
                                self.ram[addr] = self.regs[reg];
                                self.regs[30] = new_sp;
                            }
                            None => {
                                self.trigger_segfault();
                                return Some(false);
                            }
                            _ => {}
                        }
                    }
                }
            }

            // POP reg
            0x61 => {
                let reg = ops[0] as usize;
                if reg < NUM_REGS {
                    let sp = self.regs[30];
                    match self.translate_va_or_fault(sp) {
                        Some(addr) if addr < self.ram.len() => {
                            self.regs[reg] = self.ram[addr];
                            self.regs[30] = sp + 1;
                        }
                        None => {
                            self.trigger_segfault();
                            return Some(false);
                        }
                        _ => {}
                    }
                }
            }

            // Not a cacheable opcode (shouldn't happen if icache_lookup filters correctly)
            _ => return None,
        }

        Some(true)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::Vm;
    use std::time::Instant;

    // Opcodes
    const HALT: u32 = 0x00;
    const NOP: u32 = 0x01;
    const LDI: u32 = 0x10;
    const LOAD: u32 = 0x11;
    const STORE: u32 = 0x12;
    const MOV: u32 = 0x51;
    const CMP: u32 = 0x50;
    const ADD: u32 = 0x20;
    const SUB: u32 = 0x21;
    const MUL: u32 = 0x22;
    const DIV: u32 = 0x23;
    const AND: u32 = 0x24;
    const OR: u32 = 0x25;
    const XOR: u32 = 0x26;
    const SHL: u32 = 0x27;
    const SHR: u32 = 0x28;
    const MOD: u32 = 0x29;
    const NEG: u32 = 0x2A;
    const SAR: u32 = 0x2B;
    const JMP: u32 = 0x30;
    const JZ: u32 = 0x31;
    const JNZ: u32 = 0x32;
    const CALL: u32 = 0x33;
    const RET: u32 = 0x34;
    const BLT: u32 = 0x35;
    const BGE: u32 = 0x36;
    const PUSH: u32 = 0x60;
    const POP: u32 = 0x61;

    /// Load a program into RAM starting at addr, set PC to addr.
    fn load_program(vm: &mut Vm, addr: usize, words: &[u32]) {
        for (i, &w) in words.iter().enumerate() {
            if addr + i < vm.ram.len() {
                vm.ram[addr + i] = w;
            }
        }
        vm.pc = addr as u32;
    }

    /// Run up to max_steps, return (steps_taken, halted).
    fn run_steps(vm: &mut Vm, max_steps: u64) -> (u64, bool) {
        let mut steps = 0u64;
        for _ in 0..max_steps {
            if !vm.step() {
                break;
            }
            steps += 1;
        }
        (steps, vm.halted)
    }

    #[test]
    fn test_basic_add() {
        // LDI r1, 10; LDI r2, 20; ADD r1, r2; HALT
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[LDI, 1, 10, LDI, 2, 20, ADD, 1, 2, HALT]);
        let (steps, halted) = run_steps(&mut vm, 100);
        assert!(halted);
        assert_eq!(vm.regs[1], 30);
        assert_eq!(vm.regs[2], 20);
        assert_eq!(steps, 4);
    }

    #[test]
    fn test_basic_sub_mul_div() {
        // r1 = 100, r2 = 30
        // SUB: r1 = 70, MUL: r1 = 2100, DIV: r1 = 70
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 100, LDI, 2, 30,
            SUB, 1, 2,    // r1 = 70
            MUL, 1, 2,    // r1 = 2100
            DIV, 1, 2,    // r1 = 70
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[1], 70);
    }

    #[test]
    fn test_bitwise_ops() {
        // r1 = 0xFF, r2 = 0x0F
        // AND: 0x0F, OR: 0xFF, XOR: 0xF0, SHL 4: 0xF00, SHR 4: 0xF0
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0xFF, LDI, 2, 0x0F,
            AND, 1, 2,    // r1 = 0x0F
            OR, 1, 2,     // r1 = 0x0F | 0x0F = 0x0F
            LDI, 1, 0xFF, // reset
            XOR, 1, 2,    // r1 = 0xF0
            LDI, 2, 4,    // shift amount
            SHL, 1, 2,    // r1 = 0xF0 << 4 = 0xF00
            SHR, 1, 2,    // r1 = 0xF00 >> 4 = 0xF0
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[1], 0xF0);
    }

    #[test]
    fn test_mov() {
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 42,
            MOV, 2, 1,  // r2 = r1
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[2], 42);
    }

    #[test]
    fn test_cmp_and_branches() {
        // CMP r1, r2 sets r0 = -1 (less), 0 (equal), 1 (greater)
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 5, LDI, 2, 10,
            CMP, 1, 2,     // r0 = 0xFFFFFFFF (5 < 10)
            BGE, 0, 12,    // r0 != 0xFFFFFFFF? No. Don't jump.
            BLT, 0, 15,    // r0 == 0xFFFFFFFF? Yes. Jump to addr 15.
            LDI, 3, 999,   // should be skipped
            HALT,
            LDI, 3, 1,     // addr 15: landed here
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[3], 1);
    }

    #[test]
    fn test_jz_jnz() {
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0,      // r1 = 0
            JZ, 1, 9,       // jump to addr 9 (r1 == 0)
            LDI, 3, 999,    // skip
            HALT,
            LDI, 3, 1,      // addr 9
            LDI, 1, 42,     // r1 = 42 (non-zero)
            JNZ, 1, 18,     // jump to addr 18 (r1 != 0)
            LDI, 3, 999,    // skip
            HALT,
            LDI, 3, 2,      // addr 18
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[3], 2);
    }

    #[test]
    fn test_loop_100_iterations() {
        // Count from 0 to 100 in r1
        // 0: LDI r1, 0
        // 3: LDI r2, 1
        // 6: LDI r3, 100
        // 9: ADD r1, r2
        // 12: CMP r1, r3
        // 15: BGE 0, 21
        // 18: JMP 9
        // 21: HALT
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0, LDI, 2, 1, LDI, 3, 100,
            ADD, 1, 2,
            CMP, 1, 3,
            BGE, 0, 21,
            JMP, 9,
            HALT,
        ]);
        let (steps, halted) = run_steps(&mut vm, 10_000);
        assert!(halted);
        assert_eq!(vm.regs[1], 100);
        // 3 setup + 100 * 4 (ADD, CMP, BGE, JMP) + 1 BGE + 1 HALT = 405
        assert_eq!(steps, 3 + 100 * 4 + 1 + 1);
    }

    #[test]
    fn test_nested_loop() {
        // Outer: r1 = 0..10, Inner: r2 = 0..100
        // 0:  LDI r1, 0
        // 3:  LDI r4, 1
        // 6:  LDI r5, 10
        // 9:  LDI r2, 0       ; reset inner
        // 12: LDI r3, 100
        // 15: ADD r2, r4      ; r2++
        // 18: CMP r2, r3
        // 21: BGE 0, 30       ; exit inner
        // 24: JMP 15          ; continue inner
        // 27: ADD r1, r4      ; r1++ (outer)
        // 30: CMP r1, r5
        // 33: BGE 0, 42       ; exit outer
        // 36: JMP 9           ; continue outer
        // 39: HALT
        // 42: HALT
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0, LDI, 4, 1, LDI, 5, 10,
            LDI, 2, 0, LDI, 3, 100,
            ADD, 2, 4,
            CMP, 2, 3,
            BGE, 0, 30,
            JMP, 15,
            ADD, 1, 4,
            CMP, 1, 5,
            BGE, 0, 42,
            JMP, 9,
            HALT,
            HALT,
        ]);
        let (_, halted) = run_steps(&mut vm, 200_000);
        assert!(halted);
        assert_eq!(vm.regs[1], 10);
    }

    #[test]
    fn test_call_ret() {
        // Main calls subroutine at addr 12, which sets r3=99 and returns
        // 0: LDI r1, 42
        // 3: CALL 12
        // 6: HALT
        // ...
        // 12: LDI r3, 99
        // 15: RET
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 42,
            CALL, 12,
            HALT,
            NOP, NOP, NOP,  // padding
            NOP, NOP, NOP,
            LDI, 3, 99,
            RET,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[1], 42);
        assert_eq!(vm.regs[3], 99);
    }

    #[test]
    fn test_push_pop() {
        // Push r1 to stack, pop into r2
        // Need to set up stack pointer
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 30, 500,    // SP = 500
            LDI, 1, 42,      // r1 = 42
            PUSH, 1,         // push r1
            LDI, 1, 0,       // clobber r1
            POP, 2,          // pop into r2
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[2], 42);
        assert_eq!(vm.regs[30], 500); // SP restored
    }

    #[test]
    fn test_self_modifying_code() {
        // Overwrite a JMP with HALT via STORE
        // 0: LDI r1, 0        ; value = HALT opcode
        // 3: LDI r2, 12       ; target address
        // 6: STORE 1, 2       ; RAM[12] = 0 (HALT)
        // 9: LDI r3, 42
        // 12: JMP 9           ; will be overwritten to HALT
        // 15: HALT            ; fallback
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0,        // HALT opcode value
            LDI, 2, 12,       // target addr
            STORE, 1, 2,      // RAM[12] = HALT
            LDI, 3, 42,       // r3 = 42
            JMP, 9,           // addr 12: will be HALT now
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted, "VM should halt via self-modified code");
        assert_eq!(vm.regs[3], 42);
    }

    #[test]
    fn test_neg() {
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 42,
            NEG, 1,     // r1 = -42
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[1], 0xFFFFFFD6); // -42 in u32
    }

    #[test]
    fn test_mod() {
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 17,
            LDI, 2, 5,
            MOD, 1, 2,  // 17 % 5 = 2
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        assert_eq!(vm.regs[1], 2);
    }

    #[test]
    fn test_sar() {
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0x80000010u32, // negative-ish
            LDI, 2, 4,
            SAR, 1, 2,  // arithmetic shift right by 4
            HALT,
        ]);
        run_steps(&mut vm, 100);
        assert!(vm.halted);
        // 0x80000010 as i32 = -2147483632, >> 4 = -134217727 = 0xF8000001
        assert_eq!(vm.regs[1], 0xF8000001);
    }

    #[test]
    fn test_cache_hit_rate() {
        // Run a tight loop and verify cache hit rate is high
        let iterations = 500u32;
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0, LDI, 2, 1, LDI, 3, iterations,
            ADD, 1, 2,
            CMP, 1, 3,
            BGE, 0, 21,
            JMP, 9,
            HALT,
        ]);
        run_steps(&mut vm, 100_000);
        assert!(vm.halted);
        let total = vm.icache_hits + vm.icache_misses;
        if total > 0 {
            let hit_rate = vm.icache_hits as f64 / total as f64;
            assert!(
                hit_rate > 0.80,
                "Cache hit rate should be > 80%, got {:.1}% (hits={}, misses={})",
                hit_rate * 100.0,
                vm.icache_hits,
                vm.icache_misses
            );
        }
    }

    #[test]
    fn test_icache_clear() {
        let mut vm = Vm::new();
        // Populate cache
        load_program(&mut vm, 0, &[
            LDI, 1, 0, LDI, 2, 1, LDI, 3, 10,
            ADD, 1, 2, CMP, 1, 3, BGE, 0, 21, JMP, 9, HALT,
        ]);
        run_steps(&mut vm, 100_000);

        // Verify cache has entries
        assert!(vm.icache_hits > 0, "Should have cache hits before clear");

        // Clear and verify
        vm.icache_clear();
        assert_eq!(vm.icache_hits, 0);
        assert_eq!(vm.icache_misses, 0);
        assert_eq!(vm.icache_generation, 0);
        for entry in &vm.icache {
            assert!(entry.is_none(), "All entries should be None after clear");
        }
    }

    #[test]
    fn test_generation_invalidation() {
        let mut vm = Vm::new();
        // First: populate cache with a loop
        load_program(&mut vm, 0, &[
            LDI, 1, 0, LDI, 2, 1, LDI, 3, 5,
            ADD, 1, 2, CMP, 1, 3, BGE, 0, 21, JMP, 9,
            HALT, HALT, HALT,
            // addr 24+: code that will be written via STORE
        ]);
        run_steps(&mut vm, 100_000);
        assert!(vm.halted);
        let gen_before = vm.icache_generation;

        // Now write to code memory via STORE (bumps generation)
        load_program(&mut vm, 0, &[
            LDI, 30, 600,      // SP
            LDI, 1, 0,         // HALT value
            LDI, 2, 9,         // target address
            STORE, 1, 2,       // RAM[9] = HALT (invalidates cache)
            HALT,
        ]);
        run_steps(&mut vm, 100);

        assert_eq!(vm.icache_generation, gen_before.wrapping_add(1),
            "Generation should have bumped after STORE to code memory");
    }

    #[test]
    fn test_benchmark_hot_loop() {
        // Benchmark: 50k iteration tight loop
        let iterations = 50_000u32;
        let mut vm = Vm::new();
        load_program(&mut vm, 0, &[
            LDI, 1, 0, LDI, 2, 1, LDI, 3, iterations,
            ADD, 1, 2,
            CMP, 1, 3,
            BGE, 0, 21,
            JMP, 9,
            HALT,
        ]);

        let start = Instant::now();
        let (steps, halted) = run_steps(&mut vm, 10_000_000);
        let elapsed = start.elapsed();

        assert!(halted, "VM should halt");
        assert_eq!(vm.regs[1], iterations);
        assert_eq!(steps, 3 + iterations as u64 * 4 + 2);

        let total = vm.icache_hits + vm.icache_misses;
        let hit_rate = if total > 0 { vm.icache_hits as f64 / total as f64 } else { 0.0 };
        let steps_per_sec = if elapsed.as_micros() > 0 {
            steps as f64 / elapsed.as_secs_f64()
        } else {
            f64::MAX
        };

        println!(
            "\n=== icache Benchmark: {} iterations ===\
             \n  Steps: {}\
             \n  Time: {:.2} ms\
             \n  Steps/sec: {:.0}\
             \n  Cache hits: {}\
             \n  Cache misses: {}\
             \n  Hit rate: {:.1}%\
             \n  Generation: {}",
            iterations, steps,
            elapsed.as_secs_f64() * 1000.0,
            steps_per_sec,
            vm.icache_hits, vm.icache_misses,
            hit_rate * 100.0,
            vm.icache_generation,
        );

        // Sanity: should complete in reasonable time
        assert!(elapsed.as_secs() < 10, "Benchmark took too long: {:?}", elapsed);
        // Cache should be warm
        assert!(hit_rate > 0.80, "Hit rate too low: {:.1}%", hit_rate * 100.0);
    }
}
