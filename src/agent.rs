// ═══════════════════════════════════════════════════════════════════════
// AGENT SUBSTRATE BRIDGE
//
// Agents are the interface between external systems (humans, harnesses,
// other agents) and the Geometry OS VM. Each agent:
//
//   1. Receives a task (gasm source text or raw pixels)
//   2. Optionally assembles .gasm → pixel bytecode
//   3. Runs the bytecode on a VM
//   4. Drains the ForgeQueue — collecting ISSUE_CREATE outputs
//   5. Returns a result with issues, register state, screen, RAM, and stats
//
// The GasmAgent is the primary agent: it takes .gasm source, assembles it,
// executes it, and bridges ISSUE_CREATE opcode output into the forge queue.
//
// Usage (fire-and-forget):
//   let agent = GasmAgent::new(4096);
//   let result = agent.run_gasm("LDI r0, 42\nISSUE_CREATE\nHALT");
//   for issue in result.issues {
//       println!("Issue #{}: tag={} payload={} priority={:?}",
//                issue.id, issue.tag, issue.payload, issue.priority);
//   }
//
// Usage (step-by-step debugging):
//   let mut agent = GasmAgent::new(4096);
//   agent.load_gasm("PSET 10, 10, 5\nPSET 20, 20, 8\nHALT").unwrap();
//   agent.step_once();  // execute PSET 10,10,5
//   let state = agent.vm_state();
//   assert_eq!(state.pc, 4);
//   let pixel = agent.read_screen_pixel(10, 10);
//   assert_ne!(pixel, 0);
//   agent.step_once();  // execute PSET 20,20,8
//   agent.step_once();  // execute HALT
//
// Usage (yield/resume):
//   agent.load_gasm("LDI r0, 1\nYIELD\nLDI r0, 2\nHALT").unwrap();
//   let r1 = agent.run_loaded();       // stops at YIELD
//   assert!(r1.yielded);
//   let r2 = agent.resume();           // continues past YIELD
//   assert!(r2.halted);
//   assert_eq!(r2.reg(0), 2);
// ═══════════════════════════════════════════════════════════════════════

use crate::assembler::{self, Assembled};
use crate::forge::{ForgeQueue, Issue};
use crate::vm::{MAX_CYCLES, Vm};

/// Snapshot of VM state for inspection without ownership.
#[derive(Debug, Clone, serde::Serialize)]
pub struct VmState {
    pub pc: u32,
    pub regs: [u32; 32],
    pub halted: bool,
    pub yielded: bool,
    pub cycle_count: u32,
}

/// Outcome of an agent execution run.
#[derive(Debug, Clone, serde::Serialize)]
pub struct AgentResult {
    /// Issues drained from the forge queue after execution.
    pub issues: Vec<Issue>,
    /// Final register state (r0..r31).
    pub regs: [u32; 32],
    /// Program counter position after execution.
    pub pc: u32,
    /// Number of cycles executed.
    pub cycles: u32,
    /// Whether the VM halted cleanly.
    pub halted: bool,
    /// Whether the VM yielded.
    pub yielded: bool,
    /// Number of child VMs spawned.
    pub children_spawned: usize,
    /// The assembled labels (if gasm source was used).
    pub labels: std::collections::HashMap<String, usize>,
    /// Screen buffer snapshot (256x256 pixels).
    pub screen: Vec<u32>,
    /// RAM snapshot after execution.
    pub ram: Vec<u32>,
}

impl AgentResult {
    /// Was the execution successful (halted, no errors)?
    pub fn is_success(&self) -> bool {
        self.halted
    }

    /// Get a specific register value, clamped to 0..31.
    pub fn reg(&self, idx: usize) -> u32 {
        self.regs.get(idx).copied().unwrap_or(0)
    }

    /// Read a pixel from the screen snapshot at (x, y).
    /// Returns 0 if out of bounds.
    pub fn screen_pixel(&self, x: u32, y: u32) -> u32 {
        if x >= 256 || y >= 256 {
            return 0;
        }
        self.screen
            .get((y * 256 + x) as usize)
            .copied()
            .unwrap_or(0)
    }

    /// Read a value from the RAM snapshot at the given address.
    /// Returns 0 if out of bounds.
    pub fn ram_at(&self, addr: usize) -> u32 {
        self.ram.get(addr).copied().unwrap_or(0)
    }
}

/// Trait for agents that can execute programs and collect forge issues.
pub trait Agent {
    /// Execute raw pixel bytecode on the VM and return the result.
    fn run_pixels(&mut self, pixels: &[u32]) -> AgentResult;

    /// Assemble and execute .gasm source text.
    fn run_gasm(&mut self, source: &str) -> Result<AgentResult, AgentError>;

    /// The VM's forge queue (for direct inspection).
    fn forge(&self) -> &ForgeQueue;

    /// The VM's forge queue (mutable, for direct manipulation).
    fn forge_mut(&mut self) -> &mut ForgeQueue;

    /// Reset the agent's VM and forge queue to a clean state.
    fn reset(&mut self);

    /// Load gasm source into the VM without running it. For step-by-step debugging.
    fn load_gasm(
        &mut self,
        source: &str,
    ) -> Result<std::collections::HashMap<String, usize>, AgentError>;

    /// Execute a single instruction on the loaded VM. Returns updated state.
    fn step_once(&mut self) -> VmState;

    /// Run the loaded VM until halt, yield, or MAX_CYCLES.
    fn run_loaded(&mut self) -> AgentResult;

    /// Continue a yielded VM. Returns AgentResult when done.
    fn resume(&mut self) -> AgentResult;

    /// Get a snapshot of current VM state.
    fn vm_state(&self) -> VmState;

    /// Read the current screen buffer.
    fn read_screen(&self) -> Vec<u32>;

    /// Read a pixel from the screen at (x, y).
    fn read_screen_pixel(&self, x: u32, y: u32) -> u32;

    /// Read a range of RAM addresses.
    fn read_ram(&self, start: usize, count: usize) -> Vec<u32>;

    /// Read a single RAM address.
    fn peek_ram(&self, addr: usize) -> u32;

    /// Write a slice of values into RAM starting at `addr`.
    /// Expands RAM if needed.
    fn write_ram(&mut self, addr: usize, data: &[u32]);

    /// Write a single value to RAM at `addr`.
    /// Expands RAM if needed.
    fn poke_ram(&mut self, addr: usize, value: u32);

    /// Execute code already loaded in RAM starting at `addr`.
    /// Does NOT load a new program — just sets PC and runs.
    /// Useful for self-authoring: Program A writes Program B into RAM,
    /// then the agent calls `execute_from(addr)` to run it.
    fn execute_from(&mut self, addr: usize) -> AgentResult;

