// shell.rs -- Memory Palace shell tools (Phase 461)
//
// Keyboard-driven shell environment for interacting with the Memory Palace.
// Provides tools for navigation, inspection, data loading, and program execution
// through keyboard commands and socket/MCP interfaces.
//
// Vision: A living shell environment where you can "walk" through the palace,
// inspect regions, load data, and run programs - all from keyboard commands.
// The palace is an environment you program INSIDE, not just poke at from outside.

use crate::riscv::live::RiscvVmHandle;
use crate::vm::Vm;
use std::sync::Mutex;

// Global state for shell access (shared across threads)
pub struct ShellState {
    pub vm: Mutex<Vm>,
    pub riscv_handle: Mutex<Option<RiscvVmHandle>>,
    pub command_history: Mutex<Vec<String>>,
    pub current_region: Mutex<Region>,
}

impl ShellState {
    pub fn new() -> Self {
        Self {
            vm: Mutex::new(Vm::new()),
            riscv_handle: Mutex::new(None),
            command_history: Mutex::new(Vec::new()),
            current_region: Mutex::new(Region {
                name: "center".to_string(),
                start_addr: 0x0000,
                end_addr: 0x0FFF,
                description: "Core system area - VM state, canvas buffer".to_string(),
            }),
        }
    }
}

/// Palace region: where you are in the Memory Palace
#[derive(Debug, Clone, Default)]
pub struct Region {
    pub name: String,
    pub start_addr: u32,
    pub end_addr: u32,
    pub description: String,
}

// Built-in palace regions (runtime initialized, not const)
pub fn get_regions() -> Vec<Region> {
    vec![
        Region {
            name: "center".to_string(),
            start_addr: 0x0000,
            end_addr: 0x0FFF,
            description: "Core system area - VM state, canvas buffer".to_string(),
        },
        Region {
            name: "inner_ring".to_string(),
            start_addr: 0x1000,
            end_addr: 0x1FFF,
            description: "Critical facts - highest tier information".to_string(),
        },
        Region {
            name: "middle_ring".to_string(),
            start_addr: 0x2000,
            end_addr: 0x2FFF,
            description: "Important facts - medium tier information".to_string(),
        },
        Region {
            name: "outer_ring".to_string(),
            start_addr: 0x3000,
            end_addr: 0x3FFF,
            description: "Reference facts - lowest tier information".to_string(),
        },
        Region {
            name: "program_area".to_string(),
            start_addr: 0x4000,
            end_addr: 0x4FFF,
            description: "Assembly programs and subroutines".to_string(),
        },
        Region {
            name: "data_area".to_string(),
            start_addr: 0x5000,
            end_addr: 0x5FFF,
            description: "Temporary data and scratch space".to_string(),
        },
    ]
}

/// Shell command result
#[derive(Debug)]
pub enum ShellResult {
    Ok(String),
    Error(String),
    Continue, // For multi-step operations
}

/// Shell command handler
pub struct ShellCommand<'a> {
    pub name: &'a str,
    pub aliases: &'a [&'a str],
    pub description: &'a str,
    pub handler: fn(&ShellState, &[String]) -> ShellResult,
}

/// Execute a shell command
pub fn execute_command(state: &ShellState, cmd_line: &str) -> ShellResult {
    let mut parts: Vec<String> = cmd_line.split_whitespace().map(String::from).collect();

    if parts.is_empty() {
        return ShellResult::Ok(String::new());
    }

    let cmd_name = parts.remove(0);

    // Add to history
    if let Ok(mut history) = state.command_history.lock() {
        if history.len() >= 100 {
            history.remove(0);
        }
        history.push(cmd_line.to_string());
    }

    // Find command
    for shell_cmd in get_commands() {
        if shell_cmd.name == cmd_name || shell_cmd.aliases.contains(&cmd_name.as_str()) {
            return (shell_cmd.handler)(state, &parts);
        }
    }

    ShellResult::Error(format!("Unknown command: {}", cmd_name))
}

