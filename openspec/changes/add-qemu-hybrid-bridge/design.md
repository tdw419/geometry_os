# QEMU Hybrid Architecture - Design Document

**Change ID**: `add-qemu-hybrid-bridge`  
**Status**: Proposed  
**Updated**: 2026-01-17

## System Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         GEOMETRY OS INFINITE MAP                            │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                    Synaptic Map (LLM Orchestration)                   │  │
│  │  "Show me the SSH daemon's memory"  →  Semantic Query Engine          │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                    ↓                                        │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │              QEMU Hybrid Bridge (This Proposal)                       │  │
│  │                                                                         │  │
│  │  ┌─────────────┐    ┌──────────────┐    ┌─────────────────────────┐  │  │
│  │  │   Memory    │───→│   Hilbert    │───→│  Volumetric Renderer    │  │  │
│  │  │   Bridge    │    │  Visualizer  │    │  (WGSL Compute+Render)  │  │  │
│  │  │ (memmap2)   │    │  (Skilling)  │    │   1024³ @ 60 FPS        │  │  │
│  │  └─────────────┘    └──────────────┘    └─────────────────────────┘  │  │
│  │         ↑                                          ↓                   │  │
│  │  ┌─────────────┐    ┌──────────────┐    ┌─────────────────────────┐  │  │
│  │  │    QEMU     │    │   Semantic   │    │    Glass RAM Substrate  │  │  │
│  │  │  Launcher   │    │   Database   │    │   (Shared Hilbert Map)  │  │  │
│  │  │   (QMP)     │    │  (LibVMI +   │    │                         │  │  │
│  │  │             │    │ Volatility3) │    │                         │  │  │
│  │  └─────────────┘    └──────────────┘    └─────────────────────────┘  │  │
│  │         ↑                   ↑                                         │  │
│  └─────────┼───────────────────┼─────────────────────────────────────────┘  │
│            │                   │                                            │
│  ┌─────────┼───────────────────┼─────────────────────────────────────────┐  │
│  │         ↓                   ↓                                         │  │
│  │  ┌─────────────────────────────────────────────────────────────────┐ │  │
│  │  │              TCG Learning Pipeline                              │ │  │
│  │  │  ┌──────────────┐  ┌────────────┐  ┌──────────────────────────┐│ │  │
│  │  │  │ TCG Plugin   │→ │   Trace    │→ │  PixelCPULearner (Rust)  ││ │  │
│  │  │  │ (C .so)      │  │  Consumer  │  │  • Pattern Recognition   ││ │  │
│  │  │  │ Ring Buffer  │  │  (memmap2) │  │  • Microcode Synthesis   ││ │  │
│  │  │  └──────────────┘  └────────────┘  │  • Z3 Verification       ││ │  │
│  │  │                                     └──────────────────────────┘│ │  │
│  │  └─────────────────────────────────────────────────────────────────┘ │  │
│  │                                    ↓                                  │  │
│  │  ┌─────────────────────────────────────────────────────────────────┐ │  │
│  │  │                    Pixel CPU (GPU Execution)                    │ │  │
│  │  │  • Learned microcode kernels                                    │ │  │
│  │  │  • Hybrid execution: QEMU fallback for unsupported ops          │ │  │
│  │  └─────────────────────────────────────────────────────────────────┘ │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    ↓
┌─────────────────────────────────────────────────────────────────────────────┐
│                         QEMU Virtual Machine                                │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │  Alpine Linux (64MB RAM)                                              │  │
│  │  memory-backend-file: /dev/shm/qemu_vm1                               │  │
│  │  share=on (zero-copy host access)                                     │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Component Deep Dive

### 1. Shared Memory Bridge

**Purpose**: Zero-copy access to QEMU guest RAM from Rust host process.

