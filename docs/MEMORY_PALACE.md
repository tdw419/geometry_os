# Memory Palace — Linux Guest as Backend

> **Status:** Architecture document. Memory Palace building is registered in GeOS but has no implementation yet. Linux RV32 boots through early init under the GeOS hypervisor but has not yet reached userspace.

## One-Liner

Memory Palace is a GeOS-native spatial UI that talks to a Linux daemon running inside the GeOS hypervisor. The daemon does the thinking (storage, search, embeddings, networking). The palace does the drawing (rooms, objects, paths, spatial navigation).

## Why This Architecture

GeOS native code is excellent at spatial rendering — drawing pixels to the 256x256 framebuffer, handling input, the building/map metaphor. But it has no filesystem, no networking, no standard libraries, no package ecosystem. Implementing sqlite in GeOS assembly is not the plan.

Linux has all of that. So instead of reimplementing the world in assembly, the Linux guest becomes a backend service process.

The hypervisor is the bridge between them.

## Layer Diagram

```
┌─────────────────────────────────────────────────┐
│  Host Machine (Ubuntu)                           │
│  ┌─────────────────────────────────────────────┐ │
│  │  Geometry OS                                 │ │
│  │                                              │ │
│  │  ┌──────────────────────────────────────┐   │ │
│  │  │  GeOS Native Layer                   │   │ │
│  │  │                                      │   │ │
│  │  │  ┌────────────────────────────────┐  │   │ │
│  │  │  │  Memory Palace Building        │  │   │ │
│  │  │  │  (GeOS assembly program)       │  │   │ │
│  │  │  │                                │  │   │ │
│  │  │  │  - Renders rooms, corridors    │  │   │ │
│  │  │  │  - Handles spatial navigation  │  │   │ │
│  │  │  │  - Displays memory objects     │  │   │ │
│  │  │  │  - Sends queries via virtio    │  │   │ │
│  │  │  │  - Receives results via virtio │  │   │ │
│  │  │  └────────────────────────────────┘  │   │ │
│  │  │             │ virtio-serial           │   │ │
│  │  │             │ or virtio-mmio ring     │   │ │
│  │  │             ▼                         │   │ │
│  │  │  ┌────────────────────────────────┐  │   │ │
│  │  │  │  RISC-V Hypervisor             │  │   │ │
│  │  │  │  (src/riscv/)                  │  │   │ │
│  │  │  │                                │  │   │ │
│  │  │  │  - RV32IMAC interpreter        │  │   │ │
│  │  │  │  - SBI emulation               │  │   │ │
│  │  │  │  - CLINT timer                 │  │   │ │
│  │  │  │  - PLIC interrupt controller   │  │   │ │
│  │  │  │  - UART 16550A                 │  │   │ │
│  │  │  │  - Virtio-MMIO transport       │  │   │ │
│  │  │  │  - Framebuffer 0x60000000      │  │   │ │
│  │  │  │                                │  │   │ │
│  │  │  │  ┌──────────────────────────┐  │  │   │ │
│  │  │  │  │  Linux Guest (RV32)      │  │  │   │ │
│  │  │  │  │                          │  │  │   │ │
│  │  │  │  │  ┌────────────────────┐  │  │  │   │ │
│  │  │  │  │  │  palace_daemon     │  │  │  │   │ │
│  │  │  │  │  │  (initramfs /init) │  │  │  │   │ │
│  │  │  │  │  │                    │  │  │  │   │ │
│  │  │  │  │  │  - sqlite3 storage │  │  │  │   │ │
│  │  │  │  │  │  - full-text search│  │  │  │   │ │
│  │  │  │  │  │  - embedding calc  │  │  │  │   │ │
│  │  │  │  │  │  - knowledge graph │  │  │  │   │ │
│  │  │  │  │  │  - git versioning  │  │  │  │   │ │
│  │  │  │  │  │  - HTTP fetch      │  │  │  │   │ │
│  │  │  │  │  └────────────────────┘  │  │  │   │ │
│  │  │  │  └──────────────────────────┘  │  │  │   │ │
│  │  │  └────────────────────────────────┘  │   │ │
│  │  └──────────────────────────────────────┘   │ │
│  └─────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

## Communication Protocol

### Transport: Virtio-Serial

The DTB already declares virtio-mmio devices. Linux will probe them and create `/dev/vportN` character devices. Memory Palace writes queries, reads responses.

```
GeOS Memory Palace (S-mode guest code)
    │
    │  virtio-mmio write (0x10001000 region)
    ▼
Hypervisor virtio ring buffer (shared memory)
    │
    │  virtio MMIO read by Linux driver
    ▼
Linux /dev/vport0p1
    │
    │  read() by palace_daemon
    ▼
palace_daemon processes query
    │
    │  write() response back to /dev/vport0p1
    ▼
Hypervisor virtio ring buffer
    │
    │  virtio MMIO read by GeOS code
    ▼
