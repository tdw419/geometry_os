// kern_debug.rs -- Debug verifier that stops on first fault
use geometry_os::riscv::{
    cpu::{Privilege, StepResult},
    loader, RiscvVm,
};
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");
    let mut vm = RiscvVm::new(1024 * 1024);

    let load_info = loader::load_auto(&mut vm.bus, &elf, 0x8000_0000).expect("load");
    vm.cpu.pc = load_info.entry;
    vm.cpu.x[10] = 0;
    vm.cpu.privilege = Privilege::Machine;

    eprintln!("[kern_debug] entry=0x{:08X}", load_info.entry);

    let mut count: u64 = 0;
    let mut last_console_len = 0;
    let max_steps: u64 = 500_000;

    while count < max_steps {
        let prev_pc = vm.cpu.pc;
        let step = vm.step();
        count += 1;

        // Print new console output
        let cur_len = vm.bus.sbi.console_output.len();
        if cur_len > last_console_len {
            let new = String::from_utf8_lossy(&vm.bus.sbi.console_output[last_console_len..]);
            eprint!("{}", new);
            last_console_len = cur_len;
        }

        match step {
            StepResult::FetchFault => {
                eprintln!(
                    "\n[FAULT] FetchFault at PC=0x{:08X} insn #{}",
                    prev_pc, count
                );
                break;
            }
            StepResult::LoadFault => {
                eprintln!(
                    "\n[FAULT] LoadFault at PC=0x{:08X} insn #{}",
                    prev_pc, count
                );
                break;
            }
            StepResult::StoreFault => {
                eprintln!(
                    "\n[FAULT] StoreFault at PC=0x{:08X} insn #{}",
                    prev_pc, count
                );
                break;
            }
            StepResult::Ebreak => {
                eprintln!("\n[EBREAK] at PC=0x{:08X} insn #{}", prev_pc, count);
                break;
            }
            StepResult::Shutdown => {
                eprintln!("\n[SHUTDOWN] insn #{}", count);
                break;
            }
            _ => {}
        }
    }

    eprintln!("\n[kern_debug] ran {} instructions", count);
    eprintln!("[kern_debug] final pc=0x{:08X}", vm.cpu.pc);
    let console = &vm.bus.sbi.console_output;
    eprintln!("--- console ({} bytes) ---", console.len());
    let s = String::from_utf8_lossy(console);
    print!("{}", s);
    eprintln!("--- end ---");
}
