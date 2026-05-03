// Example: Run the vi-like text editor in the RISC-V hypervisor
// with piped input to test editing features.
//
// Build:  cd examples/riscv-hello && ./build.sh vi.c vi.elf
// Run:    cargo run --release --example vi_run

use geometry_os::riscv::RiscvVm;
use geometry_os::riscv::bridge::UartBridge;

/// Boot the vi editor, feed input bytes, run for N steps, collect output.
fn run_vi_with_input(elf_data: &[u8], input: &[u8], max_steps: u64) -> String {
    let mut vm = RiscvVm::new(1024 * 1024);
    let mut bridge = UartBridge::new();

    // Boot the guest
    let _ = vm.boot_guest(elf_data, 1, 500_000).expect("boot failed");

    // Drain initial banner
    bridge.drain_uart_to_canvas(&mut vm.bus, &mut vec![0u32; 256 * 256]);

    // Feed all input via UART
    bridge.forward_keys(&mut vm.bus, input);

    // Run the VM step by step
    let mut count: u64 = 0;
    use geometry_os::riscv::cpu::StepResult;
    while count < max_steps {
        match vm.step() {
            StepResult::Ok
            | StepResult::FetchFault
            | StepResult::LoadFault
            | StepResult::StoreFault
            | StepResult::Ecall => {}
            StepResult::Ebreak | StepResult::Shutdown => break,
        }
        count += 1;
    }

    // Collect output
    let mut canvas = vec![0u32; 256 * 256];
    bridge.drain_uart_to_canvas(&mut vm.bus, &mut canvas);

    let mut output = String::new();
    if !vm.bus.sbi.console_output.is_empty() {
        output.push_str(&String::from_utf8_lossy(&vm.bus.sbi.console_output));
    }

    // Also check framebuffer for visual output (the vi editor draws to fb)
    let mut fb_sample = String::new();
    for y in [0, 1, 10, 20, 248, 249].iter() {
        for x in [0, 10, 50, 100, 200].iter() {
            let fb_addr = 0x60000000u64 + (*y as u64 * 256 + *x as u64) * 4;
            if let Some(pixel) = vm.bus.framebuf.read(fb_addr) {
                if pixel != 0 {
                    fb_sample.push_str(&format!("({},{})={:#010X} ", x, y, pixel));
                }
            }
        }
    }
    if !fb_sample.is_empty() {
        output.push_str(&format!("\n[FB pixels] {}", fb_sample));
    }

    output
}

fn print_output(label: &str, out: &str) {
    eprintln!("\n=== {} ===", label);
    for line in out.lines() {
        if !line.is_empty() {
            eprintln!("  {}", line);
        }
    }
}

fn main() {
    let elf_path = "examples/riscv-hello/vi.elf";
    let elf_data = match std::fs::read(elf_path) {
        Ok(d) => d,
        Err(e) => {
            eprintln!("Error: {} not found: {}", elf_path, e);
            eprintln!("Build with: cd examples/riscv-hello && ./build.sh vi.c vi.elf");
            std::process::exit(1);
        }
    };
    eprintln!("Vi ELF: {} bytes", elf_data.len());

    let mut passed = 0;
    let mut failed = 0;

    // Test 1: Boot and see welcome screen
    // Feed a few characters to trigger rendering, then quit
    let out = run_vi_with_input(&elf_data, b":q!\r", 10_000_000);
    print_output("Test 1: Boot + quit", &out);
    // Should have some framebuffer output (welcome screen renders)
    if out.contains("[FB pixels]") {
        passed += 1;
    } else {
        eprintln!("  FAIL: No framebuffer output detected");
        failed += 1;
    }

    // Test 2: Enter insert mode, type text, exit insert, quit
    let out = run_vi_with_input(
        &elf_data,
        b"ihello world\x1b:q!\r",
        20_000_000,
    );
    print_output("Test 2: Insert text and quit", &out);
    if out.contains("[FB pixels]") {
        passed += 1;
    } else {
        eprintln!("  FAIL: No framebuffer output after insert");
        failed += 1;
    }

    // Test 3: Enter insert mode, type multiple lines, save and quit
    let out = run_vi_with_input(
        &elf_data,
        b"iline one\rline two\rline three\x1b:wq\r",
        30_000_000,
    );
    print_output("Test 3: Multi-line insert + save", &out);
    if out.contains("[FB pixels]") {
        passed += 1;
    } else {
        eprintln!("  FAIL: No framebuffer output after multi-line");
        failed += 1;
    }

    // Test 4: Navigate with hjkl
    let out = run_vi_with_input(
        &elf_data,
        b"ihello\x1bllljj:q!\r",
        20_000_000,
    );
    print_output("Test 4: Navigation with hjkl", &out);

    // Test 5: Delete with x key
    let out = run_vi_with_input(
        &elf_data,
        b"iabcdef\x1bllx:q!\r",
        20_000_000,
    );
    print_output("Test 5: Delete character with x", &out);

    // Test 6: Colon commands - :wq (write and quit)
    let out = run_vi_with_input(
        &elf_data,
        b":wq\r",
        10_000_000,
    );
    print_output("Test 6: :wq command", &out);
    if out.contains("saving") && out.contains("saved") && out.contains("goodbye") {
        passed += 1;
    } else {
        eprintln!("  FAIL: :wq did not save and quit");
        failed += 1;
    }

    eprintln!("\n=== Results: {} passed, {} failed ===", passed, failed);
    if failed > 0 {
        std::process::exit(1);
    }
}
