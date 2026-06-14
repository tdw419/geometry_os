// riscv/kernel_patches.rs -- Configurable kernel patch addresses
//
// Replaces the hardcoded physical addresses in boot.rs with a configurable
// system that can be loaded from a System.map file or set to defaults.
//
// Two strategies:
//   1. Data patches: symbol addresses from System.map (kernel_map, timebase, etc.)
//   2. Instruction patches: pattern-matched in the kernel image (calibrate_delay,
//      udelay, ndelay, setup_vm, ebreak sites) — no addresses needed, scans
//      the binary for known instruction sequences.

/// Kernel symbol addresses needed for boot patching.
///
/// Can be loaded from a System.map file via [`KernelPatches::from_system_map`]
/// or constructed with [`KernelPatches::defaults`] for the original hardcoded kernel.
#[derive(Debug, Clone)]
pub struct KernelPatches {
    // -- Data symbol addresses (physical) --
    /// Physical address of `_dtb_early_va` variable.
    pub dtb_early_va: u64,
    /// Physical address of `_dtb_early_pa` variable.
    pub dtb_early_pa: u64,

    /// Physical address of `kernel_map` struct.
    /// Fields at offsets: +12=phys_addr, +20=va_pa_offset, +24=va_kernel_pa_offset.
    pub kernel_map: u64,

    /// Physical address of `riscv_timebase` variable.
    pub riscv_timebase: u64,

    /// Physical address of `loops_per_jiffy` variable.
    pub loops_per_jiffy: u64,

    /// Physical address of `sbi_debug_console_available` variable.
    pub sbi_dbcn: u64,

    /// Physical address of `memblock` struct.
    /// Used for pre-populating reserved and memory regions.
    pub memblock: u64,

    /// Physical address of `calibrate_delay` function.
    pub calibrate_delay: u64,

    /// Physical address of `udelay` function.
    pub udelay: u64,

    /// Physical address of `ndelay` function.
    pub ndelay: u64,

    /// Physical address of ebreak in `up_read`.
    pub up_read_ebreak: u64,

    /// Physical address of ebreak in `down_read_trylock`.
    pub down_read_ebreak: u64,

    /// Physical address of `setup_vm` function (for instruction pattern scan).
    pub setup_vm: u64,

    /// Physical address of `up_read` function start (for ebreak scan within body).
    pub up_read_fn: u64,

    /// Physical address of `down_read_trylock` function start (for ebreak scan within body).
    pub down_read_trylock_fn: u64,

    /// Physical address of `reserve_initrd_mem` function.
    /// Used to bypass the memblock_is_region_reserved() overlap check
    /// that rejects initrd when page tables are allocated on top of it.
    pub reserve_initrd_mem: u64,

    /// Physical address of `workqueue_init` function.
    /// Contains an EBREAK (BUG_ON/WARN_ON) that fires during early boot.
    /// Patched to NOP so the kernel continues past the assertion.
    pub workqueue_init: u64,

    /// Physical address of `kernel_execve` function.
    pub kernel_execve: u64,

    /// Physical address of the `csrw sscratch, zero` instruction in
    /// relocate_enable_mmu+0x70 (0xC000107C). Replaced with `csrw sscratch, tp`
    /// so handle_exception can save the stack pointer without corrupting init_task.
    pub sscratch_csrw_patch: u64,

    /// Physical address of `abort_creds` function.
    /// The BUG_ON(usage < 2) triggers when exec fails and free_bprm calls
    /// abort_creds with usage=1 (from prepare_exec_creds which doesn't
    /// increment usage past atomic_set's initial value of 1). Patching the
    /// ebreak to NOP lets the kernel continue past the failed exec attempt
    /// and try the next init candidate.
    pub abort_creds: u64,

    /// Physical address of `_start_kernel` (bare-metal entry, past EFI/PE header).
    /// When the ELF entry hits the MZ header, we use this instead.
    pub start_kernel_entry: u64,

    // -- Configuration values --
    /// Timebase frequency to preset (default: 10_000_000 = 10MHz).
    pub timebase_freq: u32,

    /// Loops per jiffy to preset (default: 400_000).
    pub lpj_value: u32,

    /// Whether to use pattern scanning for instruction patches.
    /// When true, the function addresses (calibrate_delay, udelay, etc.)
    /// are used as hints but the actual patch sites are found by scanning
    /// for known instruction patterns. When false, the addresses are used
    /// directly with guard checks.
    pub use_pattern_scan: bool,
}

impl Default for KernelPatches {
    fn default() -> Self {
        Self::defaults()
    }
}

impl KernelPatches {
    /// Hardcoded addresses for the original RV32 vmlinux build.
    ///
    /// These are the values that were previously scattered throughout boot.rs.
    /// They work with exactly one kernel build — use `from_system_map` for
    /// other builds.
    pub fn defaults() -> Self {
        Self {
            dtb_early_va: 0x80801008,
            dtb_early_pa: 0x8080100C,
            kernel_map: 0x80C7A098,
            riscv_timebase: 0x80C7A058,
            loops_per_jiffy: 0x81480A18,
            sbi_dbcn: 0x814820A0,
            memblock: 0x80803448,
            calibrate_delay: 0x800080DA,
            udelay: 0x8021B34E,
            ndelay: 0x8021B308,
            up_read_ebreak: 0x8006CE7C,
            down_read_ebreak: 0x8006C748,
            setup_vm: 0x80404A70,
            up_read_fn: 0x8003A3A2,
            down_read_trylock_fn: 0x8003A03C,
            reserve_initrd_mem: 0x80402B68,
            abort_creds: 0x8002D41E,
            workqueue_init: 0x8040625A,
            sscratch_csrw_patch: 0x800000BC,
            start_kernel_entry: 0x80001084,
            kernel_execve: 0,
            timebase_freq: 10_000_000,
            lpj_value: 400_000,
            use_pattern_scan: true,
        }
    }

