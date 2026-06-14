// Run kernel for 500M+ instructions checking for SBI output
use geometry_os::riscv::cpu::Privilege;
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

    eprintln!("=== Long boot test ===");
    let mut count: u64 = 0;
    let limit: u64 = 500_000_000;
    let mut has_console = false;

    while count < limit {
        count += 1;
        if count % 100 == 0 {
            vm.bus.tick_clint_n(1);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }

        let result = vm.step();

        if !has_console && !vm.bus.sbi.console_output.is_empty() {
            has_console = true;
            let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
            eprintln!(
                "\n!!! GOT CONSOLE OUTPUT at {}M instructions !!!\n{}",
                count / 1_000_000,
                s
            );
        }

        if !vm.bus.sbi.ecall_log.is_empty() && count % 10_000_000 == 0 {
            // Count unique EIDs in ecall log
            let ecall_count = vm.bus.sbi.ecall_log.len();
            let putchars = vm.bus.sbi.console_output.len();
            let uart = vm.bus.uart.tx_buf.len();
            eprintln!(
                "[long] {}M: PC=0x{:08X} ecalls={} console={}B uart={}B priv={:?}",
                count / 1_000_000,
                vm.cpu.pc,
                ecall_count,
                putchars,
                uart,
                vm.cpu.privilege,
            );
            if putchars > 0 {
                let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
                eprintln!("  CONSOLE: {}", s);
            }
        }

        match result {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                eprintln!("[long] EBREAK at {}M", count / 1_000_000);
                break;
            },
            StepResult::Shutdown | StepResult::Yielded => {
                eprintln!("[long] END at {}M", count / 1_000_000);
                break;
            },
            _ => {},
        }
    }

    eprintln!("\n=== FINAL ===");
    eprintln!("Instrs: {}M", count / 1_000_000);
    eprintln!("ecalls: {}", vm.bus.sbi.ecall_log.len());
    eprintln!("console: {} bytes", vm.bus.sbi.console_output.len());
    if vm.bus.sbi.console_output.len() > 0 {
        eprintln!(
            "Output:\n{}",
            String::from_utf8_lossy(&vm.bus.sbi.console_output)
        );
    }
}

#[allow(dead_code)]
fn diag_state(vm: &RiscvVm, label: &str) {
    eprintln!(
        "[diag] {}: PC=0x{:08X} priv={:?} scause=0x{:X} sepc=0x{:08X}",
        label, vm.cpu.pc, vm.cpu.privilege, vm.cpu.csr.scause, vm.cpu.csr.sepc
    );
}
