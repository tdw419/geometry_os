// user_verify.rs -- Run a Linux user-mode ELF binary in RISC-V User mode.
use geometry_os::riscv::cpu::{Privilege, StepResult};
use geometry_os::riscv::{loader, RiscvVm};

fn main() {
    let elf_path = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/syscall_stress.elf".into());
    let elf = std::fs::read(&elf_path).expect("read elf");
    let mut vm = RiscvVm::new_with_base(0x8000_0000, 1024 * 1024);

    let load_info = loader::load_elf(&mut vm.bus, &elf).expect("load elf");
    vm.cpu.pc = load_info.entry;
    vm.cpu.privilege = Privilege::User;
    vm.cpu.x[2] = (0x8000_0000u64 + 1024 * 1024 - 16) as u32;
    vm.bus.heap_start = load_info.highest_addr;
    vm.bus.heap_end = load_info.highest_addr;
    vm.bus.mmap_next = 0x8000_0000 + 1024 * 1024 / 2;
    vm.cpu.csr.mie = 0;
    vm.cpu.csr.mstatus &= !(1 << 3);

    let mut count = 0u64;
    loop {
        let result = vm.step();
        count += 1;
        if vm.bus.sbi.shutdown_requested {
            eprintln!(
                "[user_verify] Guest requested shutdown after {} instructions",
                count
            );
            break;
        }
        match result {
            StepResult::Ok | StepResult::Ecall | StepResult::Yielded => {},
            StepResult::Ebreak => {
                eprintln!("[user_verify] EBREAK at PC=0x{:08X}", vm.cpu.pc);
                break;
            },
            StepResult::Shutdown => {
                eprintln!("[user_verify] Shutdown");
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                eprintln!(
                    "[user_verify] FAULT at PC=0x{:08X} mcause=0x{:08X} mtval=0x{:08X}",
                    vm.cpu.pc, vm.cpu.csr.mcause, vm.cpu.csr.mtval
                );
                break;
            },
        }
        if count > 200_000 {
            eprintln!("[user_verify] Timeout after {} instructions", count);
            break;
        }
    }

    let raw = &vm.bus.sbi.console_output;
    let s = String::from_utf8_lossy(raw);
    print!("{}", s);
    eprintln!("[user_verify] Ran {} instructions", count);
}
