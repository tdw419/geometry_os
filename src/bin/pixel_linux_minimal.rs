// pixel_linux_minimal.rs — Minimal Pixel Linux boot diagnostic
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;
use std::fs;
use std::io::Write;
use std::time::Instant;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");

    let bootargs = "earlycon=sbi rdinit=/init nosmp";

    eprintln!(
        "[min] Booting kernel ({} bytes, args='{}')...",
        kernel_data.len(),
        bootargs
    );

    let (mut vm, _fw, entry, dtb_addr) =
        RiscvVm::boot_linux_setup(&kernel_data, None, 256, bootargs).expect("boot setup failed");

    eprintln!("[min] VM: entry=0x{:08X}, dtb=0x{:08X}", entry, dtb_addr);

    let start = Instant::now();
    let max_inst = 100_000_000u64;

    for i in 0..max_inst {
        if i % 100 == 0 {
            vm.bus.tick_clint_n(1);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }

        let sbi_out: Vec<u8> = vm.bus.sbi.console_output.drain(..).collect();
        let uart_out: Vec<u8> = vm.bus.uart.tx_buf.drain(..).collect();

        if !sbi_out.is_empty() || !uart_out.is_empty() {
            let out: String = sbi_out
                .iter()
                .chain(uart_out.iter())
                .map(|&b| b as char)
                .collect();
            print!("{}[{}M]", out, i / 1_000_000);
            let _ = std::io::stdout().flush();
        }

        match vm.step() {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                eprintln!("\n[min] EBREAK at {} inst", i);
                break;
            },
            StepResult::Shutdown | StepResult::Yielded => {
                eprintln!("\n[min] HALT at {} inst", i);
                break;
            },
            _ => {},
        }

        if i > 0 && i % 10_000_000 == 0 {
            let elapsed = start.elapsed();
            let mips = i as f64 / elapsed.as_secs_f64() / 1_000_000.0;
            eprintln!(
                "  {}M: PC=0x{:08X} scause=0x{:08X} priv={:?} ecall={} ({:.1} MIPS)",
                i / 1_000_000,
                vm.cpu.pc,
                vm.cpu.csr.scause,
                vm.cpu.privilege,
                vm.bus.sbi.ecall_log.len(),
                mips
            );
        }
    }

    let elapsed = start.elapsed();
    let mips = max_inst as f64 / elapsed.as_secs_f64() / 1_000_000.0;
    eprintln!(
        "\n[min] Done: {} inst in {:.1}s ({:.1} MIPS)",
        max_inst,
        elapsed.as_secs_f64(),
        mips
    );
    eprintln!("[min] SBI ecalls: {}", vm.bus.sbi.ecall_log.len());
    eprintln!(
        "[min] Console: {} SBI bytes, {} UART bytes",
        vm.bus.sbi.console_output.len(),
        vm.bus.uart.tx_buf.len()
    );
}
