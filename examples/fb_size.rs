use geometry_os::assembler::assemble;
fn main() {
    let source = std::fs::read_to_string("programs/file_browser.asm").unwrap();
    let asm = assemble(&source, 0).unwrap();
    println!("Bytecode size: {} words (0x{:x})", asm.pixels.len(), asm.pixels.len());
}
