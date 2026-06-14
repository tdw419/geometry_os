//! Diagnostic: trace MEPC values on each timer context switch.
//! Watches for MRET instructions and logs the MEPC being restored.

use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_data =
        fs::read("examples/riscv-hello/geos_kern.elf").expect("geos_kern.elf not found");

    let mut vm = RiscvVm::new_with_base(0x80000000u64, 16 * 1024 * 1024);

    let load_info =
        geometry_os::riscv::loader::load_elf(&mut vm.bus, &kernel_data).expect("ELF load failed");

    eprintln!("Entry: 0x{:08X}", load_info.entry);

    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;
    vm.cpu.pc = load_info.entry as u32;
    vm.cpu.csr.mie |= 1 << 7;
    vm.cpu.csr.mstatus |= 1 << 3;

    let max_instr = 5_000_000u64;
    let mut count = 0u64;
    let mut mret_count = 0u64;

    // MRET is 0x30200073
    while count < max_instr {
        let pc = vm.cpu.pc;
        let word = vm.bus.read_word(pc as u64).unwrap_or(0);

        vm.step();
        count += 1;

        // Detect MRET
        if word == 0x30200073 {
            mret_count += 1;
            if mret_count <= 40 {
                let mepc = vm.cpu.csr.mepc;
                let target = if mepc >= 0x80050000 && mepc < 0x80090000 {
                    if mepc == 0x80050000 {
                        "B _start"
                    } else {
                        "B (life32 mid)"
                    }
                } else if mepc >= 0x80010000 && mepc < 0x80050000 {
                    if mepc == 0x80010000 {
                        "A _start"
                    } else {
                        "A (painter mid)"
                    }
                } else if mepc >= 0x80000000 && mepc < 0x80010000 {
                    "KERNEL"
                } else {
                    "???"
                };
                eprintln!(
                    "MRET #{} @ instr {}: mepc=0x{:08X} -> {}",
                    mret_count, count, mepc, target
                );
            }
        }

        if vm.cpu.pc == 0 && count > 1000 {
            eprintln!("PC went to 0 at instr {} - likely crash", count);
            break;
        }
    }

    eprintln!("\nTotal MRETs: {}", mret_count);

    let sbi = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    let clean: String = sbi.chars().filter(|c| *c != 'T').collect();
    let life_count = clean.matches("[life32] 32x32").count();
    eprintln!("Life32 startup count: {}", life_count);
}
