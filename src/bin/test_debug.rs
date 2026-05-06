use std::fs;
fn main() {
    let source = fs::read_to_string("programs/lib_test.asm").expect("read test");
    let result =
        geometry_os::assembler::assemble_with_lib(&source, 0, Some(".")).expect("assemble failed");
    println!("Assembled {} words", result.pixels.len());
    // Show first 10 words
    for i in 0..10.min(result.pixels.len()) {
        print!("ram[{:04x}]={:08x} ", i, result.pixels[i]);
    }
    println!();
    // Show words at 0x500
    for i in 0x500..0x510.min(result.pixels.len()) {
        print!("ram[{:04x}]={:08x} ", i, result.pixels[i]);
    }
    println!();

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &word) in result.pixels.iter().enumerate() {
        if i >= 4096 {
            break;
        }
        vm.ram[i] = word;
    }
    vm.pc = 0;
    vm.halted = false;

    for step in 0..20 {
        if !vm.halted {
            let pc = vm.pc;
            let ok = vm.step();
            println!(
                "step {}: pc={:04x} ok={} halted={}",
                step, pc, ok, vm.halted
            );
            if !ok {
                break;
            }
        }
    }
    println!("Final halted={}", vm.halted);
}