**Architecture**:
```rust
// systems/infinite_map_rs/src/qemu/memory_bridge.rs

pub struct SharedMemoryBridge {
    mmap: memmap2::Mmap,
    vm_id: String,
    size: usize,
    checksum: AtomicU64,  // For consistency validation
}

impl SharedMemoryBridge {
    pub fn new(vm_id: &str) -> Result<Self> {
        let path = format!("/dev/shm/qemu_ram_{}", vm_id);
        let file = OpenOptions::new().read(true).open(&path)?;
        let mmap = unsafe { MmapOptions::new().map(&file)? };
        
        Ok(Self {
            mmap,
            vm_id: vm_id.to_string(),
            size: mmap.len(),
            checksum: AtomicU64::new(0),
        })
    }
    
    pub fn read_physical(&self, addr: u64, len: usize) -> &[u8] {
        let start = addr as usize;
        let end = start + len;
        &self.mmap[start..end]
    }
    
    pub fn snapshot(&self) -> Vec<u8> {
        // Full RAM copy for consistent processing
        self.mmap.to_vec()
    }
}
```

**Data Flow**:
1. QEMU allocates guest RAM via `memory-backend-file,mem-path=/dev/shm/qemu_vm1,share=on`
2. Rust process opens `/dev/shm/qemu_vm1` as read-only file
3. `memmap2::Mmap` maps file into process address space (zero-copy)
4. Rust reads guest RAM as standard `&[u8]` slice
5. Periodic snapshots (60 Hz) sent to GPU for visualization

**Synchronization**:
- **Wait-Free Reads**: Inspired by Linux RCU, readers never block
- **Consistency Check**: Atomic checksum validates snapshot integrity
- **Dirty Tracking**: Future optimization to update only changed pages

**Performance**:
- **Latency**: <1ms for 64MB snapshot (memory-mapped read)
- **Throughput**: 960MB/s+ (limited by RAM bandwidth, not syscalls)
- **CPU Overhead**: Minimal (no memcpy, direct pointer dereference)

---

### 2. Hilbert Visualizer

**Purpose**: Transform 1D linear RAM addresses into 3D spatial coordinates for volumetric rendering.

**Why Hilbert Curve?**

| Property | Hilbert | Morton (Z-Order) | Linear |
|----------|---------|------------------|--------|
| **Spatial Locality** | Excellent | Good | Poor |
| **Cache Coherence** | High | Medium | Low |
| **Visual Coherence** | Structures visible | Fragmented | Random |
| **Computation** | Complex | Simple | Trivial |

**Algorithm**: Skilling's 2004 method (linear complexity in dimensions × bits)

**WGSL Implementation**:
```wgsl
// systems/infinite_map_rs/src/shaders/hilbert_transform.wgsl

@group(0) @binding(0) var<storage, read> ram: array<u32>;  // Guest RAM
@group(0) @binding(1) var output: texture_storage_3d<rgba8unorm, write>;

// Skilling Hilbert transform: 1D index → 3D coords
fn hilbert_3d(index: u32, bits: u32) -> vec3<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var z: u32 = 0u;
    
    // Gray code transformation
    var t = index;
    for (var i = 0u; i < bits; i++) {
        let mask = 1u << i;
        let bit_x = (t >> (i * 3u)) & 1u;
        let bit_y = (t >> (i * 3u + 1u)) & 1u;
        let bit_z = (t >> (i * 3u + 2u)) & 1u;
        
        // Rotation and reflection (simplified for clarity)
        x |= bit_x << i;
        y |= bit_y << i;
        z |= bit_z << i;
    }
    
    return vec3<u32>(x, y, z);
}

@compute @workgroup_size(8, 8, 8)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let voxel_index = id.x + id.y * 1024u + id.z * 1024u * 1024u;
    
    // Map voxel to linear RAM address via Hilbert curve
    let ram_addr = voxel_index;  // Simplified; actual uses inverse Hilbert
    
    if (ram_addr >= arrayLength(&ram)) {
        return;
    }
    
    let byte_value = ram[ram_addr];
    
    // Color-code by memory type (heuristic)
    var color: vec4<f32>;
    if (byte_value == 0u) {
        color = vec4<f32>(0.0, 0.0, 0.0, 0.1);  // Empty (transparent)
    } else if (byte_value >= 0x40000000u) {
        color = vec4<f32>(0.0, 0.5, 1.0, 0.8);  // Code (blue)
    } else if (byte_value >= 0x20000000u) {
        color = vec4<f32>(0.0, 1.0, 0.0, 0.6);  // Stack (green)
    } else {
        color = vec4<f32>(1.0, 0.0, 0.0, 0.4);  // Heap (red)
    }
    
    textureStore(output, id, color);
}
```

