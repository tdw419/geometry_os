// pmp-eval: Run a program on the GPU substrate and output fitness metrics as JSON.
//
// Usage:
//   pmp-eval "0x00000001 0x00000032 ..." [--addr 500]
//   echo "0x00000001 0x00000032 ..." | pmp-eval
//
// Output: JSON with fitness score, halted status, cycles, register usage, etc.

use pixels_move_pixels::vm::run_program;

use serde::Serialize;
use std::env;
use std::io::{self, Read};

#[derive(Serialize)]
struct EvalOutput {
    success: bool,
    halted: bool,
    cycles: u32,
    final_pc: u32,
    nonzero_regs: usize,
    unique_writes: usize,
    program_length: usize,
    load_address: u32,
    opcodes_used: Vec<String>,
    fitness: f64,
    registers: Vec<u32>,
    error: Option<String>,
}

fn parse_hex_pixels(input: &str) -> Result<Vec<u32>, String> {
    let mut pixels = Vec::new();
    for token in input.split_whitespace() {
        let cleaned = token.trim_matches(',').trim_start_matches("0x").trim_start_matches("0X");
        if cleaned.is_empty() {
            continue;
        }
        let val = u32::from_str_radix(cleaned, 16).map_err(|e| format!("Bad hex '{}': {}", cleaned, e))?;
        pixels.push(val);
    }
    if pixels.is_empty() {
        return Err("No pixels provided".into());
    }
    Ok(pixels)
}

fn opcode_name(byte: u8) -> String {
    match byte {
        0 => "NOP".into(),
        1 => "LDI".into(),
        2 => "MOV".into(),
        3 => "LOAD".into(),
        4 => "STORE".into(),
        5 => "ADD".into(),
        6 => "SUB".into(),
        7 => "MUL".into(),
        8 => "DIV".into(),
        9 => "JMP".into(),
        10 => "BNE".into(),
        11 => "CALL".into(),
        12 => "RET".into(),
        13 => "HALT".into(),
        215 => "DRAW".into(),
        230 => "SPAWN".into(),
        _ => format!("OP_{}", byte),
    }
}

fn main() {
    env_logger::init();

    // Parse address from --addr flag (default 500)
    let mut load_address: u32 = 500;
    let args: Vec<String> = env::args().collect();

    // Find --addr flag
    let mut hex_input = String::new();
    let mut i = 1;
    while i < args.len() {
        if args[i] == "--addr" && i + 1 < args.len() {
            load_address = args[i + 1].parse().unwrap_or(500);
            i += 2;
        } else {
            if !hex_input.is_empty() {
                hex_input.push(' ');
            }
            hex_input.push_str(&args[i]);
            i += 1;
        }
    }

    // If no args, try stdin
    if hex_input.is_empty() {
        let mut stdin_input = String::new();
        io::stdin().read_to_string(&mut stdin_input).ok();
        hex_input = stdin_input;
    }

    let pixels = match parse_hex_pixels(&hex_input) {
        Ok(p) => p,
        Err(e) => {
            let output = EvalOutput {
                success: false,
                halted: false,
                cycles: 0,
                final_pc: 0,
                nonzero_regs: 0,
                unique_writes: 0,
                program_length: 0,
                load_address,
                opcodes_used: vec![],
                fitness: 0.0,
                registers: vec![],
                error: Some(e),
            };
            println!("{}", serde_json::to_string(&output).unwrap());
            std::process::exit(1);
        }
    };

    eprintln!("[pmp-eval] Running {} pixels at address {}...", pixels.len(), load_address);

    let result = run_program(&pixels, load_address);

    eprintln!(
        "[pmp-eval] Done: halted={}, cycles={}, fitness={:.3}",
        result.halted, result.cycles, result.fitness
    );

    let opcode_names: Vec<String> = result.opcodes_used.iter().map(|&b| opcode_name(b)).collect();
    let registers: Vec<u32> = result.vm.regs[..8].to_vec();

    let output = EvalOutput {
        success: true,
        halted: result.halted,
        cycles: result.cycles,
        final_pc: result.final_pc,
        nonzero_regs: result.nonzero_regs,
        unique_writes: result.unique_writes,
        program_length: result.program_length,
        load_address: result.load_address,
        opcodes_used: opcode_names,
        fitness: result.fitness,
        registers,
        error: None,
    };

    println!("{}", serde_json::to_string_pretty(&output).unwrap());
}
