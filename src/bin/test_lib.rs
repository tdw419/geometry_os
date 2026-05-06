// Standalone test runner for lib/ functions
// Reads test results from RAM addresses (no screen I/O needed)
// cargo run --release --bin test_lib

use std::fs;

fn main() {
    let source = fs::read_to_string("programs/lib_test.asm").expect("read test");
    let result = geometry_os::assembler::assemble_with_lib(&source, 0, Some("."))
        .expect("assemble failed");

    println!("Assembled {} words", result.pixels.len());

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &word) in result.pixels.iter().enumerate() {
        if i >= 4096 { break; }
        vm.ram[i] = word;
    }
    vm.pc = 0;
    vm.halted = false;

    let mut steps = 0;
    for _ in 0..100_000 {
        if !vm.step() { break; }
        steps += 1;
    }

    println!("Ran {} steps, halted={}", steps, vm.halted);

    let test_names = [
        "strlen(\"Hello\")==5",
        "strlen(\"\")==0",
        "strcpy+strlen",
        "strcmp equal",
        "strcmp not equal",
        "strcat(Hello+World)==10",
        "memset(3,'A')",
        "memcpy(Hi)",
        "itoa(42) len==2",
        "itoa(0) len==1",
        "abs(42)==42",
        "abs(-42)==42",
        "min(3,7)==3",
        "max(3,7)==7",
        "clamp(5,1,10)==5",
        "clamp(0,1,10)==1",
        "sqrt(0)==0",
        "sqrt(144)==12",
        "dist2(0,0,3,4)==25",
        "rect_overlap(same)==1",
        "rect_overlap(disjoint)==0",
    ];

    let mut pass = 0;
    let mut fail = 0;

    for (i, name) in test_names.iter().enumerate() {
        let addr = 0xFA0 + i;
        let val = vm.ram[addr];
        if val == 1 {
            println!("  PASS: {}", name);
            pass += 1;
        } else if val == 0 {
            println!("  FAIL: {}", name);
            fail += 1;
        } else {
            println!("  ???? ({}): {} (raw={})", i, name, val);
            fail += 1;
        }
    }

    println!("\nResults: {}/{} passed", pass, test_names.len());

    if fail > 0 {
        std::process::exit(1);
    }
}
