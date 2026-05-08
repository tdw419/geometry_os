use super::types::*;
use super::Vm;

impl Vm {
    /// Handle memory opcodes (0x10-0x1F).
    /// Returns false if halted (segfault), true otherwise.
    #[allow(unreachable_patterns)]
    pub(super) fn step_memory(&mut self, opcode: u32) -> bool {
        match opcode {
            // LDI reg, imm  -- load immediate
            0x10 => {
                let reg = self.fetch() as usize;
                let imm = self.fetch();
                if reg < NUM_REGS {
                    self.regs[reg] = imm;
                }
            }

            // LOAD reg, addr_reg  -- load from RAM (page-translated)
            0x11 => {
                let reg = self.fetch() as usize;
                let addr_reg = self.fetch() as usize;
                if reg < NUM_REGS && addr_reg < NUM_REGS {
                    let vaddr = self.regs[addr_reg];
                    match self.translate_va_or_fault(vaddr) {
                        Some(addr) => {
                            // Key bitmask port (0xFFB) -- separate field to avoid
                            // bytecode overlap for large programs
                            // Restricted to focused_pid: non-focused processes get 0.
                            if addr == 0xFFB {
                                if self.current_pid == self.focused_pid {
                                    self.regs[reg] = self.key_bitmask;
                                } else {
                                    self.regs[reg] = 0;
                                }
                            }
                            // TICKS port (0xFFE) -- separate field to avoid
                            // bytecode overlap for large programs (e.g., world_desktop.asm)
                            else if addr == 0xFFE {
                                self.regs[reg] = self.frame_count;
                            }
                            // Phase 46: Intercept screen buffer range
                            else if (SCREEN_RAM_BASE..SCREEN_RAM_BASE + SCREEN_SIZE)
                                .contains(&addr)
                            {
                                self.regs[reg] = self.screen[addr - SCREEN_RAM_BASE];
                                self.log_access(addr, MemAccessKind::Read);
                            } else if addr < self.ram.len() {
                                // Phase 45: Intercept canvas RAM range
                                if (CANVAS_RAM_BASE..CANVAS_RAM_BASE + CANVAS_RAM_SIZE)
                                    .contains(&addr)
                                {
                                    self.regs[reg] = self.canvas_buffer[addr - CANVAS_RAM_BASE];
                                } else {
                                    self.regs[reg] = self.ram[addr];
                                }
                                self.log_access(addr, MemAccessKind::Read);
                            } else {
                                self.trigger_segfault();
                                return false;
                            }
                        }
                        None => {
                            self.trigger_segfault();
                            return false;
                        }
                    }
                }
            }

            // STORE addr_reg, reg  -- store to RAM (page-translated, COW-aware)
            0x12 => {
                let addr_reg = self.fetch() as usize;
                let reg = self.fetch() as usize;
                if addr_reg < NUM_REGS && reg < NUM_REGS {
                    let vaddr = self.regs[addr_reg];
                    // Check COW before writing: if the target physical page is shared,
                    // copy it to a private page first
                    self.resolve_cow_if_needed(vaddr);
                    match self.translate_va_or_fault(vaddr) {
                        Some(addr) => {
                            // Key bitmask port (0xFFB) -- separate field to avoid
                            // bytecode overlap for large programs
                            if addr == 0xFFB {
                                self.key_bitmask = self.regs[reg];
                            }
                            // TICKS port (0xFFE) -- no-op: read-only counter,
                            // prevents bytecode clobber for large programs
                            else if addr == 0xFFE {
                                // read-only, discard write
                            }
                            // Phase 46: Intercept screen buffer range
                            else if (SCREEN_RAM_BASE..SCREEN_RAM_BASE + SCREEN_SIZE)
                                .contains(&addr)
                            {
                                self.screen[addr - SCREEN_RAM_BASE] = self.regs[reg];
                                self.log_access(addr, MemAccessKind::Write);
                            } else if addr < self.ram.len() {
                                if self.mode == CpuMode::User && addr >= 0xFF00 {
                                    self.trigger_segfault();
                                    return false;
                                }
                                // Phase 45: Intercept canvas RAM range
                                if (CANVAS_RAM_BASE..CANVAS_RAM_BASE + CANVAS_RAM_SIZE)
                                    .contains(&addr)
                                {
                                    let cidx = addr - CANVAS_RAM_BASE;
                                    self.canvas_buffer[cidx] = self.regs[reg];
                                    // Phase 50: Trigger formula recalculation
                                    self.formula_recalc(cidx);
                                } else {
                                    // Invalidate instruction cache if writing to code memory
                                    if addr < self.icache.len() && self.ram[addr] != self.regs[reg]
                                    {
                                        self.icache_invalidate_range(addr, addr + 1);
                                    }
                                    self.ram[addr] = self.regs[reg];
                                }
                                self.log_access(addr, MemAccessKind::Write);
                            } else {
                                self.trigger_segfault();
                                return false;
                            }
                        }
                        None => {
                            self.trigger_segfault();
                            return false;
                        }
                    }
                }
            }

            // TEXTI x, y, "string" -- render inline text (no RAM setup needed)
            // Encoding: 0x13, x_imm, y_imm, char_count, char1, char2, ...
            0x13 => {
                let x = self.fetch() as usize;
                let y = self.fetch() as usize;
                let count = self.fetch() as usize;
                let mut sx = x;
                let mut sy = y;
                let fg = 0xFFFFFF; // white text
                for _ in 0..count {
                    let ch = self.fetch();
                    if ch == 0 {
                        continue;
                    }
                    let byte = (ch & 0xFF) as u8;
                    if byte == b'\n' {
                        sx = x;
                        sy += 10;
                        continue;
                    }
                    self.draw_char(byte, sx, sy, fg);
                    sx += 6;
                    if sx > 250 {
                        sx = x;
                        sy += 8;
                    }
                }
            }

            // STRO addr_reg, "string" -- store inline string at address in register
            // Encoding: 0x14, addr_reg, char_count, char1, char2, ...
            0x14 => {
                let ar = self.fetch() as usize;
                let count = self.fetch() as usize;
                if ar < NUM_REGS {
                    let mut vaddr = self.regs[ar];
                    for _ in 0..count {
                        let ch = self.fetch();
                        if let Some(addr) = self.translate_va_or_fault(vaddr) {
                            if (SCREEN_RAM_BASE..SCREEN_RAM_BASE + SCREEN_SIZE).contains(&addr) {
                                self.screen[addr - SCREEN_RAM_BASE] = ch;
                                self.log_access(addr, MemAccessKind::Write);
                            } else if addr < self.ram.len() {
                                if (CANVAS_RAM_BASE..CANVAS_RAM_BASE + CANVAS_RAM_SIZE)
                                    .contains(&addr)
                                {
                                    let cidx = addr - CANVAS_RAM_BASE;
                                    self.canvas_buffer[cidx] = ch;
                                    self.formula_recalc(cidx);
                                } else {
                                    self.ram[addr] = ch;
                                }
                                self.log_access(addr, MemAccessKind::Write);
                            }
                        }
                        vaddr = vaddr.wrapping_add(1);
                    }
                    // null-terminate if possible
                    if let Some(addr) = self.translate_va_or_fault(vaddr) {
                        if (SCREEN_RAM_BASE..SCREEN_RAM_BASE + SCREEN_SIZE).contains(&addr) {
                            self.screen[addr - SCREEN_RAM_BASE] = 0;
                        } else if addr < self.ram.len() {
                            if (CANVAS_RAM_BASE..CANVAS_RAM_BASE + CANVAS_RAM_SIZE).contains(&addr)
                            {
                                let cidx = addr - CANVAS_RAM_BASE;
                                self.canvas_buffer[cidx] = 0;
                                self.formula_recalc(cidx);
                            } else {
                                self.ram[addr] = 0;
                            }
                        }
                    }
                }
            }

            // CMPI reg, imm -- compare register against immediate, sets r0
            0x15 => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    let a = self.regs[rd] as i32;
                    let b = imm as i32;
                    self.regs[0] = if a < b {
                        0xFFFFFFFF
                    } else if a > b {
                        1
                    } else {
                        0
                    };
                }
            }

