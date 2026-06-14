use geometry_os::riscv::debug_linux;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let initramfs_path = ".geometry_os/fs/linux/rv32/initramfs.cpio.gz";
    let bootargs = "console=ttyS0 earlycon=sbi panic=5 loglevel=7";

    if let Err(e) = debug_linux::run_diagnostic_boot(
        kernel_path,
        Some(initramfs_path),
        50_000_000, // 50M instructions
        bootargs,
    ) {
        eprintln!("Diagnostic boot failed: {}", e);
        std::process::exit(1);
    }
}
