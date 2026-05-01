// kern_verify.rs -- Independent verifier for Phase I kernel (does not touch kern_run.rs).
use geometry_os::riscv::RiscvVm;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");
    let mut vm = RiscvVm::new(2 * 1024 * 1024);
    let r = vm.boot_guest(&elf, 2, 100_000_000).expect("boot");
    eprintln!(
        "[kern_verify] entry=0x{:08X} ran {} instructions",
        r.entry, r.instructions
    );
    eprintln!(
        "[kern_verify] final pc=0x{:08X} mcause=0x{:08X} mepc=0x{:08X} mtval=0x{:08X}",
        vm.cpu.pc,
        vm.cpu.csr.read(0x342),
        vm.cpu.csr.read(0x341),
        vm.cpu.csr.read(0x343)
    );
    eprintln!(
        "[kern_verify] mscratch=0x{:08X} mtvec=0x{:08X}",
        vm.cpu.csr.read(0x340),
        vm.cpu.csr.read(0x305)
    );
    eprintln!(
        "[kern_verify] sp=0x{:08X} ra=0x{:08X} tp=0x{:08X}",
        vm.cpu.x[2], vm.cpu.x[1], vm.cpu.x[4]
    );
    let raw = &vm.bus.sbi.console_output;
    let s = String::from_utf8_lossy(raw);
    eprintln!("--- console ({} bytes) ---", raw.len());
    print!("{}", s);
    eprintln!("\n--- byte histogram ---");
    let mut hist = std::collections::BTreeMap::new();
    for &b in raw {
        *hist.entry(b).or_insert(0u32) += 1;
    }
    for (b, c) in &hist {
        let ch = if (0x20..=0x7E).contains(b) {
            *b as char
        } else {
            '?'
        };
        eprintln!("  0x{:02X} '{}' -> {}", b, ch, c);
    }
}