            // LOADS reg, offset -- load from SP + offset (stack-relative)
            0x16 => {
                let rd = self.fetch() as usize;
                let offset = self.fetch() as i32 as usize;
                if rd < NUM_REGS {
                    let sp = self.regs[30] as usize;
                    let vaddr = if offset < 0x80000000 {
                        sp.wrapping_add(offset)
                    } else {
                        sp.wrapping_sub(0x100000000_usize - offset)
                    };
                    match self.translate_va_or_fault(vaddr as u32) {
                        Some(addr) => {
                            if (SCREEN_RAM_BASE..SCREEN_RAM_BASE + SCREEN_SIZE).contains(&addr) {
                                self.regs[rd] = self.screen[addr - SCREEN_RAM_BASE];
                                self.log_access(addr, MemAccessKind::Read);
                            } else if addr < self.ram.len() {
                                if (CANVAS_RAM_BASE..CANVAS_RAM_BASE + CANVAS_RAM_SIZE)
                                    .contains(&addr)
                                {
                                    self.regs[rd] = self.canvas_buffer[addr - CANVAS_RAM_BASE];
                                } else {
                                    self.regs[rd] = self.ram[addr];
                                }
                                self.log_access(addr, MemAccessKind::Read);
                            } else {
                                self.trigger_segfault();
                                return false;
                            }
                        }
                        None => {
                            self.trigger_segfault();
                            return false;
                        }
                    }
                }
            }

