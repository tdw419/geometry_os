# WASM Swarm Executor - Design Document

**Date**: 2026-02-14
**Phase**: J.3 - GPU Optimization
**Goal**: 10x WASM→WebGPU performance via parallel agent execution

---

## Executive Summary

Optimize the WASM GPU Bridge to execute **1024 concurrent WASM agents** in a single GPU dispatch, achieving 10x+ throughput improvement for parallel-friendly workloads.

### Key Metrics

| Metric | Current | Target | Improvement |
|--------|---------|--------|-------------|
| Concurrent instances | 1 | 1024 | 1024x |
| Dispatch call overhead | Per-instance | Single call | 1024x |
| Memory efficiency | Per-instance allocation | Pool allocation | Zero overhead spawn |
| Target throughput | ~1x | 10x+ | Via parallelism |

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                     HOST (Python)                               │
├─────────────────────────────────────────────────────────────────┤
│  SwarmManager                                                   │
│  ├─ load_bytecode(wasm_bytes)     → Shared bytecode buffer      │
│  ├─ spawn_agent(entry_point, ...) → Pool slot assignment        │
│  ├─ dispatch(count)               → GPU compute dispatch        │
│  └─ harvest_results()             → Return values per agent     │
└───────────────────────┬─────────────────────────────────────────┘
                        │ wgpu API
┌───────────────────────▼─────────────────────────────────────────┐
│                   GPU Compute Shader                            │
├─────────────────────────────────────────────────────────────────┤
│  dispatch(1024, 1, 1) workgroups                                │
│                                                                 │
│  ┌─────────────┐ ┌─────────────┐     ┌─────────────┐           │
│  │ WG 0        │ │ WG 1        │ ... │ WG 1023     │           │
│  │ Agent #0    │ │ Agent #1    │     │ Agent #1023 │           │
│  │ mem[0:64KB] │ │ mem[64:128] │     │ mem[64MB-64]│           │
│  └─────────────┘ └─────────────┘     └─────────────┘           │
│                                                                 │
│  Bindings:                                                      │
│  [0] Shared WASM bytecode (read-only)                           │
│  [1] Agent Pool memory (64MB, read-write)                       │
│  [2] Globals per instance (16KB, slotted)                       │
│  [3] Output buffer (4MB, agent results)                         │
│  [4] Config uniform (entry_point, max_instructions, count)      │
└─────────────────────────────────────────────────────────────────┘
```

---

## Memory Model

### Pool Structure

```
Agent Pool Buffer (64MB = 1024 × 64KB)
┌────────────────────────────────────────────────────────────────┐
│  Instance 0      Instance 1      Instance 2           Instance 1023
│  ┌────────────┐  ┌────────────┐  ┌────────────┐  ...  ┌────────────┐
│  │ 64KB Slice │  │ 64KB Slice │  │ 64KB Slice │       │ 64KB Slice │
│  │ 0x00000    │  │ 0x10000    │  │ 0x20000    │       │ 0x3FF0000  │
│  └────────────┘  └────────────┘  └────────────┘       └────────────┘
└────────────────────────────────────────────────────────────────┘

Globals Buffer (16KB = 1024 × 16 u32)
┌────────────────────────────────────────────────────────────────┐
│  Instance 0      Instance 1              Instance 1023          │
│  ┌────────────┐  ┌────────────┐  ...  ┌────────────┐           │
│  │ 16 globals │  │ 16 globals │       │ 16 globals │           │
│  │ [0..15]    │  │ [16..31]   │       │ [16368..]  │           │
│  └────────────┘  └────────────┘       └────────────┘           │
└────────────────────────────────────────────────────────────────┘

Output Buffer (4MB = 1024 × 4KB)
┌────────────────────────────────────────────────────────────────┐
│  Each agent writes return value + output data to its slice     │
│  Output offset = instance_id × 4096                            │
└────────────────────────────────────────────────────────────────┘
```

### VRAM Footprint

| Buffer | Size | Purpose |
|--------|------|---------|
| Bytecode | Variable (shared) | WASM instructions |
| Agent Pool | 64 MB | Linear memory per agent |
| Globals | 16 KB | 16 globals × 1024 agents |
| Output | 4 MB | Results per agent |
| **Total** | **~68 MB** | Within modern GPU limits |

### Addressing (WGSL)

```wgsl
const AGENT_MEMORY_SIZE: u32 = 65536u;  // 64KB
const GLOBALS_PER_AGENT: u32 = 16u;