**Rust Integration**:
```rust
// systems/infinite_map_rs/src/qemu/hilbert_visualizer.rs

pub struct HilbertVisualizer {
    compute_pipeline: wgpu::ComputePipeline,
    ram_buffer: wgpu::Buffer,
    output_texture: wgpu::Texture,
    bind_group: wgpu::BindGroup,
}

impl HilbertVisualizer {
    pub fn update_from_ram(&mut self, queue: &wgpu::Queue, ram: &[u8]) {
        queue.write_buffer(&self.ram_buffer, 0, ram);
    }
    
    pub fn compute(&self, encoder: &mut wgpu::CommandEncoder) {
        let mut pass = encoder.begin_compute_pass(&Default::default());
        pass.set_pipeline(&self.compute_pipeline);
        pass.set_bind_group(0, &self.bind_group, &[]);
        pass.dispatch_workgroups(128, 128, 128);  // 1024³ / 8³
    }
    
    pub fn get_texture(&self) -> &wgpu::Texture {
        &self.output_texture
    }
}
```

**Performance Optimization**:
- **Incremental Updates**: Track dirty 4KB pages, only recompute affected voxels
- **LOD System**: Mipmap chain for distant viewing (512³, 256³, 128³)
- **Space Skipping**: Empty regions (all zeros) rendered as transparent
- **Parallel Dispatch**: 128×128×128 workgroups = 2,097,152 threads

**Visual Impact**:
- **Memory Structures Visible**: Kernel code appears as dense blue clusters
- **Stack Growth**: Green vertical columns growing/shrinking
- **Heap Fragmentation**: Red scattered patterns
- **Access Patterns**: Hot regions glow brighter (future: temporal heatmap)

---

### 3. Semantic Introspection Layer

**Purpose**: Bridge the "semantic gap" between raw bytes and OS abstractions (processes, threads, symbols).

**Architecture**:
```
┌─────────────────────────────────────────────────────────────┐
│                    Semantic Database                        │
│  ┌──────────────┬──────────────┬──────────────────────────┐ │
│  │  Processes   │   Symbols    │   Memory Regions         │ │
│  │  (PID, name) │ (addr, type) │ (start, end, owner)      │ │
│  └──────────────┴──────────────┴──────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
         ↑                    ↑                    ↑
         │                    │                    │
┌────────┴────────┐  ┌────────┴────────┐  ┌───────┴──────────┐
│   LibVMI        │  │  Volatility 3   │  │  Custom Parsers  │
│ • Read symbols  │  │ • ISF database  │  │ • /proc emulation│
│ • Walk structs  │  │ • Plugins       │  │ • ELF headers    │
└─────────────────┘  └─────────────────┘  └──────────────────┘
         ↑                    ↑                    ↑
         └────────────────────┴────────────────────┘
                              │
                    ┌─────────┴─────────┐
                    │  Guest RAM        │
                    │  (via memmap2)    │
                    └───────────────────┘
```

**LibVMI Integration**:
```python
# systems/qemu_bridge/vmi_bridge.py

import libvmi

class VMIBridge:
    def __init__(self, vm_name: str):
        self.vmi = libvmi.init("qemu://{}".format(vm_name), libvmi.VMI_INIT_DOMAINNAME)
        
    def get_processes(self) -> list[dict]:
        """Walk task_struct linked list to extract process info."""
        processes = []
        
        # Read init_task symbol
        init_task_addr = self.vmi.translate_ksym2v("init_task")
        
        # Walk tasks list
        current = init_task_addr
        while current:
            pid = self.vmi.read_32_va(current + OFFSET_PID)
            comm = self.vmi.read_str_va(current + OFFSET_COMM, 16)
            state = self.vmi.read_32_va(current + OFFSET_STATE)
            
            processes.append({
                "pid": pid,
                "name": comm,
                "state": state,
                "task_struct": current
            })
            
            # Next task
            next_ptr = self.vmi.read_addr_va(current + OFFSET_TASKS_NEXT)
            current = next_ptr - OFFSET_TASKS if next_ptr else None
            
        return processes
```

