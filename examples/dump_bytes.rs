
use geometry_os::assembler;

fn main() {
    let src = std::fs::read_to_string("programs/micro-asm.asm").unwrap();
    let result = assembler::assemble(&src).unwrap();
    println!("Total pixels: {}", result.pixels.len());
    for (i, &p) in result.pixels.iter().enumerate() {
        if i >= 0x800 && p != 0 {
            let byte = (p & 0xFF) as u8;
            let ch = if byte >= 0x20 && byte < 0x7F { byte as char } else { '.' };
            println!("  [{:#06x}] = {:#010x}  ({})", i, p, ch);
        }
    }
}