let instance_id = workgroup_id.x;
let memory_base = instance_id * AGENT_MEMORY_SIZE;
let globals_base = instance_id * GLOBALS_PER_AGENT;

// Instance-aware memory access
fn agent_load_u32(memory_base: u32, addr: u32) -> u32 {
    let word_addr = (memory_base + addr) / 4u;
    return agent_pool[word_addr];
}

fn agent_store_u32(memory_base: u32, addr: u32, value: u32) {
    let word_addr = (memory_base + addr) / 4u;
    agent_pool[word_addr] = value;
}
```

---

## Shader Refactoring

### Before (Single Instance)

```wgsl
@compute @workgroup_size(64)
fn main(@builtin(local_invocation_id) local_id: vec3<u32>) {
    if local_id.x == 0u {  // Only 1 thread!
        // Execute WASM...
    }
}
```

### After (1024 Instances)

```wgsl
@compute @workgroup_size(1, 1, 1)  // 1 workgroup = 1 agent
fn main(@builtin(workgroup_id) wg_id: vec3<u32>,
        @builtin(local_invocation_id) local_id: vec3<u32>) {

    let instance_id = wg_id.x;

    // Guard: Don't exceed active count
    if instance_id >= config.active_agent_count {
        return;
    }

    // Compute memory boundaries
    let memory_base = instance_id * AGENT_MEMORY_SIZE;
    let globals_base = instance_id * GLOBALS_PER_AGENT;

    // Initialize instance state
    var pc = config.entry_point;
    var instruction_count = 0u;

    // Execution loop
    while pc < config.bytecode_size && instruction_count < config.max_instructions {
        let opcode = read_u8(pc);
        pc += 1u;
        execute_instruction_instance(opcode, &pc, memory_base, globals_base);
        instruction_count += 1u;
    }

    // Write return value
    output_buffer[instance_id * 1024u] = globals[globals_base];
}
```

### Key Changes

| Aspect | Before | After |
|--------|--------|-------|
| Workgroup size | 64 | 1 |
| Instance ID | None | `workgroup_id.x` |
| Memory | Direct | Offset by `memory_base` |
| Globals | Direct | Offset by `globals_base` |
| Dispatch | `dispatch(1,1,1)` | `dispatch(1024,1,1)` |

---

## Host-Side API

### SwarmManager Class

```python
class SwarmManager:
    """
    Manages parallel WASM agent execution on GPU.
    Supports up to 1024 concurrent agents with 64KB memory each.
    """

    MAX_AGENTS = 1024
    AGENT_MEMORY_SIZE = 64 * 1024  # 64KB
    GLOBALS_PER_AGENT = 16

    def __init__(self, shader_path: str = None): ...

    def load_bytecode(self, wasm_bytes: bytes) -> None:
        """Upload shared WASM bytecode (all agents run same code)."""

    def spawn_agent(self,
                    entry_point: int = 0,
                    memory_init: bytes = None,
                    args: List[int] = None) -> int:
        """Spawn new agent, return agent_id."""

    def dispatch(self, agent_ids: List[int] = None) -> SwarmResult:
        """Execute agents in parallel."""

    def get_agent_memory(self, agent_id: int) -> bytes:
        """Read agent's linear memory."""

    def set_agent_memory(self, agent_id: int, data: bytes) -> None:
        """Write agent's linear memory."""

    def kill_agent(self, agent_id: int) -> None:
        """Remove agent, free pool slot."""
```

### Data Classes

```python
@dataclass
class AgentState:
    agent_id: int
    pool_slot: int
    entry_point: int
    is_active: bool = True

@dataclass
class SwarmResult:
    agent_results: Dict[int, int]       # agent_id → return_value
    agent_outputs: Dict[int, bytes]     # agent_id → output data
    instruction_counts: Dict[int, int]  # agent_id → instructions
    total_time_ms: float
```

### Usage Example

```python
# Initialize
swarm = SwarmManager()
swarm.load_bytecode(wasm_bytes)

# Spawn 1024 agents
for i in range(1024):
    swarm.spawn_agent(entry_point=0, args=[i])

# Single dispatch runs all agents
result = swarm.dispatch()

