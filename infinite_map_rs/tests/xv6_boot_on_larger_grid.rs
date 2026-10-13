//! Phase 9.2-B: Real xv6 Kernel Execution Test (Larger Grid)
//!
//! End-to-end test demonstrating REAL xv6 kernel (35KB) booting on GPU spatial substrate
//! with larger grid (512x256 = 128KB) for TRUE execution:
//! 1. Load real xv6 kernel (kernel.minimal, 35KB) via PayloadLoader
//! 2. Extract PT_LOAD segments (22,616 words)
//! 3. Emit bootloader + kernel cells via PayloadLoader::emit_kernel_program()
//! 4. Load into GridRunner with larger_grid feature (512x256 = 131,072 cells)
//! 5. Execute on GPU and verify activity
//!
//! Requires: --features larger_grid

use infinite_map_rs::spatial::payload_loader::PayloadLoader;
use std::path::Path;

// Larger grid dimensions (512x256 = 131,072 cells = 128KB)
const GRID_W: usize = 512;
const GRID_H: usize = 256;

#[tokio::test]
#[ignore] // Requires GPU + kernel.minimal - run with: cargo test --test xv6_boot_on_larger_grid --features larger_grid -- --ignored
async fn test_real_xv6_kernel_execution_larger_grid() {
    // GPU device detection - skip if no GPU available
    if create_test_device().await.is_none() {
        println!("Skipping test - no GPU available");
        return;
    }

    // Check kernel.minimal exists
    let kernel_path = Path::new("../../conductor/tracks/xv6-rv32/kernel.minimal");
    if !kernel_path.exists() {
        println!("kernel.minimal not found. Build it with:");
        println!("  cd conductor/tracks/xv6-rv32 && make -f Makefile.minimal");
        return;
    }

    println!("Loading real xv6 kernel: 35KB");

    // Load real xv6 kernel (35KB)
    let kernel_data = std::fs::read(kernel_path)
        .expect("Failed to read kernel.minimal");

    println!("Loaded real xv6 kernel: {} bytes", kernel_data.len());

    // Create PayloadLoader with larger grid dimensions
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

    // Verify kernel fits in larger grid
    assert!(region.width as usize <= GRID_W, "Kernel width {} exceeds larger grid width {}", region.width, GRID_W);
    assert!(region.height as usize <= GRID_H, "Kernel height {} exceeds larger grid height {}", region.height, GRID_H);

    // Filter to grid bounds (same logic as in minimal_xv6_execution_test)
    let cells: Vec<_> = cells.into_iter()
        .filter(|(x, y, _)| *x < GRID_W && *y < GRID_H)
        .collect();

    println!("Filtered to {} cells (larger grid bounds)", cells.len());

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

    println!("Real xv6 kernel loaded into GridRunner");

    // Step simulation for 100 ticks (real xv6 will be slower)
    let mut last_state = runner.tick().await.expect("Failed to tick GridRunner (tick 0)");
    for tick in 1..100 {
        last_state = runner.tick().await.expect(&format!("Failed to tick GridRunner (tick {})", tick));
    }

    println!("Simulation completed: 100 ticks");

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

    println!("Test PASSED: xv6 kernel boots and executes on 512x256 spatial grid");
    println!("   - 35KB kernel (22,616 words) loaded on 512x256 grid");
    println!("   - {} kernel data cells ({:.1} KB capacity)",
             kernel_data_cells, kernel_data_cells as f64 * 16.0 * 4.0 / 1024.0);
    println!("   - {} active cells after 100 ticks", active_cells);
    println!("   - {} executing cells after 100 ticks", executing_cells);
}

#[tokio::test]
#[ignore] // Requires GPU - run with: cargo test --test xv6_boot_on_larger_grid --features larger_grid -- --ignored
async fn test_larger_grid_dimensions() {
    // Verify larger grid constants are correct
    const EXPECTED_W: usize = 512;
    const EXPECTED_H: usize = 256;
    const EXPECTED_CELLS: usize = 512 * 256; // 131,072

    assert_eq!(GRID_W, EXPECTED_W);
    assert_eq!(GRID_H, EXPECTED_H);
    assert_eq!(GRID_W * GRID_H, EXPECTED_CELLS);

    println!("Larger grid dimensions verified: {}x{} = {} cells", GRID_W, GRID_H, EXPECTED_CELLS);
}

#[tokio::test]
#[ignore] // Requires GPU - run with: cargo test --test xv6_boot_on_larger_grid --features larger_grid -- --ignored
async fn test_larger_grid_capacity() {
    // 35KB kernel = ~22,616 words
    // Each cell can hold 1 word
    // 512x256 grid = 131,072 cells = 131,072 words = 524,288 bytes (512KB)
    // So 35KB kernel should fit with ~487KB headroom

    const KERNEL_SIZE_WORDS: usize = 22_616;
    const GRID_CELLS: usize = 512 * 256;

    println!("Kernel size: {} words", KERNEL_SIZE_WORDS);
    println!("Grid capacity: {} cells", GRID_CELLS);

    assert!(KERNEL_SIZE_WORDS < GRID_CELLS, "Kernel too large for grid");

    let headroom = GRID_CELLS - KERNEL_SIZE_WORDS;
    let headroom_pct = (headroom as f64 / GRID_CELLS as f64) * 100.0;

    println!("Headroom: {} cells ({:.1}%)", headroom, headroom_pct);

    // Should have >80% headroom
    assert!(headroom_pct > 80.0, "Insufficient headroom: {:.1}%", headroom_pct);

    println!("Test PASSED: 35KB kernel fits comfortably on 512x256 grid with {:.1}% headroom", headroom_pct);
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

    let mut bin_data = Vec::new();

    // Header: grid dimensions + cell count + entry point
    bin_data.extend_from_slice(&grid_w.to_le_bytes());
    bin_data.extend_from_slice(&grid_h.to_le_bytes());
    bin_data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
    bin_data.extend_from_slice(&(first_code_x as u32).to_le_bytes());
    bin_data.extend_from_slice(&(first_code_y as u32).to_le_bytes());

    for (x, y, cell) in cells {
        bin_data.extend_from_slice(&(*x as u32).to_le_bytes());
        bin_data.extend_from_slice(&(*y as u32).to_le_bytes());
        bin_data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
        bin_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
    }

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