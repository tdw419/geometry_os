// Example: Run the GeOS hex editor (hexedit.elf) in the RISC-V hypervisor
// with simulated input to verify display, navigation, and editing.
//
// Build:  cd examples/riscv-hello && ./build.sh hexedit.c hexedit.elf
// Run:    cargo run --release --example hexedit_run

use geometry_os::riscv::bridge::UartBridge;
use geometry_os::riscv::RiscvVm;

fn run_hexedit(elf_data: &[u8], input: &[u8], max_steps: u64) -> (Vec<u32>, u32, String) {
    let mut vm = RiscvVm::new(1024 * 1024);
    let mut bridge = UartBridge::new();

    let boot = vm.boot_guest(elf_data, 1, 500_000).expect("boot failed");
    eprintln!(
        "  boot: {} steps, entry=0x{:08X}",
        boot.instructions, boot.entry
    );

    bridge.drain_uart_to_canvas(&mut vm.bus, &mut vec![0u32; 256 * 256]);
    bridge.forward_keys(&mut vm.bus, input);

    let mut count: u64 = 0;
    use geometry_os::riscv::cpu::StepResult;
    let mut faults = 0u64;
    while count < max_steps {
        match vm.step() {
            StepResult::Ok | StepResult::Ecall | StepResult::Yielded => {}
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                faults += 1;
            }
            StepResult::Ebreak | StepResult::Shutdown => break,
        }
        count += 1;
    }

    let console_out = String::from_utf8_lossy(&vm.bus.sbi.console_output).to_string();
    let fb = vm.bus.framebuf.pixels.clone();
    let nz = fb.iter().filter(|&&p| p != 0).count();
    eprintln!(
        "  post-boot: steps={}, pc=0x{:08X}, faults={}, fb_nz={}/{}",
        count,
        vm.cpu.pc,
        faults,
        nz,
        fb.len()
    );
    if !console_out.is_empty() {
        eprintln!(
            "  console: {:?}",
            &console_out[..console_out.len().min(200)]
        );
    }

    // Sample a few pixels for debugging
    for (x, y) in [(5, 5), (5, 2), (2, 250)] {
        let px = fb[y * 256 + x];
        eprintln!("  pixel({},{}) = 0x{:08X}", x, y, px);
    }

    (fb, vm.cpu.pc, console_out)
}

fn count_bright(canvas: &[u32], x0: usize, y0: usize, w: usize, h: usize) -> usize {
    let mut c = 0;
    for y in y0..(y0 + h).min(256) {
        for x in x0..(x0 + w).min(256) {
            let px = canvas[y * 256 + x];
            let r = (px >> 24) & 0xFF;
            let g = (px >> 16) & 0xFF;
            let b = (px >> 8) & 0xFF;
            if r > 0x15 || g > 0x15 || b > 0x15 {
                c += 1;
            }
        }
    }
    c
}

fn main() {
    let elf_path = "examples/riscv-hello/hexedit.elf";
    let elf_data = match std::fs::read(elf_path) {
        Ok(d) => d,
        Err(e) => {
            eprintln!("Error: {} not found: {}", elf_path, e);
            eprintln!("Build with: cd examples/riscv-hello && ./build.sh hexedit.c hexedit.elf");
            std::process::exit(1);
        }
    };
    eprintln!("Hex editor ELF: {} bytes", elf_data.len());

    let mut passed = 0;
    let mut failed = 0;

    // Test 1: Initial display renders content
    eprintln!("\n=== Test 1: Initial Display ===");
    let (canvas, _pc, _con) = run_hexedit(&elf_data, b"", 10_000_000);
    let tp = count_bright(&canvas, 0, 0, 256, 12);
    let hp = count_bright(&canvas, 0, 14, 256, 140);
    let sp = count_bright(&canvas, 0, 246, 256, 10);
    eprintln!("  title={} hex={} status={}", tp, hp, sp);
    if tp > 50 && hp > 200 && sp > 20 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL: not enough content rendered");
        failed += 1;
    }

    // Test 2: Arrow down
    eprintln!("\n=== Test 2: Arrow Down ===");
    let (canvas, _, _) = run_hexedit(&elf_data, b"\x1b[B", 12_000_000);
    let hp2 = count_bright(&canvas, 0, 14, 256, 140);
    eprintln!("  hex_pixels={}", hp2);
    if hp2 > 100 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 3: Search mode
    eprintln!("\n=== Test 3: Search Mode ===");
    let (canvas, _, _) = run_hexedit(&elf_data, b"s", 12_000_000);
    let sp3 = count_bright(&canvas, 0, 246, 256, 10);
    eprintln!("  status_pixels={}", sp3);
    if sp3 > 20 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 4: Goto mode
    eprintln!("\n=== Test 4: Goto Mode ===");
    let (canvas, _, _) = run_hexedit(&elf_data, b"g", 12_000_000);
    let sp4 = count_bright(&canvas, 0, 246, 256, 10);
    eprintln!("  status_pixels={}", sp4);
    if sp4 > 20 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 5: Edit mode
    eprintln!("\n=== Test 5: Edit Mode ===");
    let (canvas, _, _) = run_hexedit(&elf_data, b"\nA", 12_000_000);
    let ep5 = count_bright(&canvas, 0, 14, 256, 140);
    eprintln!("  hex_pixels={}", ep5);
    if ep5 > 100 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 6: PageDown
    eprintln!("\n=== Test 6: PageDown ===");
    let (canvas, _, _) = run_hexedit(&elf_data, b"\x1b[6", 12_000_000);
    let pp6 = count_bright(&canvas, 0, 14, 256, 140);
    eprintln!("  hex_pixels={}", pp6);
    if pp6 > 100 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 7: Goto FB address
    eprintln!("\n=== Test 7: Goto FB Address ===");
    let (canvas, _, _) = run_hexedit(&elf_data, b"g60000000\n", 15_000_000);
    let fp7 = count_bright(&canvas, 0, 14, 256, 140);
    eprintln!("  hex_pixels={}", fp7);
    if fp7 > 100 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    eprintln!("\n==============================");
    eprintln!("Results: {} passed, {} failed", passed, failed);
    if failed > 0 {
        std::process::exit(1);
    }
}
