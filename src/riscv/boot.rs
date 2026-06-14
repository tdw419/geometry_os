// riscv/boot.rs -- Guest and Linux boot methods for RiscvVm
//
// Split from mod.rs for maintainability.
// Contains: boot_guest, boot_linux_setup, boot_linux,
// ELF parsing helpers, and kernel page table fixup.

use super::cpu::{self, StepResult};
use super::csr;
use super::framebuf::FB_CONTROL_ADDR;
use super::kernel_patches::KernelPatches;
use super::loader;
use super::mmu;
use super::viz;
use super::{dtb, BootResult, RiscvVm};
use std::io::Write;

#[allow(dead_code)]
impl RiscvVm {
    /// Boot a guest OS kernel image.
    ///
    /// 1. Load kernel image (ELF32 or raw binary) into guest RAM
    /// 2. Generate and load a DTB (device tree blob) into guest RAM
    /// 3. Set PC to entry point, a0=0 (hartid), a1=dtb_addr
    /// 4. Run for `max_instructions` steps or until EBREAK/halt
    ///
    /// Returns the number of instructions executed and boot metadata.
    pub fn boot_guest(
        &mut self,
        kernel_image: &[u8],
        ram_size_mb: u32,
        max_instructions: u64,
    ) -> Result<BootResult, loader::LoadError> {
        // 1. Load kernel image.
        // vmlinux ELF has p_paddr=0 (PhysAddr field from linker script),
        // so use 0x80000000 offset to map to RISC-V physical RAM base.
        let load_info = loader::load_auto(&mut self.bus, kernel_image, 0x8000_0000)?;

        // 2. Generate DTB and load it into guest RAM just after the kernel.
        let dtb_config = dtb::DtbConfig {
            ram_size: ram_size_mb as u64 * 1024 * 1024,
            skip_plic: true, // Prevent plic_driver_init ioremap BUG during early boot
            ..Default::default()
        };
        let dtb_blob = dtb::generate_dtb(&dtb_config);

        // Place DTB at a page-aligned address after the kernel image.
        let dtb_addr = ((load_info.highest_addr + 0xFFF) & !0xFFF) as u64;
        for (i, &byte) in dtb_blob.iter().enumerate() {
            let addr = dtb_addr + i as u64;
            if self.bus.write_byte(addr, byte).is_err() {
                break;
            }
        }

        // 3. Set CPU state for boot.
        self.cpu.pc = load_info.entry;
        self.cpu.x[10] = 0; // a0 = hartid (0)
        self.cpu.x[11] = dtb_addr as u32; // a1 = DTB address
        self.cpu.privilege = cpu::Privilege::Machine;

        // 4. Execute.
        let mut count: u64 = 0;
        while count < max_instructions {
            match self.step() {
                StepResult::Ok
                | StepResult::FetchFault
                | StepResult::LoadFault
                | StepResult::StoreFault => {},
                StepResult::Ebreak => break,
                StepResult::Ecall => {}, // ECALL is normal during boot
                StepResult::Shutdown | StepResult::Yielded => break,
            }
            count += 1;
        }

        Ok(BootResult {
            instructions: count,
            entry: load_info.entry,
            dtb_addr,
        })
    }

    /// Parse the highest physical address (paddr + memsz) across all PT_LOAD segments.
    pub(super) fn parse_elf_highest_paddr(image: &[u8]) -> Option<u64> {
        let class = crate::riscv::loader::validate_elf_header(image).ok()?;
        let hdr = crate::riscv::loader::parse_elf_header(image, class);

        let mut highest: u64 = 0;
        for i in 0..hdr.phnum {
            let off = hdr.phoff + i * hdr.phentsize;
            let phdr = crate::riscv::loader::parse_phdr(image, off, class)?;
            if phdr.p_type == 1 {
                // PT_LOAD
                let seg_end = phdr.p_paddr as u64 + phdr.p_memsz as u64;
                if seg_end > highest {
                    highest = seg_end;
                }
            }
        }
        if highest == 0 {
            None
        } else {
            Some(highest)
        }
    }