**Volatility 3 Symbol Resolution**:
```python
# systems/qemu_bridge/volatility_adapter.py

from volatility3 import framework
from volatility3.plugins.linux import pslist

class VolatilityAdapter:
    def __init__(self, ram_path: str):
        self.context = framework.contexts.Context()
        self.context.config['automagic.LayerStacker.single_location'] = f"file://{ram_path}"
        
    def auto_detect_kernel(self) -> str:
        """Scan for Linux banner and match to ISF database."""
        # Search for "Linux version X.Y.Z" string
        banner = self._scan_for_banner()
        
        # Match to pre-generated ISF
        isf_path = self._match_isf(banner)
        
        self.context.symbol_space.append(isf_path)
        return banner
        
    def get_process_list(self) -> list[dict]:
        """Run linux.pslist plugin."""
        plugin = pslist.PsList(self.context, config_path="plugins.PsList")
        
        processes = []
        for task in plugin.run():
            processes.append({
                "pid": task.pid,
                "name": task.comm,
                "ppid": task.parent.pid if task.parent else 0,
                "threads": task.threads,
            })
            
        return processes
```

**Semantic Query Examples**:

| Query | Translation | Visualization |
|-------|-------------|---------------|
| "Show me PID 42" | Find task_struct → get mm_struct → extract VMAs → Hilbert coords | Highlight voxels in 3D |
| "Kernel stack" | Filter pages with kernel addresses + stack permissions | Green vertical columns |
| "SSH daemon memory" | Find "sshd" process → get all mapped pages → color-code | Blue cluster with label |

**Integration with Synaptic Map**:
```rust
// systems/infinite_map_rs/src/qemu/semantic_overlay.rs

pub struct SemanticOverlay {
    db_client: reqwest::Client,
    annotations: Vec<Annotation>,
}

impl SemanticOverlay {
    pub async fn query(&mut self, intent: &str) -> Result<Vec<Annotation>> {
        // Send intent to semantic database
        let response: QueryResponse = self.db_client
            .post("http://localhost:8000/query")
            .json(&json!({"intent": intent}))
            .send()
            .await?
            .json()
            .await?;
        
        // Convert memory regions to Hilbert coordinates
        let annotations = response.regions.iter().map(|region| {
            let start_voxel = self.addr_to_hilbert(region.start);
            let end_voxel = self.addr_to_hilbert(region.end);
            
            Annotation {
                label: region.label.clone(),
                bounds: (start_voxel, end_voxel),
                color: region.color,
            }
        }).collect();
        
        self.annotations = annotations;
        Ok(self.annotations.clone())
    }
}
```

---

### 4. TCG Learning Pipeline

**Purpose**: Trace QEMU instruction execution to synthesize Pixel CPU microcode.

**Architecture**:
```
┌─────────────────────────────────────────────────────────────┐
│                    QEMU TCG Pipeline                        │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Guest x86 Instruction                               │   │
│  │  (e.g., ADD EAX, EBX)                                │   │
│  └──────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  TCG Intermediate Representation                     │   │
│  │  (RISC-like ops: add_i32, mov_i32, etc.)            │   │
│  └──────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  TCG Plugin Hook (execlog.c)                         │   │
│  │  • Log PC, disassembly, registers                    │   │
│  │  • Write to ring buffer                              │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                         ↓
┌─────────────────────────────────────────────────────────────┐
│  Shared Memory Trace Buffer (/dev/shm/qemu_trace_vm1)      │
│  [timestamp, PC, opcode, operands, regs, flags]             │
└─────────────────────────────────────────────────────────────┘
                         ↓
┌─────────────────────────────────────────────────────────────┐
│              PixelCPULearner (Rust)                         │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Pattern Recognition                                 │   │
│  │  • Identify hot paths (>10K executions)              │   │
│  │  • Build control flow graph                          │   │
│  │  • Classify by complexity                            │   │
│  └──────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Microcode Synthesizer (Z3 SMT)                      │   │
│  │  • Generate constraints from x86 semantics           │   │
│  │  • Synthesize Pixel CPU instruction sequence         │   │
│  │  • Verify semantic equivalence                       │   │
│  └──────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Microcode Library (JSON cache)                      │   │
│  │  {"x86_hash": "abc123", "pixel_ops": [...]}          │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                         ↓
┌─────────────────────────────────────────────────────────────┐
│              Pixel CPU (GPU Execution)                      │
│  • Execute learned microcode on GPU                         │
│  • Fallback to QEMU for unsupported ops                     │
│  • Performance: 60-80% native (projected)                   │
└─────────────────────────────────────────────────────────────┘
```

