// pixel_linux_mp.rs — Boot Pixel Linux with Memory Palace (GSFS) disk
//
// Boots the RISC-V Linux kernel with a custom initramfs containing the
// Memory Palace shell (init_mp). After boot, the VirtIO block device is
// initialized with GSFS format, shared between the emulator and guest.
//
// Build: cargo run --bin pixel_linux_mp 2>&1
//
// The init_mp binary (in guest/init_mp.c) provides a self-contained shell
// that reads/writes files on the GSFS-formatted /dev/vda.
//
// After boot, this binary:
//   1. Prints all kernel boot output
//   2. Sends commands to the guest via UART
//   3. Saves the GSFS disk state for host-side inspection

use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::kernel_patches::KernelPatches;
use geometry_os::riscv::RiscvVm;
use std::fs;
use std::io::Write;
use std::time::Instant;

fn main() {
    // 1. Load kernel
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data =
        fs::read(kernel_path).expect("kernel not found at .geometry_os/build/linux-6.14/vmlinux");
    eprintln!("[mp-boot] Kernel: {} bytes", kernel_data.len());

    // 2. Load our Memory Palace initramfs
    let initrd_path = ".geometry_os/fs/linux/rv64/initramfs_mp.cpio.gz";
    let initrd_data = fs::read(initrd_path).expect("initramfs_mp not found");
    eprintln!("[mp-boot] Initramfs: {} bytes", initrd_data.len());

    // 3. Bootargs: use earlycon=sbi for SBI console, rdinit=/init for our MP shell
    let bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=6 keep_bootcon console=ttyS0";

    // 4. Kernel patches from System.map
    let patches = fs::read_to_string(".geometry_os/build/linux-6.14/System.map")
        .ok()
        .map(|m| KernelPatches::from_system_map(&m));

    // 5. Boot the VM — THIS calls init_virtio_blk_gsfs() which formats the
    //    VirtIO disk as GSFS (shared with the guest as /dev/vda)
    eprintln!("[mp-boot] Creating VM with boot_linux_setup_with_patches...");
    let (mut vm, _fw, entry, dtb_addr) = RiscvVm::boot_linux_setup_with_patches(
        &kernel_data,
        Some(&initrd_data),
        256, // 256MB RAM (plenty for a minimal init)
        bootargs,
        patches,
    )
    .expect("boot setup failed");
    eprintln!(
        "[mp-boot] VM created: entry=0x{:08X}, dtb=0x{:08X}",
        entry, dtb_addr
    );

    // 6. Check VirtIO disk state after init_virtio_blk_gsfs()
    let disk_size = vm.bus.virtio_blk.disk.len();
    eprintln!(
        "[mp-boot] VirtIO block device: {} bytes ({} sectors)",
        disk_size,
        disk_size / 512
    );

    // Check if GSFS was initialized on the VirtIO disk
    eprintln!(
        "[mp-boot] GSFS files on VirtIO disk: {}",
        vm.bus.virtio_blk_gsfs.list_files().len()
    );
    for f in vm.bus.virtio_blk_gsfs.list_files() {
        eprintln!("  - {} ({} bytes)", f.name, f.size_bytes);
    }

    // 7. Boot the kernel
    eprintln!("[mp-boot] === Booting Pixel Linux (Memory Palace Edition) ===");
    let start = Instant::now();
    let mut last_report = 0u64;
    let mut total_instructions = 0u64;
    let max_instructions = 500_000_000u64;

    // Buffer for kernel boot output
    let mut boot_log = String::new();

    while total_instructions < max_instructions {
        // Advance CLINT timer
        if total_instructions % 100 == 0 {
            vm.bus.tick_clint_n(1);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }

        // Read any SBI console output before stepping
        let sbi_out: String = vm
            .bus
            .sbi
            .console_output
            .drain(..)
            .map(|b| b as char)
            .collect();
        if !sbi_out.is_empty() {
            boot_log.push_str(&sbi_out);
            print!("{}", sbi_out);
            let _ = std::io::stdout().flush();
        }

        // Read UART output
        let uart_out: String = vm.bus.uart.tx_buf.drain(..).map(|b| b as char).collect();
        if !uart_out.is_empty() {
            boot_log.push_str(&uart_out);
            print!("{}", uart_out);
            let _ = std::io::stdout().flush();
        }

        // Single step
        match vm.step() {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                eprintln!("\n[mp-boot] EBREAK at {} instructions", total_instructions);
                break;
            },
            StepResult::Shutdown | StepResult::Yielded => {
                eprintln!(
                    "\n[mp-boot] VM halted at {} instructions",
                    total_instructions
                );
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {},
        }

        total_instructions += 1;

        // Report progress
        if total_instructions - last_report >= 10_000_000 {
            let elapsed = start.elapsed();
            let mips = total_instructions as f64 / elapsed.as_secs_f64() / 1_000_000.0;
            let sbi_count = vm.bus.sbi.console_output.len();
            let uart_count = vm.bus.uart.tx_buf.len();
            eprintln!(
                "  {}M: PC=0x{:08X} scr=0x{:08X} priv={:?} sbi_out={} uart={} ({:.1} MIPS)",
                total_instructions / 1_000_000,
                vm.cpu.pc,
                vm.cpu.csr.scause,
                vm.cpu.privilege,
                sbi_count,
                uart_count,
                mips
            );
            last_report = total_instructions;
        }

        // Stop if we've seen enough output and the guest is idle
        if total_instructions > 30_000_000
            && vm.cpu.privilege == geometry_os::riscv::cpu::Privilege::Machine
        {
            // In M-mode at this point? Might be in a tight loop waiting for input.
            // Check if we have a shell prompt in the output
            if boot_log.contains("mpalace>") {
                eprintln!("\n[mp-boot] Shell prompt detected! Guest is ready.");
                break;
            }
        }
    }

    let elapsed = start.elapsed();
    let mips = total_instructions as f64 / elapsed.as_secs_f64() / 1_000_000.0;

    // 8. Final output
    if boot_log.contains("mpalace>") {
        eprintln!("\n[mp-boot] === MEMORY PALACE GUEST READY ===");
        eprintln!(
            "  Boot time: {:.2}s ({} instructions, {:.1} MIPS)",
            elapsed.as_secs_f64(),
            total_instructions,
            mips
        );
    }

    // 9. Save the VirtIO disk so host can inspect it
    let save_path = "/tmp/mp_disk_after_boot.img";
    let mut disk_state = vm.bus.virtio_blk.disk.clone();
    fs::write(save_path, &disk_state).expect("failed to save disk state");
    eprintln!("[mp-boot] Disk state saved to {}", save_path);
    eprintln!(
        "[mp-boot] GSFS files on VirtIO disk: {}",
        vm.bus.virtio_blk_gsfs.list_files().len()
    );
    for f in vm.bus.virtio_blk_gsfs.list_files() {
        eprintln!(
            "  - {} ({} bytes, sector {})",
            f.name, f.size_bytes, f.start_sector
        );
    }

    eprintln!(
        "[mp-boot] SBI ecall log count: {}",
        vm.bus.sbi.ecall_log.len()
    );

    // Print first 20 unusual ecalls (skip expected ones)
    let mut unusual = 0;
    for (a7, a6, a0) in vm.bus.sbi.ecall_log.iter().take(100) {
        if *a7 != 0x01
            && *a7 != 0x02
            && *a7 != 0x100
            && *a7 != 0x200
            && *a7 != 0x201
            && *a7 != 0x54494D45
            && *a7 != 0x494E4946
            && *a7 != 0x52464E43
            && *a7 != 0x48534D00
        {
            eprintln!(
                "[mp-boot-ecall] a7=0x{:08X} a6=0x{:08X} a0=0x{:08X}",
                a7, a6, a0
            );
            unusual += 1;
            if unusual >= 20 {
                break;
            }
        }
    }
    if unusual == 0 {
        eprintln!(
            "[mp-boot-ecall] All {} ecalls were expected types",
            vm.bus.sbi.ecall_log.len()
        );
    }

    // Print any console chars
    let console_chars: String = vm
        .bus
        .sbi
        .console_output
        .iter()
        .map(|&b| b as char)
        .collect();
    if console_chars.is_empty() {
        eprintln!("[mp-boot] WARNING: console_output is EMPTY - no SBI console output at all!");
    } else {
        eprintln!("[mp-boot] Console output (first 500 chars):");
        eprintln!(
            "{}",
            &console_chars[..std::cmp::min(500, console_chars.len())]
        );
    }

    eprintln!("[mp-boot] === BOOT COMPLETE ===");
}
