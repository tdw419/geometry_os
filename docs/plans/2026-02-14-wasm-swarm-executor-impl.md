# WASM Swarm Executor Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement 1024-agent parallel WASM execution on GPU via workgroup-per-instance dispatch.

**Architecture:** Single GPU dispatch runs N workgroups, each executing one WASM agent with isolated 64KB memory slice from a 64MB pool. Shared bytecode buffer, slab-allocated agent memory, host-side SwarmManager API.

**Tech Stack:** Python 3.12, wgpu-py, WGSL compute shaders, NumPy

---

## Task 1: Create SwarmManager Skeleton

**Files:**
- Create: `systems/pixel_compiler/swarm_manager.py`
- Test: `systems/pixel_compiler/tests/test_swarm_manager.py`

**Step 1: Write the failing test**

```python
# systems/pixel_compiler/tests/test_swarm_manager.py
"""Tests for SwarmManager - parallel WASM agent execution."""

import pytest
import numpy as np


class TestSwarmManagerInit:
    """Test SwarmManager initialization."""

    def test_import_swarm_manager(self):
        """SwarmManager can be imported."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        assert SwarmManager is not None

    def test_swarm_manager_instantiation(self):
        """SwarmManager can be instantiated."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        assert manager is not None

    def test_swarm_manager_constants(self):
        """SwarmManager has correct constants."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        assert SwarmManager.MAX_AGENTS == 1024
        assert SwarmManager.AGENT_MEMORY_SIZE == 64 * 1024  # 64KB
        assert SwarmManager.GLOBALS_PER_AGENT == 16
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write minimal implementation**

```python
# systems/pixel_compiler/swarm_manager.py
"""
SwarmManager - Parallel WASM agent execution on GPU.

Supports up to 1024 concurrent agents with 64KB memory each.
"""

from typing import Dict, List, Optional
from dataclasses import dataclass, field
import numpy as np

try:
    import wgpu
except ImportError:
    wgpu = None


@dataclass
class AgentState:
    """Tracks active agent state."""
    agent_id: int
    pool_slot: int
    entry_point: int
    is_active: bool = True


@dataclass
class SwarmResult:
    """Results from a swarm dispatch."""
    agent_results: Dict[int, int] = field(default_factory=dict)
    agent_outputs: Dict[int, bytes] = field(default_factory=dict)
    instruction_counts: Dict[int, int] = field(default_factory=dict)
    total_time_ms: float = 0.0


class SwarmManager:
    """
    Manages parallel WASM agent execution on GPU.

    Supports up to 1024 concurrent agents with 64KB memory each.
    Uses workgroup-per-instance dispatch for maximum isolation.
    """

    MAX_AGENTS = 1024
    AGENT_MEMORY_SIZE = 64 * 1024  # 64KB per agent
    GLOBALS_PER_AGENT = 16
    OUTPUT_SIZE_PER_AGENT = 4096  # 4KB per agent

    def __init__(self, shader_path: str = None):
        """Initialize SwarmManager with optional custom shader."""
        self.mock = wgpu is None

        # Agent tracking
        self.active_agents: Dict[int, AgentState] = {}
        self.slot_assignments: Dict[int, int] = {}  # agent_id -> slot
        self.free_slots: List[int] = list(range(self.MAX_AGENTS))
        self.next_agent_id = 0

        # Buffers (initialized on demand)
        self.device = None
        self.pool_buffer = None
        self.globals_buffer = None
        self.output_buffer = None
        self.bytecode_buffer = None
        self.config_buffer = None
        self.pipeline = None

        # Bytecode state
        self._bytecode_loaded = False
        self._bytecode_size = 0

        if not self.mock:
            self._init_gpu(shader_path)
        else:
            # Mock mode storage
            self._mock_pool = bytearray(self.MAX_AGENTS * self.AGENT_MEMORY_SIZE)
            self._mock_globals = np.zeros(self.MAX_AGENTS * self.GLOBALS_PER_AGENT, dtype=np.uint32)
            self._mock_bytecode = b""
            self._mock_output = np.zeros(self.MAX_AGENTS * self.OUTPUT_SIZE_PER_AGENT, dtype=np.uint32)

    def _init_gpu(self, shader_path: str = None):
        """Initialize GPU device and buffers."""
        from pathlib import Path

        try:
            adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
            self.device = adapter.request_device(required_features=[])

            # Create buffers
            pool_size = self.MAX_AGENTS * self.AGENT_MEMORY_SIZE
            globals_size = self.MAX_AGENTS * self.GLOBALS_PER_AGENT * 4
            output_size = self.MAX_AGENTS * self.OUTPUT_SIZE_PER_AGENT * 4

            self.pool_buffer = self.device.create_buffer(
                size=pool_size,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
            )
            self.globals_buffer = self.device.create_buffer(
                size=globals_size,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
            )
            self.output_buffer = self.device.create_buffer(
                size=output_size,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
            )
            self.config_buffer = self.device.create_buffer(
                size=32,  # 8 u32 values
                usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST
            )

            # Load shader
            if shader_path is None:
                workspace_root = Path(__file__).parent.parent.parent
                shader_path = str(workspace_root / "pixelrts_v2" / "shaders" / "wasm_swarm.wgsl")

            self._create_pipeline(shader_path)

        except Exception as e:
            print(f"Warning: GPU init failed: {e}. Using mock mode.")
            self.mock = True
            self._mock_pool = bytearray(self.MAX_AGENTS * self.AGENT_MEMORY_SIZE)
            self._mock_globals = np.zeros(self.MAX_AGENTS * self.GLOBALS_PER_AGENT, dtype=np.uint32)

    def _create_pipeline(self, shader_path: str):
        """Create compute pipeline from shader."""
        # Pipeline creation deferred until shader exists
        pass
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/tests/test_swarm_manager.py
git commit -m "feat(swarm): add SwarmManager skeleton with constants and init"
```

---

## Task 2: Implement load_bytecode()

**Files:**
- Modify: `systems/pixel_compiler/swarm_manager.py`
- Modify: `systems/pixel_compiler/tests/test_swarm_manager.py`

**Step 1: Write the failing test**

```python
# Add to systems/pixel_compiler/tests/test_swarm_manager.py

