// Quick test to debug PayloadLoader kernel layout
use infinite_map_rs::spatial::payload_loader::PayloadLoader;

fn main() {
    let kernel_data = std::fs::read("tests/xv6-rv32-kernel.elf")
        .expect("Failed to read kernel");

    println!("Kernel size: {} bytes", kernel_data.len());

    let mut loader = PayloadLoader::new(256, 128);

    // Parse kernel image directly
    let (kernel_image, entry_point) = loader.parse_kernel_image(&kernel_data)
        .expect("Failed to parse kernel image");

    println!("Kernel image: {} words", kernel_image.len());
    println!("Entry point: 0x{:08x}", entry_point);

    // Manually simulate emit_kernel_program layout
    let base_x = 10usize;
    let base_y = 10usize;
    let available_width = 256 - base_x;
    let required_words = (kernel_image.len() + 3) / 4;
    let width = available_width.min(required_words).max(1);
    let height = ((required_words as usize) + width - 1) / width;

    println!("Layout calculation:");
    println!("  Available width: {}", available_width);
    println!("  Required words: {}", required_words);
    println!("  Width: {}", width);
    println!("  Height: {}", height);

    // Check bounds
    let max_y = base_y + height;
    let max_x = base_x + width;

    println!("  Max cell coords: x={}, y={}", max_x, max_y);
    println!("  Grid bounds: x=256, y=128");

    if max_x > 256 || max_y > 128 {
        println!("ERROR: Layout exceeds grid bounds!");
    } else {
        println!("OK: Layout fits in grid");
    }
}