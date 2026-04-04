//! Quick debug: disassemble compiled programs

use pixels_move_pixels::{
    hl_compiler::compile,
    gasm::disassemble,
    software_vm::SoftwareVm,
};

fn main() {
    // Test 1: boolean values
    println!("=== test_boolean_values ===");
    let src = r#"
        fn main() {
            let t = true;
            let f = false;
            if (t) {
                return 42;
            }
            return 0;
        }
    "#;
    let prog = compile(src).unwrap();
    println!("Disassembly:\n{}", disassemble(&prog.pixels).join("\n"));
    
    let mut svm = SoftwareVm::new();
    svm.load_program(0, &prog.pixels);
    svm.spawn_vm_with_bounds(0, 0, 0x00100000);
    svm.execute_frame();
    let state = svm.vm_state(0);
    println!("r1 (return) = {}", state.regs[1]);
    println!();
    
    // Test 2: early return
    println!("=== test_early_return ===");
    let src2 = r#"
        fn main() {
            let x = 5;
            if (x > 3) {
                return 100;
            }
            return 200;
        }
    "#;
    let prog2 = compile(src2).unwrap();
    println!("Disassembly:\n{}", disassemble(&prog2.pixels).join("\n"));
    
    let mut svm2 = SoftwareVm::new();
    svm2.load_program(0, &prog2.pixels);
    svm2.spawn_vm_with_bounds(0, 0, 0x00100000);
    svm2.execute_frame();
    let state2 = svm2.vm_state(0);
    println!("r1 (return) = {}", state2.regs[1]);
    println!();
    
    // Test 3: nested function calls
    println!("=== test_nested_function_calls ===");
    let src3 = r#"
        fn double(x) {
            return x + x;
        }
        fn add(a, b) {
            return a + b;
        }
        fn main() {
            return add(double(3), double(4));
        }
    "#;
    let prog3 = compile(src3).unwrap();
    println!("Disassembly:\n{}", disassemble(&prog3.pixels).join("\n"));
    
    let mut svm3 = SoftwareVm::new();
    svm3.load_program(0, &prog3.pixels);
    svm3.spawn_vm_with_bounds(0, 0, 0x00100000);
    svm3.execute_frame();
    let state3 = svm3.vm_state(0);
    println!("r1 (return) = {}", state3.regs[1]);
}
