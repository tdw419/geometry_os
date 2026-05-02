// Example: Run the GeOS mini-shell (sh.elf) in the RISC-V hypervisor
// with piped input to demonstrate shell features.
//
// Build:  cd examples/riscv-hello && ./build.sh sh.c sh.elf
// Run:    cargo run --release --example sh_run

use geometry_os::riscv::RiscvVm;
use geometry_os::riscv::bridge::UartBridge;

/// Boot a fresh shell, feed input bytes, run for N steps, collect output.
fn run_shell_with_input(elf_data: &[u8], input: &[u8], max_steps: u64) -> String {
    let mut vm = RiscvVm::new(1024 * 1024);
    let mut bridge = UartBridge::new();

    // Boot the guest
    let _ = vm.boot_guest(elf_data, 1, 500_000).expect("boot failed");

    // Drain initial banner
    bridge.drain_uart_to_canvas(&mut vm.bus, &mut vec![0u32; 256 * 256]);

    // Feed all input via UART (SBI getchar reads from uart.rx_buf)
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
    let elf_path = "examples/riscv-hello/sh.elf";
    let elf_data = match std::fs::read(elf_path) {
        Ok(d) => d,
        Err(e) => {
            eprintln!("Error: {} not found: {}", elf_path, e);
            eprintln!("Build with: cd examples/riscv-hello && ./build.sh sh.c sh.elf");
            std::process::exit(1);
        }
    };
    eprintln!("Shell ELF: {} bytes", elf_data.len());

    let mut passed = 0;
    let mut failed = 0;

    // Test 1: help command
    let out = run_shell_with_input(&elf_data, b"help\rshutdown\r", 5_000_000);
    print_output("Test 1: help", &out);
    if out.contains("Commands:") || out.contains("help") {
        passed += 1;
    } else {
        eprintln!("  FAIL: help output missing");
        failed += 1;
    }

    // Test 2: echo
    let out = run_shell_with_input(&elf_data, b"echo hello world\rshutdown\r", 5_000_000);
    print_output("Test 2: echo hello world", &out);
    if out.contains("hello world") {
        passed += 1;
    } else {
        eprintln!("  FAIL: echo output missing");
        failed += 1;
    }

    // Test 3: ver
    let out = run_shell_with_input(&elf_data, b"ver\rshutdown\r", 5_000_000);
    print_output("Test 3: ver", &out);

    // Test 4: peek
    let out = run_shell_with_input(&elf_data, b"peek 0x80000000\rshutdown\r", 5_000_000);
    print_output("Test 4: peek 0x80000000", &out);

    // Test 5: ls
    let out = run_shell_with_input(&elf_data, b"ls\rshutdown\r", 5_000_000);
    print_output("Test 5: ls", &out);

    // Test 6: regs
    let out = run_shell_with_input(&elf_data, b"regs\rshutdown\r", 5_000_000);
    print_output("Test 6: regs", &out);

    // Test 7: unknown command
    let out = run_shell_with_input(&elf_data, b"foobar\rshutdown\r", 5_000_000);
    print_output("Test 7: unknown command", &out);
    if out.contains("unknown") {
        passed += 1;
    } else {
        eprintln!("  FAIL: unknown command error missing");
        failed += 1;
    }

    // Test 8: pipe (echo | cat)
    let out = run_shell_with_input(&elf_data, b"echo hello | cat\rshutdown\r", 5_000_000);
    print_output("Test 8: echo hello | cat (pipe)", &out);

    // Test 9: echo -n (no newline)
    let out = run_shell_with_input(&elf_data, b"echo -n test\rshutdown\r", 5_000_000);
    print_output("Test 9: echo -n test", &out);

    // Test 10: history
    let out = run_shell_with_input(
        &elf_data,
        b"echo first\recho second\rhistory\rshutdown\r",
        10_000_000,
    );
    print_output("Test 10: history", &out);

    // Test 11: env
    let out = run_shell_with_input(&elf_data, b"env\rshutdown\r", 5_000_000);
    print_output("Test 11: env", &out);

    // Test 12: pwd
    let out = run_shell_with_input(&elf_data, b"pwd\rshutdown\r", 5_000_000);
    print_output("Test 12: pwd", &out);

    eprintln!("\n=== Results: {} passed, {} failed ===", passed, failed);
    if failed > 0 {
        std::process::exit(1);
    }
}
