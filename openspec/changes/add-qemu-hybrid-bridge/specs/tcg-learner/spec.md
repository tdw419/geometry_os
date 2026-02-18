# TCG Learner Specification

**Component**: TCG Learning Pipeline  
**Version**: 1.0.0  
**Status**: Proposed  
**Updated**: 2026-01-17

## Overview

The TCG Learner traces QEMU instruction execution via TCG plugins, identifies high-frequency patterns, and synthesizes equivalent Pixel CPU microcode using SMT solvers, enabling gradual migration from software emulation to GPU-native execution.

## ADDED Requirements

### Requirement: TCG Plugin Integration (REQ-TL-001)
**Priority**: MUST  
**Category**: Execution Tracing

The system SHALL provide a QEMU TCG plugin that logs instruction execution to a shared memory ring buffer.

#### Scenario: Plugin Installation
- **GIVEN** a QEMU VM launched with plugin support
- **WHEN** the `trace_logger.so` plugin is loaded via `-plugin` flag
- **THEN** the plugin SHALL:
  - Register instruction execution callbacks via `qemu_plugin_register_vcpu_insn_exec_cb`
  - Allocate a 16MB ring buffer in `/dev/shm/qemu_trace_{vm_id}`
  - Begin logging PC, disassembly, and register state for every executed instruction

#### Scenario: Instruction Trace Entry
- **GIVEN** a guest instruction executing (e.g., `ADD EAX, EBX`)
- **WHEN** the TCG plugin callback is invoked
- **THEN** the plugin SHALL write a trace entry containing:
  - **Timestamp**: Monotonic time in microseconds
  - **PC**: Program counter (instruction address)
  - **Disassembly**: Human-readable instruction string
  - **Opcode**: Raw x86 opcode bytes
  - **Registers**: Pre-execution register state (EAX, EBX, etc.)
  - **Memory**: Load/store addresses and values (if applicable)

### Requirement: Trace Consumer (REQ-TL-002)
**Priority**: MUST  
**Category**: Data Processing

The system SHALL provide a Rust component that reads the trace ring buffer and builds execution graphs.

#### Scenario: Ring Buffer Consumption
- **GIVEN** a TCG plugin writing trace entries at 10K instructions/sec
- **WHEN** the `TraceReader` consumes the ring buffer
- **THEN** the reader SHALL:
  - Memory-map `/dev/shm/qemu_trace_{vm_id}` using `memmap2`
  - Parse trace entries in lock-free manner (wait-free reads)
  - Handle wrap-around when buffer fills (circular buffer)
  - Maintain read cursor to avoid re-processing entries

#### Scenario: Control Flow Graph Construction
- **GIVEN** a sequence of trace entries
- **WHEN** building the execution graph
- **THEN** the system SHALL:
  - Identify basic blocks (sequences ending in branch/jump)
  - Detect loops (back-edges in control flow)
  - Calculate execution frequency per basic block
  - Classify blocks by complexity (simple ALU, complex memory, privileged)

### Requirement: Pattern Recognition (REQ-TL-003)
**Priority**: MUST  
**Category**: Machine Learning

The system SHALL identify high-frequency instruction sequences suitable for GPU offload.

#### Scenario: Hot Path Detection
- **GIVEN** execution traces over 10 seconds of VM runtime
- **WHEN** analyzing basic block frequencies
- **THEN** the system SHALL:
  - Rank blocks by execution count (descending)
  - Identify "hot paths" exceeding 10,000 executions
  - Filter out privileged instructions (Ring 0 ops, I/O)
  - Prioritize simple patterns (register-to-register ops, arithmetic)

#### Scenario: Sequence Clustering
- **GIVEN** multiple hot paths with similar instruction patterns
- **WHEN** performing clustering analysis
- **THEN** the system SHALL:
  - Group semantically equivalent sequences (e.g., `ADD EAX, EBX` ≈ `ADD ECX, EDX`)
  - Identify parameterizable patterns (template + operands)
  - Reduce synthesis workload by reusing templates

### Requirement: Microcode Synthesis (REQ-TL-004)
**Priority**: MUST  
**Category**: Code Generation

The system SHALL synthesize Pixel CPU microcode from x86 instruction sequences using SMT solvers.

#### Scenario: Simple ALU Synthesis
- **GIVEN** an x86 instruction `ADD EAX, EBX`
- **WHEN** requesting microcode synthesis
- **THEN** the system SHALL:
  - Generate Z3 constraints encoding x86 semantics:
    - `EAX_out = EAX_in + EBX_in`
    - `ZF = (EAX_out == 0)`
    - `CF = (EAX_out < EAX_in)`  // Carry flag
  - Synthesize Pixel CPU instruction sequence:
    ```
    MOV R0, EAX   // Load operands
    MOV R1, EBX
    ADD R0, R1    // Perform addition
    MOV EAX, R0   // Store result
    ```
  - Verify semantic equivalence via symbolic execution

