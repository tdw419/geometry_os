// pmp-assemble: Assemble .gasm source to hex pixels (for piping to pmp-eval).
//
// Usage:
//   pmp-assemble < file.gasm
//   pmp-assemble "LDI r0 42\nHALT"
//   cat file.gasm | pmp-assemble
//
// Output: space-separated hex pixels like "0x00000001 0x0000002A ..."

use pixels_move_pixels::gasm::assemble;
use std::io::{self, Read};

fn main() {
    let mut input = String::new();

    // Check for file arg or stdin
    let args: Vec<String> = std::env::args().collect();
    if args.len() > 1 {
        // Treat first non-flag arg as assembly source or file path
        let arg = &args[1];
        if std::path::Path::new(arg).exists() {
            input = std::fs::read_to_string(arg).unwrap_or_else(|e| {
                eprintln!("Error reading {}: {}", arg, e);
                std::process::exit(1);
            });
        } else {
            input = arg.clone();
        }
    } else {
        io::stdin().read_to_string(&mut input).unwrap_or_else(|e| {
            eprintln!("Error reading stdin: {}", e);
            std::process::exit(1);
        });
    }

    if input.trim().is_empty() {
        eprintln!("No input provided");
        std::process::exit(1);
    }

    let program = match assemble(&input) {
        Ok(p) => p,
        Err(e) => {
            eprintln!("Assembly error: {}", e);
            std::process::exit(1);
        }
    };

    let hex: Vec<String> = program.pixels.iter().map(|p| format!("0x{:08X}", p)).collect();
    println!("{}", hex.join(" "));
    eprintln!(
        "[pmp-assemble] {} pixels, {} opcodes",
        program.pixels.len(),
        program.pixels.len() / 2 // rough estimate
    );
}