# Check results
for agent_id, val in result.agent_results.items():
    print(f"Agent {agent_id}: {val}")
```

---

## Data Flow

### Spawn Phase

```
Python                      GPU Buffers
───────                     ───────────
load_bytecode(wasm)  ───►  bytecode_buffer [shared]

spawn_agent(0)       ───►  pool[0:64KB] = zeros
                            globals[0:15] = args

spawn_agent(1)       ───►  pool[64KB:128KB] = zeros
                            globals[16:31] = args

...spawn N agents...
```

### Dispatch Phase

```
Python                      GPU Compute
───────                     ───────────
dispatch()           ───►  dispatch_workgroups(active_count, 1, 1)

                           ┌─────────────────────────────────┐
                           │ Parallel Execution:             │
                           │ WG 0: Agent 0 executes WASM     │
                           │ WG 1: Agent 1 executes WASM     │
                           │ ...                             │
                           │ WG N: Agent N executes WASM     │
                           └─────────────────────────────────┘
```

### Harvest Phase

```
GPU Buffers                 Python
───────────                 ───────
output_buffer[0]     ───►  result.agent_results[0]
output_buffer[1]     ───►  result.agent_results[1]
...

pool[0:64KB]         ───►  get_agent_memory(0) [optional]
```

### Config Uniform

```python
config_data = np.array([
    len(wasm_bytes),         # bytecode_size
    active_agent_count,      # Number of agents
    entry_point,             # Starting PC
    max_instructions,        # Limit per agent
    0, 0, 0, 0               # Padding
], dtype=np.uint32)
```

---

## Error Handling

### GPU-Side Guards

```wgsl
// Bounds checking
if instance_id >= config.active_agent_count { return; }
if pc >= config.bytecode_size { break; }
if instruction_count >= config.max_instructions { break; }

// Memory bounds
fn agent_load_safe(memory_base: u32, addr: u32, size: u32) -> u32 {
    if addr + size > AGENT_MEMORY_SIZE { return 0u; }
    return agent_load_u32(memory_base, addr);
}
```

### Host-Side Validation

```python
def spawn_agent(self, ...):
    if self.next_agent_id >= self.MAX_AGENTS:
        raise SwarmCapacityError("Maximum agents (1024) reached")
    if len(memory_init or b'') > self.AGENT_MEMORY_SIZE:
        raise ValueError("Memory init exceeds 64KB limit")
```

---

## Testing Strategy

### Unit Tests

| Test | Description |
|------|-------------|
| `test_pool_allocation` | Verify memory slices don't overlap |
| `test_globals_isolation` | Agents can't access other globals |
| `test_spawn_limit` | Error on 1025th agent |
| `test_single_agent` | Dispatch 1 agent, verify result |
| `test_dispatch_partial` | Dispatch subset of active agents |

### Integration Tests

| Test | Description |
|------|-------------|
| `test_1024_agents` | Full capacity dispatch |
| `test_fibonacci_swarm` | 1024 agents computing fib |
| `test_memory_persistence` | State survives across dispatches |
| `test_result_harvest` | All return values readable |

### Performance Benchmarks

| Benchmark | Metric |
|-----------|--------|
| `bench_dispatch_latency` | Time to dispatch 1024 agents |
| `bench_throughput` | Instructions/sec across all agents |
| `bench_scaling` | Performance at 1, 10, 100, 1000 agents |

---

## Files to Create/Modify

### New Files

| File | Purpose |
|------|---------|
| `systems/pixel_compiler/swarm_manager.py` | Host-side manager class |
| `systems/pixel_compiler/tests/test_swarm_manager.py` | Unit tests |
| `pixelrts_v2/shaders/wasm_swarm.wgsl` | Refactored shader |

### Modified Files

| File | Changes |
|------|---------|
| `systems/pixel_compiler/wasm_gpu_bridge.py` | Add swarm mode support |
| `systems/pixel_compiler/wasm_runtime.py` | Add swarm runtime wrapper |

---

## Success Criteria

- [ ] SwarmManager can spawn 1024 agents
- [ ] Single dispatch executes all agents in parallel
- [ ] Memory isolation between agents verified
- [ ] All return values correctly harvested
- [ ] 10x+ throughput improvement vs single-instance
- [ ] All existing WASM tests still pass