    /// Fix virtual PPNs in a kernel page table after SATP change.
    fn fixup_kernel_page_table(&mut self, pg_dir_phys: u64) {
        // Delegate to Bus which handles both PTE fixup AND page registration
        // for real-time write interception (demand paging).
        self.bus.fixup_kernel_page_table(pg_dir_phys);
    }

    /// Set up the VM for Linux boot without running the instruction loop.
    /// Returns (vm, fw_addr, entry, dtb_addr) so callers can run their own loop.
    ///
    /// Uses default kernel patches (hardcoded for the original vmlinux build).
    /// For other kernel builds, use [`boot_linux_setup_with_patches`].
    pub fn boot_linux_setup(
        kernel_image: &[u8],
        initramfs: Option<&[u8]>,
        ram_size_mb: u32,
        bootargs: &str,
    ) -> Result<(Self, u64, u32, u64), loader::LoadError> {
        Self::boot_linux_setup_with_patches(kernel_image, initramfs, ram_size_mb, bootargs, None)
    }

    /// Set up the VM for Linux boot with configurable kernel patches.
    ///
    /// When `patches` is None, uses the default hardcoded patch addresses.
    /// When provided, uses the given [`KernelPatches`] (e.g., loaded from System.map).
    pub fn boot_linux_setup_with_patches(
        kernel_image: &[u8],
        initramfs: Option<&[u8]>,
        ram_size_mb: u32,
        bootargs: &str,
        patches: Option<KernelPatches>,
    ) -> Result<(Self, u64, u32, u64), loader::LoadError> {
        eprintln!(
            "[boot] boot_linux_setup_with_patches: ram={}MB, args='{}'",
            ram_size_mb, bootargs
        );
        let _ = std::io::stderr().flush();
        let patches = patches.unwrap_or_default();

        // 1. Calculate minimum RAM size from kernel s physical address ranges.
        // We use 0x80000000 as the standard RISC-V physical RAM base.
        let mem_base: u64 = 0x80000000;
        let highest_paddr =
            Self::parse_elf_highest_paddr(kernel_image).unwrap_or(mem_base + 64 * 1024 * 1024);
        let min_ram_needed = if highest_paddr >= mem_base {
            (highest_paddr - mem_base) as usize + 8 * 1024 * 1024 // extra for initrd/dtb
        } else {
            highest_paddr as usize + 8 * 1024 * 1024
        };

        let caller_ram_size = (ram_size_mb as u64) * 1024 * 1024;
        let actual_ram_size = std::cmp::max(min_ram_needed, caller_ram_size as usize);

        // 2. Create VM.
        let mut vm = Self::new_with_base(mem_base, actual_ram_size);

        // Initialize the VirtIO-backed GSFS filesystem so the disk IS a filesystem.
        // Pixel Linux sees the same GSFS as /dev/vda.
        vm.bus.init_virtio_blk_gsfs();

        // 2a. Initialize Spatial Heatmap (Phase 20-25)
        // Map to kernel RAM region (32MB covers most vmlinux images)
        vm.bus.instruction_heatmap = Some(super::mmu_heatmap::InstructionHeatmap::new(
            mem_base,
            32 * 1024 * 1024,
        ));

        vm.bus.auto_pte_fixup = true; // Phase 124
        vm.bus.low_addr_identity_map = true; // Enable MMU fallbacks for Linux

        // 3. Load kernel at physical addresses (ELF segments or raw binary).
        // The bus routes writes to RAM at 0x80000000+ automatically.
        eprintln!(
            "[boot] loading kernel image (len={})...",
            kernel_image.len()
        );
        let _ = std::io::stderr().flush();
        let load_info = match loader::load_auto_with_offset(&mut vm.bus, kernel_image, mem_base) {
            Ok(info) => info,
            Err(e) => {
                eprintln!("[boot] FAILED to load kernel: {}", e);
                let _ = std::io::stderr().flush();
                return Err(e);
            },
        };
        eprintln!(
            "[boot] kernel loaded at 0x{:08X}, highest=0x{:08X}",
            load_info.entry, load_info.highest_addr
        );
        let _ = std::io::stderr().flush();

        // VALIDATION: Check bytes at Segment 1 start
        {
            let s1_pa: u64 = 0x80400000 + 0x0FFE;
            let b0 = vm.bus.read_byte(s1_pa).unwrap_or(0);
            let b1 = vm.bus.read_byte(s1_pa + 1).unwrap_or(0);
            let b2 = vm.bus.read_byte(s1_pa + 2).unwrap_or(0);
            let b3 = vm.bus.read_byte(s1_pa + 3).unwrap_or(0);
            eprintln!(
                "[boot-valid] PA 0x{:08X}: {:02X} {:02X} {:02X} {:02X} (expect E7 80 80 A6)",
                s1_pa, b0, b1, b2, b3
            );
            let _ = std::io::stderr().flush();
        }

        // DIAGNOSTIC: verify bus write/read roundtrip at setup_vm patch address.
        {
            let diag_pa: u64 = 0x80404AB2;
            let ram_base = vm.bus.mem.ram_base;
            let ram_size = vm.bus.mem.size();
            eprintln!(
                "[boot-diag] RAM: base=0x{:08X} size=0x{:X} ({}MB)",
                ram_base,
                ram_size,
                ram_size / (1024 * 1024)
            );
            let b0 = vm.bus.read_byte(diag_pa).unwrap_or(0xFF);
            let b1 = vm.bus.read_byte(diag_pa + 1).unwrap_or(0xFF);
            let b2 = vm.bus.read_byte(diag_pa + 2).unwrap_or(0xFF);
            let b3 = vm.bus.read_byte(diag_pa + 3).unwrap_or(0xFF);
            let half = vm.bus.read_half(diag_pa).unwrap_or(0xFFFF);
            let word = vm.bus.read_word(diag_pa).unwrap_or(0xFFFFFFFF);
            eprintln!(
                "[boot-diag] PA 0x{:08X}: bytes=[{:02X} {:02X} {:02X} {:02X}] half=0x{:04X} word=0x{:08X}",
                diag_pa, b0, b1, b2, b3, half, word
            );
            let expected_file_off = 0x404AB2;
            if kernel_image.len() > expected_file_off + 4 {
                let eb0 = kernel_image[expected_file_off];
                let eb1 = kernel_image[expected_file_off + 1];
                let eb2 = kernel_image[expected_file_off + 2];
                let eb3 = kernel_image[expected_file_off + 3];
                eprintln!(
                    "[boot-diag] ELF file off 0x{:X}: bytes=[{:02X} {:02X} {:02X} {:02X}] half=0x{:04X}",
                    expected_file_off, eb0, eb1, eb2, eb3,
                    eb0 as u16 | ((eb1 as u16) << 8)
                );
            }
            let offset_from_base = diag_pa.wrapping_sub(ram_base) as usize;
            let in_ram = offset_from_base + 2 <= ram_size;
            eprintln!(
                "[boot-diag] offset from base = 0x{:X}, in_ram={}, ram_array_len=0x{:X}",
                offset_from_base, in_ram, ram_size
            );
        }

        // Highest address used by the kernel in physical memory.
        let ram_size = actual_ram_size as u64;
        let kernel_phys_end = ((load_info.highest_addr + 0xFFF) & !0xFFF) as u64;

        // 4. Setup DTB.
        // Position DTB at the top of RAM (standard practice).
        // Reserve VMALLOC_SCRATCH_POOL_SIZE at the end for the emulator's
        // vmalloc fallback pool. The DTB reports less RAM so the kernel
        // won't touch these pages.
        let dtb_ram_size = ram_size - mmu::VMALLOC_SCRATCH_POOL_SIZE;
        eprintln!(
            "[boot] DTB ram_size: {}K ({}K total, pool: {}K)",
            dtb_ram_size / 1024,
            ram_size / 1024,
            mmu::VMALLOC_SCRATCH_POOL_SIZE / 1024
        );
        let dtb_addr = mem_base + dtb_ram_size - 1024 * 1024; // 1MB from top of reported RAM
        let mut bootargs_string = bootargs.to_string();
        if bootargs_string == "console=ttyS0" {
            bootargs_string = "earlycon=sbi keep_bootcon loglevel=8 console=ttyS0".to_string();
        }
        let mut dtb_config = dtb::DtbConfig::default();
        dtb_config.ram_base = mem_base;
        dtb_config.ram_size = dtb_ram_size;
        dtb_config.skip_plic = true; // Prevent plic_driver_init ioremap BUG during early boot
        dtb_config.bootargs = bootargs_string;
        let dtb_blob = dtb::generate_dtb(&dtb_config);
        for (i, &byte) in dtb_blob.iter().enumerate() {
            vm.bus.write_byte(dtb_addr + i as u64, byte).ok();
        }

        // 4b. Load initrd into RAM if provided.
        let initrd_phys = if let Some(initrd_data) = initramfs {
            // Place initrd just after the kernel image with 2MB padding.
            // The kernel's memblock allocates page tables, hash tables, etc.
            // top-down from the end of RAM, so placing near the top caused
            // overlap: "INITRD: 0x9fd00000+0x00001000 overlaps in-use memory region".
            // Putting it right after kernel_phys_end avoids all memblock allocations.
            let initrd_start = ((kernel_phys_end + 2 * 1024 * 1024) & !0xFFF) as u64;
            let initrd_end = initrd_start + initrd_data.len() as u64;
            for (i, &byte) in initrd_data.iter().enumerate() {
                vm.bus.write_byte(initrd_start + i as u64, byte).ok();
            }
            eprintln!(
                "[boot] Loaded initrd: {} bytes at PA 0x{:08X} - 0x{:08X}",
                initrd_data.len(),
                initrd_start,
                initrd_end
            );
            // Update DTB with initrd addresses.
            dtb_config.initrd_start = Some(initrd_start);
            dtb_config.initrd_end = Some(initrd_end);
            let dtb_blob2 = dtb::generate_dtb(&dtb_config);
            for (i, &byte) in dtb_blob2.iter().enumerate() {
                vm.bus.write_byte(dtb_addr + i as u64, byte).ok();
            }
            Some((initrd_start, initrd_end))
        } else {
            None
        };

        // 5. Apply kernel patches via the configurable system.
        let dtb_size = if initrd_phys.is_some() {
            // dtb_blob2 was the final version written to memory
            dtb::generate_dtb(&dtb_config).len()
        } else {
            dtb_blob.len()
        };
        let summary = patches.apply(
            &mut vm.bus,
            dtb_addr,
            dtb_size,
            kernel_phys_end,
            initrd_phys,
            dtb_ram_size as usize,
        );
        eprintln!(
            "[boot] Patch summary: dtb={} setup_vm={} timebase={} lpj={} dbcn={} cal_delay={} udelay={} ndelay={} memblock={} up_read={} down_read={} initrd_bypass={} abort_creds={}",
            summary.dtb_pointers,
            summary.setup_vm,
            summary.timebase,
            summary.lpj,
            summary.sbi_dbcn,
            summary.calibrate_delay,
            summary.udelay,
            summary.ndelay,
            summary.memblock,
            summary.up_read,
            summary.down_read,
            summary.initrd_overlap_bypass,
            summary.abort_creds,
        );

        // Pre-zero kernel BSS range to make the BSS-clearing loop a no-op
        let bss_start_pa: u64 = 0x8148A000;
        let bss_end_pa: u64 = 0x814C6FF8;
        if bss_end_pa <= mem_base + actual_ram_size as u64 {
            eprintln!(
                "[boot] Pre-zeroing BSS range: PA 0x{:08X} - 0x{:08X}",
                bss_start_pa, bss_end_pa
            );
            let mut addr = bss_start_pa;
            while addr < bss_end_pa {
                vm.bus.write_word(addr, 0).ok();
                addr += 4;
            }
        }

        let entry_vaddr: u32 = load_info.entry;
        // Convert VA to guest PA: VA - PAGE_OFFSET gives Linux-PA (0),
        // + ram_base gives guest PA (0x80000000).
        // If entry_vaddr is already in the RAM physical range, use it directly.
        let entry_pa = if entry_vaddr >= 0xC000_0000 {
            entry_vaddr - 0xC000_0000 + (mem_base as u32)
        } else {
            entry_vaddr
        };

        // Check if the entry point has the EFI stub MZ header.
        // For CONFIG_EFI kernels, _start begins with "c.li s4,-13" (0x5A4D = MZ magic)
        // followed by "j _start_kernel". Both are valid instructions -- the MZ bytes
        // ARE the first instruction. So entering at _start works fine; no redirect needed.
        let entry_half = vm.bus.read_half(entry_pa as u64).unwrap_or(0);
        if entry_half == 0x5A4D {
            eprintln!(
                "[boot] ELF entry at PA 0x{:08X} has MZ/EFI stub header (c.li s4,-13; j _start_kernel) -- OK",
                entry_pa
            );
        }

        // 6. Create a preliminary Sv32 page table so the kernel can run at its
        // linked virtual address (0xC0000000+). On real hardware, OpenSBI sets up
        // identity mapping; we do the equivalent here.
        //
        // Sv32 L1 table: 1024 entries × 4 bytes = 4096 bytes.
        // Each entry maps a 4MB megapage.
        // We create:
        //   - Identity mapping: VA 0x80000000-0xBFFFFFFF → PA 0x80000000-0xBFFFFFFF (256 entries)
        //   - Kernel mapping:   VA 0xC0000000-0xC3FFFFFF → PA 0x80000000-0x83FFFFFF (16 entries, 64MB)
        // Place the table 2 pages below DTB.
        let pg_dir_pa = dtb_addr - 8192; // 2 pages below DTB
                                         // Clear the page table
        for i in 0..1024 {
            vm.bus.write_word(pg_dir_pa + i * 4, 0).ok();
        }
        eprintln!(
            "[boot-table] Creating preliminary page table at PA 0x{:08X}",
            pg_dir_pa
        );
        // Identity mapping: VA 0x80000000+ → PA 0x80000000+
        // Sv32 megapage PTE: PPN[0] is implied by L1 index, PPN[1] = PA >> 22.
        // Flags: V=1, R=1, W=1, X=1, A=1, D=1 (RWXADG=0xCF, G=0 for identity)
        // Only create entries for pages that fall within actual physical RAM.
        // Creating entries beyond RAM causes vmalloc page faults when the kernel
        // tries to access VA 0xa0000000+ through preliminary megapages that point
        // to unmapped physical addresses.
        let megapage_flags: u32 = 0xCF; // V|R|W|X|A|D
        let num_ram_entries = std::cmp::min(256u32, (ram_size / 0x400000) as u32);
        for i in 0..num_ram_entries {
            let l1_idx = 512 + i; // 0x80000000 >> 22 = 512
            let pa_base = 0x80000000 + i * 0x400000; // 4MB per entry
            let pte = (pa_base >> 2) | megapage_flags; // PPN = PA[31:12] in megapage
            vm.bus.write_word(pg_dir_pa + (l1_idx as u64) * 4, pte).ok();
        }
        // Kernel mapping: VA 0xC0000000+ → PA 0x80000000+
        for i in 0..64u32 {
            let l1_idx = 768 + i; // 0xC0000000 >> 22 = 768
            let pa_base = 0x80000000 + i * 0x400000;
            let pte = (pa_base >> 2) | megapage_flags;
            vm.bus.write_word(pg_dir_pa + (l1_idx as u64) * 4, pte).ok();
        }
        // Set SATP: mode=Sv32 (1), ASID=0, PPN = pg_dir_pa >> 12
        let satp_val = (1u32 << 31) | ((pg_dir_pa >> 12) as u32);
        eprintln!("[boot-table] SATP value: 0x{:08X}", satp_val);
        vm.cpu.csr.satp = satp_val;
        eprintln!(
            "[boot] Preliminary Sv32 page table at PA 0x{:08X}, SATP=0x{:08X} -- kernel VA entry at 0x{:08X}",
            pg_dir_pa, satp_val, entry_vaddr
        );

        // Enter the kernel at its virtual address (not PA).
        // With MMU enabled, VA 0xC0000000 maps to PA 0x80000000.
        // Start in S-mode (MPP=01) because:
        //   - M-mode fetches bypass MMU (bare translation), so VA 0xC0000000
        //     would be treated as PA 0xC0000000 (outside RAM).
        //   - S-mode respects SATP, so the preliminary page table translates
        //     VA 0xC0000000 → PA 0x80000000 correctly.
        // This mirrors real hardware where OpenSBI does mret to drop to S-mode
        // before entering the kernel.
        // Delegate interrupts and exceptions to S-mode (like OpenSBI does).
        // Without this, all traps go to M-mode (mtvec=0x80000000 = EFI stub = garbage).
        vm.cpu.csr.mideleg = (1 << csr::INT_STI)  // Supervisor timer
            | (1 << csr::INT_SSI)  // Supervisor software (IPI)
            | (1 << csr::INT_SEI); // Supervisor external
        vm.cpu.csr.medeleg = (1 << csr::CAUSE_FETCH_PAGE_FAULT)
            | (1 << csr::CAUSE_LOAD_PAGE_FAULT)
            | (1 << csr::CAUSE_STORE_PAGE_FAULT)
            | (1 << csr::CAUSE_ECALL_U)
            | (1 << csr::CAUSE_BREAKPOINT)
            | (1 << csr::CAUSE_LOAD_ACCESS)
            | (1 << csr::CAUSE_STORE_ACCESS)
            | (1 << csr::CAUSE_FETCH_ACCESS)
            | (1 << csr::CAUSE_MISALIGNED_LOAD)
            | (1 << csr::CAUSE_MISALIGNED_STORE)
            | (1 << csr::CAUSE_ILLEGAL_INSTRUCTION);
        // NOTE: Illegal instructions are delegated to S-mode so the kernel can
        // handle them (e.g., for software FP emulation). Without this, a kernel
        // that encounters C.FSD (funct3=5 in C0, reserved on RV32) would trap to
        // M-mode, which re-enters _start at mtvec=0x80000000 and breaks boot.

        vm.cpu.csr.mepc = entry_vaddr; // Use VA, not PA
        vm.cpu.csr.mstatus = 0b01 << csr::MSTATUS_MPP_LSB; // S-mode entry (not M-mode!)
        vm.cpu.csr.mstatus |= 1 << csr::MSTATUS_MPIE;
        let restored = vm.cpu.csr.trap_return(cpu::Privilege::Machine);
        vm.cpu.pc = vm.cpu.csr.mepc;
        vm.cpu.privilege = restored;

        // Standard RISC-V boot convention: a0=hartid, a1=DTB physical address
        vm.cpu.x[10] = 0; // a0 = hartid (0)
        vm.cpu.x[11] = dtb_addr as u32; // a1 = DTB physical address

        eprintln!("[boot-setup] After mret simulation: PC=0x{:08X} priv={:?} mepc=0x{:08X} mstatus=0x{:08X}", vm.cpu.pc, vm.cpu.privilege, vm.cpu.csr.mepc, vm.cpu.csr.mstatus);
        eprintln!(
            "[boot-setup] Boot regs: a0=0 (hartid), a1=0x{:08X} (DTB PA)",
            dtb_addr as u32
        );

        // Set initial mtimecmp high enough that time_init() runs before the
        // first timer fires. Without ANY timer, the kernel hangs in
        // check_unaligned_access() which spins waiting for jiffies to change.
        // But with mtimecmp too low (e.g. 500), the timer fires during early
        // boot before time_init() registers the clockevent device, causing a
        // timer interrupt storm in __irqentry_text_start: the kernel can never
        // mret to forward progress because mtime > mtimecmp at return.
        //
        // time_init() runs ~30M instructions into boot, so setting mtimecmp
        // to 100M gives the kernel enough headroom. The first SBI_SET_TIMER
        // call (from time_init()) takes over scheduling from here.
        vm.bus.clint.mtimecmp = 100_000_000;
        eprintln!("[boot-setup] Initial mtimecmp=100M (gives kernel time to reach time_init())");

        Ok((vm, 0, entry_vaddr, dtb_addr)) // fw_addr=0 (no M-mode handler needed)
    }

