#!/usr/bin/env cargo run
//! Glyph → Spatial Bridge Demo (Phase 5.1)
//!
//! This binary demonstrates the complete Glyph Stratum integration:
//! 1. Load a Glyph program from JSON
//! 2. Compile it into a spatial grid layout
//! 3. Execute it through GridRunner
//! 4. Display results

use infinite_map_rs::spatial::glyph_bridge::compile_glyph_to_grid;
use infinite_map_rs::spatial::grid_runner::GridRunner;
use std::path::PathBuf;
use std::env;
use bytemuck::cast_slice;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("╔════════════════════════════════════════════════════════════╗");
    println!("║  Phase 5.1: Glyph Stratum → Spatial Routing Demo        ║");
    println!("╚════════════════════════════════════════════════════════════╝");
    println!();

    // Parse command line
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <glyph_program.json>", args[0]);
        eprintln!();
        eprintln!("Example JSON format:");
        eprintln!(
            r#"{{
  "program": [[128, 0, 100.0, 0.0, 1], [141, 0, 0.0, 0.0, 0]],
  "memory": [42.0, 0.0, 0.0, 0.0]
}}"#
        );
        std::process::exit(1);
    }

    let json_path = PathBuf::from(&args[1]);

    // Step 1: Load Glyph program
    println!("📖 Step 1: Loading Glyph program from: {:?}", json_path);
    let grid_layout = compile_glyph_to_grid(&json_path)?;
    println!(
        "   ✓ Loaded {} instructions, {} memory cells",
        grid_layout.cells.iter().filter(|c| c.opcode() != 0).count(),
        grid_layout
            .cells
            .iter()
            .filter(|c| c.opcode() == 0 && c.data_buffer != 0)
            .count()
    );
    println!();

    // Step 2: Initialize GridRunner
    println!("⚙️  Step 2: Initializing GridRunner with spatial routing");
    let mut runner = GridRunner::new().await?;
    println!("   ✓ GridRunner initialized (128x64 grid with path caching)");
    println!();

    // Step 3: Convert cells to binary format for GridRunner
    println!("🗺️  Step 3: Converting cells to binary format");
    let cells = grid_layout.to_cell_array();

    // Create binary header: [grid_w, grid_h, cell_count, first_code_x, first_code_y]
    // GridRunner expects this exact header format
    let mut bin_data = Vec::new();
    bin_data.extend_from_slice(&(128u32).to_le_bytes()); // grid_w
    bin_data.extend_from_slice(&(64u32).to_le_bytes());  // grid_h
    bin_data.extend_from_slice(&(cells.len() as u32).to_le_bytes()); // cell_count
    bin_data.extend_from_slice(&(0u32).to_le_bytes());   // first_code_x
    bin_data.extend_from_slice(&(0u32).to_le_bytes());   // first_code_y

    // For each cell: [x, y, opcode, data_buffer] (16 bytes per cell)
    // Layout cells in row-major order from (0,0) to (127,63)
    for (cell_idx, cell) in cells.iter().enumerate() {
        let x = (cell_idx % 128) as u32;
        let y = (cell_idx / 128) as u32;

        bin_data.extend_from_slice(&x.to_le_bytes());
        bin_data.extend_from_slice(&y.to_le_bytes());
        bin_data.extend_from_slice(&cell.opcode().to_le_bytes());
        bin_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
    }

    println!("   ✓ Binary format: {} bytes (header: 20B, cells: {}B)",
        bin_data.len(),
        cells.len() * 16
    );
    println!();

    // Step 4: Load grid
    println!("⬆️  Step 4: Loading compiled grid into GPU");
    runner.load_binary(&bin_data)?;
    println!("   ✓ Grid uploaded to GPU");
    println!();

    // Step 5: Execute
    println!("▶️  Step 5: Executing spatial program (10 ticks)");
    for tick in 0..10 {
        runner.tick().await?;
        if tick % 5 == 0 {
            println!("   ✓ Tick {} complete", tick);
        }
    }
    println!("   ✓ Execution complete");
    println!();

    // Step 6: Read back results using tick (which returns current state)
    println!("📊 Step 6: Reading back results");
    let final_state = runner.tick().await?;
    let active_count = final_state.iter().filter(|c| c.is_active == 1).count();
    println!(
        "   ✓ Read {} cells ({} active)",
        final_state.len(),
        active_count
    );
    println!();

    // Display sample cell states
    println!("🔍 Sample cell states (first 20):");
    println!("   Index | Opcode | Active | Data");
    println!("   ------|--------|--------|-----");
    for (i, cell) in final_state.iter().take(20).enumerate() {
        println!(
            "   {:5} | {:6} | {:6} | {:4}",
            i,
            cell.opcode(),
            cell.is_active,
            cell.data_buffer
        );
    }

    println!();
    println!("╔════════════════════════════════════════════════════════════╗");
    println!("║  Phase 5.1 Demo Complete: Glyph→Spatial Integration Works!║");
    println!("╚════════════════════════════════════════════════════════════╝");

    Ok(())
}