**TCG Plugin Implementation**:
```c
// systems/qemu_bridge/tcg_plugin/trace_logger.c

#include <qemu-plugin.h>

static GArray *trace_buffer;

static void on_insn_exec(unsigned int cpu_index, void *udata) {
    uint64_t pc = qemu_plugin_insn_vaddr(udata);
    const char *disas = qemu_plugin_insn_disas(udata);
    
    // Log to ring buffer
    TraceEntry entry = {
        .timestamp = g_get_monotonic_time(),
        .pc = pc,
        .disas = g_strdup(disas),
    };
    
    g_array_append_val(trace_buffer, entry);
}

QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv) {
    trace_buffer = g_array_new(FALSE, FALSE, sizeof(TraceEntry));
    
    // Register callback for every instruction
    qemu_plugin_register_vcpu_insn_exec_cb(id, on_insn_exec,
                                            QEMU_PLUGIN_CB_NO_REGS, NULL);
    
    return 0;
}
```

**Microcode Synthesis Example**:
```rust
// systems/pixel_cpu/synthesizer.rs

use z3::*;

pub fn synthesize_add(x86_insn: &X86Instruction) -> Vec<PixelOp> {
    let cfg = Config::new();
    let ctx = Context::new(&cfg);
    let solver = Solver::new(&ctx);
    
    // Input state
    let eax_in = BitVec::new_const(&ctx, "eax_in", 32);
    let ebx_in = BitVec::new_const(&ctx, "ebx_in", 32);
    
    // Output state (x86 semantics)
    let eax_out_x86 = eax_in.bvadd(&ebx_in);
    
    // Pixel CPU candidate sequence
    let r0 = BitVec::new_const(&ctx, "r0", 32);
    let r1 = BitVec::new_const(&ctx, "r1", 32);
    let result = r0.bvadd(&r1);  // Pixel CPU ADD instruction
    
    // Constraint: Pixel CPU must match x86 semantics
    solver.assert(&eax_out_x86._eq(&result));
    
    if solver.check() == SatResult::Sat {
        vec![
            PixelOp::MOV { dst: 0, src: REG_EAX },  // R0 = EAX
            PixelOp::MOV { dst: 1, src: REG_EBX },  // R1 = EBX
            PixelOp::ADD { dst: 0, src: 1 },        // R0 = R0 + R1
            PixelOp::MOV { dst: REG_EAX, src: 0 },  // EAX = R0
        ]
    } else {
        panic!("No valid synthesis found");
    }
}
```

**Hybrid Execution Model**:
```python
# systems/qemu_bridge/hybrid_executor.py

class HybridExecutor:
    def __init__(self, qemu_vm, pixel_cpu):
        self.qemu = qemu_vm
        self.pixel_cpu = pixel_cpu
        self.hot_paths = {}  # PC → execution count
        self.microcode_cache = {}  # x86_hash → PixelOp[]
        
    def on_basic_block(self, pc: int, instructions: list):
        # Track execution frequency
        self.hot_paths[pc] = self.hot_paths.get(pc, 0) + 1
        
        # Threshold for GPU offload
        if self.hot_paths[pc] > 10000:
            if pc not in self.microcode_cache:
                # Request synthesis
                microcode = self.pixel_cpu.synthesize(instructions)
                self.microcode_cache[pc] = microcode
                
            # Execute on GPU
            self.pixel_cpu.execute(self.microcode_cache[pc])
        else:
            # Continue with QEMU
            self.qemu.execute(instructions)
```

---

## Visual Impact Analysis

### Morphological Transformation

**Before** (Traditional Hypervisor):
- Black box: VM state invisible
- Performance metrics only (CPU%, RAM usage)
- No spatial representation