    /// Parse a System.map file to extract symbol addresses.
    ///
    /// System.map format: `ADDR TYPE NAME` where ADDR is a hex address
    /// and TYPE is a single letter (T=text, D=data, B=bss, etc.).
    ///
    /// Returns a KernelPatches with all found symbols. Missing symbols
    /// retain their default values.
    pub fn from_system_map(map_text: &str) -> Self {
        let mut p = Self::defaults();
        p.use_pattern_scan = true;

        for line in map_text.lines() {
            let parts: Vec<&str> = line.split_whitespace().collect();
            if parts.len() < 3 {
                continue;
            }
            let addr = match u64::from_str_radix(parts[0], 16) {
                Ok(a) => a,
                Err(_) => continue,
            };
            // Convert kernel VA to PA.
            // RV32 kernel: VA = PA + 0x40000000 (addr >= 0xC0000000)
            // RV64 kernel: VA = PA + 0xFFFFFFFF00000000 (addr >= 0xFFFFFFFF80000000)
            // For RV64, truncating the lower 32 bits gives PA since PA >= 0x80000000.
            let pa = if addr >= 0xFFFFFFFF80000000 {
                // RV64: address like 0xFFFFFFFF80001084 → PA 0x80001084
                (addr & 0xFFFFFFFF) as u64
            } else if addr >= 0xC0000000 {
                // RV32: address like 0xC0001084 → PA 0x80001084
                addr - 0x40000000
            } else if addr >= 0x80000000 {
                addr
            } else {
                continue; // Skip low addresses
            };

            let name = parts[2];
            match name {
                "_dtb_early_va" => p.dtb_early_va = pa,
                "_dtb_early_pa" => p.dtb_early_pa = pa,
                "kernel_map" => p.kernel_map = pa,
                "riscv_timebase" => p.riscv_timebase = pa,
                "loops_per_jiffy" => p.loops_per_jiffy = pa,
                "sbi_debug_console_available" => p.sbi_dbcn = pa,
                "memblock" => p.memblock = pa,
                "calibrate_delay" => p.calibrate_delay = pa,
                "udelay" => p.udelay = pa,
                "ndelay" => p.ndelay = pa,
                "setup_vm" => p.setup_vm = pa,
                "up_read" => {
                    p.up_read_fn = pa;
                    p.up_read_ebreak = pa; // hint for ebreak scan
                },
                "down_read_trylock" => {
                    p.down_read_trylock_fn = pa;
                    p.down_read_ebreak = pa; // hint for ebreak scan
                },
                "_start_kernel" => {
                    p.start_kernel_entry = pa;
                },
                "reserve_initrd_mem" => {
                    p.reserve_initrd_mem = pa;
                },
                "abort_creds" => {
                    p.abort_creds = pa;
                },
                "workqueue_init" => {
                    p.workqueue_init = pa;
                },
                "kernel_execve" => {
                    p.kernel_execve = pa;
                },
                _ => {},
            }
        }

        p
    }

