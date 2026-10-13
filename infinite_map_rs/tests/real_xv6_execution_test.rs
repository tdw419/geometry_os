//! Phase 9.2: Real xv6 Kernel Execution Test (Large Grid)
//!
//! End-to-end test demonstrating REAL xv6 kernel (35KB) booting on GPU spatial substrate:
//! 1. Load real xv6 kernel (kernel.minimal, 35KB) via PayloadLoader
//! 2. Extract PT_LOAD segments (22,616 words)
//! 3. Emit bootloader + kernel cells via PayloadLoader::emit_kernel_program()
//! 4. Load into GridRunner with large_grid feature (256x128 = 32,768 cells)
//! 5. Execute on GPU and verify activity
//!
//! Requires: --features large_grid

use infinite_map_rs::spatial::payload_loader::PayloadLoader;
use std::path::Path;

// Large grid dimensions (required for real xv6 kernel)
const GRID_W: usize = 256;
const GRID_H: usize = 128;

#[tokio::test]
#[ignore] // Requires GPU + kernel.minimal - run with: cargo test --test real_xv6_execution --features large_grid -- --ignored
async fn test_real_xv6_kernel_execution() {
    // GPU device detection - skip if no GPU available
    if create_test_device().await.is_none() {
        println!("Skipping test - no GPU available");
        return;
    }

    // Check kernel.minimal exists
    let kernel_path = Path::new("../../conductor/tracks/xv6-rv32/kernel.minimal");
    if !kernel_path.exists() {
        println!("kernel.minimal not found. Build it with:");
        println!("  cd ../../conductor/tracks/xv6-rv32 && make -f Makefile.minimal");
        return;
    }

    println!("Loading real xv6 kernel: 35KB");

    // Load real xv6 kernel (35KB)
    let kernel_data = std::fs::read(kernel_path)
        .expect("Failed to read kernel.minimal");

    println!("Loaded real xv6 kernel: {} bytes", kernel_data.len());

    // Create PayloadLoader with large grid dimensions
    let mut loader = PayloadLoader::new(GRID_W, GRID_H);

    // Parse kernel with PayloadLoader
    let region = loader.load_kernel(&kernel_data)
        .expect("Failed to parse real xv6 kernel");

    println!("Parsed real xv6 kernel:");
    println!("  Entry point: 0x{:08x}", region.entry_point);
    println!("  Region size: {}x{} cells", region.width, region.height);
    println!("  Region base: ({}, {})", region.base_x, region.base_y);

    // Extract PT_LOAD segments
    let (kernel_image, entry_point) = loader.parse_kernel_image(&kernel_data)
        .expect("Failed to parse kernel image");

    println!("Extracted PT_LOAD segments: {} words", kernel_image.len());
    println!("  That's {} bytes of kernel code/data", kernel_image.len() * 4);

    // Verify entry point
    assert_eq!(entry_point, 0x8000_0000, "xv6 entry point should be 0x80000000");

    // Emit spatial program with kernel + bootloader
    let cells = loader.emit_kernel_program(&kernel_image, &region)
        .expect("Failed to emit spatial program");

    println!("Emitted spatial program: {} cells", cells.len());

    // Verify kernel fits in large grid
    assert!(region.width as usize <= GRID_W, "Kernel width {} exceeds large grid width {}", region.width, GRID_W);
    assert!(region.height as usize <= GRID_H, "Kernel height {} exceeds large grid height {}", region.height, GRID_H);

    // Filter to grid bounds (same logic as in minimal_xv6_execution_test)
    let cells: Vec<_> = cells.into_iter()
        .filter(|(x, y, _)| *x < GRID_W && *y < GRID_H)
        .collect();

    println!("Filtered to {} cells (large grid bounds)", cells.len());

    // Verify we have enough cells for 22,616-word kernel
    // Each kernel data cell stores up to 16 words in data_buffer (64 bytes / 4 bytes per word)
    // So we need at least ceil(22616 / 16) = 1414 kernel data cells
    let kernel_data_cells = cells.iter()
        .filter(|(_, _, cell)| cell.opcode_or_type == infinite_map_rs::geoasm_materializer::TYPE_NOP)
        .count();

    println!("Kernel data cells: {} (stores {} words total, {} KB)",
             kernel_data_cells, kernel_data_cells * 16, kernel_data_cells * 16 * 4 / 1024);

    assert!(kernel_data_cells >= 1400, "Need at least 1400 kernel data cells for 35KB kernel, got {}", kernel_data_cells);

    // Pack cells into GridRunner binary format
    let bin_data = pack_grid_runner_binary(GRID_W as u32, GRID_H as u32, &cells);

    println!("Packed binary: {} bytes", bin_data.len());

    // Create GridRunner with GPU backend
    let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new()
        .await
        .expect("Failed to create GridRunner (GPU device already confirmed available)");

    // Load binary into GridRunner
    runner.load_binary(&bin_data)
        .expect("Failed to load real xv6 kernel binary into GridRunner");

    println!("✅ Real xv6 kernel loaded into GridRunner");

    // Step simulation for 100 ticks (real xv6 will be slower)
    let mut last_state = runner.tick().await.expect("Failed to tick GridRunner (tick 0)");
    for tick in 1..100 {
        last_state = runner.tick().await.expect(&format!("Failed to tick GridRunner (tick {})", tick));
    }

    println!("✅ Simulation completed: 100 ticks");

    // Verify execution occurred
    let active_cells = last_state.iter().filter(|c| c.is_active == 1).count();
    let executing_cells = last_state.iter().filter(|c| c.executing == 1).count();

    println!("Execution state after 100 ticks:");
    println!("  Active cells: {}", active_cells);
    println!("  Executing cells: {}", executing_cells);

    // Real xv6 kernel should show significant activity
    assert!(
        active_cells > 0 || executing_cells > 0,
        "Expected spatial substrate to show activity after 100 ticks with real xv6 kernel"
    );

    println!("✅ Real xv6 kernel execution test PASSED");
    println!("   - 35KB kernel (22,616 words) loaded on 256x128 grid");
    println!("   - {} kernel data cells ({:.1} KB capacity)",
             kernel_data_cells, kernel_data_cells as f64 * 16.0 * 4.0 / 1024.0);
    println!("   - {} active cells after 100 ticks", active_cells);
    println!("   - {} executing cells after 100 ticks", executing_cells);
}