class TestSwarmManagerBytecode:
    """Test bytecode loading."""

    def test_load_bytecode_mock_mode(self):
        """Bytecode can be loaded in mock mode."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        assert manager.mock  # Ensure mock mode

        wasm = b'\x00asm\x01\x00\x00\x00'  # Minimal WASM header
        manager.load_bytecode(wasm)
        assert manager._bytecode_loaded is True

    def test_load_bytecode_size_tracked(self):
        """Bytecode size is tracked after loading."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        wasm = b'\x00asm' + b'\x00' * 100
        manager.load_bytecode(wasm)
        assert manager._bytecode_size == len(wasm)
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerBytecode -v`
Expected: FAIL with "AttributeError: 'SwarmManager' has no attribute 'load_bytecode'"

**Step 3: Write minimal implementation**

```python
# Add to SwarmManager class in systems/pixel_compiler/swarm_manager.py

    def load_bytecode(self, wasm_bytes: bytes) -> None:
        """
        Upload shared WASM bytecode to GPU.

        All agents will execute this same bytecode.
        Must be called before spawning agents.

        Args:
            wasm_bytes: WASM bytecode to upload
        """
        if self.mock:
            self._mock_bytecode = wasm_bytes
            self._bytecode_loaded = True
            self._bytecode_size = len(wasm_bytes)
            return

        # GPU mode: create/update bytecode buffer
        # Pad to 4-byte alignment for u32 access
        padded_size = ((len(wasm_bytes) + 3) // 4) * 4
        padded_wasm = wasm_bytes + b'\x00' * (padded_size - len(wasm_bytes))

        bytecode_array = np.frombuffer(padded_wasm, dtype=np.uint8)

        if self.bytecode_buffer is None or self.bytecode_buffer.size < padded_size:
            self.bytecode_buffer = self.device.create_buffer_with_data(
                data=bytecode_array,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST
            )
        else:
            self.device.queue.write_buffer(self.bytecode_buffer, 0, bytecode_array.tobytes())

        self._bytecode_loaded = True
        self._bytecode_size = len(wasm_bytes)
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerBytecode -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/tests/test_swarm_manager.py
git commit -m "feat(swarm): implement load_bytecode()"
```

---

## Task 3: Implement spawn_agent()

**Files:**
- Modify: `systems/pixel_compiler/swarm_manager.py`
- Modify: `systems/pixel_compiler/tests/test_swarm_manager.py`

**Step 1: Write the failing test**

```python
# Add to systems/pixel_compiler/tests/test_swarm_manager.py

class TestSwarmManagerSpawn:
    """Test agent spawning."""

    def test_spawn_single_agent(self):
        """Can spawn a single agent."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        agent_id = manager.spawn_agent()
        assert agent_id == 0
        assert len(manager.active_agents) == 1

    def test_spawn_multiple_agents(self):
        """Can spawn multiple agents with sequential IDs."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        ids = [manager.spawn_agent() for _ in range(5)]
        assert ids == [0, 1, 2, 3, 4]
        assert len(manager.active_agents) == 5

    def test_spawn_with_entry_point(self):
        """Agent can be spawned with custom entry point."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent(entry_point=42)
        assert manager.active_agents[agent_id].entry_point == 42

    def test_spawn_with_args(self):
        """Agent can be spawned with arguments."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent(args=[10, 20, 30])
        # Arguments stored in globals[1], globals[2], globals[3]
        assert agent_id is not None

    def test_spawn_exceeds_capacity(self):
        """Error when exceeding MAX_AGENTS."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        # Spawn max agents
        for _ in range(SwarmManager.MAX_AGENTS):
            manager.spawn_agent()

        # Next spawn should fail
        with pytest.raises(RuntimeError, match="capacity"):
            manager.spawn_agent()

    def test_spawn_requires_bytecode(self):
        """Spawn fails if bytecode not loaded."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        with pytest.raises(RuntimeError, match="bytecode"):
            manager.spawn_agent()
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerSpawn -v`
Expected: FAIL with "AttributeError"

**Step 3: Write minimal implementation**

```python
# Add to SwarmManager class in systems/pixel_compiler/swarm_manager.py

    def spawn_agent(self,
                    entry_point: int = 0,
                    memory_init: bytes = None,
                    args: List[int] = None) -> int:
        """
        Spawn a new agent instance.

        Args:
            entry_point: WASM function index to start execution
            memory_init: Initial bytes for agent's linear memory
            args: Arguments to pass via globals[1], globals[2], etc.

        Returns:
            agent_id: Unique identifier for this agent

        Raises:
            RuntimeError: If bytecode not loaded or capacity exceeded
        """
        if not self._bytecode_loaded:
            raise RuntimeError("Must call load_bytecode() before spawning agents")

        if not self.free_slots:
            raise RuntimeError(f"Swarm at capacity ({self.MAX_AGENTS} agents)")

        # Assign slot
        slot = self.free_slots.pop(0)
        agent_id = self.next_agent_id
        self.next_agent_id += 1

        # Track agent
        self.active_agents[agent_id] = AgentState(
            agent_id=agent_id,
            pool_slot=slot,
            entry_point=entry_point
        )
        self.slot_assignments[agent_id] = slot

        # Initialize memory
        if memory_init:
            self.set_agent_memory(agent_id, memory_init)

        # Initialize globals with arguments
        globals_base = slot * self.GLOBALS_PER_AGENT
        if args:
            for i, arg in enumerate(args):
                global_idx = globals_base + 1 + i  # globals[0] is return value
                if global_idx < globals_base + self.GLOBALS_PER_AGENT:
                    if self.mock:
                        self._mock_globals[global_idx] = arg
                    else:
                        # Will be batched on dispatch
                        pass

        return agent_id
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerSpawn -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/tests/test_swarm_manager.py
git commit -m "feat(swarm): implement spawn_agent() with slot allocation"
```

---

## Task 4: Implement kill_agent()

**Files:**
- Modify: `systems/pixel_compiler/swarm_manager.py`
- Modify: `systems/pixel_compiler/tests/test_swarm_manager.py`

**Step 1: Write the failing test**

```python
# Add to systems/pixel_compiler/tests/test_swarm_manager.py

class TestSwarmManagerKill:
    """Test agent removal."""

    def test_kill_agent(self):
        """Can kill an agent and free its slot."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent()
        assert len(manager.active_agents) == 1

        manager.kill_agent(agent_id)
        assert len(manager.active_agents) == 0
        assert agent_id not in manager.active_agents

    def test_kill_frees_slot(self):
        """Killing agent frees its slot for reuse."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        # Spawn and kill
        agent_id = manager.spawn_agent()
        slot = manager.active_agents[agent_id].pool_slot
        manager.kill_agent(agent_id)

        # Spawn again - should reuse slot
        new_id = manager.spawn_agent()
        assert manager.active_agents[new_id].pool_slot == slot

    def test_kill_nonexistent_raises(self):
        """Killing nonexistent agent raises error."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        with pytest.raises(KeyError):
            manager.kill_agent(999)
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerKill -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to SwarmManager class in systems/pixel_compiler/swarm_manager.py

    def kill_agent(self, agent_id: int) -> None:
        """
        Remove an agent and free its pool slot.

        Args:
            agent_id: ID of agent to remove

        Raises:
            KeyError: If agent_id not found
        """
        if agent_id not in self.active_agents:
            raise KeyError(f"Agent {agent_id} not found")

        state = self.active_agents[agent_id]
        slot = state.pool_slot

        # Remove from tracking
        del self.active_agents[agent_id]
        del self.slot_assignments[agent_id]

        # Free slot for reuse
        self.free_slots.append(slot)
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerKill -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/tests/test_swarm_manager.py
git commit -m "feat(swarm): implement kill_agent() with slot freeing"
```

---

## Task 5: Implement get/set_agent_memory()

**Files:**
- Modify: `systems/pixel_compiler/swarm_manager.py`
- Modify: `systems/pixel_compiler/tests/test_swarm_manager.py`

**Step 1: Write the failing test**

```python
# Add to systems/pixel_compiler/tests/test_swarm_manager.py

class TestSwarmManagerMemory:
    """Test agent memory access."""

    def test_set_agent_memory(self):
        """Can set agent memory."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent()
        test_data = b'Hello World!'

        manager.set_agent_memory(agent_id, test_data)

        # Verify it was written
        result = manager.get_agent_memory(agent_id, len(test_data))
        assert result == test_data

    def test_get_agent_memory_full(self):
        """Can read full 64KB memory."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_id = manager.spawn_agent()
        memory = manager.get_agent_memory(agent_id)
        assert len(memory) == SwarmManager.AGENT_MEMORY_SIZE

    def test_memory_isolation(self):
        """Agents have isolated memory."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        agent_a = manager.spawn_agent()
        agent_b = manager.spawn_agent()

        manager.set_agent_memory(agent_a, b'AAAA')
        manager.set_agent_memory(agent_b, b'BBBB')

        assert manager.get_agent_memory(agent_a, 4) == b'AAAA'
        assert manager.get_agent_memory(agent_b, 4) == b'BBBB'

    def test_memory_nonexistent_agent(self):
        """Memory access on nonexistent agent raises."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        with pytest.raises(KeyError):
            manager.get_agent_memory(999)
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerMemory -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to SwarmManager class in systems/pixel_compiler/swarm_manager.py

    def get_agent_memory(self, agent_id: int, size: int = None) -> bytes:
        """
        Read agent's linear memory.

        Args:
            agent_id: Agent to read from
            size: Bytes to read (default: full 64KB)

        Returns:
            Bytes from agent's memory

        Raises:
            KeyError: If agent_id not found
        """
        if agent_id not in self.active_agents:
            raise KeyError(f"Agent {agent_id} not found")

        slot = self.active_agents[agent_id].pool_slot
        memory_base = slot * self.AGENT_MEMORY_SIZE

        if size is None:
            size = self.AGENT_MEMORY_SIZE

        if self.mock:
            return bytes(self._mock_pool[memory_base:memory_base + size])

        # GPU mode: read from pool buffer
        data = self.device.queue.read_buffer(self.pool_buffer, memory_base, size)
        return data.tobytes()

    def set_agent_memory(self, agent_id: int, data: bytes) -> None:
        """
        Write to agent's linear memory.

        Args:
            agent_id: Agent to write to
            data: Bytes to write

        Raises:
            KeyError: If agent_id not found
            ValueError: If data exceeds 64KB
        """
        if agent_id not in self.active_agents:
            raise KeyError(f"Agent {agent_id} not found")

        if len(data) > self.AGENT_MEMORY_SIZE:
            raise ValueError(f"Data ({len(data)}) exceeds agent memory ({self.AGENT_MEMORY_SIZE})")

        slot = self.active_agents[agent_id].pool_slot
        memory_base = slot * self.AGENT_MEMORY_SIZE

        if self.mock:
            self._mock_pool[memory_base:memory_base + len(data)] = data
            return

        # GPU mode: write to pool buffer
        data_array = np.frombuffer(data, dtype=np.uint8)
        self.device.queue.write_buffer(self.pool_buffer, memory_base, data_array.tobytes())
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerMemory -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/tests/test_swarm_manager.py
git commit -m "feat(swarm): implement get/set_agent_memory() with isolation"
```

---

## Task 6: Create Swarm Shader Skeleton

**Files:**
- Create: `pixelrts_v2/shaders/wasm_swarm.wgsl`

**Step 1: Write the base shader**

```wgsl
// pixelrts_v2/shaders/wasm_swarm.wgsl
// ============================================
// GEOMETRY OS - WASM SWARM EXECUTOR
// Phase J.3: Parallel Agent Execution
// ============================================
//
// Executes up to 1024 WASM agents in parallel
// Each workgroup = 1 agent with 64KB memory

// ============================================
// CONSTANTS
// ============================================

const AGENT_MEMORY_SIZE: u32 = 65536u;  // 64KB
const GLOBALS_PER_AGENT: u32 = 16u;
const MAX_AGENTS: u32 = 1024u;

// ============================================
// BINDINGS
// ============================================

@group(0) @binding(0) var<storage, read> wasm_bytecode: array<u32>;
@group(0) @binding(1) var<storage, read_write> agent_pool: array<u32>;
@group(0) @binding(2) var<storage, read_write> globals: array<u32>;
@group(0) @binding(3) var<storage, read_write> output_buffer: array<u32>;
@group(0) @binding(4) var<uniform> config: SwarmConfig;

struct SwarmConfig {
    bytecode_size: u32,
    active_agent_count: u32,
    entry_point: u32,
    max_instructions: u32,
    _padding0: u32,
    _padding1: u32,
    _padding2: u32,
    _padding3: u32,
}

// ============================================
// MAIN ENTRY POINT
// ============================================

@compute @workgroup_size(1, 1, 1)
fn main(@builtin(workgroup_id) wg_id: vec3<u32>) {
    let instance_id = wg_id.x;

    // Guard: Don't exceed active count
    if instance_id >= config.active_agent_count {
        return;
    }

    // Compute memory boundaries for this agent
    let memory_base_u32 = instance_id * (AGENT_MEMORY_SIZE / 4u);
    let globals_base = instance_id * GLOBALS_PER_AGENT;

    // Initialize execution state
    var pc = config.entry_point;
    var instruction_count = 0u;

    // Simple execution loop (placeholder)
    // TODO: Import full WASM interpreter from wasm_vm.wgsl
    while pc < config.bytecode_size && instruction_count < config.max_instructions {
        let opcode = read_u8(pc);
        pc += 1u;

        // Placeholder: just count instructions
        instruction_count += 1u;

        // Stop at end opcode
        if opcode == 0x0Bu {  // OP_END
            break;
        }
    }

    // Write return value (globals[0] for this instance)
    output_buffer[instance_id] = globals[globals_base];
}

// ============================================
// BYTECODE READING HELPERS
// ============================================

fn read_u8(offset: u32) -> u32 {
    let word_index = offset / 4u;
    let byte_offset = offset % 4u;
    if word_index < arrayLength(&wasm_bytecode) {
        let word = wasm_bytecode[word_index];
        return (word >> (byte_offset * 8u)) & 0xFFu;
    }
    return 0u;
}
```

**Step 2: Verify shader syntax**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
from pathlib import Path
shader = Path('pixelrts_v2/shaders/wasm_swarm.wgsl').read_text()
print(f'Shader size: {len(shader)} bytes')
print('Contains main:', '@compute' in shader)
"`
Expected: Output shows shader loaded successfully

**Step 3: Commit**

```bash
git add pixelrts_v2/shaders/wasm_swarm.wgsl
git commit -m "feat(shaders): add wasm_swarm.wgsl skeleton"
```

---

## Task 7: Implement dispatch() Mock Mode

**Files:**
- Modify: `systems/pixel_compiler/swarm_manager.py`
- Modify: `systems/pixel_compiler/tests/test_swarm_manager.py`

**Step 1: Write the failing test**

```python
# Add to systems/pixel_compiler/tests/test_swarm_manager.py

class TestSwarmManagerDispatch:
    """Test agent dispatch."""

    def test_dispatch_returns_result(self):
        """Dispatch returns SwarmResult."""
        from systems.pixel_compiler.swarm_manager import SwarmManager, SwarmResult
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        manager.spawn_agent()
        result = manager.dispatch()

        assert isinstance(result, SwarmResult)

    def test_dispatch_all_active(self):
        """Dispatch runs all active agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        for _ in range(10):
            manager.spawn_agent()

        result = manager.dispatch()
        assert len(result.agent_results) == 10

    def test_dispatch_subset(self):
        """Dispatch can run subset of agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        ids = [manager.spawn_agent() for _ in range(5)]

        # Dispatch only first 2
        result = manager.dispatch(agent_ids=ids[:2])
        assert len(result.agent_results) == 2
        assert set(result.agent_results.keys()) == set(ids[:2])

    def test_dispatch_empty_swarm(self):
        """Dispatch on empty swarm returns empty result."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        result = manager.dispatch()
        assert len(result.agent_results) == 0
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerDispatch -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to SwarmManager class in systems/pixel_compiler/swarm_manager.py
import time

    def dispatch(self, agent_ids: List[int] = None, max_instructions: int = 10000) -> SwarmResult:
        """
        Execute agents in parallel on GPU.

        Args:
            agent_ids: Specific agents to run, or None for all active
            max_instructions: Execution limit per agent

        Returns:
            SwarmResult with per-agent return values and outputs
        """
        start_time = time.time()

        # Determine which agents to dispatch
        if agent_ids is None:
            agents_to_run = list(self.active_agents.keys())
        else:
            agents_to_run = [aid for aid in agent_ids if aid in self.active_agents]

        if not agents_to_run:
            return SwarmResult()

        # Determine max slot for dispatch count
        max_slot = max(self.active_agents[aid].pool_slot for aid in agents_to_run)
        active_count = max_slot + 1

        # Get entry point (assume same for all for now)
        entry_point = self.active_agents[agents_to_run[0]].entry_point

        if self.mock:
            # Mock execution: simulate results
            result = SwarmResult()
            for agent_id in agents_to_run:
                state = self.active_agents[agent_id]
                globals_base = state.pool_slot * self.GLOBALS_PER_AGENT

                # Mock: return globals[0] or 0
                return_val = int(self._mock_globals[globals_base]) if globals_base < len(self._mock_globals) else 0
                result.agent_results[agent_id] = return_val
                result.instruction_counts[agent_id] = 10  # Mock count

            result.total_time_ms = (time.time() - start_time) * 1000
            return result

        # GPU mode: Create config uniform
        config_data = np.array([
            self._bytecode_size,
            active_count,
            entry_point,
            max_instructions,
            0, 0, 0, 0  # Padding
        ], dtype=np.uint32)

        self.device.queue.write_buffer(self.config_buffer, 0, config_data.tobytes())

        # TODO: Create bind group and dispatch (Task 8)
        # For now, return mock-style results
        result = SwarmResult()
        for agent_id in agents_to_run:
            result.agent_results[agent_id] = 0
            result.instruction_counts[agent_id] = 0

        result.total_time_ms = (time.time() - start_time) * 1000
        return result
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerDispatch -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/tests/test_swarm_manager.py
git commit -m "feat(swarm): implement dispatch() mock mode"
```

---

## Task 8: Implement GPU Pipeline and Dispatch

**Files:**
- Modify: `systems/pixel_compiler/swarm_manager.py`
- Modify: `systems/pixel_compiler/tests/test_swarm_manager.py`

**Step 1: Write the failing test**

```python
# Add to systems/pixel_compiler/tests/test_swarm_manager.py

import pytest
import platform

class TestSwarmManagerGPUDispatch:
    """Test GPU dispatch (requires GPU)."""

    @pytest.mark.skipif(platform.system() == "CI", reason="No GPU in CI")
    def test_gpu_pipeline_creation(self):
        """GPU pipeline can be created."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        if manager.mock:
            pytest.skip("No GPU available")

        assert manager.device is not None

    @pytest.mark.skipif(platform.system() == "CI", reason="No GPU in CI")
    def test_gpu_dispatch_single_agent(self):
        """Can dispatch single agent on GPU."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        if manager.mock:
            pytest.skip("No GPU available")

        # Minimal WASM: just return
        wasm = bytes([
            0x00, 0x61, 0x73, 0x6d,  # magic
            0x01, 0x00, 0x00, 0x00,  # version
        ])
        manager.load_bytecode(wasm)
        manager.spawn_agent(entry_point=0)

        result = manager.dispatch(max_instructions=10)
        assert len(result.agent_results) == 1
```

**Step 2: Run test to verify it fails appropriately**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerGPUDispatch -v`
Expected: Tests skip or fail on pipeline creation

**Step 3: Write implementation**

```python
# Replace _create_pipeline in SwarmManager class

    def _create_pipeline(self, shader_path: str):
        """Create compute pipeline from swarm shader."""
        from pathlib import Path

        if not Path(shader_path).exists():
            # Shader doesn't exist yet, defer creation
            self._shader_path = shader_path
            return

        with open(shader_path, 'r') as f:
            shader_source = f.read()

        shader_module = self.device.create_shader_module(code=shader_source)

        # Bind group layout
        bg_layout_entries = [
            {"binding": 0, "visibility": wgpu.ShaderStage.COMPUTE,
             "buffer": {"type": wgpu.BufferBindingType.read_only_storage}},
            {"binding": 1, "visibility": wgpu.ShaderStage.COMPUTE,
             "buffer": {"type": wgpu.BufferBindingType.storage}},
            {"binding": 2, "visibility": wgpu.ShaderStage.COMPUTE,
             "buffer": {"type": wgpu.BufferBindingType.storage}},
            {"binding": 3, "visibility": wgpu.ShaderStage.COMPUTE,
             "buffer": {"type": wgpu.BufferBindingType.storage}},
            {"binding": 4, "visibility": wgpu.ShaderStage.COMPUTE,
             "buffer": {"type": wgpu.BufferBindingType.uniform}},
        ]

        bg_layout = self.device.create_bind_group_layout(entries=bg_layout_entries)
        pipeline_layout = self.device.create_pipeline_layout(bind_group_layouts=[bg_layout])

        self.pipeline = self.device.create_compute_pipeline(
            layout=pipeline_layout,
            compute={"module": shader_module, "entry_point": "main"}
        )
        self._bind_group_layout = bg_layout

    def _create_bind_group(self):
        """Create bind group for dispatch."""
        entries = [
            {"binding": 0, "resource": {"buffer": self.bytecode_buffer, "offset": 0, "size": self.bytecode_buffer.size}},
            {"binding": 1, "resource": {"buffer": self.pool_buffer, "offset": 0, "size": self.pool_buffer.size}},
            {"binding": 2, "resource": {"buffer": self.globals_buffer, "offset": 0, "size": self.globals_buffer.size}},
            {"binding": 3, "resource": {"buffer": self.output_buffer, "offset": 0, "size": self.output_buffer.size}},
            {"binding": 4, "resource": {"buffer": self.config_buffer, "offset": 0, "size": self.config_buffer.size}},
        ]
        return self.device.create_bind_group(layout=self._bind_group_layout, entries=entries)
```

Now update dispatch() to use GPU:

```python
# Replace GPU section in dispatch() method

        # GPU mode: Create config uniform
        config_data = np.array([
            self._bytecode_size,
            active_count,
            entry_point,
            max_instructions,
            0, 0, 0, 0
        ], dtype=np.uint32)

        self.device.queue.write_buffer(self.config_buffer, 0, config_data.tobytes())

        # Sync globals to GPU
        if hasattr(self, '_globals_dirty') and self._globals_dirty:
            self.device.queue.write_buffer(self.globals_buffer, 0, self._mock_globals.tobytes())
            self._globals_dirty = False

        # Create bind group and dispatch
        bind_group = self._create_bind_group()

        command_encoder = self.device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(self.pipeline)
        compute_pass.set_bind_group(0, bind_group, [], 0, 99)
        compute_pass.dispatch_workgroups(active_count, 1, 1)
        compute_pass.end()

        self.device.queue.submit([command_encoder.finish()])

        # Read results
        output_data = self.device.queue.read_buffer(self.output_buffer).tobytes()
        output_array = np.frombuffer(output_data, dtype=np.uint32)

        result = SwarmResult()
        for agent_id in agents_to_run:
            slot = self.active_agents[agent_id].pool_slot
            result.agent_results[agent_id] = int(output_array[slot])
            result.instruction_counts[agent_id] = max_instructions  # Approximate

        result.total_time_ms = (time.time() - start_time) * 1000
        return result
```

**Step 4: Run test**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_manager.py::TestSwarmManagerGPUDispatch -v`
Expected: PASS or skip if no GPU

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/tests/test_swarm_manager.py
git commit -m "feat(swarm): implement GPU pipeline and dispatch"
```

---

## Task 9: Scale Test - 1024 Agents

**Files:**
- Create: `systems/pixel_compiler/tests/test_swarm_scale.py`

**Step 1: Write the test**

```python
# systems/pixel_compiler/tests/test_swarm_scale.py
"""Scale tests for SwarmManager - 1024 agent capacity."""

import pytest
import time


class TestSwarmScale:
    """Test swarm at scale."""

    def test_spawn_1024_agents(self):
        """Can spawn maximum 1024 agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        start = time.time()
        for i in range(1024):
            manager.spawn_agent(args=[i])
        elapsed = time.time() - start

        assert len(manager.active_agents) == 1024
        print(f"Spawned 1024 agents in {elapsed*1000:.1f}ms")

    def test_dispatch_1024_agents(self):
        """Can dispatch 1024 agents."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm\x01\x00\x00\x00')

        for _ in range(1024):
            manager.spawn_agent()

        start = time.time()
        result = manager.dispatch()
        elapsed = time.time() - start

        assert len(result.agent_results) == 1024
        print(f"Dispatched 1024 agents in {elapsed*1000:.1f}ms")

    def test_spawn_kill_cycle(self):
        """Can spawn and kill agents repeatedly."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        manager.load_bytecode(b'\x00asm')

        for cycle in range(10):
            ids = [manager.spawn_agent() for _ in range(100)]
            for aid in ids:
                manager.kill_agent(aid)

        assert len(manager.active_agents) == 0
        # Slots should be recycled
        assert len(manager.free_slots) == 1024

    def test_memory_usage(self):
        """Memory usage is within bounds."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()

        # Pool: 64MB, Globals: 16KB, Output: 4MB
        expected_pool = 1024 * 64 * 1024
        expected_globals = 1024 * 16 * 4

        assert SwarmManager.MAX_AGENTS * SwarmManager.AGENT_MEMORY_SIZE == expected_pool
```

**Step 2: Run test**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_scale.py -v -s`
Expected: PASS with timing output

**Step 3: Commit**

```bash
git add systems/pixel_compiler/tests/test_swarm_scale.py
git commit -m "test(swarm): add scale tests for 1024 agents"
```

---

## Task 10: Integration with Existing WASM Runtime

**Files:**
- Modify: `systems/pixel_compiler/wasm_runtime.py`
- Create: `systems/pixel_compiler/tests/test_swarm_integration.py`

**Step 1: Write the test**

```python
# systems/pixel_compiler/tests/test_swarm_integration.py
"""Integration tests for SwarmManager with existing WASM tooling."""

import pytest


class TestSwarmWASMIntegration:
    """Test SwarmManager with real WASM bytecode."""

    def test_from_wasm_bytes(self):
        """Can create SwarmManager from WASM bytes."""
        from systems.pixel_compiler.swarm_manager import SwarmManager

        # Minimal valid WASM
        wasm = bytes([
            0x00, 0x61, 0x73, 0x6d,  # \0asm
            0x01, 0x00, 0x00, 0x00,  # version 1
        ])

        manager = SwarmManager.from_wasm(wasm)
        assert manager._bytecode_loaded is True

    def test_swarm_runtime_wrapper(self):
        """WASMRuntime can use swarm mode."""
        from systems.pixel_compiler.wasm_runtime import WASMRuntime

        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        runtime = WASMRuntime.from_wasm(wasm, swarm_mode=True)
        assert runtime.swarm_mode is True
```

**Step 2: Add factory method to SwarmManager**

```python
# Add to SwarmManager class

    @classmethod
    def from_wasm(cls, wasm_bytes: bytes, shader_path: str = None) -> 'SwarmManager':
        """
        Create SwarmManager pre-loaded with WASM bytecode.

        Args:
            wasm_bytes: WASM bytecode
            shader_path: Optional custom shader path

        Returns:
            SwarmManager ready for agent spawning
        """
        manager = cls(shader_path)
        manager.load_bytecode(wasm_bytes)
        return manager
```

**Step 3: Add swarm mode to WASMRuntime**

```python
# Add to WASMRuntime class in wasm_runtime.py

    def __init__(self, shader_path: Optional[str] = None, swarm_mode: bool = False):
        self.swarm_mode = swarm_mode
        if swarm_mode:
            from .swarm_manager import SwarmManager
            self.swarm = SwarmManager(shader_path)
            self.bridge = None
        else:
            self.swarm = None
            self.bridge = WASMGPUBridge(shader_path)
        # ... rest of init
```

**Step 4: Run test**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm_integration.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/swarm_manager.py systems/pixel_compiler/wasm_runtime.py systems/pixel_compiler/tests/test_swarm_integration.py
git commit -m "feat(swarm): integrate with existing WASM runtime"
```

---

## Task 11: Documentation and Final Verification

**Files:**
- Create: `systems/pixel_compiler/SWARM_QUICKSTART.md`
- Update: `systems/pixel_compiler/README.md`

**Step 1: Write quickstart doc**

```markdown
# systems/pixel_compiler/SWARM_QUICKSTART.md

# WASM Swarm Executor - Quick Start

## Overview

Execute up to 1024 WASM agents in parallel on GPU with isolated memory.

## Quick Example

```python
from systems.pixel_compiler.swarm_manager import SwarmManager

# Initialize and load bytecode
swarm = SwarmManager()
swarm.load_bytecode(wasm_bytes)

# Spawn 1024 agents
for i in range(1024):
    swarm.spawn_agent(args=[i])

# Single dispatch runs all agents
result = swarm.dispatch()

# Check results
for agent_id, return_val in result.agent_results.items():
    print(f"Agent {agent_id}: {return_val}")
```

## Key Features

- **1024 concurrent agents** via workgroup-per-instance dispatch
- **64KB memory per agent** (64MB total pool)
- **Zero-overhead spawn** - just slot assignment
- **Isolated execution** - no agent can access another's memory

## API Reference

### SwarmManager

| Method | Description |
|--------|-------------|
| `load_bytecode(wasm)` | Upload shared WASM bytecode |
| `spawn_agent(entry_point, memory_init, args)` | Spawn new agent, return ID |
| `dispatch(agent_ids)` | Execute agents in parallel |
| `get_agent_memory(agent_id)` | Read agent's memory |
| `set_agent_memory(agent_id, data)` | Write agent's memory |
| `kill_agent(agent_id)` | Remove agent, free slot |

### SwarmResult

| Field | Description |
|-------|-------------|
| `agent_results` | Dict[agent_id, return_value] |
| `agent_outputs` | Dict[agent_id, output_bytes] |
| `instruction_counts` | Dict[agent_id, count] |
| `total_time_ms` | Dispatch duration |
```

**Step 2: Run full test suite**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_swarm*.py -v --tb=short`
Expected: All PASS

**Step 3: Commit**

```bash
git add systems/pixel_compiler/SWARM_QUICKSTART.md systems/pixel_compiler/README.md
git commit -m "docs(swarm): add quickstart guide"
```

---

## Success Criteria

After completing all tasks:

- [ ] `SwarmManager` can spawn 1024 agents
- [ ] Single `dispatch()` executes all agents in parallel
- [ ] Memory isolation between agents verified
- [ ] All return values correctly harvested
- [ ] Mock mode works for testing without GPU
- [ ] GPU mode dispatches to shader (requires shader completion)
- [ ] All tests pass
- [ ] Documentation complete

---

## Future Enhancements (Out of Scope)

- Full WASM interpreter in swarm shader (import from wasm_vm.wgsl)
- Multi-bytecode support (different code per agent)
- Agent-to-agent communication channels
- Dynamic memory allocation within agent
- Performance benchmarks comparing to single-instance
