/// Boot the real xv6 kernel and collect SBI console output
///
/// This test loads the compiled xv6 kernel binary and runs it on the spatial
/// substrate, collecting console output via the ECALL intercept mechanism.
///
/// ECALL intercept:
///   - Row 9 houses MMIO console region
///   - (0, 9) = producer_head (monotonic u32)
///   - (10..73, 9) = 64-char ring buffer
///
/// When the kernel calls ecall with a7=1 (SBI console_putchar), the character
/// is written to the ring buffer and the host polls it for display.

use std::io::Write;

#[tokio::test]
async fn boot_xv6_real_kernel() {
    // Initialize GridRunner with 512x256 grid (larger_grid for xv6)
    let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(512, 256)
        .await
        .expect("Failed to create GridRunner");

    // Load xv6 kernel binary
    let kernel_path = "/tmp/xv6_diag.kernel.bin";
    println!("Loading xv6 kernel from: {}", kernel_path);

    let kernel_data = std::fs::read(kernel_path)
        .expect("Failed to read xv6 kernel binary");

    println!("Kernel size: {} bytes", kernel_data.len());

    runner.load_binary(&kernel_data)
        .expect("Failed to load kernel binary");

    println!("=== Starting xv6 boot with SBI console ===");
    println!("Polling console output each tick...\n");

    // Collect all console output
    let mut all_output = String::new();

    // Run for 500 ticks to see boot progress
    let tick_count = 500;
    for tick in 0..tick_count {
        // Execute one tick
        let _state = runner.tick().await
            .expect(&format!("Failed tick {}", tick));

        // Poll SBI console for new output
        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                // Collect and print immediately
                all_output.push_str(&new_output);
                print!("{}", new_output);
                std::io::stdout().flush().unwrap();
            }
        }

        // Progress indicator every 100 ticks
        if tick % 100 == 0 && tick > 0 {
            println!("\n[{}] {} ticks complete...", tick, tick);
        }
    }

    println!("\n=== Boot completed ({} ticks) ===", tick_count);
    println!("Total console output: {} bytes", all_output.len());

    // Save console output for analysis
    std::fs::write("/tmp/xv6_boot_output.txt", &all_output)
        .expect("Failed to write console output");
    println!("Console output saved to /tmp/xv6_boot_output.txt");

    // First 50 bytes should help identify what crashed
    if !all_output.is_empty() {
        println!("\nFirst 50 chars: {:?}", &all_output.chars().take(50).collect::<String>());
    }
}