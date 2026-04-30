// kern_trace.rs -- Trace first N instructions
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

    let max_steps: u64 = 800;
    let mut last_console_len = 0;
    let mut ecalls = 0;

    for i in 0..max_steps {
        let prev_pc = vm.cpu.pc;
        let step = vm.step();

        // Print new console output
        let cur_len = vm.bus.sbi.console_output.len();
        if cur_len > last_console_len {
            let new = String::from_utf8_lossy(&vm.bus.sbi.console_output[last_console_len..]);
            eprint!("{}", new);
            last_console_len = cur_len;
        }

        let step_str = match step {
            StepResult::Ok => "ok",
            StepResult::FetchFault => "FETCH_FAULT",
            StepResult::LoadFault => "LOAD_FAULT",
            StepResult::StoreFault => "STORE_FAULT",
            StepResult::Ebreak => "EBREAK",
            StepResult::Shutdown => "SHUTDOWN",
            StepResult::Ecall => "ECALL",
        };

        // Print all instructions after BSS clear (after insn 312) and any interesting events
        if i >= 310
            || matches!(
                step,
                StepResult::FetchFault
                    | StepResult::LoadFault
                    | StepResult::StoreFault
                    | StepResult::Ebreak
                    | StepResult::Shutdown
            )
        {
            if step == StepResult::Ecall {
                ecalls += 1;
            }
            eprintln!(
                "[{:4}] PC=0x{:08X} a0=0x{:08X} a7=0x{:08X} sp=0x{:08X} mepc=0x{:08X} -> {}",
                i, prev_pc, vm.cpu.x[10], vm.cpu.x[17], vm.cpu.x[2], vm.cpu.csr.mepc, step_str
            );
        }

        if matches!(
            step,
            StepResult::FetchFault
                | StepResult::LoadFault
                | StepResult::StoreFault
                | StepResult::Ebreak
                | StepResult::Shutdown
        ) {
            break;
        }
    }

    let console = &vm.bus.sbi.console_output;
    eprintln!("\n--- console ({} bytes) ---", console.len());
    let s = String::from_utf8_lossy(console);
    print!("{}", s);
    eprintln!("--- end ---");
}