    /// Apply all kernel patches to the loaded image in memory.
    ///
    /// Returns a summary of what was patched (for logging).
    pub fn apply(
        &self,
        bus: &mut super::bus::Bus,
        dtb_addr: u64,
        dtb_size: usize,
        kernel_phys_end: u64,
        initrd_phys: Option<(u64, u64)>,
        actual_ram_size: usize,
    ) -> PatchSummary {
        let mut summary = PatchSummary::default();

        // -- DTB early pointers --
        if bus.write_word(self.dtb_early_va, dtb_addr as u32).is_ok()
            && bus.write_word(self.dtb_early_pa, dtb_addr as u32).is_ok()
        {
            summary.dtb_pointers = true;
            eprintln!(
                "[boot] Pre-set _dtb_early_va=0x{:08X}, _dtb_early_pa=0x{:08X}",
                dtb_addr as u32, dtb_addr as u32
            );
        }

        // -- setup_vm() patch --
        summary.setup_vm = self.patch_setup_vm(bus);

        // -- riscv_timebase --
        if bus
            .write_word(self.riscv_timebase, self.timebase_freq)
            .is_ok()
        {
            summary.timebase = true;
        }

        // -- loops_per_jiffy --
        if bus.write_word(self.loops_per_jiffy, self.lpj_value).is_ok() {
            summary.lpj = true;
            eprintln!(
                "[boot] Pre-set loops_per_jiffy={} to skip calibrate_delay()",
                self.lpj_value
            );
        }

        // -- sbi_debug_console_available --
        if bus.write_word(self.sbi_dbcn, 1).is_ok() {
            summary.sbi_dbcn = true;
            eprintln!("[boot] Pre-set sbi_debug_console_available=true for earlycon DBCN");
        }

        // -- calibrate_delay --
        summary.calibrate_delay =
            self.patch_function_ret(bus, self.calibrate_delay, 0x715D, "calibrate_delay");

        // -- udelay --
        summary.udelay = self.patch_function_ret(bus, self.udelay, 0x1141, "udelay");

        // -- ndelay --
        summary.ndelay = self.patch_function_ret(bus, self.ndelay, 0x1141, "ndelay");

        // -- memblock reserved + memory --
        summary.memblock = self.patch_memblock(
            bus,
            dtb_addr,
            dtb_size,
            kernel_phys_end,
            initrd_phys,
            actual_ram_size,
        );

        // -- up_read ebreak --
        summary.up_read = self.patch_ebreak(bus, self.up_read_ebreak, "up_read");

        // -- down_read_trylock ebreak --
        summary.down_read = self.patch_ebreak(bus, self.down_read_ebreak, "down_read_trylock");

        // -- initrd overlap bypass --
        // Only apply when initrd is present. Patches reserve_initrd_mem() to
        // unconditionally jump past the memblock_is_region_reserved() check,
        // since paging_init() allocates page tables on top of our initrd region
        // before reserve_initrd_mem() gets a chance to claim it.
        if initrd_phys.is_some() {
            summary.initrd_overlap_bypass = self.patch_initrd_overlap(bus);
        }

        // -- abort_creds ebreak --
        // The BUG_ON(usage < 2) triggers because prepare_exec_creds returns
        // with usage=1 and free_bprm calls abort_creds on exec failure.
        // Patch the ebreak so the kernel can continue past the failed exec.
        summary.abort_creds = self.patch_ebreak(bus, self.abort_creds, "abort_creds");

        // -- workqueue_init ebreak --
        // -- Workqueue init ebreak patches --
        // handle_exception reads sscratch=0, swaps tp with 0, falls through
        // the per-CPU setup, and then calls die() -> oops_exit() which tries
        // to print before earlycon is ready. This creates an infinite trap
        // loop. NOP the ebreak to let boot continue.
        summary.workqueue_init = self.patch_ebreak(bus, self.workqueue_init, "workqueue_init");

        // -- Universal ebreak wipe: NOP every ebreak in the kernel text --
        self.wipe_all_ebreaks(bus, kernel_phys_end);

        // -- sscratch patch --
        // Replace `csrw sscratch, zero` (0x14001073) with `csrw sscratch, tp`
        // (0x14011073) so handle_exception can save/restore sp to a valid
        // per-CPU area instead of corrupting init_task at offset 8.
        if self.sscratch_csrw_patch != 0 {
            let orig = bus.read_word(self.sscratch_csrw_patch).unwrap_or(0);
            if orig == 0x14001073 {
                bus.write_word(self.sscratch_csrw_patch, 0x14011073).ok();
                eprintln!(
                    "[boot] Patched sscratch=0 -> sscratch=tp at PA 0x{:08X}",
                    self.sscratch_csrw_patch
                );
            } else {
                eprintln!("[boot] WARNING: sscratch patch guard mismatch: got 0x{:08X}, expected 0x14001073", orig);
            }
        }

        summary
    }

    /// Patch setup_vm() instruction sites.
    /// Looks for a known 3-instruction sequence and NOPs it.
    fn patch_setup_vm(&self, bus: &mut super::bus::Bus) -> bool {
        // setup_vm has 3 patch sites close together:
        //   +0: halfword 0xC4DC (C.LUI a5,...)
        //   +6: word    0x0104AC23 (SH a5,...)
        //  +10: halfword 0xC8CC (C.LUI a1,...)
        //
        // Scan around the setup_vm function address (from System.map or defaults).
        // setup_vm is typically small (~100 bytes), so scan ±128 bytes.
        let scan_center = self.setup_vm;
        let scan_start = scan_center.saturating_sub(0x80);
        let scan_end = scan_center + 0x80;

        for addr in (scan_start..scan_end).step_by(2) {
            let h0 = bus.read_half(addr).unwrap_or(0);
            if h0 != 0xC4DC {
                continue;
            }
            let w1 = bus.read_word(addr + 6).unwrap_or(0);
            if w1 != 0x0104AC23 {
                continue;
            }
            let h2 = bus.read_half(addr + 10).unwrap_or(0);
            if h2 != 0xC8CC {
                continue;
            }
            // Found the pattern.
            // DO NOT NOP these stores -- setup_vm reads back kernel_map fields
            // after writing them to create page table entries. NOP'ing the writes
            // and pre-filling with our own values produced incorrect page tables
            // (our phys_addr was the actual PA 0x80000000, but setup_vm stores the
            // symbol VA 0xC0000000, and derives page offsets from it).
            //
            // setup_vm writes:
            //   +0  page_offset = PAGE_OFFSET
            //   +4  virt_addr   = KERNEL_LINK_ADDR + virt_offset
            //   +12 phys_addr   = &_start (symbol VA, not PA!)
            //   +16 size        = &_end - &_start
            //   +20 va_pa_offset = PAGE_OFFSET - &_start (0 for 32-bit)
            //   +24 va_kernel_pa_offset = virt_addr - &_start
            // Then reads +4, +12, +16, +24 back to build page tables.
            eprintln!("[boot] Found setup_vm kernel_map writes at PA 0x{:08X} (pattern scan) -- leaving intact", addr);
            return true;
        }

        // Pattern scan failed — try direct addresses with guard check
        if self.use_pattern_scan {
            eprintln!("[boot] WARNING: setup_vm pattern not found in scan range");
            return false;
        }

        // Fallback: use hardcoded addresses -- just verify setup_vm is present,
        // don't NOP its kernel_map writes (setup_vm reads them back for page tables).
        let setup_vm_base: u64 = 0x80404AB2;
        let a5 = bus.read_half(setup_vm_base).unwrap_or(0);
        let a6 = bus.read_word(setup_vm_base + 6).unwrap_or(0);
        let a1 = bus.read_half(setup_vm_base + 10).unwrap_or(0);
        if a5 == 0xC4DC && a6 == 0x0104AC23 && a1 == 0xC8CC {
            eprintln!("[boot] Found setup_vm kernel_map writes at PA 0x{:08X} (hardcoded fallback) -- leaving intact", setup_vm_base);
            return true;
        }

        eprintln!(
            "[boot] WARNING: setup_vm guard check failed! a5=0x{:04X} a6=0x{:08X} a1=0x{:04X}",
            a5, a6, a1
        );
        false
    }

