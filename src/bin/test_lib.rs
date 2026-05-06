// Standalone test runner for lib/ functions
// Reads test results from RAM addresses (no screen I/O needed)
// cargo run --release --bin test_lib

use std::fs;

fn main() {
    let source = fs::read_to_string("programs/lib_test.asm").expect("read test");
    let result =
        geometry_os::assembler::assemble_with_lib(&source, 0, Some(".")).expect("assemble failed");

    println!("Assembled {} words", result.pixels.len());

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &word) in result.pixels.iter().enumerate() {
        if i >= 4096 {
            break;
        }
        vm.ram[i] = word;
    }
    vm.pc = 0;
    vm.halted = false;

    let mut steps = 0;
    for _ in 0..100_000 {
        if !vm.step() {
            break;
        }
        steps += 1;
    }

    println!("Ran {} steps, halted={}", steps, vm.halted);

    // lib_test.asm stores results at 0xF80+i (T1=0xF80, T2=0xF81, ...)
    let test_names = [
        "strlen(\"Hello\")==5",          // T1  0xF80
        "strlen(\"\")==0",               // T2  0xF81
        "strcpy+strlen",                 // T3  0xF82
        "strcmp equal",                  // T4  0xF83
        "strcmp not equal",              // T5  0xF84
        "strcat(Hello+World)==10",       // T6  0xF85
        "memset(3,'A')",                 // T7  0xF86
        "memcpy(Hi)",                    // T8  0xF87
        "itoa(42) len==2",               // T9  0xF88
        "itoa(0) len==1",                // T10 0xF89
        "abs(42)==42",                   // T11 0xF8A
        "abs(-42)==42",                  // T12 0xF8B
        "abs(0)==0",                     // T13 0xF8C
        "min(3,7)==3",                   // T14 0xF8D
        "min(7,3)==3",                   // T15 0xF8E
        "max(3,7)==7",                   // T16 0xF8F
        "max(7,3)==7",                   // T17 0xF90
        "clamp(5,1,10)==5",              // T18 0xF91
        "clamp(0,1,10)==1",              // T19 0xF92
        "clamp(15,1,10)==10",            // T20 0xF93
        "sqrt(0)==0",                    // T21 0xF94
        "sqrt(144)==12",                 // T22 0xF95
        "sqrt(1)==1",                    // T23 0xF96
        "sqrt(10000)==100",              // T24 0xF97
        "dist2(0,0,3,4)==25",            // T25 0xF98
        "dist2(0,0,0,0)==0",             // T26 0xF99
        "rect_overlap(same)==1",         // T27 0xF9A
        "rect_overlap(disjoint)==0",     // T28 0xF9B
        "point_in_rect(5,5)==1",         // T29 0xF9C
        "point_in_rect(15,5)==0",        // T30 0xF9D
        "point_in_circle(center)==1",    // T31 0xF9E
        "point_in_circle(edge)==1",      // T32 0xF9F
        "point_in_circle(far)==0",       // T33 0xFA0
        "circle_rect(inside)==1",        // T34 0xFA1
        "circle_rect(far)==0",           // T35 0xFA2
        "circles_overlap(overlap)==1",   // T36 0xFA3
        "circles_overlap(apart)==0",     // T37 0xFA4
        "point_in_triangle(inside)==1",  // T38 0xFA5
        "point_in_triangle(outside)==0", // T39 0xFA6
    ];

    let mut pass = 0;
    let mut fail = 0;

    for (i, name) in test_names.iter().enumerate() {
        let addr = 0xF80 + i;
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
