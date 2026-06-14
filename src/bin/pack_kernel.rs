// Pack a RISC-V Linux kernel (ELF) + initrd into a ChainBoot PNG.
//
// The resulting PNG can be placed on the GeOS map as a spatial file.
// When the master BootPixel chain encounters it, it extracts the kernel
// bytes from pixel data and launches the RISC-V hypervisor.
//
// Usage: cargo run --bin pack_kernel

use geometry_os::pixel::{
    pack_binary, save_seeds_to_png, BiosResolution, BootChain, ChainRegionType,
};
use std::fs;

fn main() {
    let gateway_path = "programs/linux_gateway.asm";
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let initrd_path = "initrd.cpio";
    let output_path = "linux_boot.rts.png";

    // 0. Read and pack gateway app
    let gateway_src = fs::read_to_string(gateway_path).unwrap_or_else(|e| {
        eprintln!("Cannot read gateway at {}: {}", gateway_path, e);
        std::process::exit(1);
    });
    let gateway_packed = pack_binary(gateway_src.as_bytes());
    eprintln!(
        "Gateway: {} bytes, {} seeds",
        gateway_src.len(),
        gateway_packed.seeds.len()
    );

    // 1. Read kernel ELF
    let kernel_data = fs::read(kernel_path).unwrap_or_else(|e| {
        eprintln!("Cannot read kernel at {}: {}", kernel_path, e);
        std::process::exit(1);
    });
    eprintln!("Kernel: {} bytes", kernel_data.len());

    // 2. Read initrd
    let initrd_data = fs::read(initrd_path).unwrap_or_else(|e| {
        eprintln!("Cannot read initrd at {}: {}", initrd_path, e);
        std::process::exit(1);
    });
    eprintln!("Initrd: {} bytes", initrd_data.len());

    // 3. Convert kernel bytes to seed array (4 bytes per u32, little-endian)
    let kernel_seeds = bytes_to_seeds(&kernel_data);
    eprintln!("Kernel seeds: {}", kernel_seeds.len());

    // 4. Convert initrd bytes to seed array
    let initrd_seeds = bytes_to_seeds(&initrd_data);
    eprintln!("Initrd seeds: {}", initrd_seeds.len());

    // 5. Build BootChain with three typed regions:
    //    Region 0: Gateway App (AsmSource type)
    //    Region 1: Linux Kernel (LinuxKernel type)
    //    Region 2: Linux Initrd (LinuxInitrd type)
    let regions: Vec<(ChainRegionType, &[u32], u32)> = vec![
        (
            ChainRegionType::AsmSource,
            &gateway_packed.seeds,
            gateway_src.len() as u32,
        ),
        (
            ChainRegionType::LinuxKernel,
            &kernel_seeds,
            kernel_data.len() as u32,
        ),
        (
            ChainRegionType::LinuxInitrd,
            &initrd_seeds,
            initrd_data.len() as u32,
        ),
    ];

    // Build using the same protocol as make_boot_pixel_demo
    let chain_seeds = BootChain::build(BiosResolution::Classic256, &regions);

    // 6. Save as PNG
    save_seeds_to_png(output_path, &chain_seeds, "linear").unwrap_or_else(|e| {
        eprintln!("Failed to save PNG: {}", e);
        std::process::exit(1);
    });

    eprintln!(
        "Saved {} ({} seeds, BIOS pixel: 0x{:08X})",
        output_path,
        chain_seeds.len(),
        chain_seeds[0]
    );
    eprintln!(
        "Kernel region: seed_index={}, count={}",
        1,
        kernel_seeds.len()
    );
    eprintln!(
        "Initrd region: seed_index={}, count={}",
        1 + kernel_seeds.len(),
        initrd_seeds.len()
    );

    // Verify round-trip
    let loaded = geometry_os::pixel::load_seeds_from_png(output_path).expect("round-trip load");
    assert!(
        loaded.len() >= chain_seeds.len(),
        "round-trip seed count mismatch (too few)"
    );
    assert_eq!(
        &loaded[..chain_seeds.len()],
        &chain_seeds[..],
        "round-trip seed data mismatch"
    );
    eprintln!(
        "Round-trip verified: {} seeds OK (PNG total: {})",
        chain_seeds.len(),
        loaded.len()
    );
}

/// Convert raw bytes to u32 seeds (little-endian, zero-padded).
fn bytes_to_seeds(data: &[u8]) -> Vec<u32> {
    let mut seeds = Vec::with_capacity((data.len() + 3) / 4);
    let mut i = 0;
    while i + 4 <= data.len() {
        seeds.push(u32::from_le_bytes([
            data[i],
            data[i + 1],
            data[i + 2],
            data[i + 3],
        ]));
        i += 4;
    }
    // Pad final partial word
    if i < data.len() {
        let mut buf = [0u8; 4];
        buf[..data.len() - i].copy_from_slice(&data[i..]);
        seeds.push(u32::from_le_bytes(buf));
    }
    seeds
}
