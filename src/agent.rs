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
//   5. Returns a result with issues, register state, and execution stats
//
// The GasmAgent is the primary agent: it takes .gasm source, assembles it,
// executes it, and bridges ISSUE_CREATE opcode output into the forge queue.
//
// Usage:
//   let agent = GasmAgent::new(4096);
//   let result = agent.run_gasm("LDI r0, 42\nISSUE_CREATE\nHALT");
//   for issue in result.issues {
//       println!("Issue #{}: tag={} payload={} priority={:?}",
//                issue.id, issue.tag, issue.payload, issue.priority);
//   }
// ═══════════════════════════════════════════════════════════════════════

use crate::assembler::{self, Assembled};
use crate::forge::{ForgeQueue, Issue};
use crate::vm::{Vm, MAX_CYCLES};

/// Outcome of an agent execution run.
#[derive(Debug, Clone)]
pub struct AgentResult {
    /// Issues drained from the forge queue after execution.
    pub issues: Vec<Issue>,
    /// Final register state (r0..r31).
    pub regs: [u32; 32],
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
}

/// Errors that can occur during agent execution.
#[derive(Debug, Clone)]
pub enum AgentError {
    /// Assembly failed.
    AssemblyFailed { line: usize, message: String },
    /// VM execution exceeded cycle limit.
    CycleLimitExceeded { cycles: u32 },
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
#[derive(Debug)]
pub struct GasmAgent {
    /// The underlying VM.
    vm: Vm,
    /// RAM size for new VM instances.
    ram_size: usize,
}

impl GasmAgent {
    /// Create a new GasmAgent with the given RAM size (in pixels).
    pub fn new(ram_size: usize) -> Self {
        GasmAgent {
            vm: Vm::new(ram_size),
            ram_size,
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

        let cycles = self.vm.run();

        AgentResult {
            issues: self.vm.forge.drain(),
            regs: self.vm.regs,
            cycles,
            halted: self.vm.halted,
            yielded: self.vm.yielded,
            children_spawned: self.vm.children.len(),
            labels: std::collections::HashMap::new(),
        }
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

        let cycles = self.vm.run();

        // Check if we hit the cycle limit without halting
        if cycles >= MAX_CYCLES && !self.vm.halted && !self.vm.yielded {
            return Err(AgentError::CycleLimitExceeded { cycles });
        }

        Ok(AgentResult {
            issues: self.vm.forge.drain(),
            regs: self.vm.regs,
            cycles,
            halted: self.vm.halted,
            yielded: self.vm.yielded,
            children_spawned: self.vm.children.len(),
            labels,
        })
    }

    fn forge(&self) -> &ForgeQueue {
        &self.vm.forge
    }

    fn forge_mut(&mut self) -> &mut ForgeQueue {
        &mut self.vm.forge
    }

    fn reset(&mut self) {
        self.vm = Vm::new(self.ram_size);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forge::Priority;

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
        assert_eq!(result.issues[0].priority, Priority::High); // 3 & 3 = High
    }
}
