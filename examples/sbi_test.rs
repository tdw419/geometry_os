// Test our SBI implementation with a minimal bare-metal kernel.
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_path =
        "/home/jericho/projects/zion/projects/geometry_os/geometry_os/sbi_test_kernel.bin";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");

    eprintln!("SBI test kernel: {} bytes", kernel_data.len());

    let mem_base: u64 = 0x80000000;
    let ram_size = 16 * 1024 * 1024;
    let mut vm = RiscvVm::new_with_base(mem_base, ram_size);

    for (i, &byte) in kernel_data.iter().enumerate() {
        let addr = mem_base + i as u64;
        if vm.bus.write_byte(addr, byte).is_err() {
            eprintln!("Failed to write at offset {}", i);
            break;
        }
    }

    vm.cpu.pc = mem_base as u32;
    vm.cpu.x[10] = 0;
    vm.cpu.x[11] = 0;
    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;

    eprintln!("=== Running SBI test kernel ===\n");

    let max_instrs = 100_000;
    let mut count: u64 = 0;

    while count < max_instrs {
        vm.bus.tick_clint_n(1);
        vm.bus.sync_mip(&mut vm.cpu.csr.mip);

        let result = vm.step();

        match result {
            StepResult::Ok => {},
            StepResult::Ecall => {},
            StepResult::Ebreak => {
                let console = vm.bus.sbi.console_output.clone();
                let ecall_log = vm.bus.sbi.ecall_log.clone();
                let shutdown = vm.bus.sbi.shutdown_requested;

                if !console.is_empty() {
                    let s = String::from_utf8_lossy(&console);
                    eprintln!("\n=== SBI test completed at instr {} ===", count);
                    eprintln!("Console output: '{}'", s);
                }

                let spec_ver = vm.bus.read_word(0x1000).unwrap_or(0);
                let dbcn_avail = vm.bus.read_word(0x1004).unwrap_or(0);
                let time_avail = vm.bus.read_word(0x1008).unwrap_or(0);

                eprintln!("SBI spec version: 0x{:08X}", spec_ver);
                eprintln!("DBCN available: {}", dbcn_avail);
                eprintln!("TIME available: {}", time_avail);

                eprintln!(
                    "\nEcall count: {} (logged: {})",
                    vm.cpu.ecall_count,
                    ecall_log.len()
                );
                for (i, (a7, a6, a0)) in ecall_log.iter().take(30).enumerate() {
                    let ext_name = match a7 {
                        0x10 => "BASE",
                        0x4442434E => "DBCN",
                        0x54494D45 => "TIME",
                        0x53525354 => "SRST",
                        1 => "PUTCHAR",
                        _ => "UNKNOWN",
                    };
                    eprintln!(
                        "  ecall[{}]: a7=0x{:08X} ({}), a6={}, a0={}",
                        i, a7, ext_name, a6, a0
                    );
                }

                if shutdown {
                    eprintln!("\nSRST shutdown was requested!");
                }
                break;
            },
            StepResult::Shutdown => {
                let console = vm.bus.sbi.console_output.clone();
                let ecall_log = vm.bus.sbi.ecall_log.clone();
                let s = String::from_utf8_lossy(&console);
                eprintln!("\n=== SBI test: Shutdown at instr {} ===", count);
                eprintln!("Console output: '{}'", s);
                eprintln!(
                    "Ecall count: {} (logged: {})",
                    vm.cpu.ecall_count,
                    ecall_log.len()
                );
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                eprintln!("Fault at instr {}: {:?}", count, result);
                eprintln!(
                    "PC=0x{:08X} scause=0x{:08X} stval=0x{:08X}",
                    vm.cpu.pc, vm.cpu.csr.scause, vm.cpu.csr.stval
                );
                break;
            },
            _ => {
                eprintln!("Unexpected step result at {}: {:?}", count, result);
                break;
            },
        }
        count += 1;
    }

    if count >= max_instrs {
        eprintln!("\n=== TIMEOUT after {} instructions ===", max_instrs);
        let console = vm.bus.sbi.console_output.clone();
        let s = String::from_utf8_lossy(&console);
        eprintln!("Console output: '{}'", s);
        eprintln!("Ecall count: {}", vm.cpu.ecall_count);
    }

    eprintln!("\nFinal PC=0x{:08X} priv={:?}", vm.cpu.pc, vm.cpu.privilege);
    eprintln!("a0=0x{:08X} a1=0x{:08X}", vm.cpu.x[10], vm.cpu.x[11]);
}
