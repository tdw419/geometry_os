// Quick diagnostic: boot Linux kernel with fault counting
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");
    
    // Read initrd if present
    let initrd_data = fs::read("initrd.cpio").ok();
    
    eprintln!("Kernel: {} bytes", kernel_data.len());
    if let Some(ref ir) = initrd_data {
        eprintln!("Initrd: {} bytes", ir.len());
    }

    let bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=8";
    
    let (mut vm, result) = RiscvVm::boot_linux(
        &kernel_data,
        initrd_data.as_deref(),
        512,
        5_000_000,  // 5M instructions
        bootargs,
    ).expect("boot failed");

    eprintln!("Result: {:?} instrs, entry=0x{:08X}, dtb=0x{:08X}",
        result.instructions, result.entry, result.dtb_addr);
    eprintln!("PC=0x{:08X} priv={:?}", vm.cpu.pc, vm.cpu.privilege);

    // SBI output
    if !vm.bus.sbi.console_output.is_empty() {
        let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        eprintln!("SBI output ({} bytes):\n{}", vm.bus.sbi.console_output.len(), s);
    } else {
        eprintln!("No SBI output");
    }

    // UART output
    if !vm.bus.uart.tx_buf.is_empty() {
        let s = String::from_utf8_lossy(&vm.bus.uart.tx_buf);
        eprintln!("UART output ({} bytes):\n{}", vm.bus.uart.tx_buf.len(), s);
    } else {
        eprintln!("No UART output");
    }

    // SBI ecall log
    eprintln!("SBI ecall count: {}", vm.bus.sbi.ecall_log.len());
    for (i, &(a7, a6, a0)) in vm.bus.sbi.ecall_log.iter().take(20).enumerate() {
        eprintln!("  ecall[{}]: a7=0x{:08X} a6=0x{:08X} a0=0x{:08X}", i, a7, a6, a0);
    }

    // Check registers at halt
    eprintln!("a0=0x{:08X} a1=0x{:08X} a2=0x{:08X} a3=0x{:08X}",
        vm.cpu.x[10], vm.cpu.x[11], vm.cpu.x[12], vm.cpu.x[13]);
}
