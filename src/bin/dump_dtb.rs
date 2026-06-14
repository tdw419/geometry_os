use geometry_os::riscv::dtb::{self, DtbConfig};

fn main() {
    let config = DtbConfig {
        ram_base: 0x8000_0000,
        ram_size: 512 * 1024 * 1024,
        bootargs: "earlycon=sbi rdinit=/init nosmp loglevel=8".to_string(),
        initrd_start: Some(0x814BC000),
        initrd_end: Some(0x814BCC09),
        reserved_regions: vec![(0x80000000, 0x014BC000), (0x814BC000, 0x00000C09)],
        ..Default::default()
    };
    let blob = dtb::generate_dtb(&config);
    eprintln!("DTB size: {} bytes", blob.len());
    std::fs::write("/tmp/geos.dtb", &blob).expect("write failed");
    eprintln!("Wrote DTB to /tmp/geos.dtb");
}
