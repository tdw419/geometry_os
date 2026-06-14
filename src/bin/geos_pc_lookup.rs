use geometry_os::riscv::decode::{decode, decode_c, is_compressed};

fn main() {
    let words: [(u32, u32); 5] = [
        (0xc0400ffc, 0x80e7ffd5),
        (0xc0401000, 0x27b7a680),
        (0xc0401004, 0xa623c148),
        (0xc0401008, 0xb9372097),
        (0xc040100c, 0x5097c080),
    ];

    for (va, word) in words {
        let h1 = (word & 0xFFFF) as u16;
        let h2 = (word >> 16) as u16;

        println!("VA 0x{:08X}: Word 0x{:08X}", va, word);
        if is_compressed(h1) {
            println!("  0x{:04X}: {:?}", h1, decode_c(h1));
        } else {
            println!("  0x{:08X}: {:?}", word, decode(word));
        }

        if is_compressed(h2) {
            println!("  0x{:04X}: {:?}", h2, decode_c(h2));
        }
    }
}
