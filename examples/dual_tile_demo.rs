// dual_tile_demo.rs -- Two-tile GeOS desktop: Linux VM + status panel
//
// Demonstrates the REGION/SHARED + VM_LIVE_SPAWN auto-window pipeline:
//   Left tile:  Linux boots in a SHARED region (auto-window from bounds)
//   Right tile: Status panel with border
//
// Usage:
//   cargo run --example dual_tile_demo --release

use geometry_os::assembler::assemble;
use geometry_os::preprocessor::Preprocessor;
use geometry_os::riscv::kernel_patches::KernelPatches;
use geometry_os::riscv::RiscvVm;
use geometry_os::vm::Vm;
use std::fs;
use std::time::Instant;

fn main() {
    // ── Load kernel ────────────────────────────────────────────────
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_image = match fs::read(kernel_path) {
        Ok(d) => d,
        Err(e) => {
            eprintln!("Error: cannot read kernel at {}: {}", kernel_path, e);
            eprintln!("Build the kernel first: ./scripts/build_rv32_linux.sh");
            std::process::exit(1);
        },
    };
    eprintln!("Kernel: {} bytes", kernel_image.len());

    // Optional initramfs
    let initramfs = fs::read(".geometry_os/fs/linux/rv32/initramfs.cpio.gz").ok();
    if let Some(ref ir) = initramfs {
        eprintln!("Initramfs: {} bytes", ir.len());
    }

    // ── Load System.map for accurate kernel patches ────────────────
    let patches = match fs::read_to_string(".geometry_os/build/linux-6.14/System.map") {
        Ok(map_text) => {
            eprintln!("System.map: {} bytes", map_text.len());
            let p = KernelPatches::from_system_map(&map_text);
            eprintln!(
                "Patches: setup_vm=0x{:08X} lpj=0x{:08X} pattern_scan={}",
                p.setup_vm, p.loops_per_jiffy, p.use_pattern_scan
            );
            Some(p)
        },
        Err(e) => {
            eprintln!("Warning: no System.map ({}), using defaults", e);
            None
        },
    };

    // ── Phase 1: Boot Linux via the patched API ───────────────────
    eprintln!("\n── Phase 1: Booting Linux in RiscvVm ──");
    let boot_start = Instant::now();
    let bootargs = "console=ttyS0 earlycon=sbi panic=5 loglevel=7";

    let (mut riscv_vm, boot_result) = RiscvVm::boot_linux_with_patches(
        &kernel_image,
        initramfs.as_deref(),
        512,         // 512 MB RAM
        100_000_000, // 100M instruction limit
        bootargs,
        patches,
    )
    .expect("Linux boot setup failed");

    let boot_elapsed = boot_start.elapsed();
    let mips = boot_result.instructions as f64 / boot_elapsed.as_secs_f64() / 1_000_000.0;
    eprintln!(
        "Boot: {} instructions in {:?} ({:.2} MIPS)",
        boot_result.instructions, boot_elapsed, mips
    );
    eprintln!(
        "Entry: 0x{:08X}  DTB: 0x{:08X}  PC: 0x{:08X}",
        boot_result.entry, boot_result.dtb_addr, riscv_vm.cpu.pc
    );

    // Console output from boot
    let sbi_out = String::from_utf8_lossy(&riscv_vm.bus.sbi.console_output);
    let uart_out = String::from_utf8_lossy(&riscv_vm.bus.uart.tx_buf);
    let boot_console = format!("{}{}", sbi_out, uart_out);

    // Boot milestones
    let lower = boot_console.to_lowercase();
    let milestones = [
        ("Linux version", "linux version"),
        ("Machine model", "machine model"),
        ("Kernel init", "kernel_init"),
        ("Shell prompt", "# "),
    ];
    eprintln!("Boot milestones:");
    for (name, needle) in &milestones {
        eprintln!(
            "  {}: {}",
            name,
            if lower.contains(needle) {
                "FOUND"
            } else {
                "---"
            }
        );
    }

    // ── Phase 2: Create GeOS VM with REGION tiles ──────────────────
    eprintln!("\n── Phase 2: Creating GeOS VM with REGION tiles ──");

    let asm_src = r#"
        ; Left Tile: Linux VM (SHARED -- auto-window from bounds)
        REGION linux_panel, 0, 0, 320, 240, bg=0x1A1A2E, SHARED

        ; Config string for VM_LIVE_SPAWN
        LDI r1, 0x3000
        STRO r1, "arch=rv32imac kernel=vmlinux ram=512"
        LDI r2, 0
        VM_LIVE_SPAWN r1, r2

        ; Main loop: step the VM
        LDI r20, 0
        :main_loop
            VM_LIVE_STEP
            ADDI r20, 1
            LDI r21, 200000
            CMP r20, r21
            JNZ r0 :main_loop
        HALT
        ENDR

        ; Right Tile: Status Panel
        REGION status_panel, 324, 0, 196, 240, bg=0x0F3460
        LDI r28, 0x16213E
        LDI r10, 324
        LDI r11, 0
        LDI r12, 196
        LDI r13, 2
        RECTF r10, r11, r12, r13, r28
        LDI r10, 324
        LDI r11, 238
        LDI r12, 196
        LDI r13, 2
        RECTF r10, r11, r12, r13, r28
        ENDR
    "#;

    let mut pp = Preprocessor::new();
    let expanded = pp.preprocess(asm_src);
    let asm_result = assemble(&expanded, 0).expect("Assembly failed");
    eprintln!("Assembled: {} instructions", asm_result.pixels.len());

    let mut vm = Vm::new();
    for (i, &word) in asm_result.pixels.iter().enumerate() {
        vm.ram[i] = word;
    }

    // ── Phase 3: Run GeOS VM to VM_LIVE_SPAWN ──────────────────────
    eprintln!("\n── Phase 3: Running GeOS VM (REGION + VM_LIVE_SPAWN) ──");
    let geos_start = Instant::now();

    for _ in 0..100_000 {
        vm.step();
        if vm.live_hypervisor.is_some() {
            break;
        }
        if vm.halted {
            break;
        }
    }

    // ── Phase 4: Swap in the booted RiscvVm ────────────────────────
    // The VM_LIVE_SPAWN created an empty RiscvVm. We replace it with
    // the fully booted one so VM_LIVE_STEP continues with real output.
    if let Some(ref mut live) = vm.live_hypervisor {
        eprintln!(
            "Swapping booted RiscvVm into live hypervisor (window {})",
            live.window_id
        );
        let win_id = live.window_id;
        let total = live.total_instructions;
        live.vm = riscv_vm;
        live.window_id = win_id;
        live.total_instructions = total;
        live.booted = true;
    } else {
        eprintln!("VM_LIVE_SPAWN failed, r0=0x{:08X}", vm.regs[0]);
        return;
    }

    // ── Phase 5: Continue VM_LIVE_STEP to render console ───────────
    eprintln!("\n── Phase 4: Running VM_LIVE_STEP (rendering console to window) ──");
    for _ in 0..200_000 {
        vm.step();
        if vm.halted {
            break;
        }
    }

    let geos_elapsed = geos_start.elapsed();
    eprintln!("GeOS VM total: {:?}", geos_elapsed);

    // ── Results ─────────────────────────────────────────────────────
    eprintln!("\n=== Demo Results ===");
    eprintln!("Windows: {}", vm.windows.len());
    for (i, win) in vm.windows.iter().enumerate() {
        eprintln!(
            "  Window {}: id={} pos=({},{}) size={}x{} active={}",
            i, win.id, win.x, win.y, win.w, win.h, win.active
        );
    }

    if let Some(ref live) = vm.live_hypervisor {
        eprintln!(
            "Live VM: window_id={} total_instr={}",
            live.window_id, live.total_instructions
        );
        eprintln!("Console: row={} col={}", live.console_row, live.console_col);

        // Show what was rendered
        let sbi2 = String::from_utf8_lossy(&live.vm.bus.sbi.console_output);
        let uart2 = String::from_utf8_lossy(&live.vm.bus.uart.tx_buf);
        let full = format!("{}{}{}", sbi2, uart2, boot_console);
        eprintln!("Total console: {} bytes", full.len());

        if !boot_console.is_empty() {
            eprintln!("\n=== Boot Console ({} bytes) ===", boot_console.len());
            let display = if boot_console.len() > 2000 {
                &boot_console[..2000]
            } else {
                &boot_console
            };
            eprintln!("{}", display);
            eprintln!("=== End ===");
        }
    }

    eprintln!("\nDemo complete.");
}