    /// Disassemble a range of RAM into human-readable instructions.
    /// Returns a vector of (address, formatted_string) pairs.
    /// Walks instruction boundaries using opcode widths.
    fn disassemble(&self, start: usize, count: usize) -> Vec<(usize, String)>;

    /// Convenience: disassemble and return as a single formatted string.
    /// One instruction per line, addresses prefixed.
    fn disasm(&self, start: usize, count: usize) -> String;
}

/// Errors that can occur during agent execution.
#[derive(Debug, Clone)]
pub enum AgentError {
    /// Assembly failed.
    AssemblyFailed { line: usize, message: String },
    /// VM execution exceeded cycle limit.
    CycleLimitExceeded { cycles: u32 },
    /// Cannot step/resume: no program loaded.
    NoProgramLoaded,
    /// Cannot resume: VM is not in yielded state.
    NotYielded,
}

impl std::fmt::Display for AgentError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            AgentError::AssemblyFailed { line, message } => {
                write!(f, "assembly error at line {}: {}", line, message)
            }
            AgentError::CycleLimitExceeded { cycles } => {
                write!(f, "exceeded cycle limit ({})", cycles)
            }
            AgentError::NoProgramLoaded => {
                write!(f, "no program loaded; call load_gasm() first")
            }
            AgentError::NotYielded => {
                write!(f, "VM is not in yielded state; cannot resume")
            }
        }
    }
}

impl std::error::Error for AgentError {}

/// The GasmAgent: assembles .gasm source, runs it on a VM, and bridges
/// ISSUE_CREATE outputs to the forge queue.
///
/// This is the primary agent for the Geometry OS substrate. It connects
/// the external world (text programs, harness tasks) to the internal
/// VM + forge pipeline.
///
/// Supports two modes:
/// 1. Fire-and-forget: `run_gasm(source)` — assembles, runs, returns result
/// 2. Step-by-step: `load_gasm(source)` then `step_once()` / `run_loaded()` / `resume()`
#[derive(Debug)]
pub struct GasmAgent {
    /// The underlying VM.
    vm: Vm,
    /// RAM size for new VM instances.
    ram_size: usize,
    /// Cycle counter for step-by-step execution.
    cycle_count: u32,
    /// Whether a program has been loaded (for step/resume guards).
    program_loaded: bool,
}

impl GasmAgent {
    /// Create a new GasmAgent with the given RAM size (in pixels).
    pub fn new(ram_size: usize) -> Self {
        GasmAgent {
            vm: Vm::new(ram_size),
            ram_size,
            cycle_count: 0,
            program_loaded: false,
        }
    }

    /// Create a GasmAgent with a default RAM size of 4096 pixels.
    pub fn default() -> Self {
        Self::new(4096)
    }

    /// Load and execute pre-assembled pixel bytecode into the VM.
    /// Does NOT assemble — pixels go directly into RAM.
    pub fn execute(&mut self, pixels: &[u32]) -> AgentResult {
        self.vm = Vm::new(self.ram_size);
        self.vm.load_program(pixels);
        self.cycle_count = 0;
        self.program_loaded = true;

        let cycles = self.vm.run();
        self.cycle_count = cycles;

        self.build_result(cycles, std::collections::HashMap::new())
    }

    /// Assemble .gasm source and return the assembled program without running it.
    pub fn assemble_only(&self, source: &str) -> Result<Assembled, AgentError> {
        assembler::assemble(source).map_err(|e| AgentError::AssemblyFailed {
            line: e.line,
            message: e.message,
        })
    }

    /// Run multiple gasm programs sequentially, accumulating issues.
    /// Each program gets a fresh VM but issues accumulate across runs.
    pub fn run_batch(&mut self, sources: &[&str]) -> Result<Vec<AgentResult>, AgentError> {
        let mut results = Vec::with_capacity(sources.len());
        for source in sources {
            let result = self.run_gasm(source)?;
            results.push(result);
        }
        Ok(results)
    }

    /// Build an AgentResult from the current VM state.
    fn build_result(
        &mut self,
        cycles: u32,
        labels: std::collections::HashMap<String, usize>,
    ) -> AgentResult {
        let issues = self.vm.forge.drain();
        AgentResult {
            issues,
            regs: self.vm.regs,
            pc: self.vm.pc,
            cycles,
            halted: self.vm.halted,
            yielded: self.vm.yielded,
            children_spawned: self.vm.children.len(),
            labels,
            screen: self.vm.screen.clone(),
            ram: self.vm.ram.clone(),
        }
    }
}

impl Agent for GasmAgent {
    fn run_pixels(&mut self, pixels: &[u32]) -> AgentResult {
        self.execute(pixels)
    }

    fn run_gasm(&mut self, source: &str) -> Result<AgentResult, AgentError> {
        let asm = self.assemble_only(source)?;
        let labels = asm.labels.clone();

        self.vm = Vm::new(self.ram_size);
        self.vm.load_program(&asm.pixels);
        self.cycle_count = 0;
        self.program_loaded = true;

        let cycles = self.vm.run();
        self.cycle_count = cycles;

        // Check if we hit the cycle limit without halting
        if cycles >= MAX_CYCLES && !self.vm.halted && !self.vm.yielded {
            return Err(AgentError::CycleLimitExceeded { cycles });
        }

        Ok(self.build_result(cycles, labels))
    }

    fn forge(&self) -> &ForgeQueue {
        &self.vm.forge
    }

    fn forge_mut(&mut self) -> &mut ForgeQueue {
        &mut self.vm.forge
    }

    fn reset(&mut self) {
        self.vm = Vm::new(self.ram_size);
        self.cycle_count = 0;
        self.program_loaded = false;
    }

    fn load_gasm(
        &mut self,
        source: &str,
    ) -> Result<std::collections::HashMap<String, usize>, AgentError> {
        let asm = self.assemble_only(source)?;
        let labels = asm.labels.clone();

        self.vm = Vm::new(self.ram_size);
        self.vm.load_program(&asm.pixels);
        self.cycle_count = 0;
        self.program_loaded = true;

        Ok(labels)
    }

    fn step_once(&mut self) -> VmState {
        if !self.program_loaded || self.vm.halted {
            return self.snapshot_vm_state();
        }

        self.vm.step();
        self.cycle_count += 1;

        self.snapshot_vm_state()
    }

    fn run_loaded(&mut self) -> AgentResult {
        let start_cycles = self.cycle_count;

        // Preserve yielded state from prior execution, then clear for new run
        self.vm.yielded = false;

        while !self.vm.halted && !self.vm.yielded && self.cycle_count - start_cycles < MAX_CYCLES {
            self.vm.step();
            self.cycle_count += 1;
        }

        let elapsed = self.cycle_count - start_cycles;

        self.build_result(elapsed, std::collections::HashMap::new())
    }

