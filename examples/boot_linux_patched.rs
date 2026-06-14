// boot_linux_patched.rs -- Boot Linux with System.map-based kernel patches
//
// This example demonstrates the full recommended workflow:
//   1. Load kernel vmlinux
//   2. Load System.map and parse KernelPatches
//   3. Boot with the patches applied automatically
//
// Usage:
//   cargo run --example boot_linux_patched --release
//
// The kernel and System.map are expected at:
//   .geometry_os/build/linux-6.14/vmlinux
//   .geometry_os/build/linux-6.14/System.map
//
// Initramfs is optional:
//   .geometry_os/fs/linux/rv32/initramfs.cpio.gz

use geometry_os::riscv::kernel_patches::KernelPatches;
use geometry_os::riscv::RiscvVm;
use std::fs;
use std::time::Instant;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let system_map_path = ".geometry_os/build/linux-6.14/System.map";
    let initramfs_path = ".geometry_os/fs/linux/rv32/initramfs.cpio.gz";

    // Load kernel image
    let kernel_image = match fs::read(kernel_path) {
        Ok(d) => d,
        Err(e) => {
            eprintln!("Error: cannot read kernel at {}: {}", kernel_path, e);
            eprintln!("Build the kernel first:");
            eprintln!("  ./scripts/build_rv32_linux.sh");
            std::process::exit(1);
        },
    };
    eprintln!("Kernel: {} bytes from {}", kernel_image.len(), kernel_path);

    // Load System.map and parse patches
    let patches = match fs::read_to_string(system_map_path) {
        Ok(map_text) => {
            eprintln!(
                "System.map: {} bytes from {}",
                map_text.len(),
                system_map_path
            );
            let p = KernelPatches::from_system_map(&map_text);
            eprintln!(
                "Parsed patches: pattern_scan={}, timebase_freq={}, lpj={}",
                p.use_pattern_scan, p.timebase_freq, p.lpj_value
            );
            eprintln!(
                "  setup_vm=0x{:08X}, up_read=0x{:08X}, down_read_trylock=0x{:08X}",
                p.setup_vm, p.up_read_fn, p.down_read_trylock_fn
            );
            Some(p)
        },
        Err(e) => {
            eprintln!(
                "Warning: cannot read System.map ({}), using default hardcoded patches",
                e
            );
            None
        },
    };

    // Optional initramfs
    let initramfs = fs::read(initramfs_path).ok();
    if let Some(ref ir) = initramfs {
        eprintln!("Initramfs: {} bytes from {}", ir.len(), initramfs_path);
    } else {
        eprintln!("No initramfs found (optional). Build with:");
        eprintln!("  ./scripts/build_rv32_linux.sh --initramfs");
    }

    let bootargs = "console=ttyS0 earlycon=sbi panic=5 loglevel=7";
    eprintln!("Bootargs: {}", bootargs);

    let start = Instant::now();

    // Boot with patches
    let (mut vm, result) = RiscvVm::boot_linux_with_patches(
        &kernel_image,
        initramfs.as_deref(),
        512,         // 512 MB RAM
        500_000_000, // 500M instruction limit (BSS clear takes ~150M)
        bootargs,
        patches,
    )
    .expect("boot setup should succeed");

    let elapsed = start.elapsed();
    let mips = result.instructions as f64 / elapsed.as_secs_f64() / 1_000_000.0;

    eprintln!("\n=== Boot Results ===");
    eprintln!(
        "Instructions: {} ({})",
        result.instructions,
        result.instructions as f64 / 1_000_000.0
    );
    eprintln!("Time: {:?} ({:.2} MIPS)", elapsed, mips);
    eprintln!("Entry:  0x{:08X}", result.entry);
    eprintln!("DTB:    0x{:08X}", result.dtb_addr);
    eprintln!("PC:     0x{:08X}", vm.cpu.pc);
    eprintln!("Priv:   {:?}", vm.cpu.privilege);

    // Debug: read bytes at corruption sites
    let pa1 = 0x80002C18u64;
    let pa2 = 0x8021B79Cu64;
    for pa in [0x80002C18u64, 0x8021B79Cu64, 0x8021B7A0u64, 0x8021B7A4u64] {
        eprintln!(
            "[debug] RAM at PA 0x{:08X}: word=0x{:08X}",
            pa,
            vm.bus.read_word(pa).unwrap_or(0xDEADBEEF)
        );
    }

    // Console output
    let sbi_out = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    let uart_out = String::from_utf8_lossy(&vm.bus.uart.tx_buf);
    let combined = format!("{}{}", sbi_out, uart_out);

    if !combined.is_empty() {
        eprintln!("\n=== Console Output ({} bytes) ===", combined.len());
        eprintln!("{}", combined);
        eprintln!("=== End Console Output ===");
    } else {
        eprintln!("\nNo console output captured.");
    }

    // Milestones
    eprintln!("\n=== Boot Milestones ===");
    let output_lower = combined.to_lowercase();
    let milestones = [
        ("Linux version", "linux version"),
        ("Machine model", "machine model"),
        ("DTB", "dtb"),
        ("Kernel init", "kernel_init"),
        ("Freeing unused", "freeing unused kernel"),
        ("Run /init", "run /init"),
        ("Userspace /init", "/init"),
        ("Shell prompt", "# "),
        ("Panic", "panic"),
        ("CPU idle", "cpu_idle"),
    ];
    for (name, needle) in &milestones {
        let found = output_lower.contains(needle);
        eprintln!("  {}: {}", name, if found { "FOUND" } else { "---" });
    }

    // SBI stats
    eprintln!("\nSBI ecalls: {}", vm.bus.sbi.ecall_log.len());
    eprintln!("CPU ecalls: {}", vm.cpu.ecall_count);
    eprintln!("UART TX:    {} bytes", vm.bus.uart.tx_buf.len());

    // Dump SBI ecall details
    for (i, &(a7, a6, a0)) in vm.bus.sbi.ecall_log.iter().enumerate() {
        let ext_name = match a7 {
            0x00 => "PUTCHAR",
            0x01 => "GETCHAR",
            0x10 => "EXT_BASE",
            0x54494D45 => "EXT_TIME",
            0x735049 => "EXT_IPI",
            0x52464E43 => "EXT_RFENCE",
            0x48534D => "EXT_HSM",
            0x53525354 => "EXT_SRST",
            0x4442434E => "EXT_DBCN",
            _ => "UNKNOWN",
        };
        eprintln!(
            "  ecall[{}]: a7=0x{:08X} ({}) a6=0x{:X} a0=0x{:X}",
            i, a7, ext_name, a6, a0
        );
    }

    // Trap state
    eprintln!("\nmcause:  0x{:08X}", vm.cpu.csr.mcause);
    eprintln!("mepc:    0x{:08X}", vm.cpu.csr.mepc);
    eprintln!("mtval:   0x{:08X}", vm.cpu.csr.mtval);
    eprintln!("mstatus: 0x{:08X}", vm.cpu.csr.mstatus);
    eprintln!("scause:  0x{:08X}", vm.cpu.csr.scause);
    eprintln!("sepc:    0x{:08X}", vm.cpu.csr.sepc);
    eprintln!("stval:   0x{:08X}", vm.cpu.csr.stval);

    // Interrupt state
    let mip = vm.cpu.csr.mip;
    let mie = vm.cpu.csr.mie;
    eprintln!(
        "\nMIP: 0x{:08X} (MEIP={} SEIP={} MTIP={} MSIP={})",
        mip,
        (mip >> 11) & 1,
        (mip >> 9) & 1,
        (mip >> 7) & 1,
        (mip >> 3) & 1,
    );
    eprintln!("MIE: 0x{:08X}", mie);
    eprintln!(
        "mtime: {}, mtimecmp: {}",
        vm.bus.clint.mtime, vm.bus.clint.mtimecmp
    );
}
