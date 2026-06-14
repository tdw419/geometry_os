//! Quick boot test WITH initramfs to verify initrd placement fix.
use geometry_os::riscv::RiscvVm;
fn main() {
    let kernel_data = std::fs::read(".geometry_os/build/linux-6.14/vmlinux").expect("kernel");
    let initrd_data = std::fs::read("initrd.cpio").expect("initrd.cpio");
    eprintln!(
        "[initrd-test] Kernel: {} bytes, initrd: {} bytes",
        kernel_data.len(),
        initrd_data.len()
    );
    eprintln!("[initrd-test] Booting with initramfs, 500M instructions...");
    let result = RiscvVm::boot_linux(
        &kernel_data,
        Some(&initrd_data),
        128, // 128MB RAM
        500_000_000,
        "console=hvc0 earlycon=sbi loglevel=8 nosmp rdinit=/init",
    );
    match result {
        Ok((mut vm, stats)) => {
            // Drain UART
            let mut uart = Vec::new();
            loop {
                match vm.bus.uart.read_byte(0) {
                    0 => break,
                    b => uart.push(b),
                }
            }
            // Drain SBI console
            let sbi: String = vm
                .bus
                .sbi
                .console_output
                .iter()
                .map(|&b| b as char)
                .collect();
            let combined = {
                let mut s = sbi.clone();
                if !uart.is_empty() {
                    s.push_str(&String::from_utf8_lossy(&uart));
                }
                s
            };
            eprintln!(
                "[initrd-test] UART: {} bytes, SBI: {} bytes",
                uart.len(),
                sbi.len()
            );
            if !combined.is_empty() {
                eprintln!("--- OUTPUT ---");
                eprintln!("{}", combined);
                eprintln!("--- END ---");
            }
            eprintln!(
                "[initrd-test] Instructions: {}, PC: 0x{:08X}",
                stats.instructions, vm.cpu.pc
            );
        },
        Err(e) => eprintln!("Error: {:?}", e),
    }
}