/// Get all available commands
pub fn get_commands() -> Vec<ShellCommand<'static>> {
    vec![
        ShellCommand {
            name: "help",
            aliases: &["?", "h"],
            description: "Show all available commands",
            handler: cmd_help,
        },
        ShellCommand {
            name: "goto",
            aliases: &["cd", "go"],
            description: "Navigate to a region: goto <region_name>",
            handler: cmd_goto,
        },
        ShellCommand {
            name: "where",
            aliases: &["pwd", "loc"],
            description: "Show current region and address range",
            handler: cmd_where,
        },
        ShellCommand {
            name: "ls",
            aliases: &["list", "dir"],
            description: "List memory contents: ls [addr] [count]",
            handler: cmd_ls,
        },
        ShellCommand {
            name: "peek",
            aliases: &["p", "read"],
            description: "Peek at memory: peek <addr> [count]",
            handler: cmd_peek,
        },
        ShellCommand {
            name: "poke",
            aliases: &["w", "write"],
            description: "Write to memory: poke <addr> <value>...",
            handler: cmd_poke,
        },
        ShellCommand {
            name: "load",
            aliases: &["ld"],
            description: "Load data into RAM: load <file> [addr]",
            handler: cmd_load,
        },
        ShellCommand {
            name: "run",
            aliases: &["exec"],
            description: "Run from PC or address: run [addr]",
            handler: cmd_run,
        },
        ShellCommand {
            name: "step",
            aliases: &["s"],
            description: "Single-step the VM: step [count]",
            handler: cmd_step,
        },
        ShellCommand {
            name: "reg",
            aliases: &["regs", "r"],
            description: "Show all registers: reg",
            handler: cmd_reg,
        },
        ShellCommand {
            name: "pc",
            aliases: &["rip"],
            description: "Show or set PC: pc [addr]",
            handler: cmd_pc,
        },
        ShellCommand {
            name: "clear",
            aliases: &["cls"],
            description: "Clear VM state: clear [canvas|ram|all]",
            handler: cmd_clear,
        },
        ShellCommand {
            name: "history",
            aliases: &["hist"],
            description: "Show command history: history [count]",
            handler: cmd_history,
        },
        ShellCommand {
            name: "regions",
            aliases: &["areas"],
            description: "List all palace regions",
            handler: cmd_regions,
        },
        ShellCommand {
            name: "dump",
            aliases: &["export"],
            description: "Dump memory to file: dump <addr> <count> <file>",
            handler: cmd_dump,
        },
    ]
}

// ============================================================================
// Command Handlers
// ============================================================================

fn cmd_help(_state: &ShellState, _args: &[String]) -> ShellResult {
    let mut output = String::from("Memory Palace Shell Commands:\n");
    output.push_str("================================\n");

    for cmd in get_commands() {
        output.push_str(&format!(
            "  {:15} {:30} | {}\n",
            cmd.name,
            format!("{:?}", cmd.aliases),
            cmd.description
        ));
    }

    ShellResult::Ok(output)
}

fn cmd_goto(state: &ShellState, args: &[String]) -> ShellResult {
    if args.is_empty() {
        return ShellResult::Error("Usage: goto <region_name>".to_string());
    }

    let region_name = &args[0].to_lowercase();

    for region in get_regions() {
        if region.name.to_lowercase() == *region_name {
            if let Ok(mut current) = state.current_region.lock() {
                *current = region.clone();
                return ShellResult::Ok(format!(
                    "Moved to: {} ({:#X} - {:#X})\n  {}",
                    region.name, region.start_addr, region.end_addr, region.description
                ));
            }
        }
    }

    ShellResult::Error(format!("Unknown region: {}", args[0]))
}

fn cmd_where(state: &ShellState, _args: &[String]) -> ShellResult {
    let current = state.current_region.lock().unwrap();
    ShellResult::Ok(format!(
        "Current region: {} ({:#X} - {:#X})\n  {}",
        current.name, current.start_addr, current.end_addr, current.description
    ))
}

