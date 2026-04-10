// ═══════════════════════════════════════════════════════════════════════
// SELF-AUTHORING DEMO
//
// This demonstrates the "built by AIs for AIs" thesis in two ways:
//
//   Method 1 (Direct): The agent writes bytecode directly into RAM and
//     executes it via write_ram() + execute_from().
//
//   Method 2 (Runtime): Program A constructs Program B in RAM using
//     EDIT_OVERWRITE opcodes, then jumps to it. The classic approach.
//
// Run with: cargo run --example self_authoring
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::agent::{Agent, GasmAgent};
use geometry_os::opcodes::op;

fn main() {
    println!("════════════════════════════════════════════════════════");
    println!("  GEOMETRY OS: Self-Authoring Demo");
    println!("  \"built by AIs for AIs\"");
    println!("════════════════════════════════════════════════════════\n");

    demo_direct_authoring();
    println!();
    demo_runtime_authoring();
    println!();
    demo_inspect_loop();
}

// ── Method 1: Direct Authoring (write_ram + execute_from) ────────────
//
// The simplest self-authoring loop. The AI agent writes Program B's
// bytecode directly into RAM, then calls execute_from() to run it.
// No intermediate "writer" program needed.

fn demo_direct_authoring() {
    println!("── Method 1: Direct Authoring ──────────────────────\n");

    let mut agent = GasmAgent::new(4096);

    // The agent constructs Program B: draw 3 pixels, then halt.
    let program_b: Vec<u32> = vec![
        op::LDI as u32, 0, 10,
        op::LDI as u32, 1, 10,
        op::LDI as u32, 2, 5,
        op::PSET as u32, 0, 1, 2,
        op::LDI as u32, 0, 20,
        op::LDI as u32, 1, 20,
        op::LDI as u32, 2, 8,
        op::PSET as u32, 0, 1, 2,
        op::LDI as u32, 0, 30,
        op::LDI as u32, 1, 10,
        op::LDI as u32, 2, 5,
        op::PSET as u32, 0, 1, 2,
        op::HALT as u32,
    ];

    // Step 1: Write Program B directly into RAM at address 500
    println!("[1] Agent writes {} pixels of bytecode to RAM[500]",
             program_b.len());
    agent.write_ram(500, &program_b);

    // Verify it landed
    assert_eq!(agent.peek_ram(500), op::LDI as u32);
    println!("    Verified: RAM[500] = 0x{:02X} (LDI)", agent.peek_ram(500));

    // Step 2: Execute from address 500 -- no assembly needed
    println!("[2] Agent calls execute_from(500)");
    let result = agent.execute_from(500);

    assert!(result.halted);
    println!("    Halted after {} cycles", result.cycles);

    // Step 3: Verify screen
    println!("[3] Screen verification:");
    for (x, y, _color) in [(10, 10, 5), (20, 20, 8), (30, 10, 5)] {
        let px = result.screen_pixel(x, y);
        assert_ne!(px, 0, "Pixel ({},{}) should be drawn", x, y);
        println!("    Pixel ({},{}) = {} [OK]", x, y, px);
    }

    println!("\n    Direct authoring: 3 API calls (write_ram, execute_from, screen_pixel)");
}

// ── Method 2: Runtime Authoring (Program A writes Program B) ─────────
//
// The classic approach: Program A is a "writer" that uses EDIT_OVERWRITE
// to construct Program B in RAM, then jumps to it. All happens inside
// the VM -- the agent never directly writes Program B.

