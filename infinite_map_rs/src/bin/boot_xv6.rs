// Boot xv6 kernel on spatial substrate
//
// This binary:
// 1. Loads the xv6 kernel ELF
// 2. Transpiles RISC-V instructions to GeoASM
// 3. Creates spatial grid for GridRunner
// 4. (Optionally) executes on GPU and polls SBI console

use infinite_map_rs::spatial::payload_loader::PayloadLoader;
use std::env;
use std::fs;
use std::io::{self, Write};

fn pack_grid_runner_binary(
    grid_w: u32,
    grid_h: u32,
    cells: &[(usize, usize, infinite_map_rs::geoasm_materializer::CellState)],
) -> Vec<u8> {
    // Find first active cell (entry point)
    let (first_code_x, first_code_y) = cells
        .iter()
        .find(|(_, _, cell)| cell.is_active == 1)
        .map(|(x, y, _)| (*x as u32, *y as u32))
        .expect("No active cells found - transpiler should activate entry point");

    eprintln!("=== ENTRY POINT ===");
    eprintln!("First active cell at: ({}, {})", first_code_x, first_code_y);
    eprintln!("Total cells: {}", cells.len());
    eprintln!("=== END ENTRY POINT ===\n");

    // Header: grid dimensions + cell count + entry point
    let mut bin_data = Vec::new();
    bin_data.extend_from_slice(&grid_w.to_le_bytes());
    bin_data.extend_from_slice(&grid_h.to_le_bytes());
    bin_data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
    bin_data.extend_from_slice(&first_code_x.to_le_bytes());
    bin_data.extend_from_slice(&first_code_y.to_le_bytes());

    // Cell data
    for (x, y, cell) in cells {
        bin_data.extend_from_slice(&(*x as u32).to_le_bytes());
        bin_data.extend_from_slice(&(*y as u32).to_le_bytes());
        bin_data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
        bin_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
    }

    bin_data
}

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 3 {
        eprintln!("Usage: {} <xv6.elf> <output.bin> [--execute]", args[0]);
        eprintln!("");
        eprintln!("Options:");
        eprintln!("  <xv6.elf>        Path to xv6 kernel ELF file");
        eprintln!("  <output.bin>     Path for spatial binary output");
        eprintln!("  --execute        Run on GPU and poll SBI console (requires GPU)");
        std::process::exit(1);
    }

    let elf_path = &args[1];
    let output_path = &args[2];
    let execute_on_gpu = args.len() > 3 && args[3] == "--execute";

    // Read ELF file
    let elf_data = fs::read(elf_path)
        .expect(&format!("Failed to read ELF file: {}", elf_path));

    println!("Loaded ELF: {} bytes from {}", elf_data.len(), elf_path);

    // Verify it's an ELF file
    if elf_data.len() < 4 || &elf_data[0..4] != b"\x7fELF" {
        panic!("Not an ELF file (magic check failed)");
    }

    // Create PayloadLoader with large grid (512x256 for xv6)
    let grid_w: u32 = 4096;
    let grid_h: u32 = 4096;
    let mut loader = PayloadLoader::new(grid_w as usize, grid_h as usize);

    println!("Transpiling xv6 RISC-V → GeoASM...");
    println!("Grid: {}x{} ({} cells)", grid_w, grid_h, grid_w * grid_h);

    // Load and transpile ELF
    // Memory base: 0x8000_0000 (xv6's kernel virtual address)
    // Spatial base: (0, 32) - start memory below code at y=10
    let mem_base_vaddr = 0x8000_0000;
    let mem_base_x = 0;
    // Memory MUST sit above the code banks (rows 10..1034 on a 4096 grid) —
    // row 32 overlapped the code region and data seeding overwrote code.
    let mem_base_y = 2048;

    let cells = match loader.load_spatial_elf(
        &elf_data,
        mem_base_vaddr,
        mem_base_x,
        mem_base_y
    ) {
        Ok(cells) => cells,
        Err(e) => {
            eprintln!("");
            eprintln!("╔════════════════════════════════════════════════════════════╗");
            eprintln!("║  🚨 TRANSPILER CRASH DETECTED!                              ║");
            eprintln!("╚════════════════════════════════════════════════════════════╝");
            eprintln!("");
            eprintln!("Error: {:?}", e);
            eprintln!("");
            eprintln!("This is EXACTLY what we expected! The transpiler has hit an");
            eprintln!("unimplemented instruction or CSR that xv6 uses.");
            eprintln!("");
            eprintln!("Next steps:");
            eprintln!("  1. Look at the error above - it tells us what instruction failed");
            eprintln!("  2. Check riscv_transpiler.rs for that instruction's handler");
            eprintln!("  3. Implement the missing instruction/CSR");
            eprintln!("  4. Re-run to find the NEXT unimplemented feature");
            eprintln!("");
            std::process::exit(1);
        }
    };

    println!("✓ Transpilation successful!");
    println!("  Cells emitted: {}", cells.len());
    println!("  Memory region: (0x{:08x} -> spatial ({}, {}))", mem_base_vaddr, mem_base_x, mem_base_y);

    // Pack into GridRunner binary format
    let bin_data = pack_grid_runner_binary(grid_w, grid_h, &cells);

    println!("✓ Packed spatial binary: {} bytes", bin_data.len());

    // Verify size
    let expected_size = 20 + cells.len() * 16;
    if bin_data.len() != expected_size {
        eprintln!("WARNING: Size mismatch! Got {}, expected {}", bin_data.len(), expected_size);
    } else {
        println!("✓ Binary format verified");
    }

    // Write output file
    fs::write(output_path, &bin_data)
        .expect(&format!("Failed to write output file: {}", output_path));

    println!("✓ Written to: {}", output_path);

    // Execute on GPU if requested
    if execute_on_gpu {
        println!("");
        println!("🚀 Executing on GPU with SBI console polling...");
        println!("");

        let rt = tokio::runtime::Runtime::new().unwrap();
        rt.block_on(async {
            // Create GridRunner
            let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(grid_w as usize, grid_h as usize)
                .await
                .expect("Failed to create GridRunner (GPU required)");

            println!("✓ GPU GridRunner initialized");

            // Load spatial binary
            runner.load_binary(&bin_data)
                .expect("Failed to load binary into GridRunner");

            println!("✓ Loaded binary into GPU");
            println!("");
            println!("=== Starting execution ===");
            println!("(Tick | Console output)");
            println!("-------------------------");

            // Run for 500 ticks, polling console each tick
            let tick_count = 500;
            let mut console_output = String::new();

            for tick in 0..tick_count {
                let _state = runner.tick().await
                    .expect(&format!("Tick {} failed", tick));

                // Poll SBI console
                if let Ok(new_output) = runner.poll_sbi_console().await {
                    if !new_output.is_empty() {
                        print!("{}", new_output);
                        io::stdout().flush().unwrap();
                        console_output.push_str(&new_output);
                    }
                }

                // Progress indicator every 100 ticks
                if tick % 100 == 0 && tick > 0 {
                    println!("");
                    println!("[{}]", tick);
                }
            }

            println!("");
            println!("=== Execution complete ({} ticks) ===", tick_count);
            println!("Total console output: {} bytes", console_output.len());

            // Save console output
            let console_path = format!("{}.console.txt", output_path);
            fs::write(&console_path, &console_output)
                .expect("Failed to write console output");
            println!("Console output saved to: {}", console_path);
        });
    }
}