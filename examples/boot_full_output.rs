//! Boot Linux with both SBI and UART output captured.
//! The kernel switches from SBI earlycon to 8250 UART console mid-boot.
//! We need to drain both to see the full boot log.

use geometry_os::riscv::RiscvVm;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let initramfs_path = ".geometry_os/fs/linux/rv32/initramfs.cpio.gz";

    let kernel_image = match std::fs::read(kernel_path) {
        Ok(d) => d,
        Err(e) => {
            eprintln!("No kernel at {}: {}", kernel_path, e);
            return;
        },
    };
    let initramfs = std::fs::read(initramfs_path).ok();
    eprintln!(
        "Kernel: {} bytes, initramfs: {} bytes",
        kernel_image.len(),
        initramfs.as_ref().map(|d| d.len()).unwrap_or(0)
    );

    let bootargs = "console=ttyS0 earlycon=sbi panic=5 loglevel=7 rdinit=/init";
    let result = RiscvVm::boot_linux(
        &kernel_image,
        initramfs.as_deref(),
        512,
        200_000_000, // 200M instructions
        bootargs,
    );

    match result {
        Ok((mut vm, stats)) => {
            // Drain SBI console (early boot output)
            let sbi: String = vm
                .bus
                .sbi
                .console_output
                .iter()
                .map(|&b| b as char)
                .collect();

            // Drain UART tx_buf (post-console-switch output)
            let uart: String = String::from_utf8_lossy(&vm.bus.uart.tx_buf).to_string();

            eprintln!("=== SBI OUTPUT ({} bytes) ===", sbi.len());
            if !sbi.is_empty() {
                eprintln!("{}", sbi);
            }
            eprintln!("=== UART OUTPUT ({} bytes) ===", uart.len());
            if !uart.is_empty() {
                eprintln!("{}", uart);
            }
            eprintln!("=== END ===");
            eprintln!(
                "Instructions: {}, PC: 0x{:08X}, Priv: {:?}",
                stats.instructions, vm.cpu.pc, vm.cpu.privilege
            );
            eprintln!(
                "SBI ECALLs: {}, UART writes: {}",
                vm.bus.sbi.ecall_log.len(),
                vm.bus.uart.write_count
            );
        },
        Err(e) => eprintln!("Error: {:?}", e),
    }
}
