use std::env;
use std::fs;
use std::io::Write;

// Use the same CellState and GridRunner as the transpiler
use infinite_map_rs::geoasm_materializer::CellState;
use infinite_map_rs::spatial::grid_runner::GridRunner;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: lock_test_gpu_runner <spatial.bin>");
        std::process::exit(1);
    }

    let bin_path = &args[1];
    let bin_data = fs::read(bin_path)
        .expect(&format!("Failed to read: {}", bin_path));

    println!("Loaded spatial binary: {} bytes", bin_data.len());

    // Parse the GridRunner binary format
    let mut cursor = 0;

    let grid_w = u32::from_le_bytes([
        bin_data[cursor], bin_data[cursor + 1],
        bin_data[cursor + 2], bin_data[cursor + 3],
    ]) as usize;
    cursor += 4;

    let grid_h = u32::from_le_bytes([
        bin_data[cursor], bin_data[cursor + 1],
        bin_data[cursor + 2], bin_data[cursor + 3],
    ]) as usize;
    cursor += 4;

    let cell_count = u32::from_le_bytes([
        bin_data[cursor], bin_data[cursor + 1],
        bin_data[cursor + 2], bin_data[cursor + 3],
    ]) as usize;
    cursor += 4;

    let entry_x = u32::from_le_bytes([
        bin_data[cursor], bin_data[cursor + 1],
        bin_data[cursor + 2], bin_data[cursor + 3],
    ]) as usize;
    cursor += 4;

    let entry_y = u32::from_le_bytes([
        bin_data[cursor], bin_data[cursor + 1],
        bin_data[cursor + 2], bin_data[cursor + 3],
    ]) as usize;
    cursor += 4;

    println!("Grid: {}x{}", grid_w, grid_h);
    println!("Cells: {}", cell_count);
    println!("Entry: ({}, {})", entry_x, entry_y);
    println!("");

    // Reconstruct cells
    let mut cells = Vec::with_capacity(cell_count);
    for _i in 0..cell_count {
        let x = u32::from_le_bytes([
            bin_data[cursor], bin_data[cursor + 1],
            bin_data[cursor + 2], bin_data[cursor + 3],
        ]) as usize;
        cursor += 4;

        let y = u32::from_le_bytes([
            bin_data[cursor], bin_data[cursor + 1],
            bin_data[cursor + 2], bin_data[cursor + 3],
        ]) as usize;
        cursor += 4;

        let opcode_or_type = u32::from_le_bytes([
            bin_data[cursor], bin_data[cursor + 1],
            bin_data[cursor + 2], bin_data[cursor + 3],
        ]);
        cursor += 4;

        let data_buffer = u32::from_le_bytes([
            bin_data[cursor], bin_data[cursor + 1],
            bin_data[cursor + 2], bin_data[cursor + 3],
        ]);
        cursor += 4;

        cells.push((
            x,
            y,
            CellState {
                opcode_or_type,
                is_active: 0,
                data_buffer,
                executing: 0,
            },
        ));
    }

    println!("Reconstructed {} cells", cells.len());
    println!("");

    // Create GridRunner
    println!("Initializing GPU GridRunner...");
    let mut runner = GridRunner::new_with_grid(grid_w, grid_h)
        .await
        .expect("Failed to create GridRunner (GPU required)");

    println!("GPU GridRunner initialized");
    println!("");

    // Load cells directly (we can't use load_binary since we reconstructed cells)
    // But we need to pack them into the binary format again
    let mut reload_data = Vec::new();
    reload_data.extend_from_slice(&grid_w.to_le_bytes());
    reload_data.extend_from_slice(&grid_h.to_le_bytes());
    reload_data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
    reload_data.extend_from_slice(&(entry_x as u32).to_le_bytes());
    reload_data.extend_from_slice(&(entry_y as u32).to_le_bytes());

    for (x, y, cell) in &cells {
        reload_data.extend_from_slice(&(*x as u32).to_le_bytes());
        reload_data.extend_from_slice(&(*y as u32).to_le_bytes());
        reload_data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
        reload_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
    }

    runner
        .load_binary(&reload_data)
        .expect("Failed to load binary into GridRunner");

    println!("Loaded binary into GPU");
    println!("");

    println!("=== Starting lock test execution ===");
    println!("(Tick | Test result)");
    println!("------------------------");

    let mut test_result = "Running...";

    for tick in 0..200 {
        let state = runner.tick().await.expect(&format!("Tick {} failed", tick));

        // Poll for ECALL result
        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                print!("{}", new_output);
                std::io::stdout().flush().unwrap();
            }
        }

        // Check for test completion (state might have error info)
        // For now, just run and see if we get output

        // Progress indicator every 50 ticks
        if tick % 50 == 0 && tick > 0 {
            println!("[{}]", tick);
        }
    }

    println!("");
    println!("=== Execution complete (200 ticks) ===");
    println!("");
    println!("Test result: {}", test_result);
    println!("");
    println!("Failure codes:");
    println!("  0xBAD1 - AMOSWAP didn't return expected old value");
    println!("  0xBAD2 - Lock didn't become 1 after AMOSWAP");
    println!("  0xBAD3 - lock_cpu wasn't 0 after storing tp=0");
    println!("  0xBAD4 - Lock wasn't 1 (should be held)");
    println!("  0xBAD5 - lock_cpu wasn't 0 when tp=0 (holding check fail)");
    println!("  0x600D - ALL TESTS PASSED");

    Ok(())
}