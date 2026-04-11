use geometry_os::assembler;

fn main() {
    let src = std::fs::read_to_string("programs/micro-asm.asm").unwrap();
    let result = assembler::assemble(&src).unwrap();
    
    // Dump cells from 0x800 onward as hex pairs
    let start = 0x800usize;
    for i in start..result.pixels.len() {
        let v = result.pixels[i];
        if v != 0 {
            println!("{:04x} {:08x}", i, v);
        }
    }
}
