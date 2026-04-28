// kern_run.rs -- Boot a Phase I kernel ELF, run to halt, dump console output.
//
// Used to verify geos_kern.elf prints `[geos] kernel boot` + 5 ticks before
// SBI shutdown. Unlike sh_run, this is one-shot and prints the captured
// console buffer at the end -- no interactive UART loop required.
//
// Usage: cargo run --release --example kern_run -- examples/riscv-hello/geos_kern.elf

use geometry_os::riscv::RiscvVm;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());

    let elf_data = fs::read(&elf_path).unwrap_or_else(|e| {
        eprintln!("failed to read {}: {}", elf_path, e);
        std::process::exit(1);
    });

    let mut vm = RiscvVm::new(1024 * 1024);
    let result = vm
        .boot_guest(&elf_data, 1, 50_000_000)
        .expect("boot_guest failed");

    eprintln!(
        "[kern_run] entry=0x{:08X} ran {} instructions",
        result.entry, result.instructions
    );

    let console = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    print!("{}", console);
}