    fn resume(&mut self) -> AgentResult {
        if !self.vm.yielded {
            return self.build_result(0, std::collections::HashMap::new());
        }

        // Clear yielded flag and continue execution
        self.vm.yielded = false;

        let start_cycles = self.cycle_count;
        while !self.vm.halted && !self.vm.yielded && self.cycle_count - start_cycles < MAX_CYCLES {
            self.vm.step();
            self.cycle_count += 1;
        }

        let elapsed = self.cycle_count - start_cycles;
        self.build_result(elapsed, std::collections::HashMap::new())
    }

    fn vm_state(&self) -> VmState {
        self.snapshot_vm_state()
    }

    fn read_screen(&self) -> Vec<u32> {
        self.vm.screen.clone()
    }

    fn read_screen_pixel(&self, x: u32, y: u32) -> u32 {
        if x >= 256 || y >= 256 {
            return 0;
        }
        self.vm
            .screen
            .get((y * 256 + x) as usize)
            .copied()
            .unwrap_or(0)
    }

    fn read_ram(&self, start: usize, count: usize) -> Vec<u32> {
        let end = start.saturating_add(count).min(self.vm.ram.len());
        if start >= end {
            return Vec::new();
        }
        self.vm.ram[start..end].to_vec()
    }

    fn peek_ram(&self, addr: usize) -> u32 {
        self.vm.peek(addr)
    }

    fn write_ram(&mut self, addr: usize, data: &[u32]) {
        self.vm.load(addr, data);
        self.program_loaded = true;
    }

    fn poke_ram(&mut self, addr: usize, value: u32) {
        self.vm.poke(addr, value);
        self.program_loaded = true;
    }

    fn execute_from(&mut self, addr: usize) -> AgentResult {
        self.vm.pc = addr as u32;
        self.vm.halted = false;
        self.vm.yielded = false;
        self.vm.children.clear();
        self.cycle_count = 0;
        self.program_loaded = true;

        let cycles = self.vm.run();
        self.cycle_count = cycles;

        self.build_result(cycles, std::collections::HashMap::new())
    }

    fn disassemble(&self, start: usize, count: usize) -> Vec<(usize, String)> {
        use crate::opcodes::{name, width};

        let ram = &self.vm.ram;
        let end = start.saturating_add(count).min(ram.len());
        let mut result = Vec::new();
        let mut pc = start;

        while pc < end {
            let opcode_byte = ram[pc] as u8;
            let instr_name = name(opcode_byte);
            let instr_width = width(opcode_byte);

            let formatted = if instr_name == "???" {
                format!("DB 0x{:08X}", ram[pc])
            } else {
                format_instruction(instr_name, opcode_byte, pc, ram)
            };

            result.push((pc, formatted));
            pc = pc.saturating_add(instr_width);
        }

        result
    }

    fn disasm(&self, start: usize, count: usize) -> String {
        self.disassemble(start, count)
            .iter()
            .map(|(addr, instr)| format!("{:04X}: {}", addr, instr))
            .collect::<Vec<_>>()
            .join("\n")
    }
}

impl GasmAgent {
    /// Internal helper to snapshot VM state.
    fn snapshot_vm_state(&self) -> VmState {
        VmState {
            pc: self.vm.pc,
            regs: self.vm.regs,
            halted: self.vm.halted,
            yielded: self.vm.yielded,
            cycle_count: self.cycle_count,
        }
    }
}

