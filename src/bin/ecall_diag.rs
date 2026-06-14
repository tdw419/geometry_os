// ECALL diagnostic: count every ecall instruction at the CPU level
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::kernel_patches::KernelPatches;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_data = fs::read(".geometry_os/build/linux-6.14/vmlinux").expect("kernel not found");
    let initrd_data = fs::read(".geometry_os/fs/linux/rv32/initramfs.cpio.gz").ok();
    let bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=8 keep_bootcon";
    let patches = fs::read_to_string(".geometry_os/build/linux-6.14/System.map")
        .ok()
        .map(|m| KernelPatches::from_system_map(&m));

    let (mut vm, _fw, _entry, _dtb) = RiscvVm::boot_linux_setup_with_patches(
        &kernel_data,
        initrd_data.as_deref(),
        256,
        bootargs,
        patches,
    )
    .expect("boot setup failed");

    eprintln!("=== Booting (ecall diag) ===");
    let mut count: u64 = 0;
    let mut ecall_count_sbi = 0u64; // CPU's ecall_counter
    let mut ecall_count_all = 0u64;
    let mut faults = 0u64;

    while count < 50_000_000 {
        count += 1;
        if count % 100 == 0 {
            vm.bus.tick_clint_n(1);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }

        // Track key metrics
        let priv_before = vm.cpu.privilege;
        let pc_before = vm.cpu.pc;
        let ecall_before = vm.cpu.ecall_count;

        let result = vm.step();

        let ecall_after = vm.cpu.ecall_count;

        if ecall_after > ecall_before {
            ecall_count_all += 1;
            let a7 = vm.cpu.x[17];
            let a0 = vm.cpu.x[10];
            let a6 = vm.cpu.x[16];
            if count < 1000 || ecall_count_all <= 20 {
                eprintln!(
                    "[ecall-ev] #{} count={} PC=0x{:08X}->0x{:08X} priv={:?} a7=0x{:X} a6=0x{:X} a0=0x{:X}",
                    ecall_count_all, count, pc_before, vm.cpu.pc, priv_before, a7, a6, a0
                );
            }
        }

        // Trace first 2000 instructions for initial PC progression
        if count < 2000 && (pc_before >= 0xC0000000 || priv_before != vm.cpu.privilege) {
            let priv_change = if priv_before != vm.cpu.privilege {
                format!(" priv:{:?}->{:?}", priv_before, vm.cpu.privilege)
            } else {
                String::new()
            };
            let result_str = match &result {
                StepResult::Ok => "ok",
                StepResult::Ecall => "ecall",
                StepResult::Ebreak => "ebrk",
                StepResult::FetchFault => "f_f",
                StepResult::LoadFault => "l_f",
                StepResult::StoreFault => "s_f",
                StepResult::Shutdown => "sdn",
                StepResult::Yielded => "yld",
            };
            if count % 50 == 0
                || pc_before < 0xC0001000
                || result_str != "ok"
                || priv_before != vm.cpu.privilege
            {
                eprintln!(
                    "[trace] {}: PC=0x{:08X} scause=0x{:08X} sepc=0x{:08X} {}{}",
                    count, pc_before, vm.cpu.csr.scause, vm.cpu.csr.sepc, result_str, priv_change
                );
            }
        }

        match result {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                eprintln!("[diag] EBREAK at count={}", count);
                break;
            },
            StepResult::Shutdown | StepResult::Yielded => {
                eprintln!("[diag] END at count={}", count);
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                faults += 1;
                if faults <= 5 {
                    eprintln!(
                        "[diag] FAULT #{} at count={}: scause=0x{:X} sepc=0x{:08X} stval=0x{:08X}",
                        faults, count, vm.cpu.csr.scause, vm.cpu.csr.sepc, vm.cpu.csr.stval
                    );
                }
            },
        }

        if count % 10_000_000 == 0 {
            eprintln!(
                "[diag] {}M: PC=0x{:08X} ecall_cpu={} sbi_ecall_log={} console={}B uart={}B priv={:?} faults={}",
                count / 1_000_000,
                vm.cpu.pc,
                vm.cpu.ecall_count,
                vm.bus.sbi.ecall_log.len(),
                vm.bus.sbi.console_output.len(),
                vm.bus.uart.tx_buf.len(),
                vm.cpu.privilege,
                faults,
            );
            if vm.bus.sbi.console_output.len() > 0 {
                let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
                eprintln!("  >>> CONSOLE: {}", s);
            }
        }
    }

    eprintln!("\n=== SUMMARY ===");
    eprintln!("Total instrs: {}", count);
    eprintln!("CPU ecall_count: {}", vm.cpu.ecall_count);
    eprintln!("SBI ecall_log entries: {}", vm.bus.sbi.ecall_log.len());
    eprintln!(
        "SBI console_output: {} bytes",
        vm.bus.sbi.console_output.len()
    );
    if vm.bus.sbi.console_output.len() > 0 {
        let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        eprintln!("Console output:\n{}", s);
    }
}
