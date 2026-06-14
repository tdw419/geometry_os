// geos_native_boot.rs -- Loads geos_native.elf and runs it in the GeOS interpreter
// This matches the bootloader structure we built for Geometry OS

use geometry_os::riscv::cpu::{Privilege, StepResult};
use geometry_os::riscv::RiscvVm;
use std::fs;
use std::io::Read;
use std::os::unix::io::AsRawFd;

fn main() {
    let elf_path = "native/build/geos_native.elf";
    let elf_data =
        fs::read(elf_path).expect("geos_native.elf not found. Did you run 'make -C native'?");

    println!("geos_native.elf size: {} bytes", elf_data.len());

    // Create VM with 128MB RAM
    let mem_base: u64 = 0x80000000;
    let ram_size = 128 * 1024 * 1024;
    let mut vm = RiscvVm::new_with_base(mem_base, ram_size);

    // Load ELF
    let load_info = match geometry_os::riscv::loader::load_auto(&mut vm.bus, &elf_data, 0) {
        Ok(info) => {
            println!(
                "Loaded geos_native.elf: entry=0x{:08X}, highest=0x{:08X}",
                info.entry, info.highest_addr
            );
            info
        },
        Err(e) => {
            eprintln!("Failed to load ELF: {}", e);
            std::process::exit(1);
        },
    };

    vm.cpu.pc = load_info.entry as u32;
    vm.cpu.privilege = Privilege::Machine;
    vm.bus.mmu_debug_trace = false;

    println!("=== Booting geos_native.elf ===\n");

    // Set stdin to non-blocking mode for forwarding to guest UART
    let stdin = std::io::stdin();
    let stdin_fd = stdin.as_raw_fd();
    let flags = unsafe { libc::fcntl(stdin_fd, libc::F_GETFL) };
    unsafe { libc::fcntl(stdin_fd, libc::F_SETFL, flags | libc::O_NONBLOCK) };
    let mut stdin_reader = stdin.lock();
    let mut stdin_buf = [0u8; 64];

    let max_instrs = 1_000_000_000;
    let mut count: u64 = 0;
    let mut stdin_eof = false;
    let mut instructions_post_eof = 0;

    while count < max_instrs {
        // Forward any pending stdin characters to the UART and SBI console_input
        if !stdin_eof {
            loop {
                match stdin_reader.read(&mut stdin_buf) {
                    Ok(0) => {
                        stdin_eof = true;
                        break;
                    },
                    Ok(n) => {
                        for &b in &stdin_buf[..n] {
                            vm.bus.uart.receive_byte(b);
                            // Also forward to SBI console_input for xv6 native
                            vm.bus.sbi.console_input.push(b);
                        }
                    },
                    Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => break,
                    Err(_) => {
                        stdin_eof = true;
                        break;
                    },
                }
            }
        }

        let result = vm.step();

        // Flush console output to stdout as it arrives
        if !vm.bus.sbi.console_output.is_empty() {
            let out: Vec<u8> = vm.bus.sbi.console_output.drain(..).collect();
            print!("{}", String::from_utf8_lossy(&out));
            use std::io::Write;
            std::io::stdout().flush().ok();
        }

        match result {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                println!("\n=== Halted via EBREAK at instr {} ===", count);
                break;
            },
            StepResult::Shutdown => {
                println!("\n=== Shutdown at instr {} ===", count);
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                // Page faults are delivered as traps to the guest kernel's trap handler
                // (deliver_trap already set sepc/scause/stval and redirected PC to stvec).
                // Continue stepping — the guest OS will handle the fault.
            },
            StepResult::Yielded => {
                println!("\n=== Yielded at instr {} ===", count);
                break;
            },
        }

        if stdin_eof {
            instructions_post_eof += 1;
            // 50 million instructions is plenty for booting + command execution.
            // In debug mode, this takes ~10 seconds. In release mode, <1 second.
            if instructions_post_eof > 50_000_000 {
                println!("\n=== Exiting: stdin EOF reached and execution budget exhausted ===");
                break;
            }
        }

        count += 1;
    }

    // Flush any pending SBI console output
    if !vm.bus.sbi.console_output.is_empty() {
        let console_str = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        println!("\n--- Console Output ---\n{}", console_str);
    }
}
