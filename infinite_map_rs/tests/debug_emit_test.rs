// Debug test to verify PayloadLoader cell emission
use infinite_map_rs::spatial::payload_loader::PayloadLoader;
use std::path::Path;

#[test]
#[ignore]
fn debug_kernel_cell_emission() {
    let kernel_path = Path::new("tests/xv6-rv32-kernel.elf");
    if !kernel_path.exists() {
        println!("xv6-rv32-kernel.elf not found - skipping debug test");
        return;
    }

    let kernel_data = std::fs::read(kernel_path).expect("Failed to read kernel");
    println!("Kernel size: {} bytes", kernel_data.len());

    let mut loader = PayloadLoader::new(256, 128);

    let region = loader
        .load_kernel(&kernel_data)
        .expect("Failed to load kernel");

    println!("Region dimensions:");
    println!("  base_x: {}, base_y: {}", region.base_x, region.base_y);
    println!("  width: {}, height: {}", region.width, region.height);
    println!("  entry_point: 0x{:08x}", region.entry_point);

    let (kernel_image, entry_point) = loader
        .parse_kernel_image(&kernel_data)
        .expect("Failed to parse kernel image");

    println!("Kernel image: {} words", kernel_image.len());

    let cells = loader
        .emit_kernel_program(&kernel_image, &region)
        .expect("Failed to emit kernel program");

    println!("Emitted {} cells", cells.len());

    // Check bounds
    let max_x = cells.iter().map(|(x, _, _)| *x).max().unwrap_or(0);
    let max_y = cells.iter().map(|(_, y, _)| *y).max().unwrap_or(0);
    let min_x = cells.iter().map(|(x, _, _)| *x).min().unwrap_or(0);
    let min_y = cells.iter().map(|(_, y, _)| *y).min().unwrap_or(0);

    println!(
        "Cell bounds: x=[{}, {}], y=[{}, {}]",
        min_x, max_x, min_y, max_y
    );

    // Count cells per type
    use infinite_map_rs::geoasm_materializer::TYPE_NOP;
    let data_cells = cells
        .iter()
        .filter(|(_, _, c)| c.opcode_or_type == TYPE_NOP)
        .count();
    let active_cells = cells.iter().filter(|(_, _, c)| c.is_active == 1).count();

    println!("Data cells (NOP): {}", data_cells);
    println!("Active cells: {}", active_cells);

    // Check for out-of-bounds cells
    let mut out_of_bounds = false;
    for (idx, (x, y, _)) in cells.iter().enumerate() {
        if *x >= 256 || *y >= 128 {
            println!(
                "ERROR: Cell {} at ({}, {}) is out of bounds",
                idx, x, y
            );
            out_of_bounds = true;
        }
    }

    if !out_of_bounds {
        println!("All cells within bounds!");
    }
}