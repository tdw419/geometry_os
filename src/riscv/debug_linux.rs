use super::cpu::{self, StepResult};
use crate::riscv::RiscvVm;
use std::fs;

pub fn run_diagnostic_boot(
    kernel_path: &str,
    initramfs_path: Option<&str>,
    max_instructions: u64,
    bootargs: &str,
) -> Result<(), String> {
    let kernel_data = fs::read(kernel_path).map_err(|e| format!("Kernel read error: {}", e))?;
    let initramfs_data = initramfs_path.and_then(|p| fs::read(p).ok());

    let (mut vm, _fw_addr, entry, dtb_addr) =
        RiscvVm::boot_linux_setup(&kernel_data, initramfs_data.as_deref(), 768, bootargs)
            .map_err(|e| format!("Boot setup error: {:?}", e))?;

    eprintln!(
        "[diag] Starting diagnostic boot: entry=0x{:08X}, dtb=0x{:08X}",
        entry, dtb_addr
    );

    let mut count: u64 = 0;
    let mut fault_count: u64 = 0;
    let mut prev_priv = vm.cpu.privilege;

    while count < max_instructions {
        if vm.bus.sbi.shutdown_requested {
            eprintln!("[diag] SBI shutdown requested at count={}", count);
            break;
        }

        // Tick CLINT
        if count % 100 == 0 {
            vm.bus.tick_clint_n(1);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }

        let pc_before = vm.cpu.pc;
        let step_result = vm.step();

        // Throttled fault logging
        match step_result {
            StepResult::Ok => {},
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                fault_count += 1;
                if fault_count <= 20 {
                    eprintln!(
                        "[diag] FAULT at count={}: PC=0x{:08X} result={:?} mtval=0x{:08X}",
                        count, pc_before, step_result, vm.cpu.csr.mtval
                    );
                    if fault_count == 20 {
                        eprintln!("[diag] Throttling further fault logs.");
                    }
                }
            },
            _ => {},
        }

        // Periodic state dump
        if count > 0 && count % 10_000_000 == 0 {
            eprintln!(
                "[diag] PROGRESS {}M: PC=0x{:08X} priv={:?} mstatus=0x{:08X} satp=0x{:08X} mepc=0x{:08X} ra=0x{:08X} sp=0x{:08X}",
                count / 1_000_000, pc_before, vm.cpu.privilege, vm.cpu.csr.mstatus, vm.cpu.csr.satp, vm.cpu.csr.mepc, vm.cpu.x[1], vm.cpu.x[2]
            );
        }

        // Detect S->M traps
        if prev_priv == cpu::Privilege::Supervisor && vm.cpu.privilege == cpu::Privilege::Machine {
            eprintln!(
                "[diag] S->M TRAP at count={}: PC was=0x{:08X} now=0x{:08X} mcause=0x{:08X} mepc=0x{:08X} mtval=0x{:08X}",
                count, pc_before, vm.cpu.pc, vm.cpu.csr.mcause, vm.cpu.csr.mepc, vm.cpu.csr.mtval
            );
        }

        prev_priv = vm.cpu.privilege;
        count += 1;
    }

    eprintln!(
        "[diag] Diagnostic run finished: count={}, final PC=0x{:08X}",
        count, vm.cpu.pc
    );

    // Final UART dump
    if !vm.bus.uart.tx_buf.is_empty() {
        let s = String::from_utf8_lossy(&vm.bus.uart.tx_buf);
        eprintln!("[diag] UART Output:\n{}", s);
    }

    Ok(())
}
