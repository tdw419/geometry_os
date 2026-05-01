// kern_diag3.rs -- check CLINT state after kernel boot
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");

    let mut vm = RiscvVm::new(2 * 1024 * 1024);
    let load_info =
        geometry_os::riscv::loader::load_auto(&mut vm.bus, &elf, 0x8000_0000).expect("load");

    vm.cpu.pc = load_info.entry;
    vm.cpu.x[10] = 0;
    vm.cpu.x[11] = 0;
    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;

    let mut count: u64 = 0;
    let mut console_chars: Vec<u8> = Vec::new();
    let mut timer_fired = false;
    let mut first_fire_count: u64 = 0;

    // Run until timer fires or 20M instructions
    while count < 20_000_000 {
        match vm.step() {
            StepResult::Shutdown => break,
            StepResult::Ebreak => break,
            _ => {}
        }

        // Capture console output
        let prev_len = vm.bus.sbi.console_output.len();
        if prev_len > console_chars.len() {
            for &b in &vm.bus.sbi.console_output[console_chars.len()..prev_len] {
                if (0x20..=0x7E).contains(&b) || b == b'\n' {
                    eprint!("{}", b as char);
                }
            }
            console_chars = vm.bus.sbi.console_output.clone();
        }

        // Check if timer fired (mepc jumps to mtvec = 0x80000340)
        let mepc = vm.cpu.csr.read(0x341);
        if mepc == 0x80000340 && !timer_fired {
            timer_fired = true;
            first_fire_count = count;
            eprintln!("\n[DIAG] Timer FIRST FIRED at instruction {}", count);
            eprintln!(
                "[DIAG] mtime={}, mtimecmp={}",
                vm.bus.clint.mtime, vm.bus.clint.mtimecmp
            );
            eprintln!(
                "[DIAG] mip=0x{:08X} mie=0x{:08X} mstatus=0x{:08X}",
                vm.cpu.csr.mip, vm.cpu.csr.mie, vm.cpu.csr.mstatus
            );
            break;
        }

        count += 1;

        // Check CLINT state periodically
        if count % 2_000_000 == 0 {
            eprintln!("[DIAG] {} instr: mtime={}, mtimecmp={}, mip=0x{:08X}, mie=0x{:08X}, mstatus=0x{:08X}",
                count, vm.bus.clint.mtime, vm.bus.clint.mtimecmp,
                vm.cpu.csr.mip, vm.cpu.csr.mie, vm.cpu.csr.mstatus);
        }
    }

    if !timer_fired {
        eprintln!("\n[DIAG] Timer NEVER fired in {} instructions", count);
        eprintln!(
            "[DIAG] mtime={}, mtimecmp={}",
            vm.bus.clint.mtime, vm.bus.clint.mtimecmp
        );
        eprintln!(
            "[DIAG] mip=0x{:08X} mie=0x{:08X} mstatus=0x{:08X}",
            vm.cpu.csr.mip, vm.cpu.csr.mie, vm.cpu.csr.mstatus
        );
        eprintln!(
            "[DIAG] pc=0x{:08X} mscratch=0x{:08X} mtvec=0x{:08X}",
            vm.cpu.pc,
            vm.cpu.csr.read(0x340),
            vm.cpu.csr.read(0x305)
        );
    }
}