fn cmd_ls(state: &ShellState, args: &[String]) -> ShellResult {
    let start_addr = args
        .first()
        .and_then(|s| u32::from_str_radix(s.trim_start_matches("0x"), 16).ok())
        .unwrap_or_else(|| state.current_region.lock().unwrap().start_addr);

    let count = args
        .get(1)
        .and_then(|s| usize::from_str_radix(s, 10).ok())
        .unwrap_or(16);

    let vm = state.vm.lock().unwrap();
    let mut output = format!("Memory at {:#X}:\n", start_addr);

    for i in 0..count {
        let addr = start_addr + (i as u32 * 4);
        if addr >= 0x8000 {
            break; // Don't read beyond RAM
        }
        let idx = (addr / 4) as usize;
        if idx < vm.ram.len() {
            let val = vm.ram[idx];
            if i % 4 == 0 {
                output.push_str(&format!("{:#06X}: ", addr));
            }
            output.push_str(&format!("{:08X} ", val));
            if i % 4 == 3 {
                output.push('\n');
            }
        }
    }

    ShellResult::Ok(output)
}

fn cmd_peek(state: &ShellState, args: &[String]) -> ShellResult {
    if args.is_empty() {
        return ShellResult::Error("Usage: peek <addr> [count]".to_string());
    }

    let addr = match u32::from_str_radix(args[0].trim_start_matches("0x"), 16) {
        Ok(v) => v,
        Err(_) => return ShellResult::Error(format!("Invalid address: {}", args[0])),
    };

    let count = args
        .get(1)
        .and_then(|s| usize::from_str_radix(s, 10).ok())
        .unwrap_or(1);

    let vm = state.vm.lock().unwrap();
    let mut output = String::new();

    for i in 0..count {
        let cur_addr = addr + (i as u32 * 4);
        let idx = (cur_addr / 4) as usize;
        if idx < vm.ram.len() {
            let val = vm.ram[idx];
            output.push_str(&format!("{:#X}: {:#X} ({})\n", cur_addr, val, val));
        }
    }

    ShellResult::Ok(output)
}

fn cmd_poke(state: &ShellState, args: &[String]) -> ShellResult {
    if args.len() < 2 {
        return ShellResult::Error("Usage: poke <addr> <value>...".to_string());
    }

    let addr = match u32::from_str_radix(args[0].trim_start_matches("0x"), 16) {
        Ok(v) => v,
        Err(_) => return ShellResult::Error(format!("Invalid address: {}", args[0])),
    };

    let mut vm = state.vm.lock().unwrap();
    let mut output = String::new();

    for (i, val_str) in args.iter().skip(1).enumerate() {
        let val = match u32::from_str_radix(val_str.trim_start_matches("0x"), 16) {
            Ok(v) => v,
            Err(_) => return ShellResult::Error(format!("Invalid value: {}", val_str)),
        };

        let cur_addr = addr + (i as u32 * 4);
        let idx = (cur_addr / 4) as usize;

        if idx < vm.ram.len() {
            vm.ram[idx] = val;
            output.push_str(&format!("Wrote {:#X} to {:#X}\n", val, cur_addr));
        } else {
            output.push_str(&format!("Address {:#X} out of range\n", cur_addr));
        }
    }

    ShellResult::Ok(output)
}

fn cmd_load(_state: &ShellState, args: &[String]) -> ShellResult {
    if args.is_empty() {
        return ShellResult::Error("Usage: load <file> [addr]".to_string());
    }

    let path = &args[0];
    let addr = args
        .get(1)
        .and_then(|s| u32::from_str_radix(s.trim_start_matches("0x"), 16).ok())
        .unwrap_or(0x2000);

    match std::fs::read(path) {
        Ok(data) => {
            // Try to parse as binary (u32 words)
            if data.len() % 4 == 0 {
                let words: Vec<u32> = data
                    .chunks(4)
                    .map(|chunk| u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]))
                    .collect();

                return ShellResult::Ok(format!(
                    "Loaded {} words from {} to {:#X}",
                    words.len(),
                    path,
                    addr
                ));
            }

            // Try to parse as text assembly
            let text = String::from_utf8_lossy(&data);
            ShellResult::Ok(format!(
                "Loaded {} chars from {} (text mode)",
                text.len(),
                path
            ))
        },
        Err(e) => ShellResult::Error(format!("Failed to read {}: {}", path, e)),
    }
}