#### Scenario: Complex Sequence Synthesis
- **GIVEN** a multi-instruction sequence (e.g., loop iteration)
- **WHEN** synthesis is requested
- **THEN** the system SHALL:
  - Decompose into sub-patterns
  - Synthesize each sub-pattern independently
  - Compose into final microcode sequence
  - Optimize for Pixel CPU constraints (register count, instruction set)

#### Scenario: Synthesis Failure Handling
- **GIVEN** an unsupported x86 instruction (e.g., `CPUID`, `RDTSC`)
- **WHEN** synthesis is attempted
- **THEN** the system SHALL:
  - Detect unsupported opcodes
  - Mark the basic block as "QEMU-only"
  - Log the failure for future ISA extension
  - Continue with other patterns

### Requirement: Verification (REQ-TL-005)
**Priority**: MUST  
**Category**: Correctness

The system SHALL verify that synthesized microcode is semantically equivalent to the original x86 code.

#### Scenario: Symbolic Execution Verification
- **GIVEN** synthesized Pixel CPU microcode for `ADD EAX, EBX`
- **WHEN** performing verification
- **THEN** the system SHALL:
  - Symbolically execute both x86 and Pixel CPU versions
  - Assert equivalence of output states (registers, flags, memory)
  - Use Z3 solver to prove or disprove equivalence
  - Reject microcode if proof fails

#### Scenario: Concrete Test Case Validation
- **GIVEN** verified microcode
- **WHEN** running concrete test cases
- **THEN** the system SHALL:
  - Generate random input states (register values)
  - Execute both x86 (via QEMU) and Pixel CPU versions
  - Compare output states bit-for-bit
  - Require 10,000+ test cases to pass before deployment

### Requirement: Microcode Library (REQ-TL-006)
**Priority**: SHOULD  
**Category**: Performance Optimization

The system SHALL cache synthesized microcode to avoid redundant synthesis.

#### Scenario: Cache Storage
- **GIVEN** successfully synthesized and verified microcode
- **WHEN** storing in the library
- **THEN** the system SHALL:
  - Compute a hash of the x86 instruction sequence
  - Store as JSON: `{"x86_hash": "abc123", "pixel_ops": [...]}`
  - Save to `systems/pixel_cpu/microcode/{hash}.json`
  - Index by hash for fast lookup

#### Scenario: Cache Retrieval
- **GIVEN** a hot path requiring synthesis
- **WHEN** checking the microcode library
- **THEN** the system SHALL:
  - Compute hash of the x86 sequence
  - Look up in the cache
  - Return cached microcode if found (skip synthesis)
  - Proceed with synthesis only if cache miss

### Requirement: Hybrid Execution Orchestration (REQ-TL-007)
**Priority**: SHOULD  
**Category**: Runtime Optimization

The system SHALL dynamically switch execution between QEMU and Pixel CPU based on learned patterns.

#### Scenario: Hot Path Offload
- **GIVEN** a basic block with synthesized microcode executing >10K times
- **WHEN** the hybrid executor detects the hot path
- **THEN** the system SHALL:
  - Patch QEMU TCG to redirect execution to Pixel CPU
  - Transfer register state from QEMU to GPU
  - Execute microcode on Pixel CPU
  - Transfer results back to QEMU
  - Measure speedup ratio (Pixel CPU time / QEMU time)

#### Scenario: Fallback to QEMU
- **GIVEN** a basic block with unsupported instructions
- **WHEN** execution reaches that block
- **THEN** the system SHALL:
  - Detect the "QEMU-only" marker
  - Continue execution in QEMU TCG
  - Log the fallback event for analysis
  - Avoid repeated offload attempts for that block

### Requirement: Performance Targets (REQ-TL-008)
**Priority**: MUST  
**Category**: Performance

The system SHALL meet the following learning and execution benchmarks:

#### Scenario: Trace Throughput
- **GIVEN** a QEMU VM executing typical workload
- **WHEN** measuring trace capture rate
- **THEN** the system SHALL:
  - Capture >10,000 instructions/sec to ring buffer
  - Consume traces with <1ms lag behind real-time
  - Maintain <5% CPU overhead for tracing

#### Scenario: Synthesis Latency
- **GIVEN** a simple ALU instruction sequence (1-5 instructions)
- **WHEN** performing synthesis
- **THEN** the system SHALL:
  - Complete synthesis in <100ms (median)
  - Complete verification in <50ms (median)
  - Support offline batch processing for complex patterns

#### Scenario: Execution Speedup
- **GIVEN** a hot path executing on Pixel CPU
- **WHEN** comparing to QEMU TCG execution
- **THEN** the system SHALL:
  - Achieve >5x speedup for simple ALU operations
  - Achieve >2x speedup for memory-intensive operations
  - Measure and log speedup ratios for all offloaded blocks

## API Specification

### Rust API