fn demo_runtime_authoring() {
    println!("── Method 2: Runtime Authoring ─────────────────────\n");

    let mut agent = GasmAgent::new(4096);
    let base_addr: u32 = 500;

    // Program B bytecode (what we want Program A to write into RAM):
    let program_b: Vec<u32> = vec![
        op::LDI as u32, 0, 10,
        op::LDI as u32, 1, 10,
        op::LDI as u32, 2, 5,
        op::PSET as u32, 0, 1, 2,
        op::LDI as u32, 0, 20,
        op::LDI as u32, 1, 20,
        op::LDI as u32, 2, 8,
        op::PSET as u32, 0, 1, 2,
        op::LDI as u32, 0, 30,
        op::LDI as u32, 1, 10,
        op::LDI as u32, 2, 5,
        op::PSET as u32, 0, 1, 2,
        op::HALT as u32,
    ];

    // Build Program A: a series of EDIT_OVERWRITE calls to plant program_b
    let mut program_a_parts: Vec<String> = Vec::new();
    for (i, &value) in program_b.iter().enumerate() {
        let addr = base_addr + i as u32;
        program_a_parts.push(format!("LDI r0, {}", addr));
        program_a_parts.push(format!("LDI r1, {}", value));
        program_a_parts.push("EDIT_OVERWRITE r0, r1".to_string());
    }
    program_a_parts.push(format!("JMP {}", base_addr));

    let program_a_source = program_a_parts.join("\n");

    println!("[1] Program A: {} instructions to write {} bytes to RAM[{}]",
             program_a_parts.len(), program_b.len(), base_addr);
    println!("[2] Running Program A (the writer)...");

    let result_a = agent.run_gasm(&program_a_source).expect("Program A should run");
    assert!(result_a.halted, "Program A should halt (via JMP into Program B which HALTs)");
    println!("    Program A halted after {} cycles", result_a.cycles);

    // Verify RAM
    println!("[3] Verifying RAM...");
    let authored = agent.read_ram(base_addr as usize, program_b.len());
    let mut matches = true;
    for (i, (got, expected)) in authored.iter().zip(program_b.iter()).enumerate() {
        if got != expected {
            println!("    MISMATCH at offset {}: got {} expected {}", i, got, expected);
            matches = false;
        }
    }
    assert!(matches, "Authored bytecode must match");
    println!("    RAM[{}..{}] matches Program B!", base_addr, base_addr + program_b.len() as u32);

    // Screen was already drawn (Program A jumped into Program B which ran)
    println!("[4] Screen verification (already drawn by JMP into Program B):");
    for (x, y, _) in [(10, 10, 5), (20, 20, 8), (30, 10, 5)] {
        let px = result_a.screen_pixel(x, y);
        assert_ne!(px, 0, "Pixel ({},{}) should be drawn", x, y);
        println!("    Pixel ({},{}) = {} [OK]", x, y, px);
    }

    println!("\n    Runtime authoring: Program A wrote Program B, then JMPed into it.");
    println!("    The VM executed the authored code natively.");
}

// ── Method 3: Full Inspect Loop (write -> disassemble -> execute -> verify) ─
//
// Phase 6 adds the disassembler, closing the read/write/execute trifecta.
// The agent can now WRITE bytecode, INSPECT it as human-readable text,
// EXECUTE it, and VERIFY the results -- all without a gasm assembler.

fn demo_inspect_loop() {
    println!("── Method 3: Write → Inspect → Execute → Verify ────\n");

    let mut agent = GasmAgent::new(4096);

    // Step 1: WRITE -- plant a program that computes 15 + 25 = 40
    println!("[1] WRITE: Planting add-and-store program at RAM[500]");
    let program: Vec<u32> = vec![
        op::LDI as u32, 0, 15,        // LDI r0, 15
        op::LDI as u32, 1, 25,        // LDI r1, 25
        op::ADD as u32, 0, 1,         // ADD r0, r1  (r0 = 40)
        op::LDI as u32, 2, 200,       // LDI r2, 200  (address)
        op::STORE as u32, 2, 0,       // STORE [r2], r0  (RAM[200] = 40)
        op::HALT as u32,
    ];
    agent.write_ram(500, &program);
    println!("    Wrote {} pixels", program.len());

    // Step 2: INSPECT -- disassemble the planted bytecode
    println!("\n[2] INSPECT: Disassembling RAM[500..{}]", 500 + program.len());
    let listing = agent.disassemble(500, program.len());
    for (addr, text) in &listing {
        println!("    {:>4}: {}", addr, text);
    }
    assert_eq!(listing.len(), 6);
    assert_eq!(listing[0].1, "LDI r0, 15");
    assert_eq!(listing[2].1, "ADD r0, r1");
    assert_eq!(listing[5].1, "HALT");

    // Step 3: EXECUTE -- run the program
    println!("\n[3] EXECUTE: Running from address 500");
    let result = agent.execute_from(500);
    assert!(result.halted);
    println!("    Halted after {} cycles", result.cycles);

    // Step 4: VERIFY -- check the result
    println!("\n[4] VERIFY:");
    println!("    r0 = {} (expected 40)", result.reg(0));
    assert_eq!(result.reg(0), 40);
    println!("    RAM[200] = {} (expected 40)", result.ram_at(200));
    assert_eq!(result.ram_at(200), 40);

    println!("\n    The complete self-authoring loop:");
    println!("    write_ram() → disassemble() → execute_from() → verify");
    println!("    No assembler needed. Pure bytecode round-trip.");
}