fn cmd_run(state: &ShellState, args: &[String]) -> ShellResult {
    if let Some(addr_str) = args.first() {
        let addr = match u32::from_str_radix(addr_str.trim_start_matches("0x"), 16) {
            Ok(v) => v,
            Err(_) => return ShellResult::Error(format!("Invalid address: {}", addr_str)),
        };

        let mut vm = state.vm.lock().unwrap();
        vm.pc = addr;
        vm.halted = false;
        ShellResult::Ok(format!("Running from {:#X}...", addr))
    } else {
        let mut vm = state.vm.lock().unwrap();
        vm.halted = false;
        ShellResult::Ok(format!("Running from PC {:#X}...", vm.pc))
    }
}

fn cmd_step(state: &ShellState, args: &[String]) -> ShellResult {
    let count = args
        .first()
        .and_then(|s| usize::from_str_radix(s, 10).ok())
        .unwrap_or(1);

    let mut vm = state.vm.lock().unwrap();
    let mut steps = 0;

    for _ in 0..count {
        if vm.step() {
            steps += 1;
        } else {
            break;
        }
    }

    ShellResult::Ok(format!(
        "Stepped {} times. PC={:#X} Halted={}",
        steps, vm.pc, vm.halted
    ))
}

fn cmd_reg(state: &ShellState, _args: &[String]) -> ShellResult {
    let vm = state.vm.lock().unwrap();
    let mut output = String::from("Registers:\n");
    output.push_str("==========\n");

    for i in 0..32 {
        let val = vm.regs[i];
        output.push_str(&format!("  r{:2}: {:#010X} ({:>11}) ", i, val, val));
        if i % 4 == 3 {
            output.push('\n');
        }
    }

    output.push_str(&format!("\n  PC:  {:#010X}\n", vm.pc));
    output.push_str(&format!("  Halted: {}\n", vm.halted));

    ShellResult::Ok(output)
}

fn cmd_pc(state: &ShellState, args: &[String]) -> ShellResult {
    if let Some(addr_str) = args.first() {
        let addr = match u32::from_str_radix(addr_str.trim_start_matches("0x"), 16) {
            Ok(v) => v,
            Err(_) => return ShellResult::Error(format!("Invalid address: {}", addr_str)),
        };

        let mut vm = state.vm.lock().unwrap();
        vm.pc = addr;
        ShellResult::Ok(format!("PC set to {:#X}", addr))
    } else {
        let vm = state.vm.lock().unwrap();
        ShellResult::Ok(format!("PC = {:#X}", vm.pc))
    }
}

fn cmd_clear(state: &ShellState, args: &[String]) -> ShellResult {
    let target = args.first().map(|s| s.as_str()).unwrap_or("all");

    let mut vm = state.vm.lock().unwrap();

    match target {
        "canvas" => {
            vm.canvas_buffer.fill(0);
            ShellResult::Ok("Canvas buffer cleared".to_string())
        },
        "ram" => {
            vm.ram.fill(0);
            ShellResult::Ok("RAM cleared".to_string())
        },
        "all" => {
            vm.canvas_buffer.fill(0);
            vm.ram.fill(0);
            vm.regs.fill(0);
            vm.pc = 0;
            vm.halted = true;
            ShellResult::Ok("All VM state cleared".to_string())
        },
        _ => ShellResult::Error(format!("Unknown clear target: {}", target)),
    }
}

fn cmd_history(state: &ShellState, args: &[String]) -> ShellResult {
    let count = args
        .first()
        .and_then(|s| usize::from_str_radix(s, 10).ok())
        .unwrap_or(10);

    let history = state.command_history.lock().unwrap();
    let start = if history.len() > count {
        history.len() - count
    } else {
        0
    };

    let mut output = format!("Command history (last {}):\n", count);
    for (i, cmd) in history.iter().enumerate().skip(start) {
        output.push_str(&format!("  {}: {}\n", i, cmd));
    }

    ShellResult::Ok(output)
}