```rust
pub struct TraceReader {
    mmap: memmap2::Mmap,
    read_cursor: AtomicUsize,
}

impl TraceReader {
    pub fn new(vm_id: &str) -> Result<Self, TraceError>;
    pub fn read_entry(&mut self) -> Option<TraceEntry>;
}

pub struct TraceEntry {
    pub timestamp: u64,
    pub pc: u64,
    pub disassembly: String,
    pub opcode: Vec<u8>,
    pub registers: RegisterState,
}

pub struct PatternRecognizer {
    cfg: ControlFlowGraph,
    hot_paths: HashMap<u64, usize>,  // PC → execution count
}

impl PatternRecognizer {
    pub fn analyze(&mut self, traces: &[TraceEntry]);
    pub fn get_hot_paths(&self, threshold: usize) -> Vec<BasicBlock>;
}

pub struct MicrocodeSynthesizer {
    solver: z3::Solver,
    cache: MicrocodeLibrary,
}

impl MicrocodeSynthesizer {
    pub fn synthesize(&mut self, x86_seq: &[X86Instruction]) -> Result<Vec<PixelOp>, SynthesisError>;
    pub fn verify(&self, x86_seq: &[X86Instruction], pixel_ops: &[PixelOp]) -> bool;
}
```

### C API (TCG Plugin)

```c
// systems/qemu_bridge/tcg_plugin/trace_logger.c

typedef struct {
    uint64_t timestamp;
    uint64_t pc;
    char disassembly[64];
    uint8_t opcode[16];
    uint8_t opcode_len;
} TraceEntry;

void on_insn_exec(unsigned int cpu_index, void *udata);
int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info, int argc, char **argv);
```

## Algorithm Specification

### Z3 Constraint Generation (Example: ADD)

```rust
fn generate_add_constraints(ctx: &z3::Context, solver: &z3::Solver) {
    let eax_in = BitVec::new_const(ctx, "eax_in", 32);
    let ebx_in = BitVec::new_const(ctx, "ebx_in", 32);
    
    // x86 semantics
    let eax_out_x86 = eax_in.bvadd(&ebx_in);
    let zf_x86 = eax_out_x86._eq(&BitVec::from_u64(ctx, 0, 32));
    let cf_x86 = eax_out_x86.bvult(&eax_in);  // Unsigned overflow
    
    // Pixel CPU semantics (candidate)
    let r0 = BitVec::new_const(ctx, "r0", 32);
    let r1 = BitVec::new_const(ctx, "r1", 32);
    let result = r0.bvadd(&r1);
    
    // Equivalence constraints
    solver.assert(&r0._eq(&eax_in));
    solver.assert(&r1._eq(&ebx_in));
    solver.assert(&result._eq(&eax_out_x86));
    
    // Verify
    assert_eq!(solver.check(), SatResult::Sat);
}
```

## Testing Requirements

### Unit Tests
- [ ] `test_trace_reader`: Verify ring buffer parsing
- [ ] `test_cfg_construction`: Validate control flow graph building
- [ ] `test_hot_path_detection`: Ensure correct frequency ranking
- [ ] `test_add_synthesis`: Synthesize and verify ADD instruction
- [ ] `test_microcode_cache`: Validate cache hit/miss logic

### Integration Tests
- [ ] `test_tcg_plugin_load`: Load plugin in real QEMU VM
- [ ] `test_trace_capture`: Capture 10K+ instructions
- [ ] `test_end_to_end_synthesis`: Trace → analyze → synthesize → verify
- [ ] `test_hybrid_execution`: Execute hot path on Pixel CPU
- [ ] `test_performance_speedup`: Measure >2x speedup for learned code

### Correctness Tests
- [ ] `test_symbolic_verification`: Prove equivalence for 100+ patterns
- [ ] `test_concrete_validation`: Run 10K+ random test cases per pattern
- [ ] `test_fallback_correctness`: Ensure QEMU fallback produces correct results

## Security Considerations

### Sandboxing
- **TCG Plugin**: Runs in QEMU process (untrusted guest context)
- **Trace Buffer**: Read-only from Rust consumer (no guest → host writes)
- **Synthesized Code**: Verified before execution on Pixel CPU

### Validation
- **Formal Verification**: Z3 proofs for semantic equivalence
- **Concrete Testing**: Random test cases to catch edge cases
- **Audit Trail**: Log all synthesis attempts and results

## Dependencies

### External
- **QEMU**: Version 9.0.x with TCG plugin support
- **Z3 Solver**: Rust crate `z3 = "0.12"`
- **memmap2**: Rust crate `memmap2 = "0.9"`

### Internal
- **QEMU Bridge**: Provides VM management
- **Pixel CPU**: Target execution substrate
- **Hilbert Visualizer**: Optional visualization of hot paths

## Acceptance Criteria

- [ ] TCG plugin captures >10K instructions/sec
- [ ] Trace consumer processes with <1ms lag
- [ ] Pattern recognizer identifies hot paths correctly
- [ ] Synthesizer generates correct microcode for 50+ x86 instructions
- [ ] Verification proves equivalence for all synthesized code
- [ ] Microcode cache reduces synthesis time by >90% for repeated patterns
- [ ] Hybrid execution achieves >2x speedup for learned code
- [ ] All tests pass
- [ ] Documentation complete

---

**Status**: Ready for implementation pending proposal approval.