    /// Patch a function to return immediately.
    /// Looks for `expected_half` at the function start, replaces with C.JR ra (0x8082).
    fn patch_function_ret(
        &self,
        bus: &mut super::bus::Bus,
        func_addr: u64,
        expected_half: u16,
        name: &str,
    ) -> bool {
        if self.use_pattern_scan {
            // Scan for the expected instruction in a small window around the hint.
            // Function alignment is usually 4 or 16 bytes, so check ±16 bytes.
            for offset in (0u64..32).step_by(2) {
                let addr = func_addr.saturating_sub(16) + offset;
                let half = bus.read_half(addr).unwrap_or(0);
                if (half as u16) == expected_half {
                    bus.write_half(addr, 0x8082).ok(); // C.JR ra
                    eprintln!(
                        "[boot] Patched {} to return immediately at PA 0x{:08X} (scan)",
                        name, addr
                    );
                    return true;
                }
            }
            eprintln!(
                "[boot] WARNING: {} pattern 0x{:04X} not found near PA 0x{:08X}",
                name, expected_half, func_addr
            );
            return false;
        }

        // Direct address with guard check
        let half = bus.read_half(func_addr).unwrap_or(0);
        if (half as u16) == expected_half {
            bus.write_half(func_addr, 0x8082).ok(); // C.JR ra
            eprintln!("[boot] Patched {} to return immediately", name);
            return true;
        }
        eprintln!(
            "[boot] WARNING: {} guard mismatch: got 0x{:04X}, expected 0x{:04X}",
            name, half, expected_half
        );
        false
    }

    /// NOP one or more EBREAK instructions (0x9002 → 0x0001).
    /// `addr` is the function start address (from System.map or defaults).
    /// Scans the entire function body for ALL ebreak instructions and NOPs each one.
    /// Returns true if at least one ebreak was found and patched.
    fn patch_ebreak(&self, bus: &mut super::bus::Bus, addr: u64, name: &str) -> bool {
        if self.use_pattern_scan {
            // Scan for EBREAK (0x9002) across the function body.
            // Workqueue_init and similar init functions can have multiple
            // BUG_ON/WARN_ON assertions scattered across their body (up to
            // 1024+ bytes). Patch ALL ebreaks found, not just the first one.
            let mut patched_count = 0u32;
            for offset in (0u64..2048).step_by(2) {
                let scan_addr = addr + offset;
                let half = bus.read_half(scan_addr).unwrap_or(0);
                if half == 0x9002 {
                    bus.write_half(scan_addr, 0x0001).ok(); // C.NOP
                    patched_count += 1;
                    eprintln!(
                        "[boot] Patched ebreak #{} at PA 0x{:08X} to NOP (unblocking {}, offset +{})",
                        patched_count, scan_addr, name, offset
                    );
                }
            }
            if patched_count > 0 {
                return true;
            }
            eprintln!(
                "[boot] WARNING: no ebreaks for {} found in 2048-byte window starting at PA 0x{:08X}",
                name, addr
            );
            return false;
        }

        // Non-pattern-scan: direct address with guard check
        let half = bus.read_half(addr).unwrap_or(0);
        if half == 0x9002 {
            bus.write_half(addr, 0x0001).ok(); // C.NOP
            eprintln!(
                "[boot] Patched ebreak at PA 0x{:08X} to NOP (unblocking {})",
                addr, name
            );
            return true;
        }
        false
    }