Memory Palace renders result
```

### Message Format

Line-delimited JSON over virtio-serial. Simple, debuggable, no binary parsing needed in assembly.

**Query (GeOS → Linux):**
```
{"cmd":"search","q":"riscv timer interrupt","limit":10}
{"cmd":"store","text":"Linux boots through early init...","tags":["riscv","linux","boot"]}
{"cmd":"list","tag":"riscv"}
{"cmd":"graph","from":"riscv","depth":2}
```

**Response (Linux → GeOS):**
```
{"results":[{"id":42,"text":"...","score":0.91},{"id":17,"text":"...","score":0.85}]}
{"ok":true,"id":42}
{"items":[{"id":42,"title":"Timer interrupt delivery"},{"id":17,"title":"SBI ecall handling"}]}
{"nodes":[{"id":"riscv","edges":["timer","sbi","clint"]},{"id":"timer","edges":["riscv","mtimecmp"]}]}
```

The assembly side only needs to:
1. Serialize a short JSON string (can be template-based, no full JSON library needed)
2. Write it byte-by-byte to the virtio MMIO register
3. Read back bytes and extract the fields it cares about

### Why Not SBI Calls?

SBI is for machine-mode firmware services (console, timer, reset). It's the wrong layer for application-level IPC. Virtio is the standard Linux paravirtualized I/O mechanism — Linux already has drivers for it.

## What the Palace Daemon Provides

A small static binary in the initramfs (compiled with musl for RV32):

| Capability | Implementation | Why It Matters for Memory Palace |
|---|---|---|
| Storage | sqlite3 | Persistent knowledge base without reimplementing B-trees in assembly |
| Search | sqlite FTS5 | Full-text search over stored memories |
| Embeddings | sentence-transformers (ONNX runtime) | Semantic similarity — "find things like this" |
| Knowledge graph | sqlite + adjacency lists | Navigate related concepts as corridors between rooms |
| Versioning | git (libgit2) | Track how the memory palace evolves |
| Fetch | curl + HTTP | Pull in external knowledge from URLs |
| Processing | python3 (light) | Flexible scripting for import/export/transform |

## Memory Palace as Spatial UI

The GeOS assembly program that runs when you walk into the Memory Palace building:

### Rooms = Knowledge Domains

Each room is a tile in the GeOS map. The daemon returns the list of domains (tags), and the palace renders them as labeled rooms you can walk between.

```
┌─────────┐  ┌─────────┐  ┌─────────┐
│ RISC-V  │──│  Linux  │──│ Timers  │
│         │  │  Boot   │  │         │
│ 15 items│  │ 23 items│  │  7 items│
└─────────┘  └─────────┘  └─────────┘
     │
┌─────────┐
│  GeOS   │
│  Core   │
│ 42 items│
└─────────┘
```

### Objects = Memory Entries

Inside a room, memory entries are rendered as objects you can inspect. Selecting an object shows its content (text rendered via the GeOS font system).

### Corridors = Relationships

Edges in the knowledge graph become visible corridors between rooms. The daemon returns the graph structure; the palace generates the map layout.

### The Spatial Memory Effect

This isn't just cosmetic. The method of loci (memory palace technique) is one of the oldest and most effective memorization techniques. By mapping knowledge to spatial locations, recall becomes navigation. The brain is exceptionally good at remembering where things are in space.

## Implementation Phases

### Phase 1: Linux to Userspace (current work)
- Fix timer interrupt delivery (in progress — stuck at `check_unaligned_access`)
- Get Linux to exec `/init` from initramfs
- Verify virtio driver probes
- **Files:** `src/riscv/live.rs`, `src/riscv/boot.rs`, `src/riscv/bus.rs`

### Phase 2: Virtio Transport
- Implement virtio-mmio ring buffer in hypervisor
- Verify Linux can read/write to `/dev/vport0p1`
- Build a test daemon that echoes messages
- **Files:** `src/riscv/virtio.rs`, `src/riscv/bus.rs`

### Phase 3: Palace Daemon
- Write `palace_daemon` in C (static, musl, RV32)
- Bundle into initramfs
- Implements: store, search, list, graph commands
- Backed by sqlite3 in tmpfs (or virtio-blk for persistence)
- **Files:** new `palace_daemon/` directory

### Phase 4: Memory Palace Building
- Write GeOS assembly program for the building
- Renders rooms, handles navigation, talks to daemon over virtio
- Register in GeOS desktop apps (already has `"memory_palace"` entry)
- **Files:** `programs/memory_palace.asm`

### Phase 5: Rich Features
- Embedding-based semantic search
- Knowledge graph visualization
- Import from external sources
- Temporal navigation (see how the palace changed over time)

## Key Design Decisions

1. **Linux daemon, not GeOS library** — The daemon runs in a real Unix environment with real libraries. GeOS assembly only does what it's good at: drawing and spatial layout.

2. **Virtio-serial, not shared memory** — Virtio-serial gives us a byte stream with Linux driver support already built in. Shared memory would need cache coherency and synchronization that's harder to get right.

3. **Line-delimited JSON, not binary protocol** — Debuggable with `cat /dev/vport0p1`. The overhead of JSON parsing in the daemon is negligible. The assembly side uses template strings.

4. **Initramfs, not disk** — No need for virtio-blk initially. The daemon and its database live in RAM. Persistence can come later via virtio-blk or host-side file injection.

5. **Static musl binary** — No shared library dependencies. One file in the initramfs. Cross-compiled with `riscv64-linux-gnu-gcc -march=rv32imac -mabi=ilp32 -static`.

## What Memory Palace Is NOT

- It's not a file manager (that's a different building)
- It's not a terminal emulator (that's `smart_term`)
- It's not a database viewer (though it uses one internally)
- It's not an LLM chat (that's `oracle`)

It's a spatial interface to a knowledge graph. You walk through what you know.

## Related Docs

- `docs/RISCV_HYPERVISOR.md` — Hypervisor architecture (QEMU bridge + native RISC-V interpreter)
- `docs/LINUX_BOOT_JOURNEY.md` — Step-by-step Linux boot debugging log
- `docs/SPEC.md` — GeOS overall specification
- `docs/ARCHITECTURE.md` — GeOS source tree and memory map
- `NEAR_ESCALATIONS.md` — Current blockers and decisions