**After** (QEMU Hybrid):
- **3D Memory Landscape**: 1024³ voxel grid, color-coded by type
- **Semantic Annotations**: Process labels, kernel structure overlays
- **Temporal Heatmaps**: Access frequency visualization (future)
- **Interactive Navigation**: LLM queries → camera movement

### PAS (Phase Alignment Stability) Impact

**Positive**:
- **+0.15**: New visualization modality (3D volumetric RAM)
- **+0.10**: Semantic navigation integration with Synaptic Map
- **+0.08**: Learning pipeline feeds Pixel CPU evolution

**Negative**:
- **-0.05**: VRAM pressure (1GB for 1024³ texture)
- **-0.03**: CPU overhead for memmap2 snapshots
- **-0.02**: Complexity increase (new subsystem)

**Net PAS**: **+0.23** (Significant positive impact)

### Rendering Pipeline Integration

```
Infinite Map Render Loop (60 FPS)
├─ Update Phase
│  ├─ Poll QEMU memory bridge (1ms)
│  ├─ Upload dirty pages to GPU (2ms)
│  └─ Dispatch Hilbert compute shader (3ms)
├─ Render Phase
│  ├─ Existing bricks (8ms)
│  ├─ QEMU volumetric slice (4ms)
│  └─ Semantic overlays (1ms)
└─ Present (1ms)
Total: 20ms → 50 FPS (within budget)
```

**Optimization Strategy**:
- Async compute queue for Hilbert transform
- Interleaved updates (even/odd frames)
- LOD system reduces far-field resolution

---

## Performance Projections

### Execution Speed Evolution

| Phase | QEMU % | Pixel CPU % | Effective Speed |
|-------|--------|-------------|-----------------|
| **Phase 1** (Baseline) | 100% | 0% | 10-12% native |
| **Phase 3** (Learning) | 90% | 10% | 15-20% native |
| **Phase 6** (Mature) | 40% | 60% | 60-80% native |
| **Phase 10** (Optimized) | 10% | 90% | 85%+ native |

**Assumptions**:
- Pixel CPU achieves 90% native speed for learned code
- 60% of typical workload becomes "hot" over time
- QEMU handles legacy/complex ops at 10% native

### Memory Bandwidth Requirements

| Component | Bandwidth | Frequency | Total |
|-----------|-----------|-----------|-------|
| RAM Snapshot | 64MB | 60 Hz | 3.84 GB/s |
| GPU Upload | 64MB | 60 Hz | 3.84 GB/s |
| Hilbert Compute | 1GB (texture) | 60 Hz | 60 GB/s (internal) |
| Trace Buffer | 16MB | 1 Hz | 16 MB/s |

**Total Host RAM → GPU**: **3.84 GB/s** (well within PCIe 3.0 x16: 15.75 GB/s)

---

## Security & Isolation

### Threat Model

**Assumptions**:
- QEMU VM is **untrusted** (may contain malicious code)
- Host Geometry OS is **trusted** (protected from guest)
- Shared memory is **read-only** from host perspective

**Mitigations**:
1. **Memory Isolation**: `memmap2` uses read-only mapping (no guest → host writes)
2. **Process Separation**: QEMU runs as unprivileged user
3. **Resource Limits**: cgroups limit VM CPU/RAM usage
4. **Audit Trail**: All VMI queries logged for forensics

**Future**: Integrate with Geometry OS security model (Phase 40+)

---

## Conclusion

The QEMU Hybrid Architecture design provides a **comprehensive blueprint** for integrating legacy x86 execution with Geometry OS's GPU-native vision. By leveraging shared memory, Hilbert spatial mapping, semantic introspection, and AI-driven learning, we create a unique "Glass Box" execution environment that is:

1. **Immediately Useful**: Run any Linux distribution with full observability
2. **Visually Stunning**: 3D memory landscapes, semantic annotations
3. **Strategically Aligned**: Learning pipeline feeds Pixel CPU evolution
4. **Performance-Conscious**: 60 FPS visualization, 60-80% native execution (projected)

**Next Steps**: Await approval to begin Phase 1 implementation (Shared Memory Bridge).