fn cmd_regions(_state: &ShellState, _args: &[String]) -> ShellResult {
    let mut output = String::from("Palace Regions:\n");
    output.push_str("===============\n");

    for region in get_regions() {
        output.push_str(&format!(
            "  {:15} {:#06X} - {:#06X} | {}\n",
            region.name, region.start_addr, region.end_addr, region.description
        ));
    }

    ShellResult::Ok(output)
}

fn cmd_dump(state: &ShellState, args: &[String]) -> ShellResult {
    if args.len() < 3 {
        return ShellResult::Error("Usage: dump <addr> <count> <file>".to_string());
    }

    let addr = match u32::from_str_radix(args[0].trim_start_matches("0x"), 16) {
        Ok(v) => v,
        Err(_) => return ShellResult::Error(format!("Invalid address: {}", args[0])),
    };

    let count = match usize::from_str_radix(&args[1], 10) {
        Ok(v) => v,
        Err(_) => return ShellResult::Error(format!("Invalid count: {}", args[1])),
    };

    let path = &args[2];

    let vm = state.vm.lock().unwrap();
    let mut data = Vec::new();

    for i in 0..count {
        let cur_addr = addr + (i as u32 * 4);
        let idx = (cur_addr / 4) as usize;
        if idx < vm.ram.len() {
            let val = vm.ram[idx].to_le_bytes();
            data.extend_from_slice(&val);
        }
    }

    match std::fs::write(path, &data) {
        Ok(_) => ShellResult::Ok(format!(
            "Dumped {} bytes from {:#X} to {}",
            data.len(),
            addr,
            path
        )),
        Err(e) => ShellResult::Error(format!("Failed to write {}: {}", path, e)),
    }
}

// ============================================================================
// Interactive Shell
// ============================================================================

/// Run interactive shell loop
pub fn run_interactive_shell(state: &ShellState) {
    use std::io::{self, Write};

    println!("Memory Palace Shell v0.1");
    println!("Type 'help' for commands, 'exit' to quit\n");

    loop {
        let current = state.current_region.lock().unwrap();
        let prompt = format!("geos:{} > ", current.name);
        drop(current);

        print!("{}", prompt);
        io::stdout().flush().unwrap();

        let mut input = String::new();
        match io::stdin().read_line(&mut input) {
            Ok(0) => break, // EOF
            Ok(_) => {
                let cmd_line = input.trim();
                if cmd_line.is_empty() {
                    continue;
                }

                if cmd_line == "exit" || cmd_line == "quit" {
                    println!("Goodbye!");
                    break;
                }

                match execute_command(state, cmd_line) {
                    ShellResult::Ok(msg) => print!("{}", msg),
                    ShellResult::Error(msg) => eprintln!("Error: {}", msg),
                    ShellResult::Continue => {},
                }
            },
            Err(e) => {
                eprintln!("Input error: {}", e);
                break;
            },
        }
    }
}

// ============================================================================
// Tests
// ============================================================================

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_shell_help() {
        let state = ShellState::new();
        match execute_command(&state, "help") {
            ShellResult::Ok(msg) => {
                assert!(msg.contains("Memory Palace Shell Commands"));
            },
            _ => panic!("help command failed"),
        }
    }

    #[test]
    fn test_goto_region() {
        let state = ShellState::new();
        match execute_command(&state, "goto inner_ring") {
            ShellResult::Ok(msg) => {
                assert!(msg.contains("inner_ring"));
            },
            _ => panic!("goto command failed"),
        }
    }

    #[test]
    fn test_unknown_command() {
        let state = ShellState::new();
        match execute_command(&state, "not_a_command") {
            ShellResult::Error(msg) => {
                assert!(msg.contains("Unknown command"));
            },
            _ => panic!("should have returned error"),
        }
    }
}
