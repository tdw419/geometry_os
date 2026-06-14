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
            },

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
                            }
                            // Active Substrate MMIO (Phase: Spatial Computing)
                            else if (SUBSTRATE_MMIO_BASE
                                ..SUBSTRATE_MMIO_BASE + SUBSTRATE_MMIO_SIZE)
                                .contains(&addr)
                            {
                                match addr {
                                    0xE000 => self.regs[reg] = self.substrate_x,
                                    0xE001 => self.regs[reg] = self.substrate_y,
                                    0xE003 => {
                                        #[cfg(feature = "gpu")]
                                        {
                                            if let Some(ref mut substrate) = self.active_substrate {
                                                self.regs[reg] = substrate
                                                    .get_pixel(self.substrate_x, self.substrate_y);
                                            } else {
                                                self.regs[reg] = 0;
                                            }
                                        }
                                        #[cfg(not(feature = "gpu"))]
                                        {
                                            self.regs[reg] = 0;
                                        }
                                    },
                                    0xE004 => self.regs[reg] = self.substrate_cmd,
                                    0xE005 => self.regs[reg] = self.substrate_arg1,
                                    0xE006 => self.regs[reg] = self.substrate_arg2,
                                    0xE007 => self.regs[reg] = self.substrate_status,
                                    0xE008 => self.regs[reg] = self.substrate_result,
                                    _ => self.regs[reg] = self.ram[addr],
                                }
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
                        },
                        None => {
                            self.trigger_segfault();
                            return false;
                        },
                    }
                }
            },

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
                            }
                            // Active Substrate MMIO (Phase: Spatial Computing)
                            else if (SUBSTRATE_MMIO_BASE
                                ..SUBSTRATE_MMIO_BASE + SUBSTRATE_MMIO_SIZE)
                                .contains(&addr)
                            {
                                match addr {
                                    0xE000 => self.substrate_x = self.regs[reg],
                                    0xE001 => self.substrate_y = self.regs[reg],
                                    0xE002 => {
                                        // Trigger injection
                                        #[cfg(feature = "gpu")]
                                        {
                                            let val = self.regs[reg];
                                            if let Some(ref mut substrate) = self.active_substrate {
                                                let taxonomy = (val >> 28) & 0xF;
                                                let dir = (val >> 24) & 0xF;
                                                let color = val & 0x00FFFFFF;
                                                substrate.inject_signal(
                                                    self.substrate_x,
                                                    self.substrate_y,
                                                    taxonomy,
                                                    dir,
                                                    color,
                                                );
                                            }
                                        }
                                    },
                                    0xE004 => {
                                        self.substrate_cmd = self.regs[reg];
                                        self.handle_substrate_command();
                                    },
                                    0xE005 => self.substrate_arg1 = self.regs[reg],
                                    0xE006 => self.substrate_arg2 = self.regs[reg],
                                    0xE007 => self.substrate_status = self.regs[reg],
                                    0xE008 => self.substrate_result = self.regs[reg],
                                    _ => self.ram[addr] = self.regs[reg],
                                }
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
                        },
                        None => {
                            self.trigger_segfault();
                            return false;
                        },
                    }
                }
            },

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
            },

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
            },

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
            },

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
                        },
                        None => {
                            self.trigger_segfault();
                            return false;
                        },
                    }
                }
            },

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
                        },
                        None => {
                            self.trigger_segfault();
                            return false;
                        },
                    }
                }
            },

            // SHLI reg, imm -- shift left by immediate
            0x18 => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] <<= (imm % 32) as usize;
                }
            },

            // SHRI reg, imm -- logical shift right by immediate
            0x19 => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] >>= (imm % 32) as usize;
                }
            },

            // SARI reg, imm -- arithmetic shift right by immediate
            0x1A => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    let v = self.regs[rd] as i32;
                    self.regs[rd] = (v >> ((imm % 32) as usize)) as u32;
                }
            },

            // ADDI reg, imm -- add immediate to register
            0x1B => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_add(imm);
                }
            },

            // SUBI reg, imm -- subtract immediate from register
            0x1C => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] = self.regs[rd].wrapping_sub(imm);
                }
            },

            // ANDI reg, imm -- bitwise AND with immediate
            0x1D => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] &= imm;
                }
            },

            // ORI reg, imm -- bitwise OR with immediate
            0x1E => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] |= imm;
                }
            },

            // XORI reg, imm -- bitwise XOR with immediate
            0x1F => {
                let rd = self.fetch() as usize;
                let imm = self.fetch();
                if rd < NUM_REGS {
                    self.regs[rd] ^= imm;
                }
            },

            // BANK reg, dest_addr -- Swap 4KB chunk (64x64 pixels) from VAST Substrate into RAM
            // reg: packed chunk coordinates (0xXXXXYYYY)
            // dest_addr: base RAM address to write into
            0x2C => {
                let r_coords = self.fetch() as usize;
                let dest_addr = self.fetch() as usize;
                if r_coords < NUM_REGS {
                    let packed = self.regs[r_coords];
                    let cx = (packed >> 16) as i16 as i32;
                    let cy = (packed & 0xFFFF) as i16 as i32;

                    // Fetch chunk from TileStore (O(1) from memory or EPL)
                    let wx = cx * crate::tile_store::CHUNK_SIZE as i32;
                    let wy = cy * crate::tile_store::CHUNK_SIZE as i32;

                    // We need to release the borrow on self before accessing self.ram
                    let pixels = {
                        self.tile_store.ensure_chunk(cx, cy);
                        let chunk = self.tile_store.get_or_create_chunk(wx, wy);
                        chunk.pixels.clone()
                    };

                    for i in 0..pixels.len() {
                        if dest_addr + i < self.ram.len() {
                            self.ram[dest_addr + i] = pixels[i];
                        }
                    }
                }
            },
            _ => {},
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

    #[test]
    fn test_bank_opcode() {
        let mut vm = setup_vm();
        // Setup a chunk in TileStore
        let cx = 1i32;
        let cy = 2i32;
        let wx = cx * crate::tile_store::CHUNK_SIZE as i32;
        let wy = cy * crate::tile_store::CHUNK_SIZE as i32;
        vm.tile_store.set_pixel(wx, wy, 0xABCDEF);
        vm.tile_store.set_pixel(wx + 1, wy, 0x123456);

        vm.pc = 0;
        vm.ram[0] = 1; // coord reg r1
        vm.ram[1] = 0x5000; // dest addr
        vm.regs[1] = ((cx as u32) << 16) | (cy as u16 as u32);

        vm.step_memory(0x2C);
        assert_eq!(vm.ram[0x5000], 0xABCDEF);
        assert_eq!(vm.ram[0x5001], 0x123456);
    }

    // ── Substrate MMIO (0xE004-0xE008) ─────────────────────────
    //
    // Substrate registers are accessed via LOAD/STORE to MMIO addresses:
    //   0xE004 = cmd    (STORE triggers handle_substrate_command)
    //   0xE005 = arg1
    //   0xE006 = arg2
    //   0xE007 = status
    //   0xE008 = result
    //
    // Protocol: write arg1/arg2, then write cmd (triggers handler),
    //           then read status/result to check outcome.

    // ── Deliverable 1: Command register write triggers handler ──

    #[test]
    fn test_substrate_cmd_nop_no_change() {
        // cmd=0x00 is NOP: status stays 0, no side effects
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1; // addr_reg r1
        vm.ram[1] = 2; // val_reg r2
        vm.regs[1] = 0xE004; // substrate cmd register
        vm.regs[2] = 0x00; // NOP command
        vm.step_memory(0x12); // STORE r1, r2
        assert_eq!(vm.substrate_cmd, 0x00);
        assert_eq!(vm.substrate_status, 0, "NOP should not change status");
    }

    #[test]
    fn test_substrate_cmd_unknown_sets_error() {
        // cmd=0xFF is unknown: status should be 0xFF (error)
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1; // addr_reg r1
        vm.ram[1] = 2; // val_reg r2
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0xFF; // unknown command
        vm.step_memory(0x12); // STORE
        assert_eq!(vm.substrate_cmd, 0xFF);
        assert_eq!(
            vm.substrate_status, 0xFF,
            "unknown cmd should set error status"
        );
    }

    #[test]
    fn test_substrate_cmd_write_triggers_handler() {
        // Verify STORE to 0xE004 triggers the handler by checking
        // a cmd that sets status=2 (CIRCUIT_LOAD with id=1)
        let mut vm = setup_vm();
        // Pre-set arg1 = 1 (fibonacci circuit id)
        vm.substrate_arg1 = 1;
        vm.pc = 0;
        vm.ram[0] = 1; // addr_reg r1
        vm.ram[1] = 2; // val_reg r2
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x02; // CIRCUIT_LOAD command
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_cmd, 0x02);
        assert_eq!(
            vm.substrate_status, 2,
            "CIRCUIT_LOAD should set status=2 (done)"
        );
    }

    #[test]
    fn test_substrate_cmd_write_circuit_read_sets_done() {
        // cmd=0x04 (CIRCUIT_READ) sets status=2 and reads result
        let mut vm = setup_vm();
        vm.substrate_arg1 = 0; // port 0
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x04; // CIRCUIT_READ
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_cmd, 0x04);
        assert_eq!(vm.substrate_status, 2, "CIRCUIT_READ should set status=2");
        // Without GPU, read_circuit_port returns 0
        assert_eq!(vm.substrate_result, 0, "CIRCUIT_READ without GPU returns 0");
    }

    #[test]
    fn test_substrate_cmd_fire_sets_done() {
        // cmd=0x05 (CIRCUIT_FIRE) sets status=2
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x05; // CIRCUIT_FIRE
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_status, 2, "CIRCUIT_FIRE should set status=2");
    }

    #[test]
    fn test_substrate_cmd_defrag_sets_done() {
        // cmd=0x06 (SUBSTRATE_DEFRAG) sets status=2
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x06; // SUBSTRATE_DEFRAG
        vm.step_memory(0x12);
        assert_eq!(
            vm.substrate_status, 2,
            "SUBSTRATE_DEFRAG should set status=2"
        );
    }

    // ── Deliverable 2: Status polling and result readback ───────

    #[test]
    fn test_substrate_load_cmd_register() {
        // LOAD from 0xE004 reads substrate_cmd
        let mut vm = setup_vm();
        vm.substrate_cmd = 0x42;
        vm.pc = 0;
        vm.ram[0] = 5; // dest_reg r5
        vm.ram[1] = 1; // addr_reg r1
        vm.regs[1] = 0xE004;
        vm.step_memory(0x11); // LOAD
        assert_eq!(
            vm.regs[5], 0x42,
            "LOAD from 0xE004 should return substrate_cmd"
        );
    }

    #[test]
    fn test_substrate_load_arg1_register() {
        // LOAD from 0xE005 reads substrate_arg1
        let mut vm = setup_vm();
        vm.substrate_arg1 = 0x1234;
        vm.pc = 0;
        vm.ram[0] = 3; // dest r3
        vm.ram[1] = 1; // addr r1
        vm.regs[1] = 0xE005;
        vm.step_memory(0x11);
        assert_eq!(
            vm.regs[3], 0x1234,
            "LOAD from 0xE005 should return substrate_arg1"
        );
    }

    #[test]
    fn test_substrate_load_arg2_register() {
        // LOAD from 0xE006 reads substrate_arg2
        let mut vm = setup_vm();
        vm.substrate_arg2 = 0x5678;
        vm.pc = 0;
        vm.ram[0] = 4; // dest r4
        vm.ram[1] = 1; // addr r1
        vm.regs[1] = 0xE006;
        vm.step_memory(0x11);
        assert_eq!(
            vm.regs[4], 0x5678,
            "LOAD from 0xE006 should return substrate_arg2"
        );
    }

    #[test]
    fn test_substrate_load_status_register() {
        // LOAD from 0xE007 reads substrate_status
        let mut vm = setup_vm();
        vm.substrate_status = 2;
        vm.pc = 0;
        vm.ram[0] = 6; // dest r6
        vm.ram[1] = 1; // addr r1
        vm.regs[1] = 0xE007;
        vm.step_memory(0x11);
        assert_eq!(
            vm.regs[6], 2,
            "LOAD from 0xE007 should return substrate_status"
        );
    }

    #[test]
    fn test_substrate_load_result_register() {
        // LOAD from 0xE008 reads substrate_result
        let mut vm = setup_vm();
        vm.substrate_result = 0xBEEF;
        vm.pc = 0;
        vm.ram[0] = 7; // dest r7
        vm.ram[1] = 1; // addr r1
        vm.regs[1] = 0xE008;
        vm.step_memory(0x11);
        assert_eq!(
            vm.regs[7], 0xBEEF,
            "LOAD from 0xE008 should return substrate_result"
        );
    }

    #[test]
    fn test_substrate_store_arg1_then_cmd_triggers() {
        // Full protocol: write arg1 to 0xE005, then write cmd to 0xE004
        // Verify arg1 is available to the handler
        let mut vm = setup_vm();

        // Step 1: STORE arg1=42 to 0xE005
        vm.pc = 0;
        vm.ram[0] = 1; // addr_reg r1
        vm.ram[1] = 2; // val_reg r2
        vm.regs[1] = 0xE005; // arg1 register
        vm.regs[2] = 42;
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_arg1, 42);

        // Step 2: STORE cmd=0x03 (CIRCUIT_WRITE) to 0xE004
        vm.pc = 10;
        vm.ram[10] = 1; // addr_reg r1
        vm.ram[11] = 2; // val_reg r2
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x03; // CIRCUIT_WRITE
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_cmd, 0x03);
        assert_eq!(vm.substrate_status, 2, "CIRCUIT_WRITE should set status=2");
    }

    #[test]
    fn test_substrate_store_arg2_then_read_back() {
        // Write arg2 to 0xE006, then read it back via LOAD
        let mut vm = setup_vm();

        // STORE arg2=0xABCD to 0xE006
        vm.pc = 0;
        vm.ram[0] = 1; // addr_reg
        vm.ram[1] = 2; // val_reg
        vm.regs[1] = 0xE006;
        vm.regs[2] = 0xABCD;
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_arg2, 0xABCD);

        // LOAD from 0xE006 to verify
        vm.pc = 10;
        vm.ram[10] = 3; // dest r3
        vm.ram[11] = 1; // addr r1
        vm.regs[1] = 0xE006;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[3], 0xABCD, "roundtrip: STORE then LOAD arg2");
    }

    #[test]
    fn test_substrate_full_polling_cycle() {
        // Simulate a complete command cycle:
        // 1. Write args
        // 2. Write cmd (triggers handler)
        // 3. Poll status via LOAD until done
        let mut vm = setup_vm();

        // Write arg1 (circuit id) via direct field (simulating prior STORE)
        vm.substrate_arg1 = 1;

        // Write cmd=0x02 (CIRCUIT_LOAD)
        vm.pc = 0;
        vm.ram[0] = 1; // addr_reg
        vm.ram[1] = 2; // val_reg
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x02;
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_status, 2);

        // Poll status via LOAD from 0xE007
        vm.pc = 10;
        vm.ram[10] = 5; // dest r5
        vm.ram[11] = 1; // addr r1
        vm.regs[1] = 0xE007;
        vm.step_memory(0x11);
        assert_eq!(vm.regs[5], 2, "status polling should return done (2)");
    }

    // ── Deliverable 3: Error codes for invalid commands ─────────

    #[test]
    fn test_substrate_error_unknown_cmd_0x0A() {
        // cmd=0x0A is the first unknown (past valid range 0x00-0x09)
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x0A;
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_status, 0xFF, "cmd 0x0A should error");
    }

    #[test]
    fn test_substrate_error_unknown_cmd_0x80() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x80;
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_status, 0xFF, "cmd 0x80 should error");
    }

    #[test]
    fn test_substrate_error_unknown_cmd_0xFF() {
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0xFF;
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_status, 0xFF, "cmd 0xFF should error");
    }

    #[test]
    fn test_substrate_error_max_valid_cmd_no_error() {
        // cmd=0x09 is the last valid command (SUBSTRATE_PATCH)
        // Without GPU, it won't set status=2, but it also should NOT error
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x09;
        vm.step_memory(0x12);
        assert_ne!(vm.substrate_status, 0xFF, "cmd 0x09 should not error");
    }

    #[test]
    fn test_substrate_error_preserves_cmd_value() {
        // After an error, the cmd register should still hold the invalid cmd
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0xFE;
        vm.step_memory(0x12);
        assert_eq!(
            vm.substrate_cmd, 0xFE,
            "cmd should be preserved after error"
        );
        assert_eq!(vm.substrate_status, 0xFF, "status should indicate error");
    }

    #[test]
    fn test_substrate_error_does_not_modify_result() {
        // An error command should not change substrate_result
        let mut vm = setup_vm();
        vm.substrate_result = 0x12345678;
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0xBB; // unknown
        vm.step_memory(0x12);
        assert_eq!(
            vm.substrate_result, 0x12345678,
            "error should not modify substrate_result"
        );
    }

    #[test]
    fn test_substrate_error_then_valid_cmd_clears_error() {
        // After an error, sending a valid command should reset status
        let mut vm = setup_vm();

        // First: trigger error
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0xFE;
        vm.step_memory(0x12);
        assert_eq!(vm.substrate_status, 0xFF);

        // Second: send valid cmd (0x00 = NOP, status stays 0 from prior error)
        // But we can use cmd=0x02 with arg1=1 which sets status=2
        vm.substrate_arg1 = 1;
        vm.pc = 10;
        vm.ram[10] = 1;
        vm.ram[11] = 2;
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0x02; // CIRCUIT_LOAD
        vm.step_memory(0x12);
        assert_eq!(
            vm.substrate_status, 2,
            "valid cmd after error should update status to done"
        );
    }

    #[test]
    fn test_substrate_store_status_direct() {
        // STORE to 0xE007 writes directly to substrate_status (no side effects)
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE007;
        vm.regs[2] = 99;
        vm.step_memory(0x12);
        assert_eq!(
            vm.substrate_status, 99,
            "direct STORE to status register should work"
        );
    }

    #[test]
    fn test_substrate_store_result_direct() {
        // STORE to 0xE008 writes directly to substrate_result
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE008;
        vm.regs[2] = 0xDEAD;
        vm.step_memory(0x12);
        assert_eq!(
            vm.substrate_result, 0xDEAD,
            "direct STORE to result register should work"
        );
    }

    // ── Deliverable 3: MMIO address range bounds ───────────────────

    #[test]
    fn test_substrate_addr_below_range_falls_to_ram() {
        // Address 0xDFFF is just below the substrate range (0xE000-0xEFFF)
        // Should fall through to normal RAM handling
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xDFFF;
        vm.regs[2] = 0xBEEF;
        vm.step_memory(0x12);
        assert_eq!(
            vm.ram[0xDFFF], 0xBEEF,
            "address below substrate range should write to RAM"
        );
    }

    #[test]
    fn test_substrate_addr_above_range_falls_to_ram() {
        // Address 0xF000 is just above the substrate range (0xE000-0xEFFF)
        // Should fall through to normal RAM handling
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xF000;
        vm.regs[2] = 0xCAFE;
        vm.step_memory(0x12);
        assert_eq!(
            vm.ram[0xF000], 0xCAFE,
            "address above substrate range should write to RAM"
        );
    }

    #[test]
    fn test_substrate_unhandled_addr_in_range_falls_to_ram() {
        // Address 0xE003 is within substrate range (0xE000-0xEFFF) but not explicitly handled
        // Should fall through to RAM via the _ => self.ram[addr] = self.regs[reg] fallback
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE003;
        vm.regs[2] = 0xDEAD;
        vm.step_memory(0x12);
        assert_eq!(
            vm.ram[0xE003], 0xDEAD,
            "unhandled substrate address should write to RAM"
        );
    }

    #[test]
    fn test_substrate_addr_e009_falls_to_ram() {
        // Address 0xE009 is within substrate range but not explicitly handled
        // (only 0xE000-0xE008 are explicit matches)
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE009;
        vm.regs[2] = 0xABCD;
        vm.step_memory(0x12);
        assert_eq!(vm.ram[0xE009], 0xABCD, "0xE009 should write to RAM");
    }

    #[test]
    fn test_substrate_addr_high_in_range_falls_to_ram() {
        // Address 0xE800 is well within substrate range (0xE000-0xEFFF) but not handled
        // Should fall through to RAM
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xE800;
        vm.regs[2] = 0x9999;
        vm.step_memory(0x12);
        assert_eq!(vm.ram[0xE800], 0x9999, "0xE800 should write to RAM");
    }

    #[test]
    fn test_substrate_addr_top_of_range_falls_to_ram() {
        // Address 0xEFFF is the last address in the substrate range
        // Should fall through to RAM
        let mut vm = setup_vm();
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xEFFF;
        vm.regs[2] = 0x1111;
        vm.step_memory(0x12);
        assert_eq!(vm.ram[0xEFFF], 0x1111, "0xEFFF should write to RAM");
    }

    #[test]
    fn test_substrate_load_unhandled_addr_reads_ram() {
        // LOAD from an unhandled substrate address should read from RAM
        // Using 0xE009 which is within substrate range but not explicitly handled
        let mut vm = setup_vm();
        vm.ram[0xE009] = 0x5555;
        vm.pc = 0;
        vm.ram[0] = 3; // dest r3
        vm.ram[1] = 1; // addr r1
        vm.regs[1] = 0xE009;
        vm.step_memory(0x11);
        assert_eq!(
            vm.regs[3], 0x5555,
            "LOAD from unhandled substrate address should read RAM"
        );
    }

    #[test]
    fn test_substrate_all_explicit_addrs_handled() {
        // Verify all explicitly handled substrate addresses (0xE000-0xE008) don't fall to RAM
        let mut vm = Vm::new();
        let test_addrs = [
            0xE000, 0xE001, 0xE002, 0xE004, 0xE005, 0xE006, 0xE007, 0xE008,
        ];

        for addr in test_addrs {
            vm.pc = 0;
            vm.ram[0] = 1;
            vm.ram[1] = 2;
            vm.regs[1] = addr;
            vm.regs[2] = 0xDEAD;
            vm.step_memory(0x12);
            // RAM at this address should NOT be written to (it's handled specially)
            // Note: 0xE002 is special (signal injection), but it also doesn't write to RAM
            assert_ne!(
                vm.ram[addr as usize], 0xDEAD,
                "address 0x{:04X} should be explicitly handled, not fall to RAM",
                addr
            );
        }
    }
    #[test]
    fn test_substrate_boundary_below_does_not_trigger_cmd() {
        // Writing to 0xDFFF (just below substrate range) should NOT trigger handle_substrate_command
        let mut vm = Vm::new();
        vm.substrate_cmd = 0x00;
        vm.substrate_status = 0;
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xDFFF;
        vm.regs[2] = 0x02;
        vm.step_memory(0x12);
        // substrate_cmd and status should remain unchanged
        assert_eq!(
            vm.substrate_cmd, 0x00,
            "0xDFFF write should not trigger command handler"
        );
        assert_eq!(vm.substrate_status, 0, "status should remain unchanged");
    }

    #[test]
    fn test_substrate_boundary_above_does_not_trigger_cmd() {
        // Writing to 0xF000 (just above substrate range) should NOT trigger handle_substrate_command
        let mut vm = Vm::new();
        vm.substrate_cmd = 0x00;
        vm.substrate_status = 0;
        vm.pc = 0;
        vm.ram[0] = 1;
        vm.ram[1] = 2;
        vm.regs[1] = 0xF000;
        vm.regs[2] = 0x02;
        vm.step_memory(0x12);
        assert_eq!(
            vm.substrate_cmd, 0x00,
            "0xF000 write should not trigger command handler"
        );
        assert_eq!(vm.substrate_status, 0, "status should remain unchanged");
    }
}