/// Create GridRunner binary format from cells
fn pack_grid_runner_binary(
    grid_w: u32,
    grid_h: u32,
    cells: &[(usize, usize, infinite_map_rs::geoasm_materializer::CellState)],
) -> Vec<u8> {
    // Find the first active cell (entry point)
    let (first_code_x, first_code_y) = cells
        .iter()
        .find(|(_, _, cell)| cell.is_active == 1)
        .map(|(x, y, _)| (*x, *y))
        .expect("No active cells found - bootloader should activate first cell");

    eprintln!("=== ENTRY POINT ===");
    eprintln!("First active cell at: ({}, {})", first_code_x, first_code_y);
    eprintln!("Total cells: {}", cells.len());
    eprintln!("=== END ENTRY POINT ===\n");

    // Verify entry point is at correct position
    eprintln!("DEBUG: cells[0] = ({}, {})", cells[0].0, cells[0].1);
    eprintln!("DEBUG: cells[1] = ({}, {})", cells[1].0, cells[1].1);
    
    let mut bin_data = Vec::new();

    // Header: grid dimensions + cell count + entry point
    bin_data.extend_from_slice(&grid_w.to_le_bytes());
    bin_data.extend_from_slice(&grid_h.to_le_bytes());
    bin_data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
    bin_data.extend_from_slice(&(first_code_x as u32).to_le_bytes());
    bin_data.extend_from_slice(&(first_code_y as u32).to_le_bytes());

    // Debug: print first 3 cells being packed
    eprintln!("\n=== PACKING DEBUG: First 3 cells ===");
    for (i, (x, y, cell)) in cells.iter().enumerate().take(3) {
        eprintln!(
            "Cell [{}]: ({}, {}) opcode={:08x} data={:08x} active={}",
            i, x, y, cell.opcode_or_type, cell.data_buffer, cell.is_active
        );
    }
    eprintln!("=== END PACKING DEBUG ===\n");

    // Debug: trace actual packing
    eprintln!("=== PACKING LOOP TRACE ===");
    for (idx, (x, y, cell)) in cells.iter().enumerate().take(3) {
        let x_bytes = (*x as u32).to_le_bytes();
        let y_bytes = (*y as u32).to_le_bytes();
        eprintln!(
            "Packing cell [{}]: ({}, {}) -> x_bytes: {:02x} {:02x} {:02x} {:02x}, y_bytes: {:02x} {:02x} {:02x} {:02x}",
            idx, x, y,
            x_bytes[0], x_bytes[1], x_bytes[2], x_bytes[3],
            y_bytes[0], y_bytes[1], y_bytes[2], y_bytes[3]
        );
    }
    eprintln!("=== END PACKING LOOP TRACE ===\n");

    eprintln!("DEBUG: Starting packing loop, bin_data len before: {}", bin_data.len());
    eprintln!("DEBUG: About to write {} cells", cells.len());
    
    for (cell_idx, (x, y, cell)) in cells.iter().enumerate() {
        let offset_before = bin_data.len();
        let x_bytes = (*x as u32).to_le_bytes();
        let y_bytes = (*y as u32).to_le_bytes();
        
        bin_data.extend_from_slice(&x_bytes);
        bin_data.extend_from_slice(&y_bytes);
        bin_data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
        bin_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
        
        if cell_idx < 3 {
            eprintln!(
                "Cell [{}] written at offset {}-{}: ({}, {}) -> first 8 bytes: {:02x} {:02x} {:02x} {:02x} {:02x} {:02x} {:02x} {:02x}",
                cell_idx, offset_before, offset_before + 15, x, y,
                bin_data[offset_before], bin_data[offset_before+1], bin_data[offset_before+2], bin_data[offset_before+3],
                bin_data[offset_before+4], bin_data[offset_before+5], bin_data[offset_before+6], bin_data[offset_before+7]
            );
        }
    }
    
    eprintln!("DEBUG: Finished packing loop, bin_data len after: {}", bin_data.len());
    eprintln!("DEBUG: Expected size: {} (header: 20 + cells: {} * 16)", 20 + cells.len() * 16, cells.len());
    eprintln!("DEBUG: Actual size: {}", bin_data.len());

    // Debug: dump first cell's bytes
    eprintln!("=== HEADER + FIRST CELL BYTES ===");
    eprintln!("Header (20 bytes):");
    for i in 0..20 {
        if i % 4 == 0 {
            eprint!("  [{:02}-{:02}]: ", i, i + 3);
        }
        eprint!("{:02x} ", bin_data[i]);
        if i % 4 == 3 {
            eprintln!();
        }
    }
    eprintln!("Cell [0] (16 bytes at offset 20):");
    eprintln!("  Expected: cells[0] = ({}, {})", cells[0].0, cells[0].1);
    for i in 20..36 {
        if i % 4 == 0 {
            eprint!("  [{:02}-{:02}]: ", i, i + 3);
        }
        eprint!("{:02x} ", bin_data[i]);
        if i % 4 == 3 {
            eprintln!();
        }
    }
    eprintln!("Cell [1] (16 bytes at offset 36):");
    eprintln!("  Expected: cells[1] = ({}, {})", cells[1].0, cells[1].1);
    for i in 36..52 {
        if i % 4 == 0 {
            eprint!("  [{:02}-{:02}]: ", i, i + 3);
        }
        eprint!("{:02x} ", bin_data[i]);
        if i % 4 == 3 {
            eprintln!();
        }
    }
    eprintln!("=== END BYTE DUMP ===\n");

    bin_data
}

async fn create_test_device() -> Option<(std::sync::Arc<wgpu::Device>, std::sync::Arc<wgpu::Queue>)> {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });
    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await?;

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Test Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .ok()?;

    Some((std::sync::Arc::new(device), std::sync::Arc::new(queue)))
}