    /// Boot a RISC-V Linux kernel.
    pub fn boot_linux(
        kernel_image: &[u8],
        initramfs: Option<&[u8]>,
        ram_size_mb: u32,
        max_instructions: u64,
        bootargs: &str,
    ) -> Result<(Self, BootResult), loader::LoadError> {
        Self::boot_linux_with_patches(
            kernel_image,
            initramfs,
            ram_size_mb,
            max_instructions,
            bootargs,
            None,
        )
    }

    /// Boot a RISC-V Linux kernel with configurable patches.
    pub fn boot_linux_with_patches(
        kernel_image: &[u8],
        initramfs: Option<&[u8]>,
        ram_size_mb: u32,
        max_instructions: u64,
        bootargs: &str,
        patches: Option<KernelPatches>,
    ) -> Result<(Self, BootResult), loader::LoadError> {
        let (mut vm, _fw_addr, entry, dtb_addr) = Self::boot_linux_setup_with_patches(
            kernel_image,
            initramfs,
            ram_size_mb,
            bootargs,
            patches,
        )?;

        let mut count: u64 = 0;
        let mut fault_count: u64 = 0;
        // Debug diagnostics for S→M trap and low-PC detection.
        // TODO: Remove or gate behind a debug flag once Linux boots successfully.
        let mut prev_priv = vm.cpu.privilege;

        // Value watchpoint for PA 0x80002C18 (VA 0xC0002C18) to detect corruption
        vm.bus.add_watch_value_at(0x80002C18, 0xDEADBEEF);
        let mut trap_transition_logged = false;
        let mut recent_pcs: Vec<(u64, u32, cpu::Privilege)> = Vec::with_capacity(20);
        let mut user_mode_entered = false;
        let mut user_mode_pc_log: Vec<(u64, u32)> = Vec::with_capacity(20);
        while count < max_instructions {
            if vm.bus.sbi.shutdown_requested {
                break;
            }

            // Advance CLINT timer and sync hardware interrupt state into MIP.
            // Tick rate: 1 tick per 100 instructions (accelerated).
            if count % 100 == 0 {
                vm.bus.tick_clint_n(1);
                vm.bus.sync_mip(&mut vm.cpu.csr.mip);
            }

            let pc_before = vm.cpu.pc;
            let step_result = vm.step();

            // Drain MMU logs -- only keep SATP changes and faults (skip walks for performance)
            for event in vm.bus.mmu_log.drain(..) {
                match event {
                    super::mmu::MmuEvent::PageTableWalk { .. } => { /* throttled */ },
                    super::mmu::MmuEvent::PageFault { va, access, ptes } => {
                        if fault_count < 10 {
                            eprintln!(
                                "[mmu] FAULT: va={:08x} access={:?} ptes={:08x?}",
                                va, access, ptes
                            );
                        }
                    },
                    super::mmu::MmuEvent::SatpWrite { old, new } => {
                        eprintln!("[mmu] SATP: {:08x} -> {:08x}", old, new);
                    },
                }
            }

            // Track recent PCs for trap diagnosis (throttled to avoid log floods)
            if vm.cpu.privilege == cpu::Privilege::Supervisor && count.is_multiple_of(100000) {
                // Detect first time PC goes below 0xC0000000 (left kernel mapping)
                if pc_before < 0xC0000000 && !trap_transition_logged {
                    eprintln!(
                        "[boot] LOW PC at count={}: PC=0x{:08X} priv={:?} -- left kernel VA space!",
                        count, pc_before, vm.cpu.privilege
                    );
                }
                recent_pcs.push((count, pc_before, vm.cpu.privilege));
                if recent_pcs.len() > 20 {
                    recent_pcs.remove(0);
                }
            }

            // Detect S-mode → M-mode transition (trap into firmware)
            if !trap_transition_logged
                && prev_priv == cpu::Privilege::Supervisor
                && vm.cpu.privilege == cpu::Privilege::Machine
            {
                eprintln!(
                    "[boot] S->M TRAP at count={}: PC was=0x{:08X} now=0x{:08X} mcause=0x{:08X} mepc=0x{:08X} mtval=0x{:08X} mtvec=0x{:08X} stvec=0x{:08X}",
                    count, pc_before, vm.cpu.pc, vm.cpu.csr.mcause, vm.cpu.csr.mepc, vm.cpu.csr.mtval, vm.cpu.csr.mtvec, vm.cpu.csr.stvec
                );
                eprintln!("[boot] Recent S-mode PCs before trap:");
                for (c, p, pr) in &recent_pcs {
                    eprintln!("  count={} PC=0x{:08X} priv={:?}", c, p, pr);
                }
                trap_transition_logged = true;
            }
            prev_priv = vm.cpu.privilege;

            // Value watchpoints are checked automatically in bus.write_word()
            // with eprintln output. No manual polling needed.

            match step_result {
                StepResult::Ok => {},
                StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                    if fault_count < 10 {
                        eprintln!(
                            "[boot] FAULT at count={}: {:?} PC=0x{:08X} priv={:?}",
                            count, step_result, vm.cpu.pc, vm.cpu.privilege
                        );
                    }
                    fault_count += 1;
                },
                StepResult::Ebreak => break,
                StepResult::Ecall => {}, // ECALL is normal during boot
                StepResult::Shutdown | StepResult::Yielded => break,
            }

            if count.is_multiple_of(1_000_000) && count >= 33_000_000 && count <= 38_000_000 {
                eprintln!(
                    "[boot] DETAIL {}M: PC=0x{:08X} priv={:?}",
                    count / 1_000_000,
                    vm.cpu.pc,
                    vm.cpu.privilege
                );
            }
            if count.is_multiple_of(10_000_000) && count > 0 {
                eprintln!(
                    "[boot] PROGRESS {}M: PC=0x{:08X} priv={:?} scause=0x{:08X} sepc=0x{:08X} mtime={} sbi_out={} faults={}",
                    count / 1_000_000,
                    vm.cpu.pc,
                    vm.cpu.privilege,
                    vm.cpu.csr.scause,
                    vm.cpu.csr.sepc,
                    vm.bus.clint.mtime,
                    vm.bus.sbi.console_output.len(),
                    fault_count,
                );

                // Extract data for viz before any mutable bus borrows
                let mtime = vm.bus.clint.mtime;
                let sbi_out_len = vm.bus.sbi.console_output.len();
                let ecall_log: &[(u32, u32, u32)] = &vm.bus.sbi.ecall_log;
                let ecall_count = ecall_log.len();

                // Live boot viz: render register state, SBI timeline, address space
                {
                    let fb = &mut vm.bus.framebuf.pixels;
                    viz::render_boot_state(
                        fb,
                        &vm.cpu,
                        mtime,
                        sbi_out_len,
                        ecall_count,
                        ecall_log.last().copied(),
                        count,
                        fault_count,
                        user_mode_entered,
                    );
                }

                // Flush framebuffer to display surface
                vm.bus.framebuf.write(FB_CONTROL_ADDR, 1);

                // Live MMU heatmap: render current page table state to framebuffer
                vm.bus
                    .render_mmu_heatmap(vm.cpu.csr.satp, count, fault_count);
            }

            // Detect first entry to user mode (kernel starting /init)
            if !user_mode_entered && vm.cpu.privilege == cpu::Privilege::User {
                user_mode_entered = true;
                eprintln!(
                    "[boot] FIRST USER MODE at count={}: PC=0x{:08X} sp=0x{:08X} a0=0x{:08X} a7=0x{:08X}",
                    count, vm.cpu.pc, vm.cpu.x[2], vm.cpu.x[10], vm.cpu.x[17]
                );
            }
            if user_mode_entered
                && user_mode_pc_log.len() < 50
                && vm.cpu.privilege == cpu::Privilege::User
            {
                user_mode_pc_log.push((count, vm.cpu.pc));
            }
            count += 1;
        }

        if !user_mode_pc_log.is_empty() {
            eprintln!(
                "[boot] User mode PC log ({} samples):",
                user_mode_pc_log.len()
            );
            for (c, pc) in &user_mode_pc_log {
                eprintln!("  count={} PC=0x{:08X}", c, pc);
            }
        }

        // Dump watchpoint summary
        eprintln!("[boot] Watch summary:\n{}", vm.bus.watch_summary());

        Ok((
            vm,
            BootResult {
                instructions: count,
                entry,
                dtb_addr,
            },
        ))
    }
}
