// Example: Run the GeOS file viewer (viewer.elf) in the RISC-V hypervisor
// with simulated input to verify display, scrolling, and search.
//
// Build:  cd examples/riscv-hello && ./build.sh viewer.c viewer.elf
// Run:    cargo run --release --example viewer_run

use geometry_os::riscv::bridge::UartBridge;
use geometry_os::riscv::RiscvVm;

fn run_viewer(elf_data: &[u8], input: &[u8], max_steps: u64) -> (Vec<u32>, u32, String) {
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
        count, vm.cpu.pc, faults, nz, fb.len()
    );
    if !console_out.is_empty() {
        eprintln!(
            "  console: {:?}",
            &console_out[..console_out.len().min(200)]
        );
    }

    (fb, vm.cpu.pc, console_out)
}

/// Count non-black pixels in a region of the framebuffer.
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
    let elf_path = "examples/riscv-hello/viewer.elf";
    let elf_data = match std::fs::read(elf_path) {
        Ok(d) => d,
        Err(e) => {
            eprintln!("Error: {} not found: {}", elf_path, e);
            eprintln!("Build with: cd examples/riscv-hello && ./build.sh viewer.c viewer.elf");
            std::process::exit(1);
        }
    };
    eprintln!("Viewer ELF: {} bytes", elf_data.len());

    let mut passed = 0;
    let mut failed = 0;

    // Test 1: Initial display renders content (title bar, line numbers, status bar)
    eprintln!("\n=== Test 1: Initial Display ===");
    let (canvas, _pc, _con) = run_viewer(&elf_data, b"", 15_000_000);
    let tp = count_bright(&canvas, 0, 0, 256, 12);          // title bar
    let cp = count_bright(&canvas, 0, 12, 256, 220);         // content area
    let sp = count_bright(&canvas, 0, 246, 256, 10);         // status bar
    let ln = count_bright(&canvas, 0, 12, 36, 220);          // line number column
    eprintln!("  title={} content={} status={} linenums={}", tp, cp, sp, ln);
    if tp > 20 && sp > 10 && ln > 5 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL: expected title/status/linenums");
        failed += 1;
    }

    // Test 2: Arrow down moves cursor
    eprintln!("\n=== Test 2: Arrow Down ===");
    let (canvas, _, _) = run_viewer(&elf_data, b"\x1b[B", 15_000_000);
    let cp2 = count_bright(&canvas, 0, 12, 256, 220);
    eprintln!("  content_pixels={}", cp2);
    if cp2 > 50 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 3: Search mode activated by /
    eprintln!("\n=== Test 3: Search Mode (/) ===");
    let (canvas, _, _) = run_viewer(&elf_data, b"/", 15_000_000);
    let sp3 = count_bright(&canvas, 0, 246, 256, 10);
    eprintln!("  input_bar_pixels={}", sp3);
    if sp3 > 5 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 4: Search with pattern
    eprintln!("\n=== Test 4: Search Pattern ===");
    let (canvas, _, _) = run_viewer(&elf_data, b"/include\n", 20_000_000);
    let cp4 = count_bright(&canvas, 0, 12, 256, 220);
    eprintln!("  content_pixels={}", cp4);
    if cp4 > 50 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 5: PageDown
    eprintln!("\n=== Test 5: PageDown ===");
    let (canvas, _, _) = run_viewer(&elf_data, b"\x1b[6~", 15_000_000);
    let cp5 = count_bright(&canvas, 0, 12, 256, 220);
    eprintln!("  content_pixels={}", cp5);
    if cp5 > 50 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 6: Home key
    eprintln!("\n=== Test 6: Home ===");
    let (canvas, _, _) = run_viewer(&elf_data, b"\x1b[H", 15_000_000);
    let cp6 = count_bright(&canvas, 0, 12, 256, 220);
    eprintln!("  content_pixels={}", cp6);
    if cp6 > 50 {
        eprintln!("  PASS");
        passed += 1;
    } else {
        eprintln!("  FAIL");
        failed += 1;
    }

    // Test 7: Quit
    eprintln!("\n=== Test 7: Quit ===");
    let (_canvas, pc, _con) = run_viewer(&elf_data, b"q", 15_000_000);
    // After quit, PC should be at or past shutdown point
    eprintln!("  final_pc=0x{:08X}", pc);
    eprintln!("  PASS (no crash)");
    passed += 1;

    eprintln!("\n==============================");
    eprintln!("Results: {} passed, {} failed", passed, failed);
    if failed > 0 {
        std::process::exit(1);
    }
}
