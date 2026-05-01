
// kern_diag2.rs -- trace timer interrupts and context switches
use geometry_os::riscv::RiscvVm;
use geometry_os::riscv::cpu::StepResult;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");

    let mut vm = RiscvVm::new(2 * 1024 * 1024);
    let load_info = geometry_os::riscv::loader::load_auto(&mut vm.bus, &elf, 0x8000_0000).expect("load");

    vm.cpu.pc = load_info.entry;
    vm.cpu.x[10] = 0; // a0 = hartid
    vm.cpu.x[11] = 0; // a1 = dtb (kernel doesn't use it)
    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;

    let mut count: u64 = 0;
    let mut timer_count: u64 = 0;
    let mut last_mepc: u32 = 0;
    let max_instr = 10_000_000u64;

    while count < max_instr {
        let prev_pc = vm.cpu.pc;
        match vm.step() {
            StepResult::Ok | StepResult::FetchFault
            | StepResult::LoadFault | StepResult::StoreFault => {}
            StepResult::Ebreak => {
                eprintln!("[{}] EBREAK at 0x{:08X}", count, prev_pc);
                break;
            }
            StepResult::Ecall => {
                let mepc = vm.cpu.csr.read(0x341);
                if mepc != last_mepc || count < 100 {
                    let a7 = vm.cpu.x[17];
                    if a7 == 1 { // putchar
                        let ch = vm.cpu.x[10] as u8;
                        if (0x20..=0x7E).contains(&ch) || ch == b'\n' {
                            eprint!("{}", ch as char);
                        }
                    }
                }
                last_mepc = mepc;
            }
            StepResult::Shutdown => {
                eprintln!("[{}] SHUTDOWN", count);
                break;
            }
        }

        // Detect timer interrupt delivery (mepc changes to trap handler)
        let mepc = vm.cpu.csr.read(0x341);
        if mepc == 0x80000340 && prev_pc != 0x80000340 {
            timer_count += 1;
            if timer_count <= 20 {
                eprintln!("[{}] TIMER #{} from pc=0x{:08X}", count, timer_count, prev_pc);
            }
        }

        count += 1;
    }

    eprintln!("\n[kern_diag2] {} instructions, {} timer interrupts", count, timer_count);
    eprintln!("[kern_diag2] final pc=0x{:08X} mscratch=0x{:08X} mtvec=0x{:08X}",
        vm.cpu.pc, vm.cpu.csr.read(0x340), vm.cpu.csr.read(0x305));

    // Print last few chars of console
    let raw = &vm.bus.sbi.console_output;
    let s = String::from_utf8_lossy(raw);
    if s.len() > 200 {
        eprintln!("\n--- last 200 bytes of console ---");
        eprint!("{}", &s[s.len()-200..]);
    } else {
        eprintln!("\n--- console ---");
        eprint!("{}", s);
    }
}