/// Format a single instruction with its arguments.
/// Uses the opcode's width to read the correct number of argument pixels from RAM.
fn format_instruction(name: &str, opcode: u8, pc: usize, ram: &[u32]) -> String {
    use crate::opcodes::width;

    let w = width(opcode);

    // Helper: read arg pixel safely (0 if out of bounds)
    let arg = |offset: usize| -> u32 { ram.get(pc + offset).copied().unwrap_or(0) };

    // Helper: format a register argument
    let reg = |offset: usize| -> String {
        let idx = arg(offset) as usize;
        if idx < 32 {
            format!("r{}", idx)
        } else {
            format!("{}", arg(offset))
        }
    };

    match (name, w) {
        // Width-1: no args
        ("HALT", 1) => "HALT".to_string(),
        ("NOP", 1) => "NOP".to_string(),
        ("RET", 1) => "RET".to_string(),
        ("YIELD", 1) => "YIELD".to_string(),
        ("ISSUE_CREATE", 1) => "ISSUE_CREATE".to_string(),

        // Width-2: 1 arg
        ("JMP", 2) => format!("JMP {}", arg(1) & 0x7FFFFFFF),
        ("CALL", 2) => format!("CALL {}", arg(1) & 0x7FFFFFFF),
        ("INT", 2) => format!("INT {}", arg(1)),
        ("IRET", 1) => "IRET".to_string(),
        ("STI", 3) => format!("STI {}, {}", arg(1), arg(2) & 0x7FFFFFFF),
        ("NOT", 2) => format!("NOT {}", reg(1)),
        ("PUSH", 2) => format!("PUSH {}", arg(1)),
        ("POP", 2) => format!("POP {}", reg(1)),
        ("EDIT_DEL", 2) => format!("EDIT_DEL {}", reg(1)),

        // Width-3: 2 args (register-based or mixed)
        ("ADD", 3) => format!("ADD {}, {}", reg(1), reg(2)),
        ("SUB", 3) => format!("SUB {}, {}", reg(1), reg(2)),
        ("MUL", 3) => format!("MUL {}, {}", reg(1), reg(2)),
        ("DIV", 3) => format!("DIV {}, {}", reg(1), reg(2)),
        ("MOD", 3) => format!("MOD {}, {}", reg(1), reg(2)),
        ("AND", 3) => format!("AND {}, {}", reg(1), reg(2)),
        ("OR", 3) => format!("OR {}, {}", reg(1), reg(2)),
        ("XOR", 3) => format!("XOR {}, {}", reg(1), reg(2)),
        ("MOV", 3) => format!("MOV {}, {}", reg(1), reg(2)),
        ("SHL", 3) => format!("SHL {}, {}", reg(1), arg(2)),
        ("SHR", 3) => format!("SHR {}, {}", reg(1), arg(2)),
        ("STORE", 3) => format!("STORE [{}], {}", reg(1), reg(2)),
        ("LOAD", 3) => format!("LOAD {}, [{}]", reg(1), reg(2)),
        ("LDB", 3) => format!("LDB {}, [{}]", reg(1), reg(2)),
        ("STB", 3) => format!("STB [{}], {}", reg(1), reg(2)),
        ("BRANCH", 3) => format!("BRANCH {}, {}", reg(1), arg(2) & 0x7FFFFFFF),
        ("SPAWN", 3) => format!("SPAWN {}, {}", arg(1), arg(2)),
        ("EXEC", 3) => format!("EXEC {}, {}", arg(1), arg(2)),
        ("PGET", 3) => format!("PGET {}, {}", reg(1), reg(2)),
        ("EDIT_OVW", 3) => format!("EDIT_OVW {}, {}", reg(1), reg(2)),
        ("EDIT_INS", 3) => format!("EDIT_INS {}, {}", reg(1), reg(2)),

        // Width-3 special: LDI has a value arg
        ("LDI", 3) => format!("LDI {}, {}", reg(1), arg(2)),

        // Width-4: 3 args
        ("PSET", 4) => format!("PSET {}, {}, {}", reg(1), reg(2), reg(3)),
        ("TEXT", 4) => format!("TEXT {}, {}, {}", reg(1), reg(2), arg(3)),
        ("BLIT", 4) => format!("BLIT {}, {}, {}", arg(1), arg(2), arg(3)),
        ("CIRCLEF", 4) => format!("CIRCLEF {}, {}, {}", reg(1), reg(2), reg(3)),
        ("SPAWN+", 4) => format!("SPAWN+ {}, {}, {}", arg(1), arg(2), arg(3)),
        ("EDIT_BLIT", 4) => format!("EDIT_BLIT {}, {}, {}", reg(1), reg(2), reg(3)),

        // Width-5: 4 args
        ("RECTF", 5) => format!("RECTF {}, {}, {}, {}", reg(1), reg(2), arg(3), arg(4)),
        ("LINE", 5) => format!("LINE {}, {}, {}, {}", reg(1), reg(2), reg(3), reg(4)),

        // Fallback: just show name + raw args
        _ => {
            let args: Vec<String> = (1..w).map(|i| format!("{}", arg(i))).collect();
            format!("{} {}", name, args.join(", "))
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forge::Priority;
    use crate::opcodes::op;

    // ── Existing tests (preserved) ──────────────────────────────────────

    #[test]
    fn gasm_agent_runs_simple_program() {
        let mut agent = GasmAgent::new(256);
        let result = agent.run_gasm("HALT").unwrap();
        assert!(result.halted);
        assert_eq!(result.cycles, 1);
        assert!(result.issues.is_empty());
    }

    #[test]
    fn gasm_agent_collects_forge_issues() {
        let mut agent = GasmAgent::new(256);
        let result = agent
            .run_gasm(
                "\
            LDI r0, 100
            LDI r1, 200
            LDI r2, 1
            ISSUE_CREATE
            HALT
        ",
            )
            .unwrap();

        assert!(result.halted);
        assert_eq!(result.issues.len(), 1);
        assert_eq!(result.issues[0].tag, 100);
        assert_eq!(result.issues[0].payload, 200);
        assert_eq!(result.issues[0].priority, Priority::Medium);
        // r0 should contain the issue ID after ISSUE_CREATE
        assert_eq!(result.reg(0), 1);
    }

    #[test]
    fn gasm_agent_multiple_issues() {
        let mut agent = GasmAgent::new(256);
        let result = agent
            .run_gasm(
                "\
            LDI r0, 10
            LDI r1, 20
            LDI r2, 0
            ISSUE_CREATE
            LDI r0, 30
            LDI r1, 40
            LDI r2, 3
            ISSUE_CREATE
            HALT
        ",
            )
            .unwrap();

        assert!(result.halted);
        assert_eq!(result.issues.len(), 2);
        assert_eq!(result.issues[0].tag, 10);
        assert_eq!(result.issues[0].priority, Priority::Low);
        assert_eq!(result.issues[1].tag, 30);
        assert_eq!(result.issues[1].priority, Priority::Critical);
    }

    #[test]
    fn gasm_agent_run_pixels_directly() {
        let mut agent = GasmAgent::new(256);
        use crate::opcodes::op;
        let result = agent.run_pixels(&[
            op::LDI as u32,
            0,
            42, // LDI r0, 42
            op::HALT as u32,
        ]);
        assert!(result.halted);
        assert_eq!(result.reg(0), 42);
    }

    #[test]
    fn gasm_agent_resets_state() {
        let mut agent = GasmAgent::new(256);
        let _ = agent.run_gasm("LDI r0, 99\nHALT").unwrap();
        assert_eq!(agent.forge().len(), 0);
        agent.reset();
        // After reset, forge should be empty and VM fresh
        assert!(agent.forge().is_empty());
    }

    #[test]
    fn gasm_agent_assembly_error() {
        let mut agent = GasmAgent::new(256);
        let err = agent.run_gasm("BAD_INSN r0").unwrap_err();
        match err {
            AgentError::AssemblyFailed { line, message } => {
                assert_eq!(line, 1);
                assert!(message.contains("unknown mnemonic"));
            }
            other => panic!("expected AssemblyFailed, got {:?}", other),
        }
    }

    #[test]
    fn gasm_agent_cycle_limit_exceeded() {
        let mut agent = GasmAgent::new(256);
        // Infinite loop: NOP then jump to self
        let err = agent
            .run_gasm(
                "\
            loop:
                NOP
                JMP loop
        ",
            )
            .unwrap_err();
        match err {
            AgentError::CycleLimitExceeded { cycles } => {
                assert_eq!(cycles, crate::vm::MAX_CYCLES);
            }
            other => panic!("expected CycleLimitExceeded, got {:?}", other),
        }
    }

    #[test]
    fn agent_result_helpers() {
        let mut agent = GasmAgent::new(256);
        let result = agent.run_gasm("LDI r5, 77\nHALT").unwrap();
        assert_eq!(result.reg(5), 77);
        assert_eq!(result.reg(31), 0); // default
        assert!(result.is_success());
    }

    #[test]
    fn gasm_agent_batch_execution() {
        let mut agent = GasmAgent::new(256);
        let results = agent
            .run_batch(&["LDI r0, 1\nHALT", "LDI r0, 2\nHALT"])
            .unwrap();
        assert_eq!(results.len(), 2);
        assert_eq!(results[0].reg(0), 1);
        assert_eq!(results[1].reg(0), 2);
    }

    #[test]
    fn gasm_agent_labels_preserved() {
        let mut agent = GasmAgent::new(256);
        let result = agent
            .run_gasm(
                "\
            start:
                LDI r0, 0
                HALT
        ",
            )
            .unwrap();
        assert_eq!(result.labels.get("start"), Some(&0));
    }

    #[test]
    fn gasm_agent_issue_create_with_computation() {
        // Prove the full pipeline: gasm → assemble → VM → ISSUE_CREATE → forge drain
        let mut agent = GasmAgent::new(256);
        let result = agent
            .run_gasm(
                "\
            LDI r0, 5
            LDI r1, 3
            ADD r0, r1
            ; r0 = 8, use as tag
            MOV r2, r1
            ; r2 = 3 (priority)
            ISSUE_CREATE
            HALT
        ",
            )
            .unwrap();

        assert!(result.halted);
        assert_eq!(result.issues.len(), 1);
        assert_eq!(result.issues[0].tag, 8); // 5 + 3
        assert_eq!(result.issues[0].payload, 3); // r1 unchanged
        assert_eq!(result.issues[0].priority, Priority::Critical); // 3 & 3 = 3 = Critical
    }

    // ── New tests: AgentResult fields ────────────────────────────────────

    #[test]
    fn agent_result_contains_screen_snapshot() {
        let mut agent = GasmAgent::new(4096);
        // PSET args are register indices, so load coords into regs first
        let result = agent
            .run_gasm(
                "\
            LDI r0, 5
            LDI r1, 10
            LDI r2, 7
            PSET r0, r1, r2
            HALT
        ",
            )
            .unwrap();

        assert!(result.halted);
        // Screen should be 256x256
        assert_eq!(result.screen.len(), 256 * 256);
        // Pixel at (5, 10) should be non-zero (color = 7)
        assert_ne!(result.screen_pixel(5, 10), 0);
        // Pixel at (0, 0) should still be 0
        assert_eq!(result.screen_pixel(0, 0), 0);
        // Out-of-bounds returns 0
        assert_eq!(result.screen_pixel(300, 300), 0);
    }

    #[test]
    fn agent_result_contains_ram_snapshot() {
        let mut agent = GasmAgent::new(256);
        let result = agent
            .run_gasm(
                "\
            LDI r0, 42
            HALT
        ",
            )
            .unwrap();

        // RAM snapshot should have the assembled program at the start
        assert!(!result.ram.is_empty());
        // First pixel should be LDI opcode (0x49)
        assert_eq!(result.ram_at(0), 0x49); // 'I' = LDI
        // ram_at with out-of-bounds returns 0
        assert_eq!(result.ram_at(9999), 0);
    }

    #[test]
    fn agent_result_contains_pc() {
        let mut agent = GasmAgent::new(256);
        let result = agent
            .run_gasm(
                "\
            LDI r0, 1
            LDI r1, 2
            HALT
        ",
            )
            .unwrap();

        // After HALT, PC should be past all instructions
        // LDI (width 3) + LDI (width 3) + HALT (width 1) = 7
        assert_eq!(result.pc, 7);
    }

    // ── New tests: Step-by-step execution ───────────────────────────────

    #[test]
    fn agent_load_and_step() {
        let mut agent = GasmAgent::new(256);
        let labels = agent
            .load_gasm(
                "\
            LDI r0, 10
            LDI r1, 20
            ADD r0, r1
            HALT
        ",
            )
            .unwrap();

        // Labels should be empty (no labels defined)
        assert!(labels.is_empty());

        // Step 1: LDI r0, 10 → PC should advance by 3
        let state = agent.step_once();
        assert_eq!(state.pc, 3);
        assert_eq!(state.regs[0], 10);
        assert!(!state.halted);

        // Step 2: LDI r1, 20 → PC should advance by 3 more
        let state = agent.step_once();
        assert_eq!(state.pc, 6);
        assert_eq!(state.regs[1], 20);
        assert!(!state.halted);

        // Step 3: ADD r0, r1 → r0 = 30
        let state = agent.step_once();
        assert_eq!(state.pc, 9);
        assert_eq!(state.regs[0], 30);
        assert!(!state.halted);

        // Step 4: HALT
        let state = agent.step_once();
        assert!(state.halted);
        assert_eq!(state.cycle_count, 4);
    }

    #[test]
    fn agent_step_tracks_cycle_count() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("NOP\nNOP\nHALT").unwrap();

        assert_eq!(agent.vm_state().cycle_count, 0);
        agent.step_once();
        assert_eq!(agent.vm_state().cycle_count, 1);
        agent.step_once();
        assert_eq!(agent.vm_state().cycle_count, 2);
        agent.step_once();
        assert_eq!(agent.vm_state().cycle_count, 3);
    }

    #[test]
    fn agent_step_after_halt_is_noop() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("HALT").unwrap();

        let state = agent.step_once();
        assert!(state.halted);

        // Stepping again should not panic or change state
        let state2 = agent.step_once();
        assert!(state2.halted);
        assert_eq!(state2.cycle_count, 1); // didn't increment
    }

    // ── New tests: run_loaded ───────────────────────────────────────────

    #[test]
    fn agent_run_loaded() {
        let mut agent = GasmAgent::new(256);
        agent
            .load_gasm(
                "\
            LDI r0, 99
            HALT
        ",
            )
            .unwrap();

        let result = agent.run_loaded();
        assert!(result.halted);
        assert_eq!(result.reg(0), 99);
        assert_eq!(result.cycles, 2); // LDI + HALT
    }

    // ── New tests: Yield + Resume ───────────────────────────────────────

    #[test]
    fn agent_yield_and_resume() {
        let mut agent = GasmAgent::new(256);
        agent
            .load_gasm(
                "\
            LDI r0, 1
            YIELD
            LDI r0, 2
            HALT
        ",
            )
            .unwrap();

        // Run to yield point
        let r1 = agent.run_loaded();
        assert!(r1.yielded);
        assert!(!r1.halted);
        assert_eq!(r1.reg(0), 1);

        // Resume past yield
        let r2 = agent.resume();
        assert!(!r2.yielded);
        assert!(r2.halted);
        assert_eq!(r2.reg(0), 2);
    }

    #[test]
    fn agent_resume_when_not_yielded_still_works() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("LDI r0, 5\nHALT").unwrap();

        // Run to completion (no yield)
        let r1 = agent.run_loaded();
        assert!(r1.halted);

        // Resume on halted VM should just return current state
        let r2 = agent.resume();
        assert!(r2.halted);
        assert_eq!(r2.cycles, 0); // no additional cycles
    }

    #[test]
    fn agent_multiple_yields() {
        let mut agent = GasmAgent::new(256);
        agent
            .load_gasm(
                "\
            LDI r0, 10
            YIELD
            ADD r0, r0
            YIELD
            HALT
        ",
            )
            .unwrap();

        // First run: stops at first YIELD, r0=10
        let r1 = agent.run_loaded();
        assert!(r1.yielded);
        assert_eq!(r1.reg(0), 10);

        // Resume: runs ADD then stops at second YIELD, r0=20
        let r2 = agent.resume();
        assert!(r2.yielded);
        assert_eq!(r2.reg(0), 20);

        // Resume again: runs to HALT
        let r3 = agent.resume();
        assert!(r3.halted);
        assert_eq!(r3.reg(0), 20); // no change after last yield
    }

    // ── New tests: Screen and RAM inspection ────────────────────────────

    #[test]
    fn agent_read_screen_after_pset() {
        let mut agent = GasmAgent::new(4096);
        agent
            .load_gasm(
                "\
            LDI r0, 42
            LDI r1, 17
            LDI r2, 5
            PSET r0, r1, r2
            HALT
        ",
            )
            .unwrap();

        let _ = agent.run_loaded();

        // Check via direct read
        assert_ne!(agent.read_screen_pixel(42, 17), 0);
        assert_eq!(agent.read_screen_pixel(0, 0), 0);

        // Check via full screen buffer
        let screen = agent.read_screen();
        assert_eq!(screen.len(), 256 * 256);
        assert_ne!(screen[17 * 256 + 42], 0);
    }

    #[test]
    fn agent_read_ram_range() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("LDI r0, 42\nHALT").unwrap();

        // Before running, RAM has the assembled program
        let ram_head = agent.read_ram(0, 4);
        assert_eq!(ram_head.len(), 4);
        assert_eq!(ram_head[0], 0x49); // 'I' = LDI opcode

        // Out-of-bounds read returns empty
        let oob = agent.read_ram(9999, 10);
        assert!(oob.is_empty());

        // Partial read (start near end)
        let partial = agent.read_ram(254, 10);
        assert_eq!(partial.len(), 2); // only 2 pixels available (254, 255)
    }

    #[test]
    fn agent_peek_ram() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("LDI r0, 42\nHALT").unwrap();

        // First pixel should be LDI opcode
        assert_eq!(agent.peek_ram(0), 0x49); // 'I'
        // Out of bounds returns 0
        assert_eq!(agent.peek_ram(9999), 0);
    }

    // ── New tests: vm_state ─────────────────────────────────────────────

    #[test]
    fn agent_vm_state_snapshot() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("LDI r0, 42\nLDI r1, 7\nHALT").unwrap();

        // Initial state
        let s0 = agent.vm_state();
        assert_eq!(s0.pc, 0);
        assert_eq!(s0.regs[0], 0);
        assert!(!s0.halted);
        assert_eq!(s0.cycle_count, 0);

        // After one step
        agent.step_once();
        let s1 = agent.vm_state();
        assert_eq!(s1.pc, 3);
        assert_eq!(s1.regs[0], 42);
        assert_eq!(s1.cycle_count, 1);
    }

    // ── New tests: Reset clears step state ──────────────────────────────

    #[test]
    fn agent_reset_clears_step_state() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("LDI r0, 99\nHALT").unwrap();
        agent.step_once();
        assert_eq!(agent.vm_state().cycle_count, 1);

        agent.reset();
        let state = agent.vm_state();
        assert_eq!(state.pc, 0);
        assert_eq!(state.cycle_count, 0);
        assert!(!state.halted);
    }

    // ── New tests: Step-through with graphics ───────────────────────────

    #[test]
    fn agent_step_through_drawing() {
        let mut agent = GasmAgent::new(4096);
        agent
            .load_gasm(
                "\
            LDI r0, 5
            LDI r1, 5
            LDI r2, 3
            PSET r0, r1, r2
            LDI r0, 10
            LDI r1, 10
            LDI r2, 7
            PSET r0, r1, r2
            HALT
        ",
            )
            .unwrap();

        // Step through LDI loads and first PSET (7 steps for first drawing)
        for _ in 0..7 {
            agent.step_once();
        }
        assert_ne!(agent.read_screen_pixel(5, 5), 0);
        assert_eq!(agent.read_screen_pixel(10, 10), 0); // not drawn yet

        // Step through second PSET + HALT (7 more steps)
        for _ in 0..7 {
            agent.step_once();
        }
        assert_ne!(agent.read_screen_pixel(10, 10), 0);
        assert!(agent.vm_state().halted);
    }

    // ── New tests: Fire-and-forget still works identically ──────────────

    #[test]
    fn fire_and_forget_screen_and_ram_populated() {
        let mut agent = GasmAgent::new(4096);
        let result = agent
            .run_gasm(
                "\
            LDI r0, 50
            LDI r1, 50
            LDI r2, 9
            PSET r0, r1, r2
            LDI r0, 123
            HALT
        ",
            )
            .unwrap();

        assert!(result.halted);
        assert_ne!(result.screen_pixel(50, 50), 0);
        assert_eq!(result.reg(0), 123);
        assert!(result.pc > 0);
    }

    // ── Phase 5: write_ram, poke_ram, execute_from ────────────────────

    #[test]
    fn agent_write_ram_plants_data() {
        let mut agent = GasmAgent::new(4096);
        // Write raw bytecode: LDI r0, 42 / HALT
        agent.write_ram(100, &[op::LDI as u32, 0, 42, op::HALT as u32]);

        assert_eq!(agent.peek_ram(100), op::LDI as u32);
        assert_eq!(agent.peek_ram(101), 0);
        assert_eq!(agent.peek_ram(102), 42);
        assert_eq!(agent.peek_ram(103), op::HALT as u32);
    }

    #[test]
    fn agent_poke_ram_single_value() {
        let mut agent = GasmAgent::new(4096);
        agent.poke_ram(200, 0xDEAD);
        assert_eq!(agent.peek_ram(200), 0xDEAD);
        // Other addresses unaffected
        assert_eq!(agent.peek_ram(199), 0);
        assert_eq!(agent.peek_ram(201), 0);
    }

    #[test]
    fn agent_write_ram_auto_expands() {
        let mut agent = GasmAgent::new(64);
        // Write beyond initial RAM size
        agent.write_ram(100, &[op::HALT as u32]);
        assert_eq!(agent.peek_ram(100), op::HALT as u32);
    }

    #[test]
    fn agent_execute_from_runs_code_in_ram() {
        let mut agent = GasmAgent::new(4096);

        // Write a program at address 200: LDI r0, 99 / HALT
        agent.write_ram(200, &[op::LDI as u32, 0, 99, op::HALT as u32]);

        // Execute starting at address 200
        let result = agent.execute_from(200);

        assert!(result.halted);
        assert_eq!(result.reg(0), 99);
    }

    #[test]
    fn agent_execute_from_draws_pixels() {
        let mut agent = GasmAgent::new(4096);

        // Write a drawing program at addr 300:
        // LDI r0, 15 / LDI r1, 15 / LDI r2, 5 / PSET r0, r1, r2 / HALT
        agent.write_ram(
            300,
            &[
                op::LDI as u32,
                0,
                15,
                op::LDI as u32,
                1,
                15,
                op::LDI as u32,
                2,
                5,
                op::PSET as u32,
                0,
                1,
                2,
                op::HALT as u32,
            ],
        );

        let result = agent.execute_from(300);
        assert!(result.halted);
        assert_ne!(result.screen_pixel(15, 15), 0);
    }

    #[test]
    fn agent_self_authoring_with_new_api() {
        // The simplified self-authoring loop using write_ram + execute_from
        let mut agent = GasmAgent::new(4096);

        // Step 1: Agent writes Program B directly into RAM at addr 500
        // Program B: LDI r0, 20 / LDI r1, 20 / LDI r2, 8 / PSET r0, r1, r2 / HALT
        let program_b: Vec<u32> = vec![
            op::LDI as u32,
            0,
            20,
            op::LDI as u32,
            1,
            20,
            op::LDI as u32,
            2,
            8,
            op::PSET as u32,
            0,
            1,
            2,
            op::HALT as u32,
        ];
        agent.write_ram(500, &program_b);

        // Step 2: Execute Program B from RAM
        let result = agent.execute_from(500);

        // Step 3: Verify
        assert!(result.halted);
        assert_ne!(result.screen_pixel(20, 20), 0);
        assert_eq!(result.reg(0), 20); // last LDI r0 before PSET used it as x
    }

    #[test]
    fn agent_execute_from_preserves_existing_ram() {
        let mut agent = GasmAgent::new(4096);

        // Plant data at addr 0
        agent.poke_ram(0, 0xBEEF);
        // Write and run program at addr 50
        agent.write_ram(50, &[op::LDI as u32, 0, 77, op::HALT as u32]);
        let result = agent.execute_from(50);

        assert!(result.halted);
        assert_eq!(result.reg(0), 77);
        // Data at addr 0 should survive (VM ran from addr 50, never touched addr 0)
        assert_eq!(result.ram_at(0), 0xBEEF);
    }

    // ── Phase 6: Disassembler tests ────────────────────────────────────
    //
    // IMPORTANT: disassemble(start, count) scans `count` PIXELS (not instructions).
    // Zeros in RAM decode as "DB 0x00000000" -- they don't stop the disassembly.
    // Tests must use exact pixel counts matching the program size, or assert
    // on specific entries by index rather than total length.

    #[test]
    fn disassemble_simple_halt() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("HALT").unwrap();
        // HALT = width 1, scan exactly 1 pixel
        let lines = agent.disassemble(0, 1);
        assert_eq!(lines.len(), 1);
        assert_eq!(lines[0], (0, "HALT".to_string()));
    }

    #[test]
    fn disassemble_ldi_halt() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("LDI r0, 42\nHALT").unwrap();
        // LDI(3) + HALT(1) = 4 pixels
        let lines = agent.disassemble(0, 4);
        assert_eq!(lines.len(), 2);
        assert_eq!(lines[0], (0, "LDI r0, 42".to_string()));
        assert_eq!(lines[1], (3, "HALT".to_string()));
    }

    #[test]
    fn disassemble_add_with_registers() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("ADD r0, r1\nHALT").unwrap();
        // ADD(3) + HALT(1) = 4 pixels
        let lines = agent.disassemble(0, 4);
        assert_eq!(lines[0], (0, "ADD r0, r1".to_string()));
        assert_eq!(lines[1], (3, "HALT".to_string()));
    }

    #[test]
    fn disassemble_multiple_instructions() {
        let mut agent = GasmAgent::new(256);
        agent
            .load_gasm("LDI r0, 5\nLDI r1, 10\nADD r0, r1\nHALT")
            .unwrap();
        // LDI(3)+LDI(3)+ADD(3)+HALT(1) = 10 pixels
        let lines = agent.disassemble(0, 10);
        assert_eq!(lines.len(), 4);
        assert_eq!(lines[0], (0, "LDI r0, 5".to_string()));
        assert_eq!(lines[1], (3, "LDI r1, 10".to_string()));
        assert_eq!(lines[2], (6, "ADD r0, r1".to_string()));
        assert_eq!(lines[3], (9, "HALT".to_string()));
    }

    #[test]
    fn disassemble_jump_and_nop() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("NOP\nJMP 0\nHALT").unwrap();
        // NOP(1)+JMP(2)+HALT(1) = 4 pixels
        let lines = agent.disassemble(0, 4);
        assert_eq!(lines[0], (0, "NOP".to_string()));
        assert_eq!(lines[1], (1, "JMP 0".to_string()));
        assert_eq!(lines[2], (3, "HALT".to_string()));
    }

    #[test]
    fn disassemble_pset() {
        let mut agent = GasmAgent::new(4096);
        agent
            .load_gasm("LDI r0, 10\nLDI r1, 20\nLDI r2, 5\nPSET r0, r1, r2\nHALT")
            .unwrap();
        // 3*LDI(9) + PSET(4) + HALT(1) = 14 pixels
        let lines = agent.disassemble(0, 14);
        assert_eq!(lines.len(), 5);
        assert_eq!(lines[3], (9, "PSET r0, r1, r2".to_string()));
    }

    #[test]
    fn disassemble_unknown_byte_as_db() {
        let mut agent = GasmAgent::new(256);
        // Plant a non-opcode byte at address 0
        agent.poke_ram(0, 0x00); // not a valid opcode
        let lines = agent.disassemble(0, 1);
        assert_eq!(lines.len(), 1);
        assert!(lines[0].1.starts_with("DB 0x"));
    }

    #[test]
    fn disassemble_from_offset() {
        let mut agent = GasmAgent::new(4096);
        // Write program at address 100: LDI(3) + HALT(1) = 4 pixels
        agent.write_ram(100, &[op::LDI as u32, 0, 99, op::HALT as u32]);
        let lines = agent.disassemble(100, 4);
        assert_eq!(lines.len(), 2);
        assert_eq!(lines[0], (100, "LDI r0, 99".to_string()));
        assert_eq!(lines[1], (103, "HALT".to_string()));
    }

    #[test]
    fn disassemble_empty_range() {
        let agent = GasmAgent::new(256);
        let lines = agent.disassemble(0, 0);
        assert!(lines.is_empty());
    }

    #[test]
    fn disassemble_out_of_bounds_returns_partial() {
        let agent = GasmAgent::new(16); // tiny RAM
        let lines = agent.disassemble(14, 10);
        // RAM is only 16 entries, so from 14 we can only read 2
        assert!(lines.len() <= 2);
    }

    #[test]
    fn disassemble_self_authored_program() {
        // Write a program via write_ram (as self-authoring would), then disassemble it
        let mut agent = GasmAgent::new(4096);
        agent.write_ram(
            500,
            &[
                op::LDI as u32,
                0,
                20, // 3 pixels
                op::LDI as u32,
                1,
                30, // 3 pixels
                op::ADD as u32,
                0,
                1, // 3 pixels
                op::STORE as u32,
                200,
                0,               // 3 pixels
                op::HALT as u32, // 1 pixel
            ],
        );
        // Total = 13 pixels
        let lines = agent.disassemble(500, 13);
        assert_eq!(lines.len(), 5);
        assert_eq!(lines[0], (500, "LDI r0, 20".to_string()));
        assert_eq!(lines[1], (503, "LDI r1, 30".to_string()));
        assert_eq!(lines[2], (506, "ADD r0, r1".to_string()));
        assert_eq!(lines[3], (509, "STORE [200], r0".to_string()));
        assert_eq!(lines[4], (512, "HALT".to_string()));
    }

    #[test]
    fn disassemble_all_width1_opcodes() {
        let mut agent = GasmAgent::new(256);
        agent.write_ram(
            0,
            &[
                op::HALT as u32,
                op::NOP as u32,
                op::YIELD as u32,
                op::RET as u32,
                op::ISSUE_CREATE as u32,
            ],
        );
        // 5 width-1 opcodes = 5 pixels
        let lines = agent.disassemble(0, 5);
        assert_eq!(lines.len(), 5);
        assert_eq!(lines[0].1, "HALT");
        assert_eq!(lines[1].1, "NOP");
        assert_eq!(lines[2].1, "YIELD");
        assert_eq!(lines[3].1, "RET");
        assert_eq!(lines[4].1, "ISSUE_CREATE");
    }

    #[test]
    fn disassemble_branch() {
        let mut agent = GasmAgent::new(256);
        // BRANCH = width 3
        agent.write_ram(0, &[op::BRANCH as u32, 0, 42]);
        let lines = agent.disassemble(0, 3);
        assert_eq!(lines.len(), 1);
        assert_eq!(lines[0].1, "BRANCH r0, 42");
    }

    #[test]
    fn disassemble_mov_and_store() {
        let mut agent = GasmAgent::new(256);
        agent.write_ram(
            0,
            &[
                op::MOV as u32,
                1,
                0, // MOV r1, r0  (3 pixels)
                op::STORE as u32,
                100,
                1, // STORE [100], r1  (3 pixels)
                op::LOAD as u32,
                2,
                100, // LOAD r2, [100]  (3 pixels)
            ],
        );
        // 3 instructions * 3 pixels = 9 pixels
        let lines = agent.disassemble(0, 9);
        assert_eq!(lines.len(), 3);
        assert_eq!(lines[0].1, "MOV r1, r0");
        assert_eq!(lines[1].1, "STORE [100], r1");
        assert_eq!(lines[2].1, "LOAD r2, [100]");
    }

    // ── Phase 6: Additional coverage tests ─────────────────────────────

    #[test]
    fn disassemble_rectf_width5() {
        let mut agent = GasmAgent::new(4096);
        // RECTF = width 5
        agent.write_ram(0, &[op::RECTF as u32, 0, 1, 10, 10]);
        let lines = agent.disassemble(0, 5);
        assert_eq!(lines.len(), 1);
        assert!(lines[0].1.starts_with("RECTF"));
    }

    #[test]
    fn disassemble_line_width5() {
        let mut agent = GasmAgent::new(4096);
        // LINE = width 5
        agent.write_ram(0, &[op::LINE as u32, 0, 1, 2, 3]);
        let lines = agent.disassemble(0, 5);
        assert_eq!(lines.len(), 1);
        assert!(lines[0].1.starts_with("LINE"));
    }

    #[test]
    fn disassemble_stack_ops() {
        let mut agent = GasmAgent::new(256);
        agent.write_ram(
            0,
            &[
                op::PUSH as u32,
                42, // PUSH 42 (width 2)
                op::POP as u32,
                0, // POP r0 (width 2)
            ],
        );
        // 2 + 2 = 4 pixels
        let lines = agent.disassemble(0, 4);
        assert_eq!(lines.len(), 2);
        assert_eq!(lines[0].1, "PUSH 42");
        assert_eq!(lines[1].1, "POP r0");
    }

    #[test]
    fn disassemble_call_ret() {
        let mut agent = GasmAgent::new(256);
        agent.write_ram(
            0,
            &[
                op::CALL as u32,
                10,              // CALL 10 (width 2)
                op::HALT as u32, // HALT (width 1)
            ],
        );
        let lines = agent.disassemble(0, 3);
        assert_eq!(lines.len(), 2);
        assert_eq!(lines[0].1, "CALL 10");
        assert_eq!(lines[1].1, "HALT");
    }

    #[test]
    fn disassemble_editor_ops() {
        let mut agent = GasmAgent::new(256);
        agent.write_ram(
            0,
            &[
                op::EDIT_OVERWRITE as u32,
                0,
                1, // EDIT_OVW r0, r1 (width 3)
                op::EDIT_INSERT as u32,
                2,
                3, // EDIT_INS r2, r3 (width 3)
                op::EDIT_DELETE as u32,
                4, // EDIT_DEL r4 (width 2)
                op::EDIT_BLIT as u32,
                0,
                1,
                2, // EDIT_BLIT r0, r1, r2 (width 4)
            ],
        );
        // 3 + 3 + 2 + 4 = 12 pixels
        let lines = agent.disassemble(0, 12);
        assert_eq!(lines.len(), 4);
        assert_eq!(lines[0].1, "EDIT_OVW r0, r1");
        assert_eq!(lines[1].1, "EDIT_INS r2, r3");
        assert_eq!(lines[2].1, "EDIT_DEL r4");
        assert_eq!(lines[3].1, "EDIT_BLIT r0, r1, r2");
    }

    #[test]
    fn disassemble_write_execute_inspect_roundtrip() {
        // The complete self-authoring trifecta: WRITE, EXECUTE, INSPECT
        let mut agent = GasmAgent::new(4096);

        // 1. WRITE: Plant a program at addr 500 that adds two numbers
        agent.write_ram(
            500,
            &[
                op::LDI as u32,
                0,
                15, // LDI r0, 15
                op::LDI as u32,
                1,
                25, // LDI r1, 25
                op::ADD as u32,
                0,
                1, // ADD r0, r1  (r0 = 40)
                op::PSET as u32,
                5,
                5,
                7, // PSET r5, r5, r7 -- coords from regs
                op::HALT as u32,
            ],
        );

        // 2. INSPECT (before execution): verify the bytecode is correct
        let listing = agent.disassemble(500, 14);
        assert_eq!(listing[0].1, "LDI r0, 15");
        assert_eq!(listing[1].1, "LDI r1, 25");
        assert_eq!(listing[2].1, "ADD r0, r1");
        assert_eq!(listing[3].1, "PSET r5, r5, r7");
        assert_eq!(listing[4].1, "HALT");

        // 3. EXECUTE: run the planted program
        let result = agent.execute_from(500);
        assert!(result.halted);
        assert_eq!(result.reg(0), 40);
    }

    #[test]
    fn disasm_convenience_formatting() {
        let mut agent = GasmAgent::new(256);
        agent.load_gasm("LDI r0, 42\nADD r0, r1\nHALT").unwrap();
        let output = agent.disasm(0, 7);
        assert!(output.contains("0000: LDI r0, 42"));
        assert!(output.contains("0003: ADD r0, r1"));
        assert!(output.contains("0006: HALT"));
        // Should be multi-line
        assert_eq!(output.lines().count(), 3);
    }
}
