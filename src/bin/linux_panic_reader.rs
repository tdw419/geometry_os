use geometry_os::riscv::RiscvVm;
use std::env;
use std::fs;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let max_instructions: u64 = env::var("INSTRUCTIONS")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(50_000_000);

    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path)?;
    let initrd_data = fs::read("initrd.cpio").ok();

    eprintln!(
        "[panic-reader] Booting Linux for {} instructions...",
        max_instructions
    );

    let bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=8";

    let (mut vm, result) = RiscvVm::boot_linux(
        &kernel_data,
        initrd_data.as_deref(),
        512,
        max_instructions,
        bootargs,
    )?;

    eprintln!(
        "[panic-reader] Done: PC=0x{:08X}, {} instructions",
        vm.cpu.pc, result.instructions
    );

    // Read the panic message buffer
    let buf_va: u64 = 0xC14870C4;
    let buf_pa: u64 = buf_va - 0xC0000000 + 0x80000000;

    let mut panic_msg = Vec::new();
    for i in 0..1024 {
        match vm.bus.read_byte(buf_pa + i) {
            Ok(0) | Err(_) => break,
            Ok(b) => panic_msg.push(b),
        }
    }

    if !panic_msg.is_empty() {
        let msg = String::from_utf8_lossy(&panic_msg);
        println!("=== PANIC MESSAGE ===");
        println!("{}", msg);
        println!("=== END ===");
    } else {
        println!("Panic buffer is empty.");
    }

    // Validate DTB at the expected address
    let dtb_pa: u64 = 0x9FF00000;
    let mut dtb_header = [0u8; 40];
    let mut dtb_valid = true;
    for i in 0..40 {
        match vm.bus.read_byte(dtb_pa + i as u64) {
            Ok(b) => dtb_header[i] = b,
            Err(_) => {
                dtb_valid = false;
                break;
            },
        }
    }

    if dtb_valid {
        let magic =
            u32::from_be_bytes([dtb_header[0], dtb_header[1], dtb_header[2], dtb_header[3]]);
        let totalsize =
            u32::from_be_bytes([dtb_header[4], dtb_header[5], dtb_header[6], dtb_header[7]]);
        let off_struct =
            u32::from_be_bytes([dtb_header[8], dtb_header[9], dtb_header[10], dtb_header[11]]);

        println!("\n=== DTB at PA 0x{:08X} ===", dtb_pa);
        println!(
            "magic: 0x{:08X} ({})",
            magic,
            if magic == 0xD00DFEED {
                "VALID"
            } else {
                "INVALID"
            }
        );
        println!("totalsize: {} bytes", totalsize);
        println!("off_dt_struct: 0x{:08X}", off_struct);

        if magic == 0xD00DFEED && totalsize > 0 && (totalsize as usize) < 0x100000 {
            let dtb_size = totalsize as usize;
            let mut dtb_data = vec![0u8; dtb_size];
            for i in 0..dtb_size {
                if let Ok(b) = vm.bus.read_byte(dtb_pa + i as u64) {
                    dtb_data[i] = b;
                }
            }

            let needles: &[&[u8]] = &[b"riscv,cpu-intc", b"interrupt-controller", b"riscv,plic0"];
            for needle in needles {
                let s = std::str::from_utf8(needle).unwrap_or("?");
                for i in 0..dtb_size.saturating_sub(needle.len()) {
                    if dtb_data[i..i + needle.len()] == **needle {
                        println!("Found '{}' in DTB at offset 0x{:X}", s, i);
                    }
                }
            }

            fs::write("/tmp/geos_live.dtb", &dtb_data)?;
            println!("Wrote live DTB to /tmp/geos_live.dtb");
        }
    }

    // Check kernel's page tables
    let satp = vm.cpu.csr.read(0x180);
    let ppn = satp & 0x3FFFFF;
    let pg_dir_pa = (ppn as u64) << 12;
    println!("\n=== VM State ===");
    println!("SATP: 0x{:08X} pg_dir=PA 0x{:08X}", satp, pg_dir_pa);

    // Check if DTB PA is mapped in direct mapping
    let dtb_va_direct: u32 = 0x9FF00000;
    let vpn1 = ((dtb_va_direct >> 22) & 0x3FF) as u64;
    let l1_entry_addr = pg_dir_pa + vpn1 * 4;
    match vm.bus.read_word(l1_entry_addr as u64) {
        Ok(entry) => {
            let pte_ppn = (entry >> 10) & 0xFFFFF;
            let pte_pa = (pte_ppn as u64) << 12;
            let is_valid = (entry & 1) != 0;
            let is_leaf = (entry & 0xE) != 0;
            println!(
                "\nVA 0x{:08X} L1[{}]: PTE=0x{:08X} valid={} leaf={} next=0x{:08X}",
                dtb_va_direct, vpn1, entry, is_valid, is_leaf, pte_pa
            );
            if is_valid && !is_leaf {
                let vpn0 = ((dtb_va_direct >> 12) & 0x3FF) as u64;
                let l0_addr = pte_pa + vpn0 * 4;
                match vm.bus.read_word(l0_addr as u64) {
                    Ok(l0_entry) => {
                        let l0_ppn = (l0_entry >> 10) & 0xFFFFF;
                        let l0_pa = (l0_ppn as u64) << 12;
                        println!(
                            "  L0[{}]: PTE=0x{:08X} valid={} maps_to=0x{:08X}",
                            vpn0,
                            l0_entry,
                            (l0_entry & 1) != 0,
                            l0_pa
                        );
                    },
                    Err(_) => println!("  L0: read error"),
                }
            } else if is_valid && is_leaf {
                let mapped_pa = pte_pa | ((dtb_va_direct & 0x3FFFFF) as u64);
                println!(
                    "  Megapage: VA 0x{:08X} -> PA 0x{:08X}",
                    dtb_va_direct, mapped_pa
                );
            }
        },
        Err(_) => println!("L1: read error at PA 0x{:08X}", l1_entry_addr),
    }

    // Also check kernel-mapped version of DTB
    let dtb_va_kernel: u32 = 0xDFF00000;
    let vpn1k = ((dtb_va_kernel >> 22) & 0x3FF) as u64;
    let l1k_addr = pg_dir_pa + vpn1k * 4;
    match vm.bus.read_word(l1k_addr as u64) {
        Ok(entry) => {
            let pte_ppn = (entry >> 10) & 0xFFFFF;
            let pte_pa = (pte_ppn as u64) << 12;
            let is_valid = (entry & 1) != 0;
            let is_leaf = (entry & 0xE) != 0;
            println!(
                "\nVA 0x{:08X} L1[{}]: PTE=0x{:08X} valid={} leaf={} next=0x{:08X}",
                dtb_va_kernel, vpn1k, entry, is_valid, is_leaf, pte_pa
            );
            if is_valid && is_leaf {
                let mapped_pa = pte_pa | ((dtb_va_kernel & 0x3FFFFF) as u64);
                println!(
                    "  Megapage: VA 0x{:08X} -> PA 0x{:08X}",
                    dtb_va_kernel, mapped_pa
                );
            }
        },
        Err(_) => println!("Kernel VA L1: read error"),
    }

    // Read what the kernel actually has in _dtb_early_va and _dtb_early_pa
    let dtb_early_va_pa: u64 = 0x80801008;
    let dtb_early_pa_pa: u64 = 0x8080100C;
    let early_va = vm.bus.read_word(dtb_early_va_pa).unwrap_or(0xDEAD);
    let early_pa = vm.bus.read_word(dtb_early_pa_pa).unwrap_or(0xDEAD);
    println!("\n=== DTB Pointers (kernel state) ===");
    println!(
        "_dtb_early_va @ PA 0x{:08X} = 0x{:08X}",
        dtb_early_va_pa, early_va
    );
    println!(
        "_dtb_early_pa @ PA 0x{:08X} = 0x{:08X}",
        dtb_early_pa_pa, early_pa
    );
    // Try reading DTB magic from the VA the kernel would use
    if early_va != 0 && early_va != 0xDEAD {
        // Translate VA to PA for direct memory read
        let va_as_u32 = early_va as u32;
        let vpn1 = ((va_as_u32 >> 22) & 0x3FF) as u64;
        let l1_addr = pg_dir_pa + vpn1 * 4;
        if let Ok(l1e) = vm.bus.read_word(l1_addr) {
            let l1_valid = (l1e & 1) != 0;
            let l1_leaf = (l1e & 0xE) != 0;
            if l1_valid && !l1_leaf {
                let l2_pa = (((l1e >> 10) & 0xFFFFF) as u64) << 12;
                let vpn0 = ((va_as_u32 >> 12) & 0x3FF) as u64;
                if let Ok(l0e) = vm.bus.read_word(l2_pa + vpn0 * 4) {
                    let pa = (((l0e >> 10) & 0xFFFFF) as u64) << 12;
                    let magic = vm.bus.read_word(pa).unwrap_or(0);
                    println!(
                        "  VA 0x{:08X} -> PA 0x{:08X} (via L2), DTB magic there = 0x{:08X} {}",
                        va_as_u32,
                        pa,
                        magic,
                        if magic == 0xD00DFEED {
                            "VALID"
                        } else {
                            "INVALID"
                        }
                    );
                }
            } else if l1_valid && l1_leaf {
                let pa = (((l1e >> 10) & 0xFFFFF) as u64) << 12 | ((va_as_u32 & 0x3FFFFF) as u64);
                let magic = vm.bus.read_word(pa).unwrap_or(0);
                println!(
                    "  VA 0x{:08X} -> PA 0x{:08X} (megapage), DTB magic there = 0x{:08X} {}",
                    va_as_u32,
                    pa,
                    magic,
                    if magic == 0xD00DFEED {
                        "VALID"
                    } else {
                        "INVALID"
                    }
                );
            } else {
                println!("  VA 0x{:08X} L1 not valid! (PTE=0x{:08X})", va_as_u32, l1e);
            }
        }
    }

    println!("\nKey registers:");
    println!(
        "  PC=0x{:08X}  RA=0x{:08X}  SP=0x{:08X}",
        vm.cpu.pc, vm.cpu.x[1], vm.cpu.x[2]
    );
    println!("  a0=0x{:08X}  a1=0x{:08X}", vm.cpu.x[10], vm.cpu.x[11]);
    println!(
        "  scause=0x{:08X}  sepc=0x{:08X}  stval=0x{:08X}",
        vm.cpu.csr.scause, vm.cpu.csr.sepc, vm.cpu.csr.stval
    );

    // Print console output from SBI DBCN
    if !vm.bus.sbi.console_output.is_empty() {
        let console_str = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        println!(
            "\n=== CONSOLE OUTPUT ({} bytes) ===",
            vm.bus.sbi.console_output.len()
        );
        println!("{}", console_str);
        println!("=== END CONSOLE ===");
    } else {
        println!("\nNo console output collected.");
    }

    // Decode DBCN writes from ecall log as ASCII text
    // DBCN_CONSOLE_WRITE (fid=0): a0 is supposed to be num_bytes, a1 is addr
    // But Linux earlycon uses it as a0=char for single-byte writes
    let mut dbcn_text = String::new();
    let mut real_console_writes = 0;
    for (_i, (a7, a6, a0)) in vm.bus.sbi.ecall_log.iter().enumerate() {
        if *a7 == 0x4442434E && *a6 == 0 {
            // DBCN fid=0
            // If a0 looks like a small value (< 256), treat as single byte
            if *a0 < 256 {
                let ch = (*a0 as u8) & 0xFF;
                if ch >= 0x20 && ch < 0x7F {
                    dbcn_text.push(ch as char);
                } else if ch == 0x0A {
                    dbcn_text.push('\n');
                } else if ch == 0x0D {
                    // skip CR
                } else {
                    dbcn_text.push_str(&format!("\\x{:02x}", ch));
                }
            } else {
                // Bulk write: a0 = num_bytes (we can't decode without address)
                real_console_writes += 1;
            }
        }
    }
    if !dbcn_text.is_empty() {
        println!(
            "\n=== DBCN CHAR STREAM ({} single-byte writes) ===",
            dbcn_text.len()
        );
        println!("{}", dbcn_text);
        println!("=== END DBCN ===");
    }
    if real_console_writes > 0 {
        println!(
            "Also had {} bulk DBCN_CONSOLE_WRITE calls (need addr to decode)",
            real_console_writes
        );
    }

    // Print last 30 SBI calls (skip the massive timer spam)
    println!(
        "\nSBI ecall log ({} calls, showing first 60 + last 30):",
        vm.bus.sbi.ecall_log.len()
    );
    let log = &vm.bus.sbi.ecall_log;
    for (i, (a7, a6, a0)) in log.iter().enumerate() {
        // Show first 60 calls, then skip to last 30
        if i >= 60 && i < log.len().saturating_sub(30) {
            if i == 60 {
                println!("  ... ({} calls omitted) ...", log.len() - 60 - 30);
            }
            continue;
        }
        let ext = match a7 {
            0x10 => "BASE",
            0x54494D45 => "TIME",
            0x735049 => "IPI",
            0x52464E43 => "RFENCE",
            0x53525354 => "SRST",
            0x4442434E => "DBCN",
            1 => "PUTCHAR",
            _ => "???",
        };
        println!("  [{}] {} fid={} a0=0x{:X}", i, ext, a6, a0);
    }

    Ok(())
}