    /// Bypass the memblock_is_region_reserved() check in reserve_initrd_mem().
    ///
    /// The kernel's paging_init() allocates page tables top-down from RAM *before*
    /// reserve_initrd_mem() runs, so the initrd region always appears "reserved."
    /// This patch replaces the conditional branch (c.beqz after the call) with an
    /// unconditional jump (c.j), so the overlap check is skipped and the initrd
    /// is always accepted.
    ///
    /// Pattern: after calling memblock_is_region_reserved(), the kernel has:
    ///   c.beqz a0, <success_path>    (0xCD09 for offset +26)
    /// We replace it with:
    ///   c.j <success_path>            (0xA829 for offset +26)
    fn patch_initrd_overlap(&self, bus: &mut super::bus::Bus) -> bool {
        // The c.beqz a0 instruction is at reserve_initrd_mem + 0x80 (offset from function start).
        // For the default kernel: 0x80402B68 + 0x80 = 0x80402BE8.
        // We scan a window around the expected location to handle different builds.
        let check_offset: u64 = 0x80; // offset of the c.beqz within the function
        let check_addr = self.reserve_initrd_mem + check_offset;

        // Scan ±32 bytes for c.beqz a0 pattern
        // The offset (+26) might vary across kernel builds, so we look for any
        // c.beqz with a0 (rs1'=x10) where the target is the memblock_reserve call.
        for delta in (0u64..64).step_by(2) {
            let addr = check_addr.saturating_sub(32) + delta;
            let half = bus.read_half(addr).unwrap_or(0);

            // C.BEQZ format: 110 | imm[8|4:3] | rs1'[2:0] | imm[7:6|2:1|5] | 01
            // rs1' = a0 = x10 → bits[9:7] = 010
            // So: 110_xxx_010_xxx_01 → mask 0b110_000_111_000_11 = 0xE383
            //     value 0b110_000_010_000_01 = 0xC101
            if (half & 0xE383) != 0xC101 {
                continue;
            }

            // Decode the branch target
            let imm_bit = |i: u32| -> u32 {
                ((half as u32)
                    >> match i {
                        8 => 12,
                        4 => 11,
                        3 => 10,
                        7 => 6,
                        6 => 5,
                        2 => 4,
                        1 => 3,
                        5 => 2,
                        _ => 0,
                    })
                    & 1
            };

            let offset = (imm_bit(8) << 8)
                | (imm_bit(7) << 7)
                | (imm_bit(6) << 6)
                | (imm_bit(5) << 5)
                | (imm_bit(4) << 4)
                | (imm_bit(3) << 3)
                | (imm_bit(2) << 2)
                | (imm_bit(1) << 1) as u32;

            // Encode C.J with the same offset
            let b = |i: u32| -> u32 { (offset >> i) & 1 };
            let cj_instr = (0b101u32 << 13)
                | (b(11) << 12)
                | (b(4) << 11)
                | (b(9) << 10)
                | (b(8) << 9)
                | (b(10) << 8)
                | (b(6) << 7)
                | (b(7) << 6)
                | (b(3) << 5)
                | (b(2) << 4)
                | (b(1) << 3)
                | (b(5) << 2)
                | 0b01;

            bus.write_half(addr, cj_instr as u16).ok();
            eprintln!(
                "[boot] Patched initrd overlap bypass at PA 0x{:08X}: c.beqz a0,+{} -> c.j +{} (unconditional)",
                addr, offset, offset
            );
            return true;
        }

        eprintln!(
            "[boot] WARNING: initrd overlap bypass pattern not found near PA 0x{:08X}",
            check_addr
        );
        false
    }

