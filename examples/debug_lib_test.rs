use geometry_os::assembler::assemble_with_lib;
use geometry_os::vm::Vm;

fn main() {
    let source = std::fs::read_to_string("programs/lib_test_v4.asm")
        .expect("programs/lib_test_v4.asm should exist");
    let result = assemble_with_lib(&source, 0, Some("lib"))
        .expect("lib_test_v4.asm should assemble");
    
    println!("Total bytecode size: {} words (0x{:04X})", result.pixels.len(), result.pixels.len());
    
    // Dump labels near 0x0E00-0x1000
    println!("\nLabels in 0x0C00-0x1100 range:");
    let mut labels: Vec<_> = result.labels.iter()
        .filter(|(_, &addr)| addr >= 0x0C00 && addr <= 0x1100)
        .collect();
    labels.sort_by_key(|(_, &addr)| addr);
    for (name, addr) in &labels {
        println!("  0x{:04X}: {}", addr, name);
    }
    
    // Dump 0x0E00-0x0E90
    println!("\nBytecode 0x0E00-0x0E90:");
    for i in 0x0E00..0x0E90.min(result.pixels.len()) {
        println!("  [0x{:04X}] = 0x{:08X}", i, result.pixels[i]);
    }
    
    // Run and check
    let mut vm = Vm::new();
    vm.regs[30] = 0xFF00;
    for (i, &word) in result.pixels.iter().enumerate() {
        vm.ram[i] = word;
    }
    
    // Run with periodic PC reporting
    let mut last_report = 0u64;
    for step in 0..2_000_000u64 {
        if vm.halted { break; }
        vm.step();
        if step - last_report >= 200_000 {
            println!("\nStep {}: PC=0x{:04X} halted={}", step, vm.pc, vm.halted);
            // Print PC trace at this point
            for i in 0..16 {
                let idx = (vm.pc_trace_idx + i) % 16;
                print!("  [{}] 0x{:04X}", i, vm.pc_trace[idx]);
            }
            println!();
            last_report = step;
        }
    }
    
    println!("\nFinal: PC=0x{:04X} halted={} total_steps={}", vm.pc, vm.halted, vm.total_steps);
    
    // PC trace
    println!("Final PC trace:");
    for i in 0..16 {
        let idx = (vm.pc_trace_idx + i) % 16;
        println!("  [{}] 0x{:04X}", i, vm.pc_trace[idx]);
    }
    
    // Test results
    let mut pass = 0;
    let mut fails = Vec::new();
    for i in 0..56u32 {
        let addr = 0x1F80 + i;
        let val = vm.ram[addr as usize];
        if val == 1 { pass += 1; } else { fails.push((i+1, addr, val)); }
    }
    println!("\nTotal: {}/56 passed", pass);
    for (num, addr, val) in &fails {
        println!("  FAIL T{} (0x{:04X}): val={}", num, addr, val);
    }
}
