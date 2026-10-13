// Phase 9.2: Test REAL xv6 kernel transpilation
#[test]
fn test_real_xv6_kernel_transpilation() {
    use std::fs;

    let kernel_path = "/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32/kernel.bin";

    if !std::path::Path::new(kernel_path).exists() {
        eprintln!("ERROR: xv6 kernel not found");
        return;
    }

    let elf_data = fs::read(kernel_path).expect("Failed to read xv6 kernel");
    println!("");
    println!("PHASE 9.2: REAL XV6 KERNEL TRANSPILATION");
    println!("Loaded xv6 kernel: {} bytes", elf_data.len());

    if &elf_data[0..4] != b"\x7fELF" {
        panic!("Not an ELF file!");
    }

    let grid_w = 512;
    let grid_h = 256;
    let loader = PayloadLoader::new(grid_w, grid_h);

    println!("Grid: {}x{}", grid_w, grid_h);
    println!("Transpiling RISC-V -> GeoASM...");
    println!("");

    let result = loader.load_spatial_elf(&elf_data, 0x8000_0000, 0, 32);

    match result {
        Ok(cells) => {
            println!("SUCCESS: Emitted {} cells", cells.len());
            println!("The xv6 kernel has been fully transpiled!");
        },
        Err(e) => {
            println!("");
            println!("TRANSPILER CRASH DETECTED!");
            println!("Error: {:?}", e);
            println!("");
            println!("The transpiler has hit an unimplemented instruction or CSR.");
            panic!("Transpilation failed: {:?}", e);
        }
    }
}