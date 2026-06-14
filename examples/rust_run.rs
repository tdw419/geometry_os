// Run a Rust bare-metal ELF on the GeOS RISC-V VM.
// cargo run --release --example rust_run

use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "../geometry_os/examples/riscv-rust/hello_rust.elf".into());
    let elf_data = std::fs::read(&elf_path).unwrap_or_else(|e| {
        eprintln!("Error reading {}: {}", elf_path, e);
        std::process::exit(1);
    });
    eprintln!("Loaded {} ELF: {} bytes", elf_path, elf_data.len());

    let mut vm = RiscvVm::new(1024 * 1024);
    let boot = vm.boot_guest(&elf_data, 1, 1_000_000).expect("boot failed");
    eprintln!(
        "Booted: {} instructions, entry=0x{:08X}",
        boot.instructions, boot.entry
    );

    if vm.bus.sbi.shutdown_requested {
        let output = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        println!("{}", output);
        eprintln!(
            "Program shut down cleanly during boot ({} instructions)",
            boot.instructions
        );
        return;
    }

    // If not shut down during boot, keep running
    let mut steps: u64 = 0;
    let max_steps = 2_000_000;
    while steps < max_steps {
        match vm.step() {
            StepResult::Ok
            | StepResult::FetchFault
            | StepResult::LoadFault
            | StepResult::StoreFault
            | StepResult::Ecall
            | StepResult::Yielded => {},
            StepResult::Ebreak | StepResult::Shutdown => break,
        }
        steps += 1;
    }

    let output = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    println!("{}", output);
    if vm.bus.sbi.shutdown_requested {
        eprintln!(
            "Program shut down ({} + {} instructions)",
            boot.instructions, steps
        );
    } else {
        eprintln!(
            "VM ran {} + {} steps without shutdown",
            boot.instructions, steps
        );
    }
}