    /// Pre-populate memblock reserved and memory regions.
    fn patch_memblock(
        &self,
        bus: &mut super::bus::Bus,
        dtb_addr: u64,
        dtb_size: usize,
        kernel_phys_end: u64,
        initrd_phys: Option<(u64, u64)>,
        actual_ram_size: usize,
    ) -> bool {
        let mb = self.memblock;

        // === DIAGNOSTIC: dump memblock struct before patching ===
        {
            let bottom_up = bus.read_word(mb).unwrap_or(0xDEAD);
            let current_limit = bus.read_word(mb + 4).unwrap_or(0xDEAD);
            let mem_cnt = bus.read_word(mb + 8).unwrap_or(0xDEAD);
            let mem_max = bus.read_word(mb + 12).unwrap_or(0xDEAD);
            let mem_total = bus.read_word(mb + 16).unwrap_or(0xDEAD);
            let mem_regions_ptr = bus.read_word(mb + 20).unwrap_or(0xDEAD);
            let mem_name_ptr = bus.read_word(mb + 24).unwrap_or(0xDEAD);
            let res_cnt = bus.read_word(mb + 28).unwrap_or(0xDEAD);
            let res_max = bus.read_word(mb + 32).unwrap_or(0xDEAD);
            let res_total = bus.read_word(mb + 36).unwrap_or(0xDEAD);
            let res_regions_ptr = bus.read_word(mb + 40).unwrap_or(0xDEAD);
            let res_name_ptr = bus.read_word(mb + 44).unwrap_or(0xDEAD);

            eprintln!("[boot-diag-memblock] struct at PA 0x{:08X}:", mb);
            eprintln!(
                "[boot-diag-memblock]   bottom_up={} current_limit=0x{:08X}",
                bottom_up, current_limit
            );
            eprintln!(
                "[boot-diag-memblock]   memory: cnt={} max={} total_size=0x{:X} regions_ptr=0x{:08X} name=0x{:08X}",
                mem_cnt, mem_max, mem_total, mem_regions_ptr, mem_name_ptr
            );
            eprintln!(
                "[boot-diag-memblock]   reserved: cnt={} max={} total_size=0x{:X} regions_ptr=0x{:08X} name=0x{:08X}",
                res_cnt, res_max, res_total, res_regions_ptr, res_name_ptr
            );

            // Convert regions pointers to PA and dump existing regions
            if mem_regions_ptr >= 0xC0000000 {
                let mem_regions_pa = (mem_regions_ptr - 0x40000000) as u64;
                for i in 0..mem_cnt.min(8) {
                    let a = mem_regions_pa + (i as u64) * MEMBLOCK_REGION_SIZE;
                    let base = bus.read_word(a).unwrap_or(0);
                    let size = bus.read_word(a + 4).unwrap_or(0);
                    let flags = bus.read_word(a + 8).unwrap_or(0xFF);
                    eprintln!(
                        "[boot-diag-memblock]   memory.regions[{}]: PA 0x{:08X} {{ base=0x{:08X} size=0x{:X} flags={} }}",
                        i, a, base, size, flags
                    );
                }
            }
            if res_regions_ptr >= 0xC0000000 {
                let res_regions_pa = (res_regions_ptr - 0x40000000) as u64;
                for i in 0..res_cnt.min(8) {
                    let a = res_regions_pa + (i as u64) * MEMBLOCK_REGION_SIZE;
                    let base = bus.read_word(a).unwrap_or(0);
                    let size = bus.read_word(a + 4).unwrap_or(0);
                    let flags = bus.read_word(a + 8).unwrap_or(0xFF);
                    eprintln!(
                        "[boot-diag-memblock]   reserved.regions[{}]: PA 0x{:08X} {{ base=0x{:08X} size=0x{:X} flags={} }}",
                        i, a, base, size, flags
                    );
                }
            }
        }

        // Reserved regions
        // struct memblock_region on RV32: { base(4), size(4), flags(4) } = 12 bytes
        const MEMBLOCK_REGION_SIZE: u64 = 12;
        let res_regions_ptr = bus.read_word(mb + 40).unwrap_or(0);
        if res_regions_ptr >= 0xC0000000 {
            let res_regions_pa = (res_regions_ptr - 0x40000000) as u64;
            let res_cnt_addr = mb + 28;
            let res_cnt = bus.read_word(res_cnt_addr).unwrap_or(0);
            let res_region_offset = (res_cnt as u64) * MEMBLOCK_REGION_SIZE;

            eprintln!(
                "[boot-diag-memblock]   => reserved.regions PA=0x{:08X}, cnt={}, first_free_offset={} (at PA 0x{:08X})",
                res_regions_pa, res_cnt, res_region_offset, res_regions_pa + res_region_offset
            );
            eprintln!(
                "[boot-diag-memblock]   => kernel_phys_end=0x{:08X} kernel_size=0x{:X} ({}MB)",
                kernel_phys_end as u32,
                (kernel_phys_end - 0x80000000) as u32,
                (kernel_phys_end - 0x80000000) / (1024 * 1024)
            );
            eprintln!(
                "[boot-diag-memblock]   => dtb_addr=0x{:08X} actual_ram_size={} (0x{:X})",
                dtb_addr as u32, actual_ram_size, actual_ram_size
            );

            // Write {base=0x80000000, size=kernel_phys_end - 0x80000000, flags=0}
            let kernel_size = (kernel_phys_end - 0x80000000) as u32;
            let write_addr = res_regions_pa + res_region_offset;
            eprintln!(
                "[boot-patch] Writing reserved region to 0x{:08X}",
                write_addr
            );
            bus.write_word(write_addr, 0x80000000).ok();
            bus.write_word(write_addr + 4, kernel_size).ok();
            bus.write_word(write_addr + 8, 0).ok(); // flags = NONE
            bus.write_word(res_cnt_addr, res_cnt + 1).ok();
            eprintln!(
                "[boot] Pre-populated memblock reserved: base=0x80000000 size=0x{:08X} (end=0x{:08X})",
                kernel_size, kernel_phys_end as u32
            );

            // Reserve initrd if present
            if let Some((ird_start, ird_end)) = initrd_phys {
                let new_cnt = bus.read_word(res_cnt_addr).unwrap_or(0);
                let new_offset = (new_cnt as u64) * MEMBLOCK_REGION_SIZE;
                let ird_size = (ird_end - ird_start) as u32;
                let write_addr = res_regions_pa + new_offset;
                eprintln!(
                    "[boot-patch] Writing reserved initrd to 0x{:08X}",
                    write_addr
                );
                bus.write_word(write_addr, ird_start as u32).ok();
                bus.write_word(write_addr + 4, ird_size).ok();
                bus.write_word(write_addr + 8, 0).ok(); // flags = NONE
                bus.write_word(res_cnt_addr, new_cnt + 1).ok();
                eprintln!(
                    "[boot] Pre-populated memblock reserved initrd: base=0x{:08X} size=0x{:08X}",
                    ird_start as u32, ird_size
                );
            }

            // Reserve DTB + preliminary page tables at top of RAM.
            // The DTB is placed at (ram_top - 1MB) and the page table is 8KB below it.
            // Reserve a 1MB region from (dtb_addr - 8KB) to (dtb_addr + 1MB) to cover both.
            // This prevents memblock_alloc() from handing out this memory for kernel page tables.
            {
                let pt_and_dtb_base = dtb_addr - 8192; // page table starts here
                let pt_and_dtb_size = (dtb_addr + 1024 * 1024) - pt_and_dtb_base;
                let new_cnt = bus.read_word(res_cnt_addr).unwrap_or(0);
                let new_offset = (new_cnt as u64) * MEMBLOCK_REGION_SIZE;
                let write_addr = res_regions_pa + new_offset;
                eprintln!(
                    "[boot-patch] Writing reserved DTB+PT to 0x{:08X}",
                    write_addr
                );
                bus.write_word(write_addr, pt_and_dtb_base as u32).ok();
                bus.write_word(write_addr + 4, pt_and_dtb_size as u32).ok();
                bus.write_word(write_addr + 8, 0).ok();
                bus.write_word(res_cnt_addr, new_cnt + 1).ok();
                eprintln!(
                    "[boot] Pre-populated memblock reserved DTB+PT: base=0x{:08X} size=0x{:08X} (dtb=0x{:08X}, {} bytes)",
                    pt_and_dtb_base as u32, pt_and_dtb_size as u32, dtb_addr as u32, dtb_size
                );
            }
        }

        // Memory regions
        let mem_cnt_addr = mb + 8;
        let mem_regions_ptr = bus.read_word(mb + 20).unwrap_or(0);
        if mem_regions_ptr >= 0xC0000000 {
            let mem_regions_pa = (mem_regions_ptr - 0x40000000) as u64;
            eprintln!(
                "[boot-patch] Writing memory regions to 0x{:08X}",
                mem_regions_pa
            );
            bus.write_word(mem_regions_pa, 0x80000000).ok();
            bus.write_word(mem_regions_pa + 4, actual_ram_size as u32)
                .ok();
            bus.write_word(mem_regions_pa + 8, 0).ok(); // flags = NONE
            bus.write_word(mem_cnt_addr, 1).ok();
            bus.write_word(mb + 16, actual_ram_size as u32).ok();
            eprintln!(
                "[boot] Pre-populated memblock memory: PA 0x80000000 - PA 0x{:08X}",
                (0x80000000u64 + actual_ram_size as u64) as u32
            );

            // === POST-PATCH VERIFICATION ===
            eprintln!("[boot-diag-memblock] === POST-PATCH VERIFICATION ===");
            let mem_cnt_post = bus.read_word(mb + 8).unwrap_or(0xDEAD);
            let mem_total_post = bus.read_word(mb + 16).unwrap_or(0xDEAD);
            let res_cnt_post = bus.read_word(mb + 28).unwrap_or(0xDEAD);
            eprintln!(
                "[boot-diag-memblock]   memory: cnt={} total_size=0x{:X} reserved: cnt={}",
                mem_cnt_post, mem_total_post, res_cnt_post
            );
            for i in 0..mem_cnt_post.min(4) {
                let a = mem_regions_pa + (i as u64) * 12;
                let base = bus.read_word(a).unwrap_or(0);
                let size = bus.read_word(a + 4).unwrap_or(0);
                let flags = bus.read_word(a + 8).unwrap_or(0xFF);
                eprintln!(
                    "[boot-diag-memblock]   memory.regions[{}]: {{ base=0x{:08X} size=0x{:X} flags={} }}",
                    i, base, size, flags
                );
            }
            if res_regions_ptr >= 0xC0000000 {
                let res_regions_pa = (res_regions_ptr - 0x40000000) as u64;
                for i in 0..res_cnt_post.min(8) {
                    let a = res_regions_pa + (i as u64) * 12;
                    let base = bus.read_word(a).unwrap_or(0);
                    let size = bus.read_word(a + 4).unwrap_or(0);
                    let flags = bus.read_word(a + 8).unwrap_or(0xFF);
                    eprintln!(
                        "[boot-diag-memblock]   reserved.regions[{}]: {{ base=0x{:08X} size=0x{:X} flags={} }}",
                        i, base, size, flags
                    );
                }
            }

            return true;
        }
        false
    }
}

