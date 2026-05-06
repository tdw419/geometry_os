// geo_forth — Forth compiler targeting GeOS bytecode
//
// Reads .fth source files and compiles them to GeOS assembly (.asm).
// The generated .asm can be loaded via `load_asm` or assembled directly.
//
// Architecture:
//   - Data stack: GeOS PUSH/POP (r30 = SP)
//   - Return stack: managed via r29 (Forth return stack pointer)
//   - Memory layout: code at 0x1000, Forth data at 0x3000, user vars at 0x3800
//   - Compilation: direct-to-ASM (text output, then assemble via GeOS assembler)
//
// Usage: cargo run --bin geo_forth -- input.fth [output.asm]

use geometry_os::forth::compiler;

use std::env;
use std::fs;
use std::path::Path;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: geo_forth <input.fth> [output.asm]");
        eprintln!("  If output is omitted, writes to <input>.asm");
        std::process::exit(1);
    }

    let input_path = &args[1];
    let output_path = if args.len() >= 3 {
        args[2].clone()
    } else {
        let p = Path::new(input_path);
        p.with_extension("asm").to_string_lossy().to_string()
    };

    let source = match fs::read_to_string(input_path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading {}: {}", input_path, e);
            std::process::exit(1);
        }
    };

    let mut comp = compiler::Compiler::new();
    match comp.compile(&source) {
        Ok(asm) => {
            match fs::write(&output_path, &asm) {
                Ok(()) => {
                    let lines = asm.lines().count();
                    println!("Compiled {} -> {} ({} lines)", input_path, output_path, lines);
                }
                Err(e) => {
                    eprintln!("Error writing {}: {}", output_path, e);
                    std::process::exit(1);
                }
            }
        }
        Err(e) => {
            eprintln!("Compile error: {}", e);
            std::process::exit(1);
        }
    }
}
