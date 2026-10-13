/// Example: SBI Console Polling Integration
///
/// Demonstrates how to integrate SBI console polling into the main tick loop
/// for real xv6 kernels.
///
/// The spatial ECALL intercept in riscv_transpiler.rs (v7.6) automatically
/// intercepts ECALLs with a7=1 (SBI console_putchar) and writes characters
/// to the MMIO ring buffer on row 9:
///
///   (0, 9)          producer_head (monotonic u32)
///   (10..73, 9)     64-char ring buffer
///
/// The host polls row 9 each tick and prints any new characters.
///
/// Usage: Run this test with a real xv6 kernel that uses SBI console_putchar
use infinite_map_rs::geoasm_materializer::CellState;
use std::time::Duration;

#[ignore] // Requires real xv6 kernel binary
#[tokio::test]
async fn test_sbi_console_polling() {
    // Initialize GridRunner
    let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(512, 256)
        .await
        .expect("Failed to create GridRunner");

    // Load xv6 kernel (as .bin format)
    let kernel_data = std::fs::read("xv6_riscv.bin")
        .expect("Failed to read xv6 kernel binary");

    runner.load_binary(&kernel_data)
        .expect("Failed to load kernel binary");

    println!("=== Starting xv6 boot with SBI console ===");
    println!("Polling console output each tick...\n");

    // Run for N ticks, polling console each iteration
    let tick_count = 1000;
    for tick in 0..tick_count {
        // Execute one tick
        let _state = runner.tick().await
            .expect(&format!("Failed tick {}", tick));

        // Poll SBI console for new output
        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                // Print new characters immediately (no buffering)
                print!("{}", new_output);
                std::io::stdout().flush().unwrap();
            }
        }

        // Optional: throttle to 60 FPS for console readability
        // tokio::time::sleep(Duration::from_millis(16)).await;

        // Progress indicator every 100 ticks
        if tick % 100 == 0 && tick > 0 {
            println!("\n[{}] {} ticks complete...", tick, tick);
        }
    }

    println!("\n=== Boot completed ({} ticks) ===", tick_count);

    // Final console poll to catch any remaining output
    if let Ok(final_output) = runner.poll_sbi_console().await {
        if !final_output.is_empty() {
            print!("{}", final_output);
            std::io::stdout().flush().unwrap();
        }
    }
}

/// Example: Console polling with frame saving
///
/// Demonstrates how to combine console polling with the existing
/// frame save pattern used in other tests.
#[ignore] // Requires real xv6 kernel binary
#[tokio::test]
async fn test_console_with_frame_save() {
    let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(512, 256)
        .await
        .expect("Failed to create GridRunner");

    let kernel_data = std::fs::read("xv6_riscv.bin")
        .expect("Failed to read xv6 kernel binary");

    runner.load_binary(&kernel_data)
        .expect("Failed to load kernel binary");

    // Track console output separately
    let mut full_console_output = String::new();

    // Run with periodic frame saves
    for tick in 0..500 {
        let state = runner.tick().await
            .expect(&format!("Failed tick {}", tick));

        // Poll console
        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                print!("{}", new_output);
                std::io::stdout().flush().unwrap();
                full_console_output.push_str(&new_output);
            }
        }

        // Save frame every 100 ticks
        if tick % 100 == 0 {
            let frame_path = format!("/tmp/xv6_frame_{:04}.png", tick);
            save_frame_to_png(&state, 512, 256, &frame_path);
            println!("Saved frame: {}", frame_path);
        }
    }

    // Save final console output to file
    std::fs::write("/tmp/xv6_console.txt", &full_console_output)
        .expect("Failed to write console output");

    println!("Console output saved to /tmp/xv6_console.txt");
}

/// Helper: Save frame to PNG (implementation depends on your image library)
fn save_frame_to_png(
    cells: &[CellState],
    width: usize,
    height: usize,
    path: &str,
) {
    use image::{ImageBuffer, Luma};

    // Create grayscale image from cells
    let mut img = ImageBuffer::<Luma<u8>, Vec<u8>>::new(width as u32, height as u32);

    for (i, cell) in cells.iter().enumerate() {
        let x = (i % width) as u32;
        let y = (i / width) as u32;

        // Visualize cell state (simple grayscale)
        let pixel_value = if cell.is_active == 1 {
            255 // White for active
        } else if cell.opcode_or_type != 0 {
            128 // Gray for instructions
        } else if cell.data_buffer != 0 {
            64 // Dark gray for data
        } else {
            0 // Black for empty
        };

        img.put_pixel(x, y, Luma([pixel_value]));
    }

    img.save(path).expect("Failed to save PNG");
}