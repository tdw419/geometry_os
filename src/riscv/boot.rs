// riscv/boot.rs -- Guest and Linux boot methods for RiscvVm
//
// Split from mod.rs for maintainability.
// Contains: boot_guest, boot_linux_setup, boot_linux,
// ELF parsing helpers, and kernel page table fixup.

use super::cpu::{self, StepResult};
use super::csr;
use super::loader;
use super::{dtb, BootResult, RiscvVm};

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
        let load_info = loader::load_auto(&mut self.bus, kernel_image, 0x8000_0000)?;

        // 2. Generate DTB and load it into guest RAM just after the kernel.
        let dtb_config = dtb::DtbConfig {
            ram_size: ram_size_mb as u64 * 1024 * 1024,
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
                | StepResult::StoreFault => {}
                StepResult::Ebreak => break,
                StepResult::Ecall => {} // ECALL is normal during boot
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

    /// Steps:
    /// Set up the VM for Linux boot without running the instruction loop.
    /// Returns (vm, fw_addr, entry, dtb_addr) so callers can run their own loop.
    pub fn boot_linux_setup(
        kernel_image: &[u8],
        _initramfs: Option<&[u8]>,
        ram_size_mb: u32,
        bootargs: &str,
    ) -> Result<(Self, u64, u32, u64), loader::LoadError> {
        // 1. Calculate minimum RAM size from kernel's physical address ranges.
        let highest_paddr = Self::parse_elf_highest_paddr(kernel_image).unwrap_or(64 * 1024 * 1024);
        let min_ram_size = highest_paddr as usize + 4 * 1024 * 1024; // extra for initrd/dtb

        let caller_ram_size = (ram_size_mb as u64) * 1024 * 1024;
        let actual_ram_size = std::cmp::max(min_ram_size, caller_ram_size as usize);

        // 2. Create VM with ram_base=0x80000000.
        // This is the standard RISC-V virt machine layout.
        // Kernel executes at 0xC0000000+, physical memory starts at 0x80000000.
        let mem_base: u64 = 0x80000000;
        let mut vm = Self::new_with_base(mem_base, actual_ram_size);
        vm.bus.auto_pte_fixup = true; // Phase 124

        // 3. Load kernel at physical addresses (p_paddr from ELF segments).
        // The bus routes writes to RAM at 0x80000000+ automatically.
        let load_info = loader::load_elf(&mut vm.bus, kernel_image)?;
        // Highest address used by the kernel in physical memory.
        let ram_size = actual_ram_size as u64;
        let kernel_phys_end = ((load_info.highest_addr + 0xFFF) & !0xFFF) as u64;

        // 4. Setup DTB.
        // Position DTB at the top of RAM (standard practice).
        let dtb_addr = mem_base + ram_size - 1024 * 1024; // 1MB from top
        let mut dtb_config = dtb::DtbConfig::default();
        dtb_config.ram_base = mem_base;
        dtb_config.ram_size = ram_size;
        dtb_config.bootargs = bootargs.to_string();
        let dtb_blob = dtb::generate_dtb(&dtb_config);
        for (i, &byte) in dtb_blob.iter().enumerate() {
            vm.bus.write_byte(dtb_addr + i as u64, byte).ok();
        }

        // 5. Hardcoded kernel patches and pointers (Phase 124).
        // VA 0xC0801008 -> PA 0x80801008.
        let dtb_early_va_pa: u64 = 0x80801008;
        let dtb_early_pa_pa: u64 = 0x8080100C;
        vm.bus.write_word(dtb_early_va_pa, dtb_addr as u32).ok();
        vm.bus.write_word(dtb_early_pa_pa, dtb_addr as u32).ok();
        eprintln!(
            "[boot] Pre-set _dtb_early_va=0x{:08X}, _dtb_early_pa=0x{:08X}",
            dtb_addr as u32, dtb_addr as u32
        );

        // setup_vm() patch points for local vmlinux (RAM at 0x80000000)
        let setup_vm_phys_addr_store: u64 = 0x80404AB2; // PA
        let setup_vm_va_kernel_pa_store: u64 = 0x80404AB8; // PA
        let setup_vm_va_pa_offset_store: u64 = 0x80404ABC; // PA
        let kernel_map_phys: u64 = 0x80C7A098; // PA

        let sw_a5_12 = vm.bus.read_half(setup_vm_phys_addr_store).unwrap_or(0);
        let sw_a6_24 = vm.bus.read_word(setup_vm_va_kernel_pa_store).unwrap_or(0);
        let sw_a1_20 = vm.bus.read_half(setup_vm_va_pa_offset_store).unwrap_or(0);
        if sw_a5_12 == 0xC4DC && sw_a6_24 == 0x0104AC23 && sw_a1_20 == 0xC8CC {
            vm.bus.write_half(setup_vm_phys_addr_store, 0x0001).ok(); // C.NOP
            vm.bus
                .write_word(setup_vm_va_kernel_pa_store, 0x00000013)
                .ok(); // 32-bit NOP
            vm.bus.write_half(setup_vm_va_pa_offset_store, 0x0001).ok(); // C.NOP
            vm.bus.write_word(kernel_map_phys + 12, 0x80000000).ok(); // phys_addr = 0x80000000
            vm.bus.write_word(kernel_map_phys + 20, 0x40000000).ok(); // va_pa_offset = 0x40000000
            vm.bus.write_word(kernel_map_phys + 24, 0x00000000).ok(); // va_kernel_pa_offset = 0
            eprintln!("[boot] Patched kernel_map: phys_addr=0x80000000, va_pa_offset=0x40000000, va_kernel_pa_offset=0");
        } else {
            eprintln!("[boot] WARNING: kernel patch mismatch! sw_a5_12=0x{:04X} sw_a6_24=0x{:08X} sw_a1_20=0x{:04X} (expected 0xC4DC/0x0104AC23/0xC8CC)", sw_a5_12, sw_a6_24, sw_a1_20);
        }

        // riscv_timebase at VA 0xC0C7A058 -> PA 0x80C7A058
        let riscv_timebase_pa: u64 = 0x80C7A058;
        vm.bus.write_word(riscv_timebase_pa, 10_000_000).ok();

        // loops_per_jiffy at VA 0xC0C7A018 -> PA 0x80C7A018
        let lpj_pa: u64 = 0x80C7A018;
        vm.bus.write_word(lpj_pa, 400_000).ok();
        eprintln!("[boot] Pre-set loops_per_jiffy=400000 to skip calibrate_delay()");

        // sbi_debug_console_available at VA 0xC14820A0 -> PA 0x814820A0
        let sbi_dbcn_pa: u64 = 0x814820A0;
        vm.bus.write_word(sbi_dbcn_pa, 1).ok();
        eprintln!("[boot] Pre-set sbi_debug_console_available=true for earlycon DBCN");

        // calibrate_delay at VA 0xC00080DA -> PA 0x800080DA
        let calibrate_delay_pa: u64 = 0x800080DA;
        if vm.bus.read_half(calibrate_delay_pa).unwrap_or(0) == 0x715D {
            vm.bus.write_half(calibrate_delay_pa, 0x8082).ok(); // C.JR ra (ret)
            eprintln!("[boot] Patched calibrate_delay to return immediately");
        }

        // udelay at VA 0xC021B34E -> PA 0x8021B34E
        let udelay_pa: u64 = 0x8021B34E;
        if vm.bus.read_half(udelay_pa).unwrap_or(0) == 0x1141 {
            vm.bus.write_half(udelay_pa, 0x8082).ok(); // C.JR ra (ret)
            eprintln!("[boot] Patched udelay to return immediately");
        }

        // ndelay at VA 0xC021B308 -> PA 0x8021B308
        let ndelay_pa: u64 = 0x8021B308;
        if vm.bus.read_half(ndelay_pa).unwrap_or(0) == 0x1141 {
            vm.bus.write_half(ndelay_pa, 0x8082).ok(); // C.JR ra (ret)
            eprintln!("[boot] Patched ndelay to return immediately");
        }

        // memblock at VA 0xC0803448 -> PA 0x80803448
        let memblock_pa: u64 = 0x80803448;
        let res_regions_ptr = vm.bus.read_word(memblock_pa + 40).unwrap_or(0);
        if res_regions_ptr >= 0xC0000000 {
            let res_regions_pa = (res_regions_ptr - 0x40000000) as u64; // Correct VA->PA
            let res_cnt_addr = memblock_pa + 28;
            let res_cnt = vm.bus.read_word(res_cnt_addr).unwrap_or(0);
            let res_region_offset = (res_cnt as u64) * 8;
            vm.bus
                .write_word(res_regions_pa + res_region_offset, 0x80000000)
                .ok();
            vm.bus
                .write_word(
                    res_regions_pa + res_region_offset + 4,
                    kernel_phys_end as u32,
                )
                .ok();
            vm.bus.write_word(res_cnt_addr, res_cnt + 1).ok();
            eprintln!(
                "[boot] Pre-populated memblock reserved: PA 0x80000000 - PA 0x{:08X}",
                0x80000000 + kernel_phys_end as u32
            );
        }

        // memblock memory
        {
            let mem_cnt_addr = memblock_pa + 8;
            let mem_regions_ptr = vm.bus.read_word(memblock_pa + 20).unwrap_or(0);
            if mem_regions_ptr >= 0xC0000000 {
                let mem_regions_pa = (mem_regions_ptr - 0x40000000) as u64;
                vm.bus.write_word(mem_regions_pa, 0x80000000).ok();
                vm.bus
                    .write_word(mem_regions_pa + 4, actual_ram_size as u32)
                    .ok();
                vm.bus.write_word(mem_cnt_addr, 1).ok();
                vm.bus
                    .write_word(memblock_pa + 16, actual_ram_size as u32)
                    .ok();
                eprintln!(
                    "[boot] Pre-populated memblock memory: PA 0x80000000 - PA 0x{:08X}",
                    0x80000000 + actual_ram_size as u32
                );
            }
        }

        // Phase 257: NOP out problematic ebreak in up_read
        let up_read_ebreak_pa: u64 = 0x8006CE7C; // PA
        if vm.bus.read_half(up_read_ebreak_pa).unwrap_or(0) == 0x9002 {
            vm.bus.write_half(up_read_ebreak_pa, 0x0001).ok(); // C.NOP
            eprintln!(
                "[boot] Patched ebreak at PA 0x{:08X} to NOP (unblocking up_read)",
                up_read_ebreak_pa
            );
        }

        // Also patch down_read_trylock ebreak
        let down_read_ebreak_pa: u64 = 0x8006C748; // PA
        if vm.bus.read_half(down_read_ebreak_pa).unwrap_or(0) == 0x9002 {
            vm.bus.write_half(down_read_ebreak_pa, 0x0001).ok(); // C.NOP
            eprintln!(
                "[boot] Patched ebreak at PA 0x{:08X} to NOP (unblocking down_read_trylock)",
                down_read_ebreak_pa
            );
        }

        let entry_vaddr: u32 = load_info.entry;
        vm.cpu.csr.mepc = entry_vaddr - 0x40000000; // Physical entry point!
        vm.cpu.csr.mstatus = 1u32 << csr::MSTATUS_MPP_LSB;
        vm.cpu.csr.mstatus |= 1 << csr::MSTATUS_MPIE;
        let restored = vm.cpu.csr.trap_return(cpu::Privilege::Machine);
        vm.cpu.pc = vm.cpu.csr.mepc;
        vm.cpu.privilege = restored;

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
        let (mut vm, _fw_addr, entry, dtb_addr) =
            Self::boot_linux_setup(kernel_image, initramfs, ram_size_mb, bootargs)?;

        let mut count: u64 = 0;
        while count < max_instructions {
            if vm.bus.sbi.shutdown_requested {
                break;
            }

            // Advance CLINT timer and sync hardware interrupt state into MIP.
            vm.bus.tick_clint_n(100);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);

            let step_result = vm.step();

            match step_result {
                StepResult::Ok => {}
                StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {}
                StepResult::Ebreak => break,
                StepResult::Ecall => {} // ECALL is normal during boot
                StepResult::Shutdown | StepResult::Yielded => break,
            }

            if count.is_multiple_of(10_000_000) && count > 0 {
                eprintln!(
                    "[boot] PROGRESS {}M: PC=0x{:08X} priv={:?} mtime={} sbi_out={}",
                    count / 1_000_000,
                    vm.cpu.pc,
                    vm.cpu.privilege,
                    vm.bus.clint.mtime,
                    vm.bus.sbi.console_output.len(),
                );
            }
            count += 1;
        }

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
