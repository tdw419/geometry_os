// kern_diag.rs -- diagnostic for Phase I kernel boot
use geometry_os::riscv::RiscvVm;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");

    // Need 2MB to fit kernel + guests + stacks
    let mut vm = RiscvVm::new(2 * 1024 * 1024);
    let r = vm.boot_guest(&elf, 2, 100_000_000).expect("boot");

    eprintln!(
        "[kern_diag] entry=0x{:08X} ran {} instructions",
        r.entry, r.instructions
    );
    eprintln!("[kern_diag] final pc=0x{:08X}", vm.cpu.pc);
    eprintln!("[kern_diag] privilege={:?}", vm.cpu.privilege);
    eprintln!(
        "[kern_diag] mscratch=0x{:08X} mtvec=0x{:08X}",
        vm.cpu.csr.read(0x340),
        vm.cpu.csr.read(0x305)
    );
    eprintln!(
        "[kern_diag] sp=0x{:08X} ra=0x{:08X} tp=0x{:08X}",
        vm.cpu.x[2], vm.cpu.x[1], vm.cpu.x[4]
    );

    // Check console output
    let raw = &vm.bus.sbi.console_output;
    let s = String::from_utf8_lossy(raw);
    eprintln!("--- console ({} bytes) ---", raw.len());
    print!("{}", s);
    eprintln!("--- end console ---");

    // Check if we got timer interrupts
    eprintln!("--- SBI stats ---");
    eprintln!("  ecall_count={}", vm.cpu.ecall_count);
    eprintln!("  sbi_console_len={}", vm.bus.sbi.console_output.len());
}
