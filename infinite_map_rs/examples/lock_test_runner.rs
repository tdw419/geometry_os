use infinite_map_rs::spatial::payload_loader::PayloadLoader;
use std::env;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: lock_test_runner <lock_test.elf>");
        std::process::exit(1);
    }

    let elf_path = &args[1];
    let elf_data = fs::read(elf_path)
        .expect(&format!("Failed to read: {}", elf_path));

    println!("Loaded lock test: {} bytes", elf_data.len());

    if &elf_data[0..4] != b"\x7fELF" {
        panic!("Not an ELF file!");
    }

    // Use smaller grid for test (256x256)
    let grid_w = 256;
    let grid_h = 256;
    let mut loader = PayloadLoader::new(grid_w, grid_h);

    println!("Grid: {}x{}", grid_w, grid_h);
    println!("Transpiling RISC-V -> GeoASM...");
    println!("");

    // Transpile with memory base at 0x80000000
    let mem_base_vaddr = 0x8000_0000;
    let mem_base_x = 0;
    let mem_base_y = 128; // Start memory at row 128

    let cells = match loader.load_spatial_elf(&elf_data, mem_base_vaddr, mem_base_x, mem_base_y) {
        Ok(cells) => cells,
        Err(e) => {
            println!("TRANSPILER ERROR: {:?}", e);
            std::process::exit(1);
        }
    };

    println!("SUCCESS: Transpiled to {} cells", cells.len());

    // Find entry point
    let (entry_x, entry_y) = cells
        .iter()
        .find(|(_, _, cell)| cell.is_active == 1)
        .map(|(x, y, _)| (*x, *y))
        .expect("No active cells found");

    println!("Entry point: ({}, {})", entry_x, entry_y);
    println!("");

    // Pack into GridRunner binary format
    let mut bin_data = Vec::new();
    bin_data.extend_from_slice(&grid_w.to_le_bytes());
    bin_data.extend_from_slice(&grid_h.to_le_bytes());
    bin_data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
    bin_data.extend_from_slice(&(entry_x as u32).to_le_bytes());
    bin_data.extend_from_slice(&(entry_y as u32).to_le_bytes());

    for (x, y, cell) in cells {
        bin_data.extend_from_slice(&(x as u32).to_le_bytes());
        bin_data.extend_from_slice(&(y as u32).to_le_bytes());
        bin_data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
        bin_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
    }

    // Write spatial binary
    let output_path = "lock_test.spatial.bin";
    fs::write(output_path, &bin_data)
        .expect(&format!("Failed to write: {}", output_path));

    println!("Written: {} bytes to {}", bin_data.len(), output_path);
    println!("");
    println!("To run on GPU:");
    println!("  cargo run --example lock_test_gpu_runner -- lock_test.spatial.bin");
}