// Quick diagnostic: boot Linux kernel with fault counting
use geometry_os::riscv::kernel_patches::KernelPatches;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");

    // Read initrd if present
    let initrd_path = ".geometry_os/fs/linux/rv32/initramfs.cpio.gz";
    let initrd_data = fs::read(initrd_path).ok();
    if initrd_data.is_none() {
        eprintln!("Warning: no initrd at {}", initrd_path);
    }

    eprintln!("Kernel: {} bytes", kernel_data.len());
    if let Some(ref ir) = initrd_data {
        eprintln!("Initrd: {} bytes", ir.len());
    }

    let bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=8 keep_bootcon";

    let patches = fs::read_to_string(".geometry_os/build/linux-6.14/System.map")
        .ok()
        .map(|map_text| KernelPatches::from_system_map(&map_text));

    let (mut vm, _fw, entry, dtb_addr) = RiscvVm::boot_linux_setup_with_patches(
        &kernel_data,
        initrd_data.as_deref(),
        768,
        bootargs,
        patches,
    )
    .expect("boot setup failed");

    // Diagnostic BEFORE execution
    let trap_pa = 0x81405348;
    match vm.bus.read_word(trap_pa) {
        Ok(word) => eprintln!("Mem BEFORE RUN at PA 0x{:08X}: 0x{:08X}", trap_pa, word),
        Err(_) => eprintln!("Mem BEFORE RUN at PA 0x{:08X}: <read failed>", trap_pa),
    }

    // Now run
    let start_time = std::time::Instant::now();
    let limit = 200_000_000;
    let mut count = 0;

    let mut trap_count = 0;
    let mut last_pc = vm.cpu.pc;

    while count < limit {
        // Track PC jumps that look like traps (to stvec/mtvec)
        let stvec = vm.cpu.csr.read(geometry_os::riscv::csr::STVEC) & !3;
        let mtvec = vm.cpu.csr.read(geometry_os::riscv::csr::MTVEC) & !3;

        if vm.cpu.pc == stvec || vm.cpu.pc == mtvec {
            // It just jumped to a trap vector!
            // But wait, the PC might just naturally be there.
            // Let's only print if it jumped from somewhere else.
            if last_pc != vm.cpu.pc - 4 && last_pc != vm.cpu.pc - 2 {
                let cause = if vm.cpu.privilege == geometry_os::riscv::cpu::Privilege::Machine {
                    vm.cpu.csr.read(geometry_os::riscv::csr::MCAUSE)
                } else {
                    vm.cpu.csr.read(geometry_os::riscv::csr::SCAUSE)
                };
                let tval = if vm.cpu.privilege == geometry_os::riscv::cpu::Privilege::Machine {
                    vm.cpu.csr.read(geometry_os::riscv::csr::MTVAL)
                } else {
                    vm.cpu.csr.read(geometry_os::riscv::csr::STVAL)
                };
                eprintln!("TRAP #{} detected! Jumped from 0x{:08X} to 0x{:08X}. Cause: 0x{:08X}, tval: 0x{:08X}, priv: {:?}", 
                    trap_count, last_pc, vm.cpu.pc, cause, tval, vm.cpu.privilege);
                trap_count += 1;

                if trap_count > 20 {
                    eprintln!("Too many traps, stopping.");
                    break;
                }
            }
        }

        last_pc = vm.cpu.pc;
        if vm.step() != geometry_os::riscv::cpu::StepResult::Ok {
            break;
        }
        count += 1;
    }

    eprintln!(
        "Result: {} instrs, entry=0x{:08X}, dtb=0x{:08X}",
        count, entry, dtb_addr
    );
    eprintln!("PC=0x{:08X} priv={:?}", vm.cpu.pc, vm.cpu.privilege);

    // SBI output
    if !vm.bus.sbi.console_output.is_empty() {
        let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        eprintln!(
            "SBI output ({} bytes):\n{}",
            vm.bus.sbi.console_output.len(),
            s
        );
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
        eprintln!(
            "  ecall[{}]: a7=0x{:08X} a6=0x{:08X} a0=0x{:08X}",
            i, a7, a6, a0
        );
    }

    // Check registers at halt
    eprintln!(
        "a0=0x{:08X} a1=0x{:08X} a2=0x{:08X} a3=0x{:08X}",
        vm.cpu.x[10], vm.cpu.x[11], vm.cpu.x[12], vm.cpu.x[13]
    );

    // Diagnostic: Read memory at the trap PC (0xC0221FD4 translates to 0x80221FD4 with PAGE_OFFSET=0xC0000000)
    let trap_pa = 0x80221FD4;
    match vm.bus.read_word(trap_pa) {
        Ok(word) => eprintln!(
            "Mem at PA 0x{:08X} (VA 0xC0221FD4): 0x{:08X}",
            trap_pa, word
        ),
        Err(_) => eprintln!("Mem at PA 0x{:08X} (VA 0xC0221FD4): <read failed>", trap_pa),
    }
}
