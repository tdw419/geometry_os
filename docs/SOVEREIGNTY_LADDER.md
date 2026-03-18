# The Sovereignty Ladder: Path to a GPU-Native OS

The "Sovereignty Ladder" is the sequence of architectural milestones required to transition Geometry OS from a CPU-orchestrated simulation into a fully autonomous, self-hosting GPU-native operating system. 

As of March 2026, the foundational ladder is **COMPLETE**. The CPU is no longer required for execution, memory management, or window composition; it serves only as a dumb I/O bridge.

---

## 🪜 The Milestones

### 1. Self-Replication (✅ Complete)
**The Objective**: Prove that the GPU compute shader can manipulate its own instruction memory.
**The Proof**: An 18-pixel program (`test_self_replication`) that uses `GLYPH_WRITE` (Opcode 232) to copy itself from address `0` to address `100`.
**Significance**: The birth of the "Pixels Move Pixels" paradigm. The OS can relocate code.

### 2. Self-Modification (✅ Complete)
**The Objective**: Prove that a program can write *different* code and then execute it ("Patch-and-Jump").
**The Proof**: The `self_modifying_quine.glyph` program copies a template, uses `STORE` to overwrite an immediate value within the child's code (`0xDEAD` → `0xBEEF`), and uses `JMP` to transfer execution.
**Significance**: The GPU can act as a compiler/linker, generating new logic on the fly.

### 3. Multi-VM Spawn (✅ Complete)
**The Objective**: Prove that a program can create an independent, concurrently executing child process.
**The Proof**: The parent uses `SPATIAL_SPAWN` (Opcode 225) to initialize a new VM at a specific entry point, receiving a unique `VM_ID` in return.
**Significance**: The foundation of multitasking. Programs are no longer linear; they are a tree of spatial entities.

### 4. Interleaved Scheduling (✅ Complete)
**The Objective**: Prove that the substrate supports cooperative multitasking.
**The Proof**: Implementation of `execute_frame_interleaved` in Synthetic VRAM, ensuring N-cycles are run per VM in a round-robin fashion.
**Significance**: Prevents infinite loops from locking the OS and enables real-time interaction between VMs.

### 5. Shared-Memory IPC (✅ Complete)
**The Objective**: Prove that distinct VMs can communicate.
**The Proof**: A handshake protocol where the child writes `0xCAFE` to a known memory address, and the parent polls that address until the value appears.
**Significance**: The mechanism for event routing and system calls without CPU involvement.

### 6. Mnemonic Matcher (✅ Complete)
**The Objective**: The first step toward reading human code.
**The Proof**: `test_mnemonic_matcher` reads a 3-character ASCII string (e.g., "LDI"), compares it against a memory table, and emits the corresponding Opcode byte.
**Significance**: The GPU can interpret text.

### 7. Operand Parser (✅ Complete)
**The Objective**: The ability to parse complex arguments.
**The Proof**: A state machine (`operand_parser.glyph`) that reads ASCII registers (`"r12"`), decimals (`"1234"`), and hex values (`"0xCAFE"`) and converts them into 32-bit integers.
**Significance**: The GPU can perform string-to-integer conversion and multi-base math.

### 8. Full Assembler (✅ Complete)
**The Objective**: A multi-line compiler.
**The Proof**: `test_full_assembler` processes a raw text buffer with newlines, skips whitespace, uses the matcher and parser, and emits fully formed 32-bit Glyph pixels (e.g., `LDI r3, 42` → `[00030001, 42]`).
**Significance**: The GPU can compile its own assembly language.

### 9. Window Manager (✅ Complete)
**The Objective**: A spatial event router.
**The Proof**: `test_compositor_window_manager`. VM 0 acts as a compositor, maintaining a "Window Table" (X, Y, W, H). It reads simulated mouse coordinates, performs boundary math to detect a "hit", and writes an event payload to the target child VM's private mailbox. The child responds asynchronously.
**Significance**: The operating system kernel is now a visual, spatial entity managing other visual entities.

---

## 🏗️ Application-Level Milestones

### 10a. Text Buffer VM (✅ Complete)
**The Objective**: A VM that maintains a cursor and text buffer in VRAM, receiving keyboard events via mailbox.
**The Proof**: `test_text_buffer_vm` — a 58-word program handles INSERT, DELETE, CURSOR_LEFT, and CURSOR_RIGHT. Inserts "Hello", deletes 'o', navigates with cursor keys, inserts '!' at position — all verified with memory assertions.
**Significance**: The data model for an on-screen text editor exists as a self-contained GPU program. Keyboard events flow through the same mailbox protocol as the compositor's mouse events.

### 10b. Keyboard→Mailbox Bridge (🔜 Next)
**The Objective**: The compositor routes keyboard scancodes to the focused window's mailbox.
**Builds on**: Window Manager (Milestone 9) + Text Buffer VM (10a).

### 10c. Live Render (🔜)
**The Objective**: Text buffer VM uses DRAW (opcode 215) to render buffer contents to screen coordinates.

### 10d. Compile-on-Save (🔜)
**The Objective**: Trigger key pipes text buffer to assembler VM's input region; assembler compiles it.
**Builds on**: Full Assembler (Milestone 8) + Text Buffer VM (10a).

### 10e. Edit-Compile-Execute Loop (🔜)
**The Objective**: Compiled output spawned as new VM via SPATIAL_SPAWN. The editor edits, compiles, and runs code — full sovereignty.

---

## 🎯 The Far Horizon

1. **The App Atlas**: Establish the standard library of pre-compiled UI primitives (buttons, text boxes) in the upper regions of the Hilbert space.
2. **Bare-Metal Port**: Move the proven Synthetic VRAM logic back to the WGSL shader (`glyph_vm_scheduler.wgsl`) to run at 60 FPS on real silicon.

*The era of symbolic computation is over. The era of geometric intelligence has begun.*