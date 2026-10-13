use infinite_map_rs::spatial::payload_loader::PayloadLoader;
use std::path::Path;

const GRID_W: usize = 256;
const GRID_H: usize = 128;

fn main() {
    let kernel_path = Path::new("../../conductor/tracks/xv6-rv32/kernel.minimal");
    let kernel_data = std::fs::read(kernel_path).expect("Should read kernel");
    
    let mut loader = PayloadLoader::new(GRID_W, GRID_H);
    
    let region = loader.load_kernel(&kernel_data).expect("Failed to load kernel");
    println!("Kernel region: {}x{} at ({}, {})", region.width, region.height, region.base_x, region.base_y);
    
    let (kernel_image, entry_point) = loader.parse_kernel_image(&kernel_data).expect("Failed to parse");
    println!("Kernel image: {} words, entry=0x{:08x}", kernel_image.len() / 4, entry_point);
    
    let cells = loader.emit_kernel_program(&kernel_image, &region).expect("Failed to emit");
    println!("Total cells: {}", cells.len());
    
    // First 10 cells
    println!("\nFirst 10 cells:");
    for (i, (x, y, cell)) in cells.iter().enumerate().take(10) {
        println!("  [{}]: ({}, {}) opcode={:08x} data={:08x}", i, x, y, cell.opcode_or_type, cell.data_buffer);
    }
    
    // Find any cells with invalid coordinates
    println!("\nInvalid coordinates (y >= {}):", GRID_H);
    let mut invalid_count = 0;
    for (i, (x, y, _)) in cells.iter().enumerate() {
        if *y >= GRID_H {
            println!("  [{}]: ({}, {}) - INVALID", i, x, y);
            invalid_count += 1;
            if invalid_count >= 5 {
                break;
            }
        }
    }
    
    if invalid_count == 0 {
        println!("  None found - all coordinates are valid!");
    }
}
