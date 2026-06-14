use geometry_os::pixel::{
    pack_binary, save_seeds_to_png, BiosResolution, BootChain, ChainRegionType,
};

fn main() {
    let source = "LDI r1, 10\n:loop\nSUB r1, r1, 1\nJZ r1, :done\nJMP :loop\n:done\nHALT\n";
    let packed = pack_binary(source.as_bytes());

    println!(
        "Creating boot chain with {} seeds of ASM source",
        packed.seeds.len()
    );

    let chain_seeds = BootChain::build(
        BiosResolution::Classic256,
        &[(ChainRegionType::AsmSource, &packed.seeds[..], 0)],
    );

    let path = "chain_boot_demo.rts.png";
    save_seeds_to_png(path, &chain_seeds, "hilbert").expect("Failed to save PNG");

    println!("Saved chain boot demo to {}", path);
    println!("First pixel (BIOS): 0x{:08X}", chain_seeds[0]);
}
