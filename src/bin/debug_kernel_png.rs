use geometry_os::pixel::{load_seeds_from_png, BootChain};

fn main() {
    let seeds = load_seeds_from_png("linux_boot.rts.png").expect("load");
    println!("Total seeds in PNG: {}", seeds.len());
    println!("Seed[0] (BIOS): 0x{:08X}", seeds[0]);
    println!("Seed[1] (manifest): 0x{:08X}", seeds[1]);
    println!("Seed[2] (desc 0 lo): 0x{:08X}", seeds[2]);
    println!("Seed[3] (desc 0 hi): 0x{:08X}", seeds[3]);
    println!("Seed[4] (desc 1 lo): 0x{:08X}", seeds[4]);
    println!("Seed[5] (desc 1 hi): 0x{:08X}", seeds[5]);

    let chain = BootChain::parse(&seeds).expect("parse");
    println!("Chain: {}", chain.summary());
    for (i, r) in chain.regions.iter().enumerate() {
        println!(
            "Region {}: idx={}, count={}, type={:?}",
            i, r.seed_index, r.seed_count, r.region_type
        );
    }

    // Check first 4 bytes of kernel payload
    let kernel_start = chain.regions[0].seed_index as usize;
    if kernel_start < seeds.len() {
        println!(
            "Kernel payload starts at seed[{}]: 0x{:08X}",
            kernel_start, seeds[kernel_start]
        );
        let bytes = seeds[kernel_start].to_le_bytes();
        println!(
            "First 4 bytes of kernel: {:02X} {:02X} {:02X} {:02X}",
            bytes[0], bytes[1], bytes[2], bytes[3]
        );
    }
}
