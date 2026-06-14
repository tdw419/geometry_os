use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let initramfs_path = "/tmp/initramfs-test.cpio.gz";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");
    let initramfs_data = fs::read(initramfs_path).expect("initramfs not found");

    let bootargs = "rdinit=/init console=ttyS0,115200 earlycon=sbi loglevel=8";
    let (mut vm, _) = RiscvVm::boot_linux(
        &kernel_data,
        Some(&initramfs_data),
        512,
        5_000_000,
        bootargs,
    )
    .expect("boot failed");

    eprintln!("After 5M instructions:");
    eprintln!("SBI output: {} bytes", vm.bus.sbi.console_output.len());

    if !vm.bus.sbi.console_output.is_empty() {
        let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        eprintln!("=== CONSOLE OUTPUT ===");
        eprintln!("{}", s);
        eprintln!("======================");
    }

    // Check if we saw our hello message
    let output = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    if output.contains("Hello from RISC-V") {
        eprintln!("SUCCESS: RISC-V program executed in Memory Palace!");
    }
}
