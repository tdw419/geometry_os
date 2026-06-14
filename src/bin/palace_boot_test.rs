// Palace boot test v2 — boots longer and dumps ALL output at end
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::kernel_patches::KernelPatches;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_data = fs::read(".geometry_os/build/linux-6.14/vmlinux").expect("kernel not found");
    let initrd_path = ".geometry_os/fs/linux/rv32/palace_initramfs.cpio.gz";
    let initrd_data = fs::read(initrd_path).ok();
    if initrd_data.is_none() {
        eprintln!("[palace-boot] WARNING: no initrd at {}", initrd_path);
        return;
    }
    eprintln!(
        "[palace-boot] Initrd: {} bytes",
        initrd_data.as_ref().unwrap().len()
    );
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

    eprintln!("[palace-boot] === Booting ===\n");

    let start = std::time::Instant::now();
    let mut count: u64 = 0;
    let max_inst = 300_000_000u64;

    while count < max_inst {
        if count % 100 == 0 {
            vm.bus.tick_clint_n(1);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }
        match vm.step() {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                break;
            },
            StepResult::Shutdown | StepResult::Yielded => {
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {},
        }
        if count % 50_000_000 == 0 && count > 0 {
            let elapsed = start.elapsed();
            let mips = count as f64 / elapsed.as_secs_f64() / 1_000_000.0;
            eprintln!(
                "  {}M inst, {:.1} MIPS, PC=0x{:08X}",
                count / 1_000_000,
                mips,
                vm.cpu.pc
            );
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

    // Dump ALL accumulated output
    let sbi = &vm.bus.sbi.console_output;
    if !sbi.is_empty() {
        eprintln!(
            "\nSBI CONSOLE ({} bytes):\n{}",
            sbi.len(),
            String::from_utf8_lossy(sbi)
        );
    } else {
        eprintln!("\nNo SBI console output");
    }
    let uart = &vm.bus.uart.tx_buf;
    if !uart.is_empty() {
        eprintln!(
            "\nUART OUTPUT ({} bytes):\n{}",
            uart.len(),
            String::from_utf8_lossy(uart)
        );
    } else {
        eprintln!("\nNo UART output");
    }
}
