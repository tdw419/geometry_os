use infinite_map_rs::spatial::payload_loader::PayloadLoader;
use std::env;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 3 {
        eprintln!("Usage: boot_xv6 <xv6.elf> <output.bin>");
        eprintln!("  xv6.elf: Path to xv6 kernel ELF file");
        eprintln!("  output.bin: Output path for spatial binary");
        std::process::exit(1);
    }

    let elf_path = &args[1];
    let output_path = &args[2];

    let elf_data = fs::read(elf_path).expect(&format!("Failed to read: {}", elf_path));

    println!("Loaded xv6 kernel: {} bytes", elf_data.len());

    if &elf_data[0..4] != b"\x7fELF" {
        panic!("Not an ELF file!");
    }

    let grid_w = 4096;
    let grid_h = 4096;
    let loader = PayloadLoader::new(grid_w, grid_h);

    println!("Grid: {}x{}", grid_w, grid_h);
    println!("Transpiling RISC-V -> GeoASM...");
    println!("");

    let result = loader.load_spatial_elf(&elf_data, 0x8000_0000, 0, 32);

    match result {
        Ok(cells) => {
            println!("SUCCESS: Emitted {} cells", cells.len());

            let mut bin_data = Vec::new();
            bin_data.extend_from_slice(&grid_w.to_le_bytes());
            bin_data.extend_from_slice(&grid_h.to_le_bytes());
            bin_data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
            bin_data.extend_from_slice(&0u32.to_le_bytes());
            bin_data.extend_from_slice(&0u32.to_le_bytes());

            for (x, y, cell) in cells {
                bin_data.extend_from_slice(&(x as u32).to_le_bytes());
                bin_data.extend_from_slice(&(y as u32).to_le_bytes());
                bin_data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
                bin_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
            }

            fs::write(output_path, &bin_data)
                .expect(&format!("Failed to write: {}", output_path));

            println!("Written: {} bytes to {}", bin_data.len(), output_path);
        }
        Err(e) => {
            println!("");
            println!("TRANSPILER CRASH DETECTED!");
            println!("Error: {:?}", e);
            println!("");
            println!("The transpiler has hit an unimplemented instruction or CSR.");
            std::process::exit(1);
        }
    }
}