/// Summary of what patches were applied (for diagnostics).
#[derive(Debug, Clone, Default)]
pub struct PatchSummary {
    pub dtb_pointers: bool,
    pub setup_vm: bool,
    pub timebase: bool,
    pub lpj: bool,
    pub sbi_dbcn: bool,
    pub calibrate_delay: bool,
    pub udelay: bool,
    pub ndelay: bool,
    pub memblock: bool,
    pub up_read: bool,
    pub down_read: bool,
    /// Whether the initrd memblock overlap bypass was applied.
    pub initrd_overlap_bypass: bool,
    /// Whether the abort_creds ebreak was patched to NOP.
    pub abort_creds: bool,
    /// Whether the workqueue_init ebreak was patched to NOP.
    pub workqueue_init: bool,
}

impl PatchSummary {
    pub fn all_applied(&self) -> bool {
        self.dtb_pointers
            && self.setup_vm
            && self.timebase
            && self.lpj
            && self.sbi_dbcn
            && self.calibrate_delay
            && self.udelay
            && self.ndelay
            && self.memblock
    }
}

impl KernelPatches {
    /// Wipe ALL ebreak instructions in the kernel text to prevent any
    /// BUG()/WARN_ON() traps from stalling the boot. Scans the kernel
    /// RAM range (PA 0x8000_0000..kernel_phys_end) for both compressed
    /// (0x9002) and uncompressed (0x0010_0073) ebreak instructions and
    /// replaces them with NOPs.
    fn wipe_all_ebreaks(&self, bus: &mut super::bus::Bus, kernel_phys_end: u64) {
        let kernel_base: u64 = 0x8000_0000;
        let mut count: u32 = 0;
        let end = std::cmp::min(kernel_phys_end, kernel_base + 16 * 1024 * 1024); // max 16MB

        // Scan by halfword (2-byte aligned) for compressed ebreak (0x9002)
        let mut addr = kernel_base;
        while addr + 2 <= end {
            let half = bus.read_half(addr).unwrap_or(0);
            if half == 0x9002 {
                bus.write_half(addr, 0x0001).ok(); // C.NOP
                count += 1;
            }
            addr += 2;
        }
        // Also scan by word for uncompressed ebreak (0x00100073)
        let mut addr = kernel_base;
        while addr + 4 <= end {
            let word = bus.read_word(addr).unwrap_or(0);
            if word == 0x00100073 {
                bus.write_word(addr, 0x00000013).ok(); // NOP (ADDI x0, x0, 0)
                count += 1;
            }
            addr += 4;
        }
        eprintln!(
            "[boot] Wiped {} ebreak instructions in kernel text (0x{:08X}-0x{:08X})",
            count, kernel_base, end
        );
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn defaults_match_real_system_map() {
        let p = KernelPatches::defaults();
        // These match the actual linux-6.14 System.map (VA - 0x40000000 = PA)
        assert_eq!(p.dtb_early_va, 0x80801008);
        assert_eq!(p.dtb_early_pa, 0x8080100C);
        assert_eq!(p.kernel_map, 0x80C7A098);
        assert_eq!(p.riscv_timebase, 0x80C7A058);
        assert_eq!(p.loops_per_jiffy, 0x81480A18); // BSS section, not .data
        assert_eq!(p.sbi_dbcn, 0x814820A0);
        assert_eq!(p.memblock, 0x80803448);
        assert_eq!(p.calibrate_delay, 0x800080DA);
        assert_eq!(p.udelay, 0x8021B34E);
        assert_eq!(p.ndelay, 0x8021B308);
        assert_eq!(p.setup_vm, 0x80404A70);
        assert_eq!(p.up_read_fn, 0x8003A3A2);
        assert_eq!(p.down_read_trylock_fn, 0x8003A03C);
        assert_eq!(p.reserve_initrd_mem, 0x80402B68);
        assert_eq!(p.timebase_freq, 10_000_000);
        assert_eq!(p.lpj_value, 400_000);
    }

    #[test]
    fn from_system_map_parses_addresses() {
        let map = "\
80008000 T _start
800080DA T calibrate_delay
8021B34E T udelay
8021B308 T ndelay
80801008 D _dtb_early_va
8080100C D _dtb_early_pa
80C7A058 D riscv_timebase
80C7A018 D loops_per_jiffy
814820A0 D sbi_debug_console_available
80C7A098 D kernel_map
80803448 D memblock
";
        let p = KernelPatches::from_system_map(map);
        assert_eq!(p.dtb_early_va, 0x80801008);
        assert_eq!(p.kernel_map, 0x80C7A098);
        assert_eq!(p.calibrate_delay, 0x800080DA);
        assert_eq!(p.kernel_execve, 0); // defaults to 0 (unset by default config)
        assert!(p.use_pattern_scan);
    }

    #[test]
    fn from_system_map_converts_va_to_pa() {
        // Kernel VA space starts at 0xC0000000, PA at 0x80000000
        let map = "C00080DA T calibrate_delay\n";
        let p = KernelPatches::from_system_map(map);
        assert_eq!(p.calibrate_delay, 0x800080DA); // VA - 0x40000000 = PA
    }

    #[test]
    fn from_system_map_skips_low_addresses() {
        let map = "00001000 T _text\nC00080DA T calibrate_delay\n";
        let p = KernelPatches::from_system_map(map);
        // Low addresses should be skipped, calibrate_delay should be found
        assert_eq!(p.calibrate_delay, 0x800080DA);
    }

    #[test]
    fn from_system_map_preserves_defaults_for_missing() {
        let map = "800080DA T calibrate_delay\n";
        let p = KernelPatches::from_system_map(map);
        // calibrate_delay is set, everything else keeps defaults
        assert_eq!(p.calibrate_delay, 0x800080DA);
        assert_eq!(p.kernel_map, 0x80C7A098); // default
    }

    #[test]
    fn from_system_map_parses_new_symbols() {
        let map = "\
C0404A70 T setup_vm
C003A3A2 T up_read
C003A03C T down_read_trylock
";
        let p = KernelPatches::from_system_map(map);
        assert_eq!(p.setup_vm, 0x80404A70);
        assert_eq!(p.up_read_fn, 0x8003A3A2);
        assert_eq!(p.up_read_ebreak, 0x8003A3A2); // ebreak hint = function start
        assert_eq!(p.down_read_trylock_fn, 0x8003A03C);
        assert_eq!(p.down_read_ebreak, 0x8003A03C);
    }

    #[test]
    fn patch_summary_all_applied() {
        let s = PatchSummary {
            dtb_pointers: true,
            setup_vm: true,
            timebase: true,
            lpj: true,
            sbi_dbcn: true,
            calibrate_delay: true,
            udelay: true,
            ndelay: true,
            memblock: true,
            up_read: false,
            down_read: false,
            initrd_overlap_bypass: false,
            abort_creds: true,
            workqueue_init: true,
        };
        // up_read/down_read don't block all_applied
        assert!(s.all_applied());
    }
}
