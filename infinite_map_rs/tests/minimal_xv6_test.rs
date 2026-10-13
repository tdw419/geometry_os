// Test for minimal xv6 kernel (35KB version)
use infinite_map_rs::spatial::payload_loader::PayloadLoader;

#[test]
fn test_minimal_xv6_kernel_parse() {
    let kernel_data = std::fs::read(
        "/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32/kernel.minimal",
    )
    .expect("Failed to read kernel.minimal");

    println!("Minimal xv6 kernel size: {} bytes", kernel_data.len());
    assert!(kernel_data.len() < 50_000, "Kernel should be < 50KB for minimal configuration");

    let loader = PayloadLoader::new(128, 64);
    let (kernel_image, entry_point) = loader
        .parse_kernel_image(&kernel_data)
        .expect("Failed to parse ELF");

    println!("Entry point: 0x{:x}", entry_point);
    println!("Extracted PT_LOAD segments: {} bytes", kernel_image.len());

    assert_eq!(entry_point, 0x80000000, "Entry point should be 0x80000000");
    assert!(
        kernel_image.len() < 50_000,
        "Extracted image should be < 50KB"
    );

    // Verify grid size constraints (128x64 grid = 8192 cells = 32768 bytes)
    let grid_cells = kernel_image.len() / 4;
    assert!(
        grid_cells < 8192,
        "Kernel fits within 128x64 grid ({} cells)",
        grid_cells
    );
    println!("Grid cells required: {} / 8192 max", grid_cells);
}