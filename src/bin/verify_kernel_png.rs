use geometry_os::pixel::{load_seeds_from_png, BootChain, ChainRegionType};

fn main() {
    let seeds = load_seeds_from_png("linux_boot.rts.png").expect("load");
    println!("Loaded {} seeds from PNG", seeds.len());

    let chain = BootChain::parse(&seeds).expect("parse");
    println!("Chain: {}", chain.summary());

    // Extract gateway (region 0)
    let gateway = chain.resolve_region(&seeds, 0).expect("gateway extract");
    println!("Gateway: {} bytes extracted", gateway.len());

    // Extract kernel (region 1)
    let kernel = chain.resolve_region(&seeds, 1).expect("kernel extract");
    println!("Kernel: {} bytes extracted", kernel.len());

    // Check ELF header
    assert!(kernel.len() > 4, "kernel too small");
    assert_eq!(kernel[0], 0x7F, "ELF magic byte 0");
    assert_eq!(kernel[1], b'E' as u8, "ELF magic byte 1");
    assert_eq!(kernel[2], b'L' as u8, "ELF magic byte 2");
    assert_eq!(kernel[3], b'F' as u8, "ELF magic byte 3");
    println!("ELF header verified: OK");

    // Extract initrd (region 2)
    let initrd = chain.resolve_region(&seeds, 2).expect("initrd extract");
    println!("Initrd: {} bytes extracted", initrd.len());

    // Compare with original files
    let orig_kernel = std::fs::read(".geometry_os/build/linux-6.14/vmlinux").expect("read orig");
    let orig_initrd = std::fs::read("initrd.cpio").expect("read orig initrd");

    assert_eq!(kernel.len(), orig_kernel.len(), "kernel size mismatch");
    assert_eq!(&kernel, &orig_kernel, "kernel data mismatch");
    println!("Kernel byte-for-byte match: OK");

    assert_eq!(initrd.len(), orig_initrd.len(), "initrd size mismatch");
    assert_eq!(&initrd, &orig_initrd, "initrd data mismatch");
    println!("Initrd byte-for-byte match: OK");

    println!(
        "\nPixel packing verified: 6.1MB kernel + 3KB initrd packed into {} seeds ({}×{} PNG)",
        seeds.len(),
        1240,
        1240
    );
}