            // STORES offset, reg -- store to SP + offset (stack-relative, COW-aware)
            0x17 => {
                let offset = self.fetch() as i32;
                let rs = self.fetch() as usize;
                if rs < NUM_REGS {
                    let sp = self.regs[30] as i32;
                    let vaddr = sp.wrapping_add(offset) as u32;
                    self.resolve_cow_if_needed(vaddr);
                    match self.translate_va_or_fault(vaddr) {
                        Some(addr) => {
                            if (SCREEN_RAM_BASE..SCREEN_RAM_BASE + SCREEN_SIZE).contains(&addr) {
                                self.screen[addr - SCREEN_RAM_BASE] = self.regs[rs];
                                self.log_access(addr, MemAccessKind::Write);
                            } else if addr < self.ram.len() {
                                if self.mode == CpuMode::User && addr >= 0xFF00 {
                                    self.trigger_segfault();
                                    return false;
                                }
                                if (CANVAS_RAM_BASE..CANVAS_RAM_BASE + CANVAS_RAM_SIZE)
                                    .contains(&addr)
                                {
                                    let cidx = addr - CANVAS_RAM_BASE;
                                    self.canvas_buffer[cidx] = self.regs[rs];
                                    self.formula_recalc(cidx);
                                } else {
                                    self.ram[addr] = self.regs[rs];
                                }
                                self.log_access(addr, MemAccessKind::Write);
                            } else {
                                self.trigger_segfault();
                                return false;
                            }
                        }
                        None => {
                            self.trigger_segfault();
                            return false;
                        }
                    }
                }
            }

