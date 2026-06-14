/// Diagnostic: Trace the exact circumstances of the fault at/near 0xC00010FA.
///
/// The kernel runs 30M+ instructions then faults at this address.
/// We need to know:
/// 1. What type of fault (instruction fetch, load, store)
/// 2. What was the previous PC before the fault
/// 3. What instruction is at that address
/// 4. Whether the page is mapped in the current page table
use geometry_os::riscv::{
    cpu::{Privilege, StepResult},
    RiscvVm,
};

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let initramfs_path = ".geometry_os/fs/linux/rv32/initramfs.cpio.gz";

    let kernel_image = match std::fs::read(kernel_path) {
        Ok(d) => d,
        Err(_) => {
            eprintln!("No kernel at {}", kernel_path);
            return;
        },
    };
    let initramfs = std::fs::read(initramfs_path).ok();

    let bootargs = "console=ttyS0 earlycon=sbi panic=5 loglevel=7";
    let (mut vm, _fw_addr, _entry, _dtb_addr) =
        RiscvVm::boot_linux_setup(&kernel_image, initramfs.as_deref(), 512, bootargs)
            .expect("setup");

    let mut count: u64 = 0;
    let max = 50_000_000;

    // Track SATP changes
    let mut last_satp: u32 = vm.cpu.csr.satp;
    let mut satp_changes: Vec<(u64, u32, u32)> = Vec::new(); // (count, old, new)

    // Track the last N PCs for context when fault happens
    let mut recent_pcs: Vec<(u64, u32, Privilege, String)> = Vec::new();
    let trace_window = 50;

    // Track faults
    let mut fault_count: u64 = 0;
    let mut first_fault_seen = false;

    // Track MMU log size to detect new page faults
    let mut last_mmu_log_len = 0;

    while count < max {
        if vm.bus.sbi.shutdown_requested {
            break;
        }

        // Advance timer
        vm.bus.tick_clint_n(100);
        vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        vm.bus.current_pc = vm.cpu.pc;

        let step_result = vm.step();

        // Track SATP changes
        let cur_satp = vm.cpu.csr.satp;
        if cur_satp != last_satp {
            satp_changes.push((count, last_satp, cur_satp));
            eprintln!(
                "[satp] count={} SATP changed: 0x{:08X} -> 0x{:08X} (PPN 0x{:05X} -> 0x{:05X}, mode {}->{})",
                count,
                last_satp, cur_satp,
                last_satp & 0x3FFFFF,
                cur_satp & 0x3FFFFF,
                (last_satp >> 31) & 1,
                (cur_satp >> 31) & 1,
            );
            last_satp = cur_satp;
        }

        // Track recent PCs (clone step_result since we match on it below)
        recent_pcs.push((
            count,
            vm.cpu.pc,
            vm.cpu.privilege,
            format!("{:?}", step_result),
        ));
        if recent_pcs.len() > trace_window {
            recent_pcs.remove(0);
        }

        // Check for new MMU events (page faults)
        let mmu_log_len = vm.bus.mmu_log.len();
        if mmu_log_len > last_mmu_log_len {
            for i in last_mmu_log_len..mmu_log_len {
                let evt = &vm.bus.mmu_log[i];
                match evt {
                    geometry_os::riscv::mmu::MmuEvent::PageFault { va, access, ptes } => {
                        if *va >= 0xC000_0000 {
                            eprintln!(
                                "[mmu] PAGE FAULT at count={}: VA=0x{:08X} access={:?} ptes={:?} PC=0x{:08X} priv={:?}",
                                count, va, access, ptes, vm.cpu.pc, vm.cpu.privilege
                            );
                        }
                    },
                    _ => {},
                }
            }
            last_mmu_log_len = mmu_log_len;
        }

        match step_result {
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                fault_count += 1;
                if !first_fault_seen {
                    first_fault_seen = true;
                    eprintln!("\n=== FIRST FAULT at count={} ===", count);
                    eprintln!("  Result: {:?}", step_result);
                    eprintln!("  PC: 0x{:08X}", vm.cpu.pc);
                    eprintln!("  Privilege: {:?}", vm.cpu.privilege);
                    eprintln!(
                        "  SATP: 0x{:08X} (PPN=0x{:05X}, mode={})",
                        vm.cpu.csr.satp,
                        vm.cpu.csr.satp & 0x3FFFFF,
                        (vm.cpu.csr.satp >> 31) & 1
                    );
                    eprintln!("  MSTATUS: 0x{:08X}", vm.cpu.csr.mstatus);
                    eprintln!("  SCAUSE: 0x{:08X}", vm.cpu.csr.scause);
                    eprintln!("  STVAL: 0x{:08X}", vm.cpu.csr.stval);
                    eprintln!("  MCAUSE: 0x{:08X}", vm.cpu.csr.mcause);
                    eprintln!("  MTVAL: 0x{:08X}", vm.cpu.csr.mtval);

                    // Dump the last N PCs before this fault
                    eprintln!("\n  Last {} PCs before fault:", recent_pcs.len());
                    for (c, pc, priv_, res) in &recent_pcs {
                        eprintln!(
                            "    [{}] PC=0x{:08X} priv={:?} result={:?}",
                            c, pc, priv_, res
                        );
                    }

                    // Check if 0xC00010FA is in the current page table
                    let satp_ppn = vm.cpu.csr.satp & 0x3FFFFF;
                    let pg_dir_phys = (satp_ppn as u64) << 12;
                    eprintln!("\n  Page table check (pg_dir at PA 0x{:08X}):", pg_dir_phys);

                    // L1[768] = first kernel megapage
                    let l1_768 = vm.bus.read_word(pg_dir_phys + 768 * 4).unwrap_or(0xDEAD);
                    eprintln!(
                        "    L1[768] = 0x{:08X} (V={} leaf={} PPN=0x{:05X})",
                        l1_768,
                        l1_768 & 1,
                        (l1_768 >> 1) & 1 | (l1_768 >> 2) & 1 | (l1_768 >> 3) & 1,
                        (l1_768 >> 10) & 0xFFFFF
                    );
                    // L1[0..10] for low addresses
                    for i in 0..10 {
                        let pte = vm.bus.read_word(pg_dir_phys + i * 4).unwrap_or(0xDEAD);
                        if pte != 0 {
                            eprintln!(
                                "    L1[{}] = 0x{:08X} (V={} PPN=0x{:05X})",
                                i,
                                pte,
                                pte & 1,
                                (pte >> 10) & 0xFFFFF
                            );
                        }
                    }
                    // L1[512..520] for RAM identity
                    for i in 512..520 {
                        let pte = vm.bus.read_word(pg_dir_phys + i * 4).unwrap_or(0xDEAD);
                        if pte != 0 {
                            eprintln!(
                                "    L1[{}] = 0x{:08X} (V={} PPN=0x{:05X})",
                                i,
                                pte,
                                pte & 1,
                                (pte >> 10) & 0xFFFFF
                            );
                        }
                    }

                    // If L1[768] is a non-leaf, check L2[1] (vpn0=1 for 0xC00010FA)
                    if l1_768 & 1 != 0 && (l1_768 & 0xE) == 0 {
                        // Non-leaf, check L2
                        let l2_ppn = (l1_768 >> 10) & 0xFFFFF;
                        let l2_base = (l2_ppn as u64) << 12;
                        let l2_1 = vm.bus.read_word(l2_base + 1 * 4).unwrap_or(0xDEAD);
                        eprintln!(
                            "    L2[1] (at PA 0x{:08X}) = 0x{:08X} (V={} PPN=0x{:05X})",
                            l2_base + 4,
                            l2_1,
                            l2_1 & 1,
                            (l2_1 >> 10) & 0xFFFFF
                        );
                        let l2_0 = vm.bus.read_word(l2_base).unwrap_or(0xDEAD);
                        eprintln!(
                            "    L2[0] (at PA 0x{:08X}) = 0x{:08X} (V={} PPN=0x{:05X})",
                            l2_base,
                            l2_0,
                            l2_0 & 1,
                            (l2_0 >> 10) & 0xFFFFF
                        );
                    }

                    // Try to read the instruction at the fault address
                    let fault_va = vm.cpu.pc;
                    eprintln!(
                        "\n  Attempting to read instruction at fault VA 0x{:08X}:",
                        fault_va
                    );

                    // Direct physical read of what the kernel image has at this offset
                    let kernel_offset = fault_va - 0xC000_0000; // Linux PA offset
                    if (kernel_offset as usize) < kernel_image.len() - 4 {
                        let inst_bytes =
                            &kernel_image[kernel_offset as usize..kernel_offset as usize + 4];
                        eprintln!(
                            "    Kernel image at offset 0x{:X}: {:02X} {:02X} {:02X} {:02X}",
                            kernel_offset,
                            inst_bytes[0],
                            inst_bytes[1],
                            inst_bytes[2],
                            inst_bytes[3]
                        );
                    }

                    // Check guest PA for this VA
                    let guest_pa = vm.bus.mem.ram_base + kernel_offset as u64;
                    let pa_word = vm.bus.read_word(guest_pa).unwrap_or(0xDEAD);
                    eprintln!("    Guest PA 0x{:08X}: word=0x{:08X}", guest_pa, pa_word);

                    // SBI console output so far
                    if !vm.bus.sbi.console_output.is_empty() {
                        let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
                        let start = s.len().saturating_sub(500);
                        eprintln!("\n  Last SBI output: ...{}", &s[start..]);
                    }

                    // Known PT pages count
                    eprintln!("\n  Known PT pages: {}", vm.bus.known_pt_pages.len());

                    // Dump all SATP changes seen so far
                    eprintln!("\n  SATP changes ({} total):", satp_changes.len());
                    for (c, old, new) in &satp_changes {
                        eprintln!("    [{}] 0x{:08X} -> 0x{:08X}", c, old, new);
                    }
                }

                if fault_count <= 10 {
                    eprintln!(
                        "[fault] #{} at count={}: {:?} PC=0x{:08X} priv={:?}",
                        fault_count, count, step_result, vm.cpu.pc, vm.cpu.privilege
                    );
                }
            },
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak | StepResult::Shutdown | StepResult::Yielded => {
                break;
            },
        }

        // Progress every 5M
        if count > 0 && count % 5_000_000 == 0 {
            eprintln!(
                "[progress] {}M: PC=0x{:08X} priv={:?} faults={} sbi_out={}",
                count / 1_000_000,
                vm.cpu.pc,
                vm.cpu.privilege,
                fault_count,
                vm.bus.sbi.console_output.len()
            );
        }

        count += 1;
    }

    eprintln!("\n=== Final State ===");
    eprintln!("Instructions: {}", count);
    eprintln!("Faults: {}", fault_count);
    eprintln!("PC: 0x{:08X}", vm.cpu.pc);
    eprintln!("Privilege: {:?}", vm.cpu.privilege);
    eprintln!("SATP: 0x{:08X}", vm.cpu.csr.satp);
    eprintln!("Known PT pages: {}", vm.bus.known_pt_pages.len());
    eprintln!("SATP changes: {}", satp_changes.len());
    for (c, old, new) in &satp_changes {
        eprintln!("  [{}] 0x{:08X} -> 0x{:08X}", c, old, new);
    }

    if !vm.bus.sbi.console_output.is_empty() {
        let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        eprintln!("\nSBI console output ({} bytes):\n{}", s.len(), s);
    }
}
