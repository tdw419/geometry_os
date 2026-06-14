// Extended boot test: run more instructions with periodic progress
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::kernel_patches::KernelPatches;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");
    let initrd_path = ".geometry_os/fs/linux/rv32/initramfs.cpio.gz";
    let initrd_data = fs::read(initrd_path).ok();
    let bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=8 keep_bootcon";
    let patches = fs::read_to_string(".geometry_os/build/linux-6.14/System.map")
        .ok()
        .map(|m| KernelPatches::from_system_map(&m));

    let (mut vm, _fw, _entry, _dtb) = RiscvVm::boot_linux_setup_with_patches(
        &kernel_data,
        initrd_data.as_deref(),
        512,
        bootargs,
        patches,
    )
    .expect("boot setup failed");

    eprintln!("=== Booting ===");
    let start = std::time::Instant::now();
    let mut last_report = 0u64;

    let mut count: u64 = 0;
    while count < 200_000_000 {
        if count % 100 == 0 {
            vm.bus.tick_clint_n(1);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }
        match vm.step() {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                eprintln!("[boot] EBREAK at {}", count);
                break;
            },
            StepResult::Shutdown | StepResult::Yielded => {
                eprintln!("[boot] END at {}", count);
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {},
        }
        // First fault diagnostic register dump
        if vm.cpu.csr.scause != 0 && vm.bus.sbi.ecall_log.is_empty() && count < 1000000 {
            eprintln!(
                "[diag-regs] FIRST FAULT at {}: scause=0x{:08X} stval=0x{:08X} sepc=0x{:08X}",
                count, vm.cpu.csr.scause, vm.cpu.csr.stval, vm.cpu.csr.sepc
            );
            eprintln!(
                "[diag-regs]   x10(a0)=0x{:08X} x11(a1)=0x{:08X} x12(a2)=0x{:08X}",
                vm.cpu.x[10], vm.cpu.x[11], vm.cpu.x[12]
            );
            eprintln!(
                "[diag-regs]   x1(ra)=0x{:08X} x2(sp)=0x{:08X} x8(s0)=0x{:08X} x9(s1)=0x{:08X}",
                vm.cpu.x[1], vm.cpu.x[2], vm.cpu.x[8], vm.cpu.x[9]
            );
        }
        if count - last_report >= 10_000_000 {
            let elapsed = start.elapsed();
            let mips = count as f64 / elapsed.as_secs_f64() / 1_000_000.0;
            eprintln!("  {}M: PC=0x{:08X} scause=0x{:08X} sepc=0x{:08X} priv={:?} sbi={} uart={} ecall={} ({:.1} MIPS)",
                count/1_000_000, vm.cpu.pc, vm.cpu.csr.scause, vm.cpu.csr.sepc, vm.cpu.privilege,
                vm.bus.sbi.console_output.len(), vm.bus.uart.tx_buf.len(),
                vm.bus.sbi.ecall_log.len(), mips);
            last_report = count;
            if vm.bus.sbi.console_output.len() > 20 {
                let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
                eprintln!("  >>> BOOT LOG <<<\n{}", s);
            }
        }
        count += 1;
    }

    let elapsed = start.elapsed();
    let mips = count as f64 / elapsed.as_secs_f64() / 1_000_000.0;
    eprintln!(
        "\n=== FINAL: {} instrs in {:.1}s = {:.1} MIPS ===",
        count,
        elapsed.as_secs_f64(),
        mips
    );
    let sbi = &vm.bus.sbi.console_output;
    if !sbi.is_empty() {
        eprintln!("\nSBI ({}B):\n{}", sbi.len(), String::from_utf8_lossy(sbi));
    } else {
        eprintln!("\nNo SBI output");
    }
    let uart = &vm.bus.uart.tx_buf;
    if !uart.is_empty() {
        eprintln!(
            "\nUART ({}B):\n{}",
            uart.len(),
            String::from_utf8_lossy(uart)
        );
    }
    eprintln!("\necalls: {}", vm.bus.sbi.ecall_log.len());
    for e in vm.bus.sbi.ecall_log.iter().take(20) {
        eprintln!("  a7=0x{:08X} a6=0x{:08X}", e.0, e.1);
    }
}