            // SHLI reg, imm -- shift left by immediate
            0x18 => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] <<= (imm % 32) as usize;
                }
            }

            // SHRI reg, imm -- logical shift right by immediate
            0x19 => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] >>= (imm % 32) as usize;
                }
            }

            // SARI reg, imm -- arithmetic shift right by immediate
            0x1A => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    let v = self.regs[rd] as i32;
                    self.regs[rd] = (v >> ((imm % 32) as usize)) as u32;
                }
            }

            // ADDI reg, imm -- add immediate to register
            0x1B => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_add(imm);
                }
            }

            // SUBI reg, imm -- subtract immediate from register
            0x1C => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_sub(imm);
                }
            }

            // ANDI reg, imm -- bitwise AND with immediate
            0x1D => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] &= imm;
                }
            }

            // ORI reg, imm -- bitwise OR with immediate
            0x1E => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] |= imm;
                }
            }

            // XORI reg, imm -- bitwise XOR with immediate
            0x1F => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] ^= imm;
                }
            }
            _ => {}
        }
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::types::*;

    /// Helper: create a fresh VM with PC set to `pc` and no page directory.
    /// For step_memory tests, ram[pc..] must contain the opcode arguments.
    fn setup_vm() -> Vm {
        let mut vm = Vm::new();
        vm.current_page_dir = None;
        vm
    }

    // ── LDI (0x10) ──────────────────────────────────────────────

    #[test]
    fn test_ldi_loads_immediate() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1; // reg r1
        vm.ram[1] = 42; // imm
        vm.step_memory(0x10);
        assert_eq!(vm.regs[1], 42);
    }

    #[test]
    fn test_ldi_large_immediate() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 5; // reg r5
        vm.ram[1] = 0xDEADBEEF; // large value
        vm.step_memory(0x10);
        assert_eq!(vm.regs[5], 0xDEADBEEF);
    }

    #[test]
    fn test_ldi_invalid_register_ignored() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 50; // register 50 >= NUM_REGS
        vm.ram[1] = 99;
        vm.step_memory(0x10);
        // No crash, register 50 doesn't exist
    }

    // ── LOAD (0x11) — canvas buffer interception ────────────────

    #[test]
    fn test_load_canvas_buffer_reads_canvas_not_ram() {
        let mut vm = setup_vm();
        vm.canvas_buffer[5] = 0xABCDEF;
        vm.ram[0x8005] = 999; // should be ignored
        vm.pc = 0;
        vm.ram[0] = 2; // dest reg r2
        vm.ram[1] = 1; // addr reg r1
        vm.regs[1] = 0x8005; // address in canvas range
        vm.step_memory(0x11);
        assert_eq!(vm.regs[2], 0xABCDEF);
    }

    #[test]
    fn test_load_canvas_buffer_boundary_start() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0x111111;
        vm.ram[CANVAS_RAM_BASE] = 0x222222; // should be ignored
        vm.pc = 0;
        vm.ram[0] = 3; // dest r3
        vm.ram[1] = 4; // addr r4
        vm.regs[4] = CANVAS_RAM_BASE as u32;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[3], 0x111111);
    }

    #[test]
    fn test_load_canvas_buffer_boundary_end() {
        let mut vm = setup_vm();
        let last_idx = CANVAS_RAM_SIZE - 1;
        vm.canvas_buffer[last_idx] = 0x999999;
        vm.pc = 0;
        vm.ram[0] = 5; // dest r5
        vm.ram[1] = 6; // addr r6
        vm.regs[6] = (CANVAS_RAM_BASE + last_idx) as u32;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[5], 0x999999);
    }

    // ── STORE (0x12) — canvas buffer interception ───────────────

    #[test]
    fn test_store_canvas_buffer_writes_canvas_not_ram() {
        let mut vm = setup_vm();
        vm.ram[0x8005] = 999; // initial RAM value
        vm.pc = 0;
        vm.ram[0] = 1; // addr reg r1
        vm.ram[1] = 3; // val reg r3
        vm.regs[1] = 0x8005; // canvas address
        vm.regs[3] = 0x123456;
        vm.step_memory(0x12);
        assert_eq!(vm.canvas_buffer[5], 0x123456);
        assert_eq!(vm.ram[0x8005], 999, "RAM should be unchanged");
    }

    #[test]
    fn test_store_canvas_boundary_end() {
        let mut vm = setup_vm();
        let last_idx = CANVAS_RAM_SIZE - 1;
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = (CANVAS_RAM_BASE + last_idx) as u32;
        vm.regs[2] = 0xFEEDFACE;
        vm.step_memory(0x12);
        assert_eq!(vm.canvas_buffer[last_idx], 0xFEEDFACE);
    }

    // ── LOAD/STORE — regular RAM (outside canvas) ───────────────

    #[test]
    fn test_load_regular_ram_outside_canvas() {
        let mut vm = setup_vm();
        vm.ram[0x3000] = 42;
        vm.pc = 0;
        vm.ram[0] = 2; // dest r2
        vm.ram[1] = 1; // addr r1
        vm.regs[1] = 0x3000;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[2], 42);
    }

    #[test]
    fn test_store_regular_ram_outside_canvas() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 3;
        vm.regs[1] = 0x5000;
        vm.regs[3] = 99;
        vm.step_memory(0x12);
        assert_eq!(vm.ram[0x5000], 99);
    }

    #[test]
    fn test_load_regular_ram_at_address_zero() {
        let mut vm = setup_vm();
        vm.ram[0] = 0x10; // put LDI at addr 0 to avoid clobbering test
        vm.ram[10] = 77;
        vm.pc = 100; // use a safe PC
        vm.ram[100] = 2;
        vm.ram[101] = 1;
        vm.regs[1] = 10;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[2], 77);
    }

    // ── LOAD/STORE — special ports ──────────────────────────────

    #[test]
    fn test_load_ticks_port() {
        let mut vm = setup_vm();
        vm.frame_count = 12345;
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[2] = 0xFFE;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[1], 12345);
    }

    #[test]
    fn test_store_ticks_port_is_noop() {
        let mut vm = setup_vm();
        vm.frame_count = 100;
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xFFE;
        vm.regs[2] = 999;
        vm.step_memory(0x12);
        assert_eq!(vm.frame_count, 100, "TICKS should be read-only");
    }

    #[test]
    fn test_load_key_bitmask_focused_process() {
        let mut vm = setup_vm();
        vm.key_bitmask = 0x1F;
        vm.focused_pid = 1;
        vm.current_pid = 1;
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[2] = 0xFFB;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[1], 0x1F);
    }

    #[test]
    fn test_load_key_bitmask_unfocused_process() {
        let mut vm = setup_vm();
        vm.key_bitmask = 0x1F;
        vm.focused_pid = 1;
        vm.current_pid = 2; // different from focused
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[2] = 0xFFB;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[1], 0, "unfocused process gets 0");
    }

    #[test]
    fn test_store_key_bitmask() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xFFB;
        vm.regs[2] = 0x0A;
        vm.step_memory(0x12);
        assert_eq!(vm.key_bitmask, 0x0A);
    }

    // ── LOAD/STORE — out of bounds ──────────────────────────────

    #[test]
    fn test_load_out_of_bounds_triggers_segfault() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[2] = 0x20000; // past screen buffer range (0x10000-0x1FFFF)
        let result = vm.step_memory(0x11);
        assert!(!result, "should halt on out-of-bounds LOAD");
        assert!(vm.segfault);
    }

    #[test]
    fn test_store_out_of_bounds_triggers_segfault() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0x20000; // past screen buffer range (0x10000-0x1FFFF)
        vm.regs[2] = 42;
        let result = vm.step_memory(0x12);
        assert!(!result, "should halt on out-of-bounds STORE");
        assert!(vm.segfault);
    }

    // ── CMPI (0x15) ────────────────────────────────────────────

    #[test]
    fn test_cmpi_less_than() {
        let mut vm = setup_vm();
        vm.regs[5] = 3;
        vm.pc = 0;
        vm.ram[0] = 5; // reg r5
        vm.ram[1] = 10; // imm
        vm.step_memory(0x15);
        assert_eq!(vm.regs[0], 0xFFFFFFFF, "r0 should be -1 (less)");
    }

    #[test]
    fn test_cmpi_equal() {
        let mut vm = setup_vm();
        vm.regs[5] = 10;
        vm.pc = 0;
        vm.ram[0] = 5;
        vm.ram[1] = 10;
        vm.step_memory(0x15);
        assert_eq!(vm.regs[0], 0, "r0 should be 0 (equal)");
    }

    #[test]
    fn test_cmpi_greater_than() {
        let mut vm = setup_vm();
        vm.regs[5] = 20;
        vm.pc = 0;
        vm.ram[0] = 5;
        vm.ram[1] = 10;
        vm.step_memory(0x15);
        assert_eq!(vm.regs[0], 1, "r0 should be 1 (greater)");
    }

    // ── Immediate shift ops ─────────────────────────────────────

    #[test]
    fn test_shli_basic() {
        let mut vm = setup_vm();
        vm.regs[3] = 1;
        vm.pc = 0;
        vm.ram[0] = 3; // r3
        vm.ram[1] = 4; // shift 4
        vm.step_memory(0x18);
        assert_eq!(vm.regs[3], 16);
    }

    #[test]
    fn test_shri_basic() {
        let mut vm = setup_vm();
        vm.regs[3] = 16;
        vm.pc = 0;
        vm.ram[0] = 3;
        vm.ram[1] = 2;
        vm.step_memory(0x19);
        assert_eq!(vm.regs[3], 4);
    }

    #[test]
    fn test_sari_preserves_sign() {
        let mut vm = setup_vm();
        vm.regs[3] = 0xFFFFFFF0u32; // -16 as i32
        vm.pc = 0;
        vm.ram[0] = 3;
        vm.ram[1] = 2; // arithmetic shift right by 2
        vm.step_memory(0x1A);
        assert_eq!(vm.regs[3], 0xFFFFFFFCu32, "should sign-extend");
    }

    // ── Immediate arithmetic ops ────────────────────────────────

    #[test]
    fn test_addi_basic() {
        let mut vm = setup_vm();
        vm.regs[4] = 100;
        vm.pc = 0;
        vm.ram[0] = 4;
        vm.ram[1] = 50;
        vm.step_memory(0x1B);
        assert_eq!(vm.regs[4], 150);
    }

    #[test]
    fn test_subi_basic() {
        let mut vm = setup_vm();
        vm.regs[4] = 100;
        vm.pc = 0;
        vm.ram[0] = 4;
        vm.ram[1] = 30;
        vm.step_memory(0x1C);
        assert_eq!(vm.regs[4], 70);
    }

    // ── Immediate bitwise ops ───────────────────────────────────

    #[test]
    fn test_andi_basic() {
        let mut vm = setup_vm();
        vm.regs[5] = 0xFF;
        vm.pc = 0;
        vm.ram[0] = 5;
        vm.ram[1] = 0x0F;
        vm.step_memory(0x1D);
        assert_eq!(vm.regs[5], 0x0F);
    }

    #[test]
    fn test_ori_basic() {
        let mut vm = setup_vm();
        vm.regs[5] = 0xF0;
        vm.pc = 0;
        vm.ram[0] = 5;
        vm.ram[1] = 0x0F;
        vm.step_memory(0x1E);
        assert_eq!(vm.regs[5], 0xFF);
    }

    #[test]
    fn test_xori_basic() {
        let mut vm = setup_vm();
        vm.regs[5] = 0xFF;
        vm.pc = 0;
        vm.ram[0] = 5;
        vm.ram[1] = 0x0F;
        vm.step_memory(0x1F);
        assert_eq!(vm.regs[5], 0xF0);
    }

    // ── STRO (0x14) ────────────────────────────────────────────

    #[test]
    fn test_stro_stores_null_terminated_string() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1; // addr_reg r1
        vm.ram[1] = 3; // char count
        vm.ram[2] = 72; // 'H'
        vm.ram[3] = 73; // 'I'
        vm.ram[4] = 33; // '!'
        vm.regs[1] = 0x5000;
        vm.step_memory(0x14);
        assert_eq!(vm.ram[0x5000], 72);
        assert_eq!(vm.ram[0x5001], 73);
        assert_eq!(vm.ram[0x5002], 33);
        assert_eq!(vm.ram[0x5003], 0, "null terminator");
    }

    // ── LOADS/STORES (stack-relative) ───────────────────────────

    #[test]
    fn test_loads_stack_relative() {
        let mut vm = setup_vm();
        vm.regs[30] = 0xFF00; // SP
        vm.ram[0xFF05] = 123; // SP+5
        vm.pc = 0;
        vm.ram[0] = 2; // dest r2
        vm.ram[1] = 5; // offset
        vm.step_memory(0x16);
        assert_eq!(vm.regs[2], 123);
    }

    #[test]
    fn test_stores_stack_relative() {
        let mut vm = setup_vm();
        vm.regs[30] = 0xFF00; // SP
        vm.pc = 0;
        vm.ram[0] = 5; // offset
        vm.ram[1] = 3; // val reg r3
        vm.regs[3] = 77;
        vm.step_memory(0x17);
        assert_eq!(vm.ram[0xFF05], 77);
    }
}
