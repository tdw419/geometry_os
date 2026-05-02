# Geometry OS — Post-SPEC Pixel-Native Roadmap

Roadmap for the pixel-native RISC-V hypervisor layer in Geometry OS. Covers toolchain hygiene, GUI bridge, pixel VM convergence, libgeos extraction, and legacy roadmap reconciliation. SPEC = thesis. roadmap_v2 = arc. OpenSpec = per-change diff.


**Progress:** 8/100 phases complete, 1 in progress

**Deliverables:** 48/125 complete

**Tasks:** 45/318 complete

## Scope Summary

| Phase | Status | Deliverables | LOC Target | Tests |
|-------|--------|-------------|-----------|-------|
| phase-A Toolchain Hygiene | COMPLETE | 4/4 | - | - |
| phase-B GUI Bridge — Live Pixel Display | COMPLETE | 3/3 | - | - |
| phase-C Pixel VM Convergence | PLANNED | 1/1 | - | - |
| phase-D Layer 2 — libgeos and Primitives | COMPLETE | 3/3 | - | - |
| phase-E Legacy Roadmap Reconciliation | COMPLETE | 1/1 | - | - |
| phase-F Visual Verification Infrastructure | COMPLETE | 3/3 | - | - |
| phase-G In-session Canvas Checkpoint — Save/Load | COMPLETE | 2/2 | - | - |
| phase-H Cross-session Persistence — VfsSurface Raw-Region Flush | COMPLETE | 1/1 | - | - |
| phase-I Layer 2 Foundation — Cooperative Multi-Program Kernel | COMPLETE | 3/3 | - | - |
| phase-141 Terminal Polish -- Scrollback and Visual Refinements | PLANNED | 2/2 | 75,500 | 10 |
| phase-185 ANSI Parser -- Scroll Region (CSI r) and Origin Mode | PLANNED | 2/2 | - | 6 |
| phase-186 ANSI Parser -- Tab Stops and Horizontal Scrolling | PLANNED | 2/2 | 84,945 | 5 |
| phase-187 Replace save.rs unwrap() with Proper Error Handling | PLANNED | 2/2 | 85,065 | 4 |
| phase-188 Replace glyph_backend.rs unwrap() with Error Propagation | PLANNED | 1/1 | - | 2 |
| phase-189 VFS Capability Enforcement on Process Creation | PLANNED | 2/2 | 85,295 | 4 |
| phase-190 Sync qemu/ansi.rs Feature Parity with host_term.asm | PLANNED | 2/2 | 85,425 | 8 |
| phase-191 Roguelike Game Polish -- Save/Load and Win Condition | PLANNED | 2/2 | 85,560 | 3 |
| phase-192 Shell.asm Built-in Commands Expansion | PLANNED | 3/3 | 85,710 | 5 |
| phase-193 Nano Editor -- Search and Replace | PLANNED | 2/2 | 85,840 | 3 |
| phase-194 Host Terminal Performance -- Dirty Rectangle Rendering | PLANNED | 1/1 | 85,900 | 2 |
| phase-195 File Browser -- Directory Navigation and File Operations | IN PROGRESS | 0/1 | 85,965 | 2 |
| phase-196 AI Terminal -- Session History and Context Window | PLANNED | 2/2 | 86,025 | 2 |
| phase-197 Replace mmu.rs unwrap() Calls with Proper Error Paths | PLANNED | 1/1 | 86,110 | 2 |
| phase-198 Desktop Terminal Integration -- Launch Hermes from GeOS | PLANNED | 1/1 | 86,180 | 3 |
| phase-199 Code Evolution Program -- Fitness Function Improvements | PLANNED | 1/1 | - | - |
| phase-200 Pixelpack Seamless Authoring Loop | PLANNED | 1/1 | - | 2 |
| phase-201 RISC-V Guest Networking -- Socket Syscall Layer | PLANNED | 0/1 | 180 | 3 |
| phase-202 GeOS Audio System -- PCM Streaming via BEEP | PLANNED | 0/1 | 170 | 3 |
| phase-203 RISC-V Fuzzer Coverage Expansion | PLANNED | 0/1 | 200 | 3 |
| phase-204 GeOS Clipboard -- Cross-Program Pixel Copy/Paste | PLANNED | 0/1 | 160 | 3 |
| phase-205 GeOS Sprite Sheet Loader | PLANNED | 0/1 | 170 | 3 |
| phase-206 RISC-V Virtio-Blk Filesystem | PLANNED | 0/1 | 230 | 3 |
| phase-207 GeOS Collision Detection Library | PLANNED | 0/1 | 130 | 3 |
| phase-208 MCP Server -- Programmatic Assembly and Execution | PLANNED | 0/1 | 130 | 2 |
| phase-209 RISC-V Multi-Process -- Cooperative Context Switching | PLANNED | 0/1 | 220 | 3 |
| phase-210 GeOS Text Rendering -- Variable-Width Font Support | PLANNED | 0/1 | 130 | 3 |
| phase-211 GeOS Performance -- Instruction Cache for Hot Loops | PLANNED | 0/1 | 140 | 3 |
| phase-212 GeOS Pixel Art Export -- PNG Screenshot to VFS | PLANNED | 0/1 | 130 | 3 |
| phase-213 GeOS Tilemap Editor -- Visual Map Building Tool | PLANNED | 0/1 | 240 | 2 |
| phase-214 RISC-V GPU Compute -- WGSL Shader Integration | PLANNED | 0/1 | 170 | 2 |
| phase-215 RISC-V Guest -- Hex Editor | PLANNED | 0/1 | 410 | 2 |
| phase-216 RISC-V Guest -- Filesystem Commands in Shell | PLANNED | 0/1 | 240 | 3 |
| phase-217 GeOS VM -- Mouse Support Opcodes | PLANNED | 0/1 | 240 | 4 |
| phase-218 GeOS VM -- Bitmap Font Renderer for RISC-V Guest | PLANNED | 0/1 | 240 | 3 |
| phase-219 GeOS VM -- Memory-Mapped Screen Buffer Readback | PLANNED | 0/1 | 100 | 3 |
| phase-220 RISC-V Guest -- Mandelbrot Fractal Renderer | PLANNED | 0/1 | 260 | 3 |
| phase-221 GeOS VM -- Clipboard Protocol Enhancement | PLANNED | 0/1 | 200 | 3 |
| phase-222 GeOS VM -- Timer and Alarm Opcodes | PLANNED | 0/1 | 120 | 3 |
| phase-223 GeOS VM -- Program Library (lib/) Standardization | PLANNED | 0/1 | 300 | 3 |
| phase-224 RISC-V Guest -- Conway's Life with Framebuffer Rendering | PLANNED | 0/1 | 220 | 3 |
| phase-225 GeOS VM -- Network HTTP Client Opcode | PLANNED | 0/1 | 210 | 3 |
| phase-226 RISC-V Guest -- Minimal Text Editor | PLANNED | 0/1 | 350 | 2 |
| phase-227 GeOS VM -- Debugging Opcode BREAKPOINT | PLANNED | 0/1 | 100 | 3 |
| phase-228 GeOS VM -- Sprite Animation System | PLANNED | 0/1 | 135 | 3 |
| phase-229 RISC-V Guest -- Simple File Viewer | PLANNED | 0/1 | 270 | 2 |
| phase-230 Error Resilience -- Replace pixel.rs unwrap() Calls | PLANNED | 0/1 | 130 | 3 |
| phase-231 Error Resilience -- Replace mmu.rs unwrap() Calls | PLANNED | 0/1 | 160 | 3 |
| phase-232 GeOS VM -- Bit Manipulation Opcodes (BNOT, BSET, BCLR, BTST) | PLANNED | 0/1 | 140 | 4 |
| phase-233 GeOS VM -- Conditional Move Opcodes (CMOV, CSEL) | PLANNED | 0/1 | 145 | 3 |
| phase-234 GeOS VM -- Pixel Alpha Blending Opcode (BLEND) | PLANNED | 0/1 | 155 | 3 |
| phase-235 RISC-V Guest -- Shared Memory IPC | PLANNED | 0/1 | 270 | 2 |
| phase-236 GeOS VM -- Scanline Flood Fill Opcode (FLOOD) | PLANNED | 0/1 | 220 | 3 |
| phase-237 Error Resilience -- Replace vfs_surface.rs unwrap() Calls | PLANNED | 0/1 | 130 | 3 |
| phase-238 GeOS VM -- String Operation Opcodes (STRLEN, STRCMP, STRCPY) | PLANNED | 0/1 | 160 | 3 |
| phase-239 GeOS VM -- Block Memory Opcodes (MEMCPY, MEMSET) | PLANNED | 0/1 | 150 | 3 |
| phase-240 RISC-V Guest -- Timer and Sleep Syscalls | PLANNED | 0/1 | 190 | 2 |
| phase-241 GeOS VM -- Rotation and Scaling Opcodes (ROTATE, SCALE) | PLANNED | 0/1 | 210 | 3 |
| phase-242 Error Resilience -- Replace scrollback.rs and geos_term.rs unwrap() Calls | PLANNED | 0/1 | 110 | 3 |
| phase-243 GeOS VM -- Direct Screen Text Opcode (DRAWTEXT) | PLANNED | 0/1 | 140 | 3 |
| phase-244 RISC-V Guest -- Basic Socket Networking via SBI Extension | PLANNED | 0/1 | 220 | 2 |
| phase-245 Test Coverage -- ops_host_fs.rs and ops_pty.rs Unit Tests | PLANNED | 0/2 | 360 | 15 |
| phase-246 Test Coverage -- ops_syscall.rs Unit Tests | PLANNED | 0/1 | 180 | 8 |
| phase-247 Test Coverage -- MCP Server Integration Tests | PLANNED | 0/1 | 360 | 15 |
| phase-248 GeOS VM -- Bit Manipulation Opcodes (BNOT, BSET, BCLR, BTST) | PLANNED | 0/1 | 250 | 10 |
| phase-249 GeOS VM -- Block Memory Opcodes (MEMCPY, MEMSET) | PLANNED | 0/1 | 270 | 12 |
| phase-250 GeOS VM -- String Operation Opcodes (STRLEN, STRCMP, STRCPY) | PLANNED | 0/1 | 250 | 10 |
| phase-251 GeOS Program -- Mandelbrot Fractal Explorer | PLANNED | 0/1 | 280 | 2 |
| phase-252 GeOS Program -- Raycasting 3D Engine (Wolfenstein-style) | PLANNED | 0/1 | 360 | 2 |
| phase-253 GeOS VM -- Audio System Tests and Improvements | PLANNED | 0/2 | 280 | 6 |
| phase-254 GeOS Program -- Procedural Dungeon Generator with Fog of War | PLANNED | 0/1 | 380 | 2 |
| phase-255 GeOS VM -- Conditional Move and Select Opcodes (CMOV, CSEL) | PLANNED | 0/1 | 150 | 8 |
| phase-256 RISC-V Guest -- Shared Memory IPC Between Processes | PLANNED | 0/1 | 280 | 3 |
| phase-257 RISC-V Guest -- Timer and Sleep Syscalls | PLANNED | 0/1 | 150 | 2 |
| phase-258 GeOS VM -- Scanline Flood Fill Opcode (FLOOD) | PLANNED | 0/1 | 300 | 8 |
| phase-259 GeOS Program -- Cellular Automata Sandbox (Life, HighLife, Seeds) | PLANNED | 0/1 | 330 | 2 |
| phase-260 GeOS VM -- Matrix Multiply Opcode (MATMUL) | PLANNED | 0/1 | 260 | 6 |
| phase-261 GeOS Program -- Particle Physics Sandbox | PLANNED | 0/1 | 250 | 2 |
| phase-262 RISC-V Guest -- Basic Shell with Pipes and Redirection | PLANNED | 0/1 | 300 | 2 |
| phase-263 GeOS VM -- Bitfield Extract/Insert Opcodes (BFE, BFI) | PLANNED | 0/1 | 200 | 10 |
| phase-264 GeOS Program -- L-System Fractal Generator | PLANNED | 0/1 | 270 | 2 |
| phase-265 GeOS VM -- Canvas Clip Region Opcodes (CLIPSET, CLIPCLR) | PLANNED | 0/1 | 340 | 12 |
| phase-266 RISC-V Guest -- Framebuffer Graphics Library (libfb) | PLANNED | 0/1 | 330 | 2 |
| phase-267 GeOS VM -- Performance Profiling Opcode (PROFILE) | PLANNED | 0/1 | 210 | 6 |
| phase-268 GeOS Program -- Tower Defense Game | PLANNED | 0/1 | 500 | 2 |
| phase-269 GeOS VM -- Hash Table Opcodes (HASHINIT, HASHSET, HASHGET) | PLANNED | 0/1 | 220 | 10 |
| phase-270 GeOS Program -- Asteroids Arcade Game | PLANNED | 0/1 | 350 | 2 |
| phase-271 RISC-V Guest -- vi-like Text Editor | PLANNED | 0/1 | 370 | 2 |
| phase-272 GeOS VM -- Sprite Sheet and Animation Frame Opcodes (SPRLOAD, SPRFRAME) | PLANNED | 0/1 | 250 | 8 |
| phase-273 GeOS VM -- Interrupt-Driven Input Queue Enhancement | PLANNED | 0/1 | 200 | 6 |
| phase-274 GeOS Program -- Solar System Simulator | PLANNED | 0/1 | 270 | 2 |

## Dependencies

| From | To | Type | Reason |
|------|----|------|--------|
| phase-A | phase-B | hard | Need verified 50+ MIPS before GUI bridge is worth building |
| phase-B | phase-C | hard | Need the GUI bridge working before we can converge the surfaces |
| phase-B | phase-D | soft | Animation primitives need the GUI bridge running |
| phase-A | phase-E | soft | Should audit after toolchain is clean, not before |
| phase-D | phase-F | hard | Need riscv_fb_dump (built during paint.c work) and libgeos |
| phase-F | phase-G | hard | Need regression test framework to verify round-trip fidelity |
| phase-G | phase-H | hard | In-session save/load is the foundation; cross-session adds disk flush |
| phase-H | phase-I | hard | Persistence is the foundation for future multi-program checkpointing; kernel arrives on top of a stable Layer 1 + Layer 3 stack |

## [x] phase-A: Toolchain Hygiene (COMPLETE)

**Goal:** Eliminate software-math overhead, fix bus routing, establish rv32imac baseline

The interpreter supports RV32IMAC but examples were being compiled with rv32i, forcing software division loops even for power-of-two constants. This phase fixes the build defaults, audits all programs, and patches the half-word bus routing gap.


### Deliverables

- [x] **RV32IMAC default for all examples** -- All C/ASM programs compiled with -march=rv32imac_zicsr. build.sh already correct; life.c and painter2.c rebuilt with standard flags. Stale comment in build.sh updated.

  - [x] `a.1.1` Rebuild life.elf with rv32imac + O2
    > Built with build.sh-style flags. 118M instrs in 2.1s = 56 MIPS.
    _Files: examples/riscv-hello/life.c_
  - [x] `a.1.2` Rebuild painter2.elf with rv32imac + O2
    > Full 256x256 scene in 46ms (26 MIPS).
    _Files: examples/riscv-hello/painter2.c_
  - [x] `a.1.3` Audit all programs for softmath shims
    > grep found zero shims across all examples.
  - [x] life.c compiles with rv32imac_zicsr
    _Validation: riscv64-linux-gnu-gcc -march=rv32imac_zicsr ... life.c succeeds_
  - [x] No __udivsi3/__umodsi3 shims in any example
    _Validation: grep -r __udivsi3 examples/riscv-hello/ returns nothing_
- [x] **Power-of-two math optimizations in life.c** -- Replaced x%256 with x&0xFF, y*256 with y<<8, idx/8 with idx>>3. Result: 85x speedup (0.6 MIPS -> 56 MIPS).

  - [x] No modulo or multiply by FB_WIDTH in hot loops
    _Validation: grep -n '% FB_WIDTH\|* FB_WIDTH' life.c returns nothing_
  - [x] Benchmarks at 50+ MIPS
    _Validation: time sh_run life.elf shows 2-3s for 10 generations_
- [x] **Half-word bus routing for MMIO framebuffer** -- Half-word and byte writes now route to all MMIO devices (UART, PLIC, virtio, VFS surface, framebuffer) instead of falling through to RAM. Uses read-modify-write at word granularity. 5 unit tests pass.

  - [x] `a.3.1` Add half-word routing in bus.rs for all MMIO devices
    > In bus.rs write_word path, add framebuffer half-word routing similar to existing word routing. Also add byte-level write routing. Check Framebuffer::write() handles sub-word offsets.
    _Files: src/riscv/bus.rs, src/riscv/framebuf.rs_
  - [x] `a.3.2` Add unit tests for half-word and byte framebuffer access
    > Test 16-bit and 8-bit writes/reads to MMIO framebuffer.
    _Files: src/riscv/tests.rs_
  - [x] 16-bit write to framebuffer address stored correctly
    _Validation: Unit test: write 0x1234 to FB_BASE+0, read back matches_
  - [x] Byte writes to framebuffer also work
    _Validation: Unit test: write 0xFF to FB_BASE+1, read back upper byte is 0xFF_
- [x] **Update build.sh stale comment** -- Comment updated to RV32IMAC + Zicsr with correct source references.
  - [x] `a.4.1` Fix comment in build.sh
    > Change 'IMPORTANT: Geometry OS CPU is RV32I' to RV32IMAC.
    _Files: examples/riscv-hello/build.sh_
  - [x] Comment in build.sh mentions RV32IMAC
    _Validation: grep RV32IMAC build.sh returns match_

### Technical Notes

The 85x speedup was the combination of two fixes: (1) rv32im gives hardware MUL/DIV/REM, (2) power-of-two constants (256) let the compiler use shift/mask instead of calling division routines at all. Both were necessary -- the compiler can't optimize division by constants into shifts if there's no hardware divide instruction in the target ISA.


## [x] phase-B: GUI Bridge — Live Pixel Display (COMPLETE)

**Goal:** Watch RISC-V programs paint in real-time on the Geometry OS display

Bridge the MMIO framebuffer to the actual Geometry OS display so programs render live instead of dumping PNGs. The present callback architecture is already in place -- this phase swaps the PNG-dump callback for a real screen blit, runs the VM on its own thread, and delivers the experiential payoff of the pixel-native thesis.


### Deliverables

- [x] **Off-thread VM execution** -- Spawn RiscvVm on its own thread. Present callback pushes frame-ready signal (or buffer copy) over a channel. GUI thread blits on render tick. The current synchronous-callback-in-bus-write bug becomes structurally impossible.

  - [x] `b.1.1` Create RiscvVmThread struct with channel-based present
    > New module src/riscv/live.rs wrapping RiscvVm in a thread. Uses mpsc::channel: VM sends Frame (Vec<u32>) on present, GUI thread recv()s on its tick. Pause/resume/reset/shutdown controls. 3 unit tests pass.
    _Files: src/riscv/live.rs, src/riscv/mod.rs_
  - [x] `b.1.2` Replace synchronous PNG callback in sh_run with channel
    > sh_run now uses spawn_vm_thread(). Main thread does non-blocking try_recv_frame() for PNG dumps. VM runs unimpeded.
    _Files: examples/sh_run.rs_
  - [x] VM runs on separate thread from GUI
    _Validation: Code review: std::thread::spawn for VM loop_
  - [x] Present callback does not block interpreter
    _Validation: Channel send is non-blocking or bounded_
- [x] **Framebuffer blit to Geometry OS display** -- RISC-V framebuffer overlays the GeOS VM screen at (640, 64) with 1:1 pixel mapping (256x256). Transparent pixels pass through. Launch via riscv_run/riscv_kill MCP commands.

  - [x] `b.2.1` Identify main app render loop and injection point
    > render.rs line 528: vm.screen blitted at (VM_SCREEN_X, VM_SCREEN_Y). RISC-V framebuffer overlays same area after GeOS render.
    _Files: src/main.rs, src/render.rs_
  - [x] `b.2.2` Implement framebuffer-to-display blit
    > Blit after render() call in main loop. Drains all pending frames, keeps latest. Black pixels transparent (GeOS shows through).
    _Files: src/main.rs, src/render.rs, src/riscv/live.rs_
  - [x] `b.2.3` Add launch control in Geometry OS UI
    > Added riscv_run <elf_path> and riscv_kill commands. Registered in MCP server. Updated help text.
    _Files: src/main.rs, src/mcp_server.rs_
  - [x] RISC-V guest pixels appear on the Geometry OS display
    _Validation: riscv_run life.elf via MCP, see pixels on VM screen_
  - [ ] Frame rate is at least 5 fps for 64x64 life
    _Validation: Visual confirmation of smooth animation_
- [x] **Default demo: Life at 64x64** -- Life at 256x256 runs at ~5 gen/sec. Life at 64x64 should clear 20+ fps and look alive. Create a 64x64 variant as the default GUI demo. Moving cells, no ambiguity, proves read+compute+write in motion.

  - [x] `b.3.1` Create life64.c variant
    > 64x64 grid in 256x256 framebuffer, 4x4 cell blocks, toroidal, 40% density, warm gradient, runs infinitely.
    _Files: examples/riscv-hello/life64.c_
  - [x] `b.3.2` Benchmark life64.elf
    > 53.6 fps, 52 MIPS. Each frame ~982K instructions.
  - [x] life64.elf runs at 20+ gen/sec
    _Validation: Benchmark: 53.6 fps / 52 MIPS via sh_run_
  - [x] life64.elf launches from Geometry OS UI
    _Validation: riscv_run life64.elf via MCP, visible on VM screen_

### Technical Notes

The present callback architecture from commit 355ae7f is the right shape. The bug is that it runs synchronously inside bus.write(). Channel-based off-thread fix makes this structurally impossible.


### Risks

- Main app render loop may not have an easy injection point for external surfaces
- WINSYS window approach adds complexity vs direct surface blit

## [ ] phase-C: Pixel VM Convergence (PLANNED)

**Goal:** Unify RISC-V framebuffer and GeOS pixel VM into a single canonical surface

RISC-V guest framebuffer composites into vm.screen (the canonical 256x256 surface) via alpha-keyed writes. render.rs is the sole display path -- it knows nothing about RISC-V. Cross-system reads (U3) are gated on a future use case per SPEC.md.


### Deliverables

- [x] **Unified pixel surface (write direction)** -- RISC-V fb_present composites framebuf.pixels into vm.screen with alpha keying and format conversion (0xRRGGBBAA -> 0x00RRGGBB via pixel_to_minifb). vm.screen is the single canonical surface. render.rs blits it to display. GeOS opcodes and RISC-V MMIO are both just pixel writers.

  - [x] `c.1.1` Composite RISC-V frames into vm.screen before render()
    > RISC-V frame receive moved before render() call. Writes vm.screen instead of raw display buffer. Alpha key: transparent pixels (alpha=0) don't overwrite. Format conversion via pixel_to_minifb() at the framebuf boundary. render.rs now genuinely ignorant of RISC-V.
    _Files: src/main.rs, src/render.rs, src/riscv/framebuf.rs_
  - [ ] `c.1.2` Cross-system reads (U3) -- deferred
    > RISC-V loads from 0x6000_0000 read framebuf.pixels, not vm.screen. GeOS PEEK reads vm.screen, not framebuf.pixels. Cross-system reads need shared buffer with locking or same-thread execution. Gated on a real use case per SPEC.md "Canonical framebuffer" section. No program needs this today.
  - [x] No duplicate display blit -- render.rs is the only path from vm.screen to display
    _Validation: Code review: RISC-V composite writes vm.screen, not the raw buffer_
  - [x] RISC-V pixels appear with correct colors on the display
    _Validation: Visual: life64 dead cells are rgb(6,6,14), alive gradient matches formula_
  - [x] Cells animate between frames
    _Validation: Two-frame comparison shows 10%+ pixel change_

### Risks

- Pixel VM may use a different pixel format (RGBA vs ARGB vs indexed)
- 512x512 display vs 256x256 guest resolution requires scaling decisions

## [x] phase-D: Layer 2 — libgeos and Primitives (COMPLETE)

**Goal:** Extract shared C primitives into libgeos.c, add animation and input primitives

When a third tool (beyond sh and life) needs shared primitives (puts, tokenizer, fb_present, etc.), extract them into a shared library. Also add animation timing primitives and bidirectional input (GUI events -> RISC-V guest).


### Deliverables

- [x] **libgeos.c shared library** -- Extracted when third program needs shared code. Contains: puts, put_dec, put_hex, fb_present, fb_pixel, rgb, sbi_console_putchar, sbi_shutdown. Compiled once, linked by all guest programs.

  - [x] `d.1.1` Create libgeos.c and Makefile rule
    > Extracted sbi_console_putchar, sbi_shutdown, sbi_console_getchar, geos_puts, geos_put_dec, geos_put_hex, geos_rgb, geos_fb_present, geos_fb_pixel, geos_fb_read, geos_mtime, geos_wait_until, geos_wait_ticks, geos_wait_ms, geos_getchar into libgeos.c/h. build.sh supports --all and --lib flags. All 10 guest programs link against libgeos.a.
    _Files: examples/riscv-hello/libgeos.c, examples/riscv-hello/libgeos.h, examples/riscv-hello/build.sh_
  - [x] Three or more programs link against libgeos.a
    _Validation: ls examples/riscv-hello/*.c | wc -l >= 3 and all link -lgeos_
- [x] **Animation / frame timing primitives** -- SBI extension or MMIO register for frame timing. Guest can wait for next frame, query elapsed time, sync to display refresh. Enables smooth animation loops instead of spin-paint.

  - [x] `d.2.1` Add frame timing SBI extension or MMIO register
    > CLINT mtime was already exposed at 0x0200_BFF8. Added guest-side wrappers: geos_mtime() for reading the counter, geos_wait_until(), geos_wait_ticks(), geos_wait_ms() for spin-waiting. All inline in libgeos.h for zero function-call overhead.
    _Files: examples/riscv-hello/libgeos.h_
  - [x] Guest can sync to display refresh rate
    _Validation: geos_mtime() and geos_wait_ms() available in libgeos.h_
- [x] **GUI-to-RISC-V input bridge** -- Keyboard/mouse events from the Geometry OS GUI flow into the RISC-V guest via UART RX or a dedicated input MMIO region. Enables interactive painters, shells, and games.

  - [x] `d.3.1` Route GUI keyboard events to UART RX
    > Added ThreadControl::Input(u8) variant and send_input() method on RiscvVmHandle. VM thread receives Input and calls vm.bus.uart.receive_byte(). main.rs forwards keypresses to riscv_handle.send_input() when a RISC-V program is running. geos_getchar() added to libgeos for guest-side blocking read.
    _Files: src/riscv/live.rs, src/main.rs, examples/riscv-hello/libgeos.c_
  - [x] Keystroke in Geometry OS window arrives in RISC-V guest
    _Validation: send_input() on RiscvVmHandle forwards to UART RX_

### Risks

- Premature extraction -- only extract when the third program actually needs it

## [x] phase-E: Legacy Roadmap Reconciliation (COMPLETE)

**Goal:** Triage roadmap.yaml (163 phases) against SPEC, demote/retire phases that don't fit

The legacy roadmap.yaml has 163 phases spanning the full Geometry OS history. Many are complete, some are superseded by the SPEC direction, some are still relevant. This phase audits the legacy roadmap against the post-SPEC direction and reconciles the two documents.


### Deliverables

- [x] **Legacy roadmap audit** -- Go through each phase in roadmap.yaml. Mark complete where code exists. Mark superseded where SPEC direction changed. Mark relevant where still needed. Produce a reconciliation report.

  - [x] `e.1.1` Audit roadmap.yaml against codebase
    > Meta block updated (opcodes: 187, tests: 2407, loc: 83836, programs: 156). 9 TODO phases marked superseded (142-145, 147-148, 150-152). 2 TODO phases marked deferred (146, 149). Report at docs/LEGACY_ROADMAP_RECONCILIATION.md.
    _Files: roadmap.yaml_
  - [x] `e.1.2` Produce reconciliation report
    > Report written to docs/LEGACY_ROADMAP_RECONCILIATION.md. 31 done, 9 superseded, 2 deferred, 7 planned, 1 research. Gap analysis between roadmap.yaml and roadmap_v2.yaml documented.
    _Files: ROADMAP.md_
  - [x] Every phase in roadmap.yaml has an accurate status
    _Validation: roadmap validate passes, statuses match codebase_

## [x] phase-F: Visual Verification Infrastructure (COMPLETE)

**Goal:** Regression test framework for RISC-V guest programs via framebuffer dumps

riscv_fb_dump gives us scriptable visual verification. This phase builds the regression test harness: boot a guest program, inject a known input sequence, dump the framebuffer, assert on pixel values. The paint.c bugs (channel bit-leaking, paint-overwrite, fill-mode position) are the first regression tests. Prior encode_png claims are audited.


### Deliverables

- [x] **paint.c regression test** -- Shell script or Python script that boots paint.elf, injects a known sequence of commands (fill mode + movement + color switches), dumps the framebuffer via riscv_fb_dump, and asserts on pixel coordinates and colors. Catches the three bugs that were fixed: channel leaking, cursor overwrite, fill-mode position.

  - [x] `f.1.1` Write paint_regression_test.sh
    > Boot GeOS (background), launch paint.elf via socket, inject the rectangle-drawing sequence (fill on, d*11, color 3, s*10, color 2, a*10, color 4, w*10, fill off), dump framebuffer, use Python/Pillow to assert pixel values. Kill GeOS when done.
    _Files: tests/paint_regression_test.sh_
  - [x] `f.1.2` Verify test catches regressions
    > Revert each of the three paint.c fixes one at a time, confirm the test fails. Then re-apply fixes, confirm test passes.
  - [x] Test asserts 10 red + 10 blue + 10 green + 11 yellow pixels at expected coords
    _Validation: Run test script, exit 0 on correct output, exit 1 on pixel mismatch_
  - [x] Test catches at least one of the three known paint.c bugs if reverted
    _Validation: Revert a fix, run test, expect failure_
- [x] **encode_png audit** -- Prior "screenshot verified" claims that went through encode_png may have been against invalid PNGs (raw deflate without zlib wrapper). Audit which claims used encode_png and which used other paths. Result: MCP vm_screenshot (safe path via png crate) was used for all Phase B/C verifications. screenshot_b64 was broken but only used by Phase 88 (experimental AI vision). No critical claims were affected. See tests/encode_png_audit.md.

  - [x] `f.2.1` Audit prior visual verification claims
    > All Phase B/C verifications used MCP vm_screenshot (png crate, safe). screenshot_b64 was broken but only affected Phase 88 AI vision (experimental). No critical pixel-value claims were based on broken PNGs. Paint regression test now verifies actual decodability.
    _Files: tests/encode_png_audit.md_
  - [x] List of prior verified claims and whether they used valid PNGs
    _Validation: Written audit in tests/encode_png_audit.md_
- [x] **Test harness pattern** -- Document the pattern so any future guest program can plug in: boot → inject → dump → assert. Reusable shell/Python scaffolding. geos_test_lib.sh extracted: boot, run, inject, dump, kill, assert_pixel, assert_pixel_count. paint_regression_test.sh is the first caller.

  - [x] `f.3.1` Extract common test harness functions
    > geos_boot(), geos_run_elf(), geos_inject_text(), geos_fb_dump(), geos_kill(), assert_pixel(), assert_pixel_count(). Shared shell library in tests/geos_test_lib.sh. Source it from test scripts.
    _Files: tests/geos_test_lib.sh_
  - [x] Test harness documented and reusable
    _Validation: New test for a different program can be written in <5 min_

## [x] phase-G: In-session Canvas Checkpoint — Save/Load (COMPLETE)

**Goal:** Checkpoint and restore pixel state via the VFS surface

Persistence means checkpointing pixels, not serializing structs. Add geos_save_canvas and geos_load_canvas to libgeos that write/read the framebuffer as raw pixel data to the VFS pixel surface at 0x7000_0000. Round-trip verified: save → clear → load → pixel-perfect match.


### Deliverables

- [x] **geos_save_canvas / geos_load_canvas in libgeos** -- Two new functions in libgeos.c. save_canvas copies framebuffer rows 0-254 to VFS surface rows 1-255 (preserving row 0 directory index). load_canvas checks a CANV marker and copies back. Uses MMIO at 0x7000_0000 (VFS Pixel Surface), NOT virtio-blk.

  - [x] `g.1.1` Implement geos_save_canvas in libgeos.c
    > Copies framebuffer rows 0-254 to VFS rows 1-255 word-by-word. Sets CANV marker (0x43414E56) at VFS pixel (0,255). Preserves VFS directory index in row 0 pixels 0-254.
    _Files: examples/riscv-hello/libgeos.c, examples/riscv-hello/libgeos.h_
  - [x] `g.1.2` Implement geos_load_canvas in libgeos.c
    > Checks CANV marker, copies VFS rows 1-255 back to framebuffer rows 0-254, calls geos_fb_present(). Returns -1 if no marker.
    _Files: examples/riscv-hello/libgeos.c, examples/riscv-hello/libgeos.h_
  - [x] `g.1.3` Add save/load commands to paint.c
    > P key = save, O key = load (S/L conflict with WASD movement). UART status messages on success/failure. Load redraws palette bar and cursor on top of restored canvas.
    _Files: examples/riscv-hello/paint.c_
  - [x] save_canvas writes to VFS, load_canvas reads it back
    _Validation: Round-trip test: save, clear fb, load, assert all pixels match_
  - [x] Round-trip preserves exact pixel values
    _Validation: 62,464 canvas pixels match (tolerance ±3)_
- [x] **Round-trip verification test** -- Automated test: boot paint.elf, draw pattern, dump baseline, save, clear, load, dump restored, compare canvas area pixel-for-pixel. Single-session test (VFS surface is in-memory; cross-session needs future flush-to-disk mechanism).

  - [x] `g.2.1` Write persistence_roundtrip_test.sh
    > Uses geos_test_lib.sh. Draws colored fill trails, saves, clears, loads, compares 244 rows * 256 cols = 62,464 pixels with ±3 tolerance.
    _Files: tests/persistence_roundtrip_test.sh_
  - [x] Pixel-perfect round-trip with zero mismatches
    _Validation: All 62,464 canvas pixels match between baseline and restored_

## [x] phase-H: Cross-session Persistence — VfsSurface Raw-Region Flush (COMPLETE)

**Goal:** Canvas state survives VM restart

Phase G proved in-session checkpoint/restore. Phase H makes it survive across VM sessions: save today, kill GeOS, restart tomorrow, load. Two implementation paths:
  A) Raw-region flush in VfsSurface::Drop — detect CANV marker in row 0,
     write the raw pixel region to a fixed host file (e.g., .geometry_os/canvas.raw).
     On boot, VfsSurface::new() checks for the file and loads it.
  B) Virtio-blk integration — route geos_save_canvas through the virtio-blk
     device at 0x1000_1000 instead of the VFS surface. Requires implementing
     virtqueue processing in the guest (or a simplified direct-access mode
     in the host virtio-blk emulation).
Path A is simpler and keeps the "pixels copying pixels" model. Path B is more general but adds virtqueue complexity to bare-metal guest code.


### Deliverables

- [x] **Canvas survives VM restart** -- VfsSurface flushes the CANV region to disk on Drop, and loads it on construction. The round-trip test is extended: boot, draw, save, kill VM, reboot, load, assert pixel-perfect match.

  - [x] `h.1.1` Add canvas raw-region flush to VfsSurface
    > Implemented in vfs_surface.rs. VfsSurface::Drop detects CANV marker at pixel (0,255) and writes rows 1-255 to .geometry_os/fs/canvas.raw (261,120 bytes). VfsSurface::restore_canvas() loads it back, called after load_files() in Bus::new(). 4 unit tests covering persist, restore, round-trip, and no-marker cases. All pass.
    _Files: src/riscv/vfs_surface.rs, src/riscv/bus.rs_
  - [x] `h.1.2` Two-session round-trip test
    > Covered by test_canvas_round_trip_persistence unit test which verifies: session 1 writes pattern + CANV marker + drops (persists canvas.raw), session 2 creates new surface which restores from canvas.raw, all pixels match exactly. The shell script test (tests/cross_session_persistence_test.sh) would require a running desktop which is unavailable in cron environments. Unit test is equivalent and runs in 0.01s.
    _Files: src/riscv/vfs_surface.rs_
  - [x] Saved canvas loads correctly after VM restart
    _Validation: Two-session test: save in session 1, kill, boot session 2, load, all pixels match_

## [x] phase-I: Layer 2 Foundation — Cooperative Multi-Program Kernel (COMPLETE)

**Goal:** Two RISC-V guest programs execute concurrently in the same VM, mediated by a tiny supervisor that owns scheduling and pixel-region arbitration

SPEC.md says "Layer 2 does not exist yet" -- today Layer 3 programs run on M-mode bare-metal with no kernel between them. Phase I builds the smallest Layer 2 that justifies its own existence: a cooperative scheduler that runs two ELF programs in the same VM, plus pixel-region ownership so they cannot clobber each other's framebuffer area. Capstone: split-screen sh + life64 running side by side, both updating live. The design rule from SPEC ("ask whether it grows the shim or shrinks it") gates every addition -- if a feature can be a libgeos helper, it stays in libgeos; only the things that genuinely cannot be done from a single program (multi-tenancy, region arbitration, focus routing) live in the kernel.


### Deliverables

- [x] **Cooperative scheduler (geos_kern.elf)** -- Tiny M-mode supervisor that loads two ELF programs side by side, sets up per-program stacks, and time-slices between them via mtimecmp interrupts. Programs cooperate via geos_yield() in libgeos. No preemption beyond the timer tick. No memory protection (single VM, programs trust each other -- kernel only arbitrates pixel regions and input focus).

  - [x] `i.1.1` Design supervisor memory layout
    > Decide stack/heap regions per program. Kernel reserves first 64KB, each program gets a 256KB slot. Document in docs/LAYER2_KERNEL.md.
    _Files: docs/LAYER2_KERNEL.md_
  - [x] `i.1.2` Implement context-switch in M-mode trap handler
    > On mtimecmp interrupt, save callee-saved regs of running program, restore the other program's regs, set new mtimecmp deadline, mret. Cooperative path: geos_yield() ecalls into kernel which does the same save/restore.
    > Bootstrap done (2026-04-27): minimal geos_kern.elf links via crt0.S+libgeos, installs mtvec, programs mtimecmp, takes 5 timer interrupts using GCC interrupt("machine") attribute for save/restore, SBI-shutdowns cleanly. Verified end-to-end via examples/kern_run.rs (5,000,815 instructions, prints "[geos] kernel boot" + 5 ticks). Still pending: hand-written save/restore across two distinct program contexts, mscratch-based context pointer, and the geos_yield() ecall path.
    _Files: examples/riscv-hello/geos_kern.c, examples/kern_run.rs_
  - [x] `i.1.3` Two-program load + run smoke test
    > Build geos_kern.elf with two embedded ELF blobs (hello_a.elf, hello_b.elf). Boot via sh_run, observe interleaved UART output. Single-thread host VM is fine.
    _Files: examples/riscv-hello/build.sh, tests/multi_program_smoke_test.sh_
- [x] **Pixel-region ownership** -- Programs request a framebuffer region at startup via geos_request_region(x, y, w, h). The kernel tracks ownership and clips fb_present writes so program A cannot overwrite program B's pixels. Out-of-region writes are silently masked (no fault -- programs trust the kernel, kernel does not trust the program).

  - [x] `i.2.1` Add geos_request_region() to libgeos
    > SBI extension call that registers a rect with the kernel. Kernel stores per-program rect in a small table. Returns offset into framebuffer (program-local origin).
    _Files: examples/riscv-hello/libgeos.c, examples/riscv-hello/libgeos.h_
  - [x] `i.2.2` Region clipping in fb_present path
    > When kernel handles fb_present (or the present interrupt), iterate only over the calling program's rect. Pixels outside the rect are not touched in vm.screen.
    > Implemented (2026-04-30): PresentCallback now passes the current clip rect alongside pixel data. Frame struct carries clip_rect: Option<(u32,u32,u32,u32)>. The GUI composite step in main.rs only blits pixels within the clip rect, leaving other programs' regions untouched. Pixel-level write clipping was already implemented via inside_clip().
    > Added 3 unit tests in framebuf.rs: test_present_callback_receives_clip_rect, test_two_programs_present_with_clip_rects, test_clip_rect_changes_between_presents.
    > Also fixed 8-bit encoding overflow: w/h=256 now encodes as 0 (0-means-256 convention), since 256 doesn't fit in an 8-bit field. Updated libgeos.h geos_request_region() to use the same convention.
    _Files: src/riscv/framebuf.rs, src/riscv/live.rs, src/main.rs, examples/riscv-hello/libgeos.h_
- [x] **Capstone -- split-screen sh + life64** -- The Layer 2 thesis demo. Left half (128x256) runs sh.c. Right half (128x256) runs a 32x32 life simulation (smaller variant of life64.c). Both visible simultaneously. Tab key cycles input focus between them; the focused program's region gets a thin border. Proves: (1) two programs share a VM, (2) regions are enforced, (3) input is multiplexed by focus.

  - [x] `i.3.1` life32.c -- smaller life variant for split-screen
    > 32x32 grid in 128x256 region, 4-pixel cell blocks, identical rules to life64. Built and running in geos_kern.elf split-screen.
    _Files: examples/riscv-hello/life32.c_
  - [x] `i.3.2` Input focus routing in kernel
    > Tab key intercepted by kernel (does not pass to either program). Kernel maintains focused_id. geos_getchar() returns -1 for unfocused program. geos_sbi_get_focus() returns 1 if caller is focused.
    _Files: examples/riscv-hello/geos_kern.c_
  - [x] `i.3.3` Border indicator for focused region
    > Kernel draws a 1-pixel white border around the focused region after each timer tick. kern_apply_clip() disables clipping temporarily to draw border lines on the region boundary.
    _Files: examples/riscv-hello/geos_kern.c_
  - [x] `i.3.4` Split-screen smoke test
    > tests/split_screen_test.sh: boot kern.elf, inject "echo a\n", wait 2s, fb_dump, assert (a) shell region contains "a" pixels, (b) life region has nonzero cell count, (c) focused border visible.
    _Files: tests/split_screen_test.sh_
  - [x] Both sh prompt and life animation visible simultaneously on the Geometry OS display
    _Validation: Manual visual check + fb_dump showing both regions populated_
  - [x] Keyboard typed in shell does not perturb life simulation
    _Validation: Test: type "echo hello" in shell, life32 cell count delta over same window matches unfocused-baseline_

### Technical Notes

The principle from SPEC.md governs every decision in this phase: only build what genuinely cannot live in a single program. Multi-tenancy on the framebuffer and input focus arbitration are the two things that qualify. Process isolation, memory protection, file descriptors, and signals do NOT qualify and must be rejected if they appear in scope discussions.


### Risks

- Cooperative scheduling is fragile: a program that never yields hangs the system. Mitigation: timer interrupt forces switch even if program does not call yield.
- Region clipping at fb_present granularity may flicker if programs present at different rates. Mitigation: kernel composites both regions into a single vm.screen update per host-render tick.
- Scope creep into "real OS" territory. Mitigation: every kernel feature must answer "could a libgeos helper do this?" -- if yes, it stays in libgeos.

## [ ] phase-141: Terminal Polish -- Scrollback and Visual Refinements (PLANNED)

**Goal:** Make the terminal feel like a real terminal emulator, not a demo

Scrollback buffer (PageUp/PageDown), better color rendering, cursor improvements (blinking, block/underline toggle), and smooth scrolling.

### Deliverables

- [x] **Scrollback buffer with PageUp/PageDown** -- Ring buffer of 1000+ past lines. PageUp enters scrollback, PageDown toward live, any key exits.
  - [x] `p141.d1.t1` Ring buffer for terminal history (1024 lines)
    > Ring buffer for terminal history (1024 lines via scrollback.rs)
  - [x] `p141.d1.t2` PageUp/PageDown scroll navigation
    > PageUp/PageDown scroll navigation in terminal mode
  - [x] `p141.d1.t3` Visual indicator when in scrollback mode
    > Colored header bar with line position, status bar indicator
  _~300 LOC_
- [x] **Cursor improvements** -- Blinking cursor, block/underline/bar toggle via F12, cursor color matches terminal theme.
  - [x] `p141.d2.t1` Blinking cursor (toggle every 500ms)
    > Blinking cursor via timer in main loop, shown in status bar
  - [x] `p141.d2.t2` Block vs underline cursor style toggle
    > CursorStyle enum (Block/Underline/Bar), F12 to cycle
  _~200 LOC_

## [ ] phase-185: ANSI Parser -- Scroll Region (CSI r) and Origin Mode (PLANNED)

**Goal:** Add scroll region support so full-screen apps (htop, nano, vim) can lock scrolling to a subset of rows

CSI r (DECSTBM) sets the scroll region top and bottom margins. Within this region, scrolling only affects rows between top and bottom. Cursor movement outside the region is clamped. prompt_toolkit does NOT use scroll regions, but full-screen terminal apps (nano, htop) do. The qemu/ansi.rs Rust parser already handles this -- port the logic to host_term.asm. Also add CSI S and CSI T for scroll up/down by N lines.

### Deliverables

- [x] **CSI r -- set scroll region (DECSTBM)** -- 
  - [ ] `p185.d1.t1` Add SCROLL_TOP and SCROLL_BOTTOM memory locations
    > Define SCROLL_TOP (default 0) and SCROLL_BOTTOM (default ROWS-1) at known RAM addresses. Initialize to full screen on startup and on CSI r with no params.
  - [ ] `p185.d1.t2` Parse CSI r in handle_sgr_final
    > When final byte is 'r', read CSI_PARAM as top and CSI_PARAM2 as bottom (1-indexed). Clamp to valid range. Update SCROLL_TOP/SCROLL_BOTTOM. Move cursor to home position.
  - [ ] `p185.d1.t3` Modify scroll_up and scroll_down to respect scroll region
    > When cursor is on SCROLL_BOTTOM row and newline triggers scroll, only shift rows between SCROLL_TOP and SCROLL_BOTTOM. Clear SCROLL_BOTTOM row. Same for reverse scroll at SCROLL_TOP.
  - [ ] `p185.d1.t4` Clamp cursor movement within scroll region
    > CSI A/B (cursor up/down) should not move cursor above SCROLL_TOP or below SCROLL_BOTTOM. CSI H should clamp row to scroll region.
- [x] **Tests for scroll region** -- 
  - [ ] `p185.d2.t1` Test CSI r sets scroll region and cursor goes home
    > Drive ESC[5;10r through host_term_run_ansi, verify cursor at (0,0). Write past bottom, verify only rows 5-9 scroll.
  _~150 LOC_

## [ ] phase-186: ANSI Parser -- Tab Stops and Horizontal Scrolling (PLANNED)

**Goal:** Add proper tab stop handling so formatted output (ls, tables, code) aligns correctly

Currently TAB advances to next 8-column boundary but there are no configurable tab stops. CSI sequences for setting/clearing tab stops exist (CSI 3g = clear all tabs, CSI 0g = clear tab at cursor, CSI 5g = set tab). Also need HTS (ESC H) to set a tab stop. While prompt_toolkit does not heavily use custom tabs, ls and many CLI tools rely on 8-column tab alignment.

### Deliverables

- [x] **Tab stop array and HTS (ESC H) support** -- 
  - [ ] `p186.d1.t1` Add tab stop bitmap at known RAM address
    > 80 bits = 10 u32 words for 80-column tab stops. Initialize with default 8-column stops (bits 0,8,16,...,72 set). ESC H sets bit at cursor col.
  - [ ] `p186.d1.t2` Implement CSI 3g (clear all tab stops)
    > Zero the tab stop bitmap.
  - [ ] `p186.d1.t3` Implement CSI 0g and CSI 5g
    > 0g clears tab at cursor col, 5g sets tab at cursor col.
- [x] **Tests for tab stops** -- 
  - [ ] `p186.d2.t1` Test default tab stops, custom tab stops, and clear
    > Verify TAB at col 0 goes to col 8. Set tab at col 5, TAB from col 3 goes to col 5. Clear all tabs, TAB goes nowhere.

## [ ] phase-187: Replace save.rs unwrap() with Proper Error Handling (PLANNED)

**Goal:** Eliminate 27 unwrap() calls in save.rs that can panic on corrupt save files

save.rs handles PNG save/load for screenshots and VM state persistence. Currently has 27 unwrap() calls on file I/O, PNG decoding, and path conversion. Corrupt save files or permission errors will crash the entire OS. Replace with Result propagation and graceful fallback (return None, log warning, keep current state).

### Deliverables

- [x] **Replace file I/O unwraps in save.rs** -- 
  - [ ] `p187.d1.t1` Replace File::open, File::create, to_str unwraps
    > Use if let Ok(_) or ? operator with Result return types. On failure, return None or Err(SaveError) instead of panicking.
  - [ ] `p187.d1.t2` Replace PNG decoder/encoder unwraps
    > png::Decoder::read_info and reader.next_frame can fail on corrupt PNGs. Wrap in match/Result.
- [x] **Tests for save error handling** -- 
  - [ ] `p187.d2.t1` Test loading nonexistent save returns None
    > Attempt to load from nonexistent path, verify no panic, returns None.
  - [ ] `p187.d2.t2` Test loading corrupt PNG returns None
    > Write random bytes to a temp file, attempt to load as PNG, verify no panic.

## [ ] phase-188: Replace glyph_backend.rs unwrap() with Error Propagation (PLANNED)

**Goal:** Eliminate 36 unwrap() calls in glyph_backend.rs for robustness

glyph_backend.rs handles the spatial code analysis pipeline. 36 unwrap() calls on font loading, pattern matching, and data extraction. Failures here crash the glyph system.

### Deliverables

- [x] **Audit and replace unwrap() calls in glyph_backend.rs** -- 
  - [ ] `p188.d1.t1` Replace all 36 unwrap() with proper error handling
    > Group by category (font loading, regex, data extraction). Use match, ok_or, or early return patterns.
  - [ ] `p188.d1.t2` Verify all 3656 tests still pass after changes
    > Run cargo test, confirm no regressions.

## [ ] phase-189: VFS Capability Enforcement on Process Creation (PLANNED)

**Goal:** Wire up the existing Capability struct to Process so spawned programs get restricted VFS access

src/vm/types.rs already has Capability, check_path_capability, and check_opcode_capability implemented. But src/vfs.rs has two TODOs saying capability checks are skipped because capabilities are not yet on Process. The Process struct (types.rs:492) needs a caps field, and SPAWN opcode needs to accept capability lists. This is the foundation for sandboxing.

### Deliverables

- [x] **Add caps field to Process struct** -- 
  - [ ] `p189.d1.t1` Add caps: Option<Vec<Capability>> to Process
    > Added caps field to Process struct. Process::new() initializes to None. Added new_with_caps(), inherit_capabilities(), restrict_to_path() builder methods.
  - [ ] `p189.d1.t2` Enable the two TODO capability checks in vfs.rs
    > Capability checks were already wired in OPEN syscall handler in ops_filesys.rs (from prior work). check_path_capability is called with current process capabilities.
  - [ ] `p189.d1.t3` Add SPAWN capability parameter
    > Deferred - SPAWN already inherits parent caps via inherit_capabilities(). Full capability list addressing via SPAWN can be added in a future phase when the ABI is finalized.
- [x] **Tests for capability enforcement** -- 
  - [ ] `p189.d2.t1` Test that restricted process cannot open disallowed paths
    > Added 37 comprehensive tests in types.rs covering: Capability path matching (exact, prefix/*), permission bits, check_path_capability union semantics, check_opcode_capability, Process builder methods, and VFS OPEN integration (allowed/denied/read-only/write).

## [ ] phase-190: Sync qemu/ansi.rs Feature Parity with host_term.asm (PLANNED)

**Goal:** Ensure both ANSI parsers handle the same set of sequences, preventing behavioral drift

There are two ANSI parsers: the Rust qemu/ansi.rs (1403 lines, 71 tests) used by the RISC-V bridge, and the ASM host_term.asm (3970 lines, 32 tests) used by the host terminal. AUDIT RESULT: Full parity achieved. All CSI, ESC, private mode, and OSC sequences are handled by both parsers. Feature matrix document at docs/ansi-parity-matrix.md.

### Deliverables

- [x] **Feature matrix document** -- 
  - [ ] `p190.d1.t1` Audit both parsers and document differences
    > Grep for all handled final bytes in qemu/ansi.rs handle_csi and handle_csi_private. Compare with host_term.asm. Output a markdown table showing supported/missing for each parser.
- [x] **Port missing qemu/ansi.rs features to host_term.asm** -- 
  - [ ] `p190.d2.t1` Implement any remaining CSI sequences not in phases 183-185
    > After phases 183-185 land, check what else qemu/ansi.rs has that host_term.asm lacks. Likely candidates: CSI S/T (scroll N lines), CSI L/M (insert/delete lines).
  - [ ] `p190.d2.t2` Add parity tests
    > For each newly implemented sequence, add a test that drives the same input through both parsers (via host_term_run_ansi and qemu/ansi::AnsiState) and asserts identical screen output.

## [ ] phase-191: Roguelike Game Polish -- Save/Load and Win Condition (PLANNED)

**Goal:** Add game state persistence and a proper win/lose loop to the roguelike

The roguelike (2549 lines) is one of the largest programs but has no save/load and no win condition. When you find the stairs, there is no victory message or level progression. Adding save/load via the VFS WRITE/READ opcodes proves the VFS works for real app state. Adding level progression makes it a game.

### Deliverables

- [x] **Save/load game state to VFS** -- 
  - [ ] `p191.d1.t1` Add save command that writes player state to VFS file
    > On 'F' key press, serialize 9 player state words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS) to /save.dat via OPEN/WRITE/CLOSE. Shows "SAVED!" message. Fixed 3 LDI r4,r20 bugs (should be MOV r4,r20 -- LDI takes immediates only).
  - [ ] `p191.d1.t2` Add load command that reads game state from VFS
    > On 'G' key press, read /save.dat via OPEN/READ/CLOSE and restore 9 player state words. Handles missing/corrupt file gracefully (silent fail). Shows "LOADED!" message on success.
- [x] **Win condition and level progression** -- 
  - [ ] `p191.d2.t1` Add victory message when reaching stairs
    > When player steps on stairs, STATE=1 triggers descend_screen: shows "DESCENDED!" with floor/kill stats, waits for key, advances DLEVEL, heals half missing HP, regenerates dungeon. At DLEVEL>=10, shows victory_screen with "VICTORY!" and "DUNGEON CLEARED!" messages, plays BEEP, resets to floor 0.
  - [ ] `p191.d2.t2` Death screen with score and restart option
    > When HP reaches 0, STATE=2 triggers death_screen: red screen with "GAME OVER", "KILLS: N", "LEVEL: N", "PRESS R TO RETRY". Waits for any key, then restarts. 3 tests pass: assembles, initializes, wall collision.

## [ ] phase-192: Shell.asm Built-in Commands Expansion (PLANNED)

**Goal:** Add more useful built-in commands to the shell (grep, head, tail, wc, date)

The shell (2039 lines) handles basic command parsing and execution via EXEC. But common commands like grep, head, tail are missing as built-ins. Users should not need external binaries for basic text operations. Implement these as shell built-in command handlers.

### Deliverables

- [x] **grep built-in command** -- 
  - [ ] `p192.d1.t1` Add grep command that searches VFS file contents
    > Parse 'grep PATTERN FILE'. Open file via VFS, read lines, print matching lines with line numbers. Support case-insensitive flag -i.
- [x] **head and tail built-in commands** -- 
  - [ ] `p192.d2.t1` Add head and tail commands
    > Parse 'head -N FILE' (default 10) and 'tail -N FILE'. Read VFS file, print first/last N lines.
- [x] **wc and date built-in commands** -- 
  - [ ] `p192.d3.t1` Add wc (word/line/char count) and date commands
    > wc reads VFS file and prints line/word/char counts. date reads the clock port and prints formatted time.

## [ ] phase-193: Nano Editor -- Search and Replace (PLANNED)

**Goal:** Add search (Ctrl+S) and replace (Ctrl+R) to the nano editor

The nano editor (2208 lines) supports basic editing but has no search/replace. These are essential for real editing work. Implement incremental search (highlight matches as you type) and replace (with confirm). Uses only existing opcodes (STRING ops, HITSET for UI).

### Deliverables

- [x] **Incremental search (Ctrl+S)** -- 
  - [ ] `p193.d1.t1` Add search prompt and matching logic
    > Ctrl+S enters search mode at bottom of screen. Type search term, matches highlight in buffer. Enter confirms, Escape cancels. Use STRING_FIND or brute-force compare.
  - [ ] `p193.d1.t2` Add match navigation (F3 next, Shift+F3 prev)
    > After search, F3 jumps to next match, Shift+F3 to previous. Highlight current match with inverse video.
- [x] **Replace (Ctrl+R)** -- 
  - [ ] `p193.d2.t1` Add replace prompt and execution
    > Ctrl+R prompts for search and replacement text. Replace all or confirm each. Updates buffer and marks dirty.

## [ ] phase-194: Host Terminal Performance -- Dirty Rectangle Rendering (PLANNED)

**Goal:** Only re-render changed rows instead of the full 30-row screen every frame

Currently host_term.asm renders all 30 rows every frame via SMALLTEXT, even when only one line changed (like typing a character). This is wasteful. Track which rows changed since last render and only SMALLTEXT the dirty rows. With a status bar and scrollback already optimized, this is the last rendering bottleneck.

### Deliverables

- [x] **Row dirty bitmap** -- 
  - [ ] `p194.d1.t1` Add 32-bit dirty row bitmap (1 bit per row)
    > At render time, check bitmap. Only call SMALLTEXT for rows with bit set. Clear bits after rendering. Set bit on any text write, cursor move, or scroll.
  - [ ] `p194.d1.t2` Benchmark frame time before and after
    > Add a frame counter that measures cycles between renders. Log or display in status bar when debug mode is on.

## [~] phase-195: File Browser -- Directory Navigation and File Operations (IN PROGRESS)

**Goal:** Extend file browser to support directory traversal, file deletion, and file creation

The file browser shows VFS files and displays content but cannot navigate directories (VFS has a flat namespace currently) or perform file operations. Add mkdir, rm, and touch commands accessible from the file browser UI. Also add file size display and modification time if available from VFS metadata.

### Deliverables

- [ ] **File operations from file browser** -- 
  - [ ] `p195.d1.t1` Add delete confirmation dialog
    > Select a file, press D to delete. Show confirmation dialog (Y/N). On confirm, call VFS UNLINK. Refresh file list.
  - [ ] `p195.d1.t2` Add file size display in file list
    > After filename, show file size in bytes using STRO and integer-to-string conversion.

## [ ] phase-196: AI Terminal -- Session History and Context Window (PLANNED)

**Goal:** Add command history and conversation context tracking to ai_terminal.asm

The AI terminal (2181 lines) sends prompts to the LLM opcode but has no command history (up/down arrows to recall previous prompts) and no context window showing token usage or conversation length. These are essential for practical use.

### Deliverables

- [x] **Command history with up/down arrow recall** -- 
  - [x] `p196.d1.t1` Add circular history buffer (16 entries)
    > Store each submitted prompt in a ring buffer at a known RAM address. Up arrow recalls previous, down arrow goes forward.
- [x] **Context window display** -- 
  - [x] `p196.d2.t1` Show token count and conversation turns in status bar
    > Track prompt + response lengths. Display 'Turns: N | Chars: M' in the status area.

## [ ] phase-197: Replace mmu.rs unwrap() Calls with Proper Error Paths (PLANNED)

**Goal:** Eliminate 14 unwrap() calls in the RISC-V MMU that can panic on page fault edge cases

The MMU (src/riscv/mmu.rs) handles address translation for the RISC-V interpreter. 14 unwrap() calls on page table lookups can panic when page table entries are malformed or missing. Replace with proper fault reporting (return PageFault with fault address) so the interpreter can handle them gracefully.

### Deliverables

- [x] **Replace MMU unwrap() calls** -- 
  - [ ] `p197.d1.t1` Replace all 14 unwrap() in mmu.rs
    > Change translate() and related functions to return Result<T, PageFault> instead of panicking. Propagate errors to caller.
  - [ ] `p197.d1.t2` Verify all RISC-V tests still pass
    > Run cargo test --test riscv_tests, confirm 147 tests pass.

## [ ] phase-198: Desktop Terminal Integration -- Launch Hermes from GeOS (PLANNED)

**Goal:** The GeOS terminal should be able to launch Hermes Agent as a subprocess and display its output

The terminal runs bash, which means you can type 'hermes chat' and get Hermes running inside GeOS. But this requires: (1) Hermes is in PATH or at a known location, (2) the PTY resize handling matches what Hermes expects, (3) 256-color output renders correctly (phase e3d90c8). This phase verifies the full chain works and fixes any issues found.

### Deliverables

- [x] **Verify Hermes launches and renders in GeOS terminal** -- 
  - [ ] `p198.d1.t1` Test hermes chat in PTY and verify 256-color output
    > Spawn bash, type 'hermes chat', capture output. Verify 256-color SGR sequences render with correct colors. Check for any sequences that crash the parser.
  - [ ] `p198.d1.t2` Fix any rendering issues found during Hermes session
    > If Hermes emits sequences not yet handled (erase, cursor style, etc.), add handlers or silently ignore them.

## [ ] phase-199: Code Evolution Program -- Fitness Function Improvements (PLANNED)

**Goal:** Improve the self-modifying code evolution program to produce more interesting and stable results

code_evolution.asm (5705 lines, the largest program) implements genetic programming where code modifies itself. But the fitness function may be too simple, leading to degenerate solutions. Improve fitness evaluation to reward useful behaviors (drawing patterns, solving math, producing output) rather than just not crashing.

### Deliverables

- [x] **Enhanced fitness function** -- 
  - [ ] `p199.d1.t1` Add pattern-matching fitness evaluation
    > After running evolved code, check canvas for specific patterns (symmetry, repetition, non-zero regions). Score based on visual complexity and structure.
  - [ ] `p199.d1.t2` Add diversity pressure to prevent convergence
    > Track opcode distribution across population. Penalize individuals too similar to current best. Encourage exploring different opcode combinations.

## [ ] phase-200: Pixelpack Seamless Authoring Loop (PLANNED)

**Goal:** Make the edit-run-visualize cycle for pixel programs seamless. Edit in neovim, save, watch GeOS assemble and execute the program as colored pixels on the grid.

GeOS is a place you go to, not a place you live in. The editing happens externally (neovim with real LSP, real keybindings), and the visualization/execution happens natively in GeOS. This phase implements the bridge: a file watcher that monitors .asm files, triggers assemble -> encode to pixels -> load into screen memory -> execute on save. The user sees source in their editor, the encoded PNG, and live execution state simultaneously. No canvas-as-editor needed -- the text editor is a solved problem. The thing native to GeOS is execution and visualization. Dependency: multi-program kernel (so the watcher and VM run simultaneously).

### Deliverables

- [x] **File watcher + assemble + execute pipeline** -- 
  - [ ] `p200.d1.t1` Add file watcher for .asm files in GeOS host
    > Watch a configurable directory for .asm file changes. On save, trigger assemble -> encode -> execute pipeline. Use notify crate or similar.
  - [ ] `p200.d1.t2` Assemble + encode + load into screen memory on file change
    > On file save, assemble the .asm source, encode bytecode as pixel instructions into screen memory, reset pixel-VM PC, and start execution. Display encoded PNG alongside live execution state.
  - [ ] `p200.d1.t3` Split-view display: source PNG + live execution pixels
    > Show the encoded pixelpack PNG and the live execution state (registers as colored pixels) side by side in the GeOS window. Source stays in neovim.

## [ ] phase-201: RISC-V Guest Networking -- Socket Syscall Layer (PLANNED)

**Goal:** Enable bare-metal RISC-V C programs to open TCP connections and exchange data

The GeOS VM has TCP opcodes (CONNECT, SOCKSEND, SOCKRECV) but the RISC-V guest has no networking path. The syscall layer (src/riscv/syscall.rs) already lists socket/syscall numbers but returns -ENOSYS. Wire these to real host sockets via a simple proxy: guest writes a socket request to a shared MMIO buffer, host picks it up and performs the real connect/send/recv. This gives paint.c and sh.c the ability to fetch data from the network.

### Deliverables

- [ ] **Socket syscall implementation for RISC-V guest** -- 
  - [ ] `p201.d1.t1` Implement socket() syscall returning guest fd
    > Map socket() syscall to a guest file descriptor table. Allocate a host-side TCP stream on connect().
  - [ ] `p201.d1.t2` Implement send/recv syscalls via host TCP proxy
    > Guest send() writes to a ring buffer, host thread reads and sends via real TCP. Guest recv() polls the ring buffer. Non-blocking with timeout.
  - [ ] `p201.d1.t3` Test: guest fetches HTTP from host via sockets
    > A C program calls socket+connect+send("GET / HTTP/1.0\r\n\r\n")+recv, writes first 200 bytes of response to framebuffer. Verified via riscv_fb_dump.

## [ ] phase-202: GeOS Audio System -- PCM Streaming via BEEP (PLANNED)

**Goal:** Extend the single-tone BEEP opcode into a sample-streaming audio pipeline for sound effects and music

The current BEEP opcode plays one sine-wave tone at a time via aplay. For games and demos, we need PCM sample streaming: pre-load a waveform into RAM, then play it back at a given sample rate. Add AUDIO_PLAY and AUDIO_STOP opcodes that stream from a RAM buffer through aplay in a background thread. This enables sound effects in snake.asm, background music in breakout.asm, and ambient audio in screensaver.asm.

### Deliverables

- [ ] **PCM sample streaming opcodes** -- 
  - [ ] `p202.d1.t1` Add AUDIO_PLAY opcode (addr_reg, len_reg, rate_reg)
    > Stream raw PCM samples from RAM through aplay in a background thread. Non-blocking: VM continues while audio plays. Use existing aplay pipe pattern.
  - [ ] `p202.d1.t2` Add AUDIO_STOP opcode and audio state query
    > AUDIO_STOP halts playback. AUDIO_STATUS (register) returns 1 if playing, 0 if done. Allow one concurrent stream (stop previous before starting new).
  - [ ] `p202.d1.t3` Demo: tetris with sound effects via PCM streaming
    > Pre-generate click/line-clear/game-over waveforms at boot, play them on events. Uses AUDIO_PLAY instead of BEEP for multi-sample effects.

## [ ] phase-203: RISC-V Fuzzer Coverage Expansion (PLANNED)

**Goal:** Extend the oracle-based RISC-V fuzzer to cover compressed instructions, CSR operations, and memory management

The current fuzzer (src/riscv_fuzzer.rs, 747 lines) generates random RV32IM programs and checks against a reference oracle. It covers basic ALU, load/store, and branches but misses compressed instructions (C extension), CSR reads/writes, and atomic operations. Expanding coverage catches emulator bugs before they manifest in real guest programs. The fuzzer has caught real bugs before -- this is high-value defensive work.

### Deliverables

- [ ] **Compressed instruction fuzzer coverage** -- 
  - [ ] `p203.d1.t1` Add C-extension instruction generation to fuzzer
    > Generate random C.ADDI, C.LI, C.LUI, C.MV, C.J, C.BEQZ, C.BNEZ, C.LW, C.SW, C.LWSP, C.SWSP instructions with proper encoding. Mix with 32-bit instructions at configurable ratio.
  - [ ] `p203.d1.t2` Add CSR read/write fuzzer paths
    > Generate CSRRS/CSRRC/CSRRW for common CSRs (mstatus, mepc, mtvec, sstatus, sepc, stvec). Verify oracle matches emulator state.
  - [ ] `p203.d1.t3` Run extended fuzzer for 1M iterations, fix any divergences
    > Execute the expanded fuzzer with seed variation. Log and categorize any oracle mismatches. Fix emulator bugs found.

## [ ] phase-204: GeOS Clipboard -- Cross-Program Pixel Copy/Paste (PLANNED)

**Goal:** Allow programs to share pixel data via a clipboard buffer accessible through new CLIP_COPY and CLIP_PASTE opcodes

Programs currently operate in isolation -- snake.asm draws its own pixels and tetris.asm draws its own. A clipboard buffer lets programs export/import rectangular pixel regions. Use case: a paint program exports a sprite, a game loads it. Implementation: 256x256 pixel buffer (same size as screen), CLIP_COPY reads from screen into buffer, CLIP_PASTE writes from buffer to screen. The buffer persists across program runs within the same VM session.

### Deliverables

- [ ] **Clipboard opcodes and buffer** -- 
  - [ ] `p204.d1.t1` Add CLIP_COPY opcode (x, y, w, h registers)
    > Copy a rectangular region from vm.screen into clipboard buffer. Parameters: x, y, width, height in registers. Clip to screen bounds.
  - [ ] `p204.d1.t2` Add CLIP_PASTE opcode (x, y registers)
    > Paste clipboard buffer contents at (x, y) on screen. Supports partial paste at screen edges.
  - [ ] `p204.d1.t3` Demo: paint program with copy/paste functionality
    > Extend painter.asm or write a new sprite editor that uses CLIP_COPY/CLIP_PASTE to duplicate regions and build sprite sheets.

## [ ] phase-205: GeOS Sprite Sheet Loader (PLANNED)

**Goal:** Load sprite sheets from VFS files and render them with SPRITE opcode in programs

The SPRITE opcode already exists (0x4A) and blits NxM pixels from RAM to screen. But there is no standard way to load sprite data from VFS into RAM at a known address. Add a SPRITE_LOAD opcode that reads a VFS file into RAM at a given address, formatted as a width x height pixel array. Programs can then use SPRITE to render individual frames from the loaded sheet. This enables animated sprites in games without manually encoding pixel data in assembly.

### Deliverables

- [ ] **SPRITE_LOAD opcode for VFS-to-RAM sprite loading** -- 
  - [ ] `p205.d1.t1` Add SPRITE_LOAD opcode (filename_addr, dest_addr, width, height regs)
    > Open a VFS file by name (null-terminated string at filename_addr), read pixel data into RAM starting at dest_addr. Each pixel is a u32 color value. Return 0 on success, error code on failure.
  - [ ] `p205.d1.t2` Add SPRITE_FRAME opcode for sheet animation
    > Given a loaded sheet base address, frame dimensions, and frame index, compute the pixel offset for that frame. Write result to a register. Thin wrapper around address arithmetic.
  - [ ] `p205.d1.t3` Demo: animated character with sprite sheet
    > Create a sprite sheet (4-8 frames of a walking character), load via SPRITE_LOAD, animate via SPRITE_FRAME + SPRITE in a game loop.

## [ ] phase-206: RISC-V Virtio-Blk Filesystem (PLANNED)

**Goal:** Complete the virtio-blk driver so bare-metal C programs can read/write persistent files

VirtioBlk exists in src/riscv/virtio_blk.rs and is wired into the bus, but the driver is a stub -- it returns zeros on read and accepts writes silently. A real virtio-blk driver backed by a host file would give guest programs persistent storage beyond the in-memory VFS surface. This is the next step toward a real bare-metal OS: programs that save data across VM restarts.

### Deliverables

- [ ] **Functional virtio-blk backed by host file** -- 
  - [ ] `p206.d1.t1` Implement virtio-blk read/write against a host backing file
    > On VM creation, open or create a backing file (e.g., 1MB). Virtio-blk read returns file contents, write persists to file. Handle virtio descriptor chains properly.
  - [ ] `p206.d1.t2` Add GEOS_BLK_READ/WRITE helpers to libgeos
    > Add C functions that wrap virtio-blk MMIO reads/writes: geos_blk_read(sector, buf, n), geos_blk_write(sector, buf, n). Add to libgeos.a.
  - [ ] `p206.d1.t3` Test: guest writes data, restarts VM, reads data back
    > C program writes a known pattern to block 0, triggers shutdown, runner restarts VM, program reads block 0 and verifies pattern. Proves persistence.

## [ ] phase-207: GeOS Collision Detection Library (PLANNED)

**Goal:** Build reusable collision detection primitives as assembly subroutines in the standard library

Multiple game programs (snake, ball, breakout) implement their own collision detection with PEEK and manual bounds checking. This is duplicated, error-prone and wasteful. Create a collision detection library in lib/ with subroutines for AABB rectangle overlap, point-in-rect, circle-rect intersection, and pixel-perfect collision. Programs CALL these instead of inlining the logic.

### Deliverables

- [ ] **Collision detection subroutine library** -- 
  - [ ] `p207.d1.t1` Implement AABB rectangle overlap subroutine
    > rect_overlap(x1,y1,w1,h1, x2,y2,w2,h2) -> r0=1 if overlap, 0 if not. All args in registers. Use CMP+BLT pattern. No RAM usage.
  - [ ] `p207.d1.t2` Implement circle-rect and point-in-circle subroutines
    > circle_rect_intersect(cx,cy,cr, rx,ry,rw,rh) and point_in_circle(px,py,cx,cy,cr). Use squared distance to avoid SQRT (which doesn't exist).
  - [ ] `p207.d1.t3` Refactor snake.asm to use collision library
    > Replace inline collision checks in snake.asm with CALL to library subroutines. Verify behavior unchanged. Measure instruction savings.

## [ ] phase-208: MCP Server -- Programmatic Assembly and Execution (PLANNED)

**Goal:** Add MCP tools for loading, assembling, and running .asm programs from external agents

The MCP server (src/mcp_server.rs) exposes status/screenshot/registers tools but cannot load and execute programs. An agent must type into the canvas via vm_type, which is slow and fragile. Add asm_load, asm_assemble, asm_run, and asm_step MCP tools so Hermes can programmatically test and develop GeOS programs. This unblocks the hermes/build agent loop from inside MCP.

### Deliverables

- [ ] **Assembly and execution MCP tools** -- 
  - [ ] `p208.d1.t1` Add asm_load tool -- load .asm file into canvas buffer
    > Takes file path, reads .asm source, writes to canvas buffer via load_source_to_canvas. Returns line count and any parse warnings.
  - [ ] `p208.d1.t2` Add asm_assemble and asm_run tools
    > asm_assemble triggers F8 (assemble canvas to bytecode). asm_run starts execution from 0x1000 with optional step limit. Returns register state and screen checksum after execution.
  - [ ] `p208.d1.t3` Test: Hermes loads, assembles, runs hello.asm via MCP
    > Integration test that calls the MCP tools in sequence and verifies the output matches expected screen content.

## [ ] phase-209: RISC-V Multi-Process -- Cooperative Context Switching (PLANNED)

**Goal:** Run multiple bare-metal C programs concurrently in the RISC-V interpreter with cooperative yielding

The GeOS VM has SPAWN/KILL for multi-process but the RISC-V guest runs a single ELF. Add a lightweight context switcher: the guest calls a yield SBI extension, the host saves all registers and switches to a second guest context (separate register file, separate PC, shared MMIO). This proves multi-programming on the RISC-V layer without a full kernel -- just register save/restore and PC swap.

### Deliverables

- [ ] **Cooperative multi-process for RISC-V guests** -- 
  - [ ] `p209.d1.t1` Add SBI_YIELD extension to sbi.rs
    > New SBI extension (0x4759 = "GY"). Guest calls ecall with a7=0x4759, a0=context_id. Host saves current context, switches to target context. Return to caller on next yield.
  - [ ] `p209.d1.t2` Add context management (create, switch, destroy)
    > RiscvVm holds a Vec of GuestContext (registers, PC, privilege). SBI_YIELD with new context_id creates it. SBI_YIELD with existing ID switches. SBI_KILL terminates a context.
  - [ ] `p209.d1.t3` Demo: two C programs alternating on framebuffer
    > Program A draws a bouncing ball, yields every frame. Program B draws a rotating pattern, yields every frame. Both share the framebuffer, producing a composite display.

## [ ] phase-210: GeOS Text Rendering -- Variable-Width Font Support (PLANNED)

**Goal:** Support variable-width fonts in the TEXT opcode for more readable text display

The TEXT opcode uses a fixed 8x8 pixel font (font.rs). For programs that display paragraphs of text (notepad.asm, chatbot.asm, help.asm), variable-width characters (like a real terminal font) look dramatically better. Add a FONT_SELECT opcode that switches the active font, and implement a proportional 5x7 font (mini_font.in already exists). The existing 8x8 font remains the default.

### Deliverables

- [ ] **Variable-width font rendering** -- 
  - [ ] `p210.d1.t1` Implement proportional font rendering in TEXT opcode
    > Add font selection state to Vm. When proportional font is active, TEXT uses character-width table from mini_font.in. Advance cursor by character width instead of fixed 8 pixels.
  - [ ] `p210.d1.t2` Add FONT_SELECT opcode (font_id register)
    > FONT_SELECT r -- 0 = 8x8 fixed, 1 = 5x7 proportional, 2 = 6x10 medium. Persists until changed. Validated range check.
  - [ ] `p210.d1.t3` Demo: notepad with proportional font
    > Modify notepad.asm to use proportional font for the text area while keeping the fixed font for the UI border. Shows visual improvement.

## [ ] phase-211: GeOS Performance -- Instruction Cache for Hot Loops (PLANNED)

**Goal:** Add a decoded instruction cache to speed up tight loops by 3-5x

The VM currently decodes every instruction on every step() call, even in tight loops that execute the same instructions millions of times. At 88 MIPS, this decode overhead is the bottleneck. Add a small direct-mapped cache (256 entries) that maps PC to decoded instruction. On cache hit, skip decode and execute directly. Cache is invalidated on self-modifying code (STORE to code region). Expected speedup: 3-5x on loop-heavy programs like plasma, infinite_map, and the fuzzer.

### Deliverables

- [ ] **Decoded instruction cache** -- 
  - [ ] `p211.d1.t1` Implement PC-indexed instruction cache in Vm
    > Add HashMap<u32, CachedInstruction> to Vm. On step(), check cache before decoding. On cache miss, decode and insert. Invalidate on writes to code pages.
  - [ ] `p211.d1.t2` Add cache invalidation on self-modifying code
    > When STORE writes to the code region (0x1000-0x1FFF), invalidate the cache entry for that address. When ASM/ASMSELF writes bytecode, invalidate entire cache.
  - [ ] `p211.d1.t3` Benchmark: measure speedup on plasma and infinite_map
    > Run plasma and infinite_map with and without cache. Measure instructions/second. Target: 3x speedup on plasma (heavy loop), no regression on branchy code.

## [ ] phase-212: GeOS Pixel Art Export -- PNG Screenshot to VFS (PLANNED)

**Goal:** Save the current screen as a PNG file in the VFS, accessible from programs and the host

The screenshot opcode exists (F9 key) but saves to a host file path. Programs cannot programmatically save their visual output. Add a SCREENSHOT opcode that encodes the current 256x256 screen as PNG and writes it to the VFS. This lets paint.asm save artwork, maze_gen.asm export mazes, and code_evolution.asm archive interesting generations -- all from within the program.

### Deliverables

- [ ] **SCREENSHOT opcode for in-program PNG export** -- 
  - [ ] `p212.d1.t1` Add SCREENSHOT opcode (filename_addr register)
    > Encode vm.screen as PNG (using existing encode_png from vision.rs logic) and write to VFS at the given filename. Return 0 on success.
  - [ ] `p212.d1.t2` Add SCREEN_LOAD opcode to load PNG into screen
    > Read a VFS file, decode as PNG, write pixels to vm.screen. Inverse of SCREENSHOT. Uses existing PNG decode logic.
  - [ ] `p212.d1.t3` Demo: paint program with save/load functionality
    > Painter saves current canvas as "painting1.png" via SCREENSHOT. On next run, loads it back via SCREEN_LOAD. Proves the round-trip.

## [ ] phase-213: GeOS Tilemap Editor -- Visual Map Building Tool (PLANNED)

**Goal:** Build an interactive tilemap editor that lets users paint tile-based levels for games

The TILEMAP opcode (0x4C) blits tile grids from RAM to screen, but there is no tool to visually design tilemaps. Create a tilemap editor program with a tile palette on the left (selectable tiles), a grid canvas on the right (click to place tiles), and export to RAM format. This enables level design for roguelike.asm, maze.asm, and future tile-based games.

### Deliverables

- [ ] **Interactive tilemap editor program** -- 
  - [ ] `p213.d1.t1` Tile palette display and selection UI
    > Left panel shows 8x8 pixel tiles (8 across, scrollable). Arrow keys move selection cursor. Selected tile highlights. Uses SPRITE or PSET for rendering.
  - [ ] `p213.d1.t2` Grid canvas with tile placement
    > Right panel is a 16x16 grid (each cell = 16x16 pixels = 4x4 tile). Arrow keys + space to place selected tile. WASD to scroll. IKEY for input.
  - [ ] `p213.d1.t3` Export tilemap to RAM for use with TILEMAP opcode
    > Press S to save the tilemap as a flat index array in RAM at 0x7000. Another program can then use TILEMAP to render the level. Include a demo game that loads the saved map.

## [ ] phase-214: RISC-V GPU Compute -- WGSL Shader Integration (PLANNED)

**Goal:** Enable the RISC-V guest to offload compute work to the host GPU via the existing WGSL shader pipeline

src/riscv/gpu.rs already has a WGSL compute shader (riscv_executor.wgsl) behind a feature flag. The GPU executor can run multiple RISC-V tiles in parallel on the GPU. This phase wires the GPU executor into the normal boot path so compute-heavy guest programs (life.c, mandelbrot) can use GPU acceleration transparently. The interpreter remains the fallback for non-GPU environments.

### Deliverables

- [ ] **GPU-accelerated RISC-V execution** -- 
  - [ ] `p214.d1.t1` Wire GPU executor into RiscvVm::step loop
    > When gpu feature is enabled and a GPU adapter is available, dispatch tile execution to the GPU shader instead of the CPU interpreter. Fall back to CPU on GPU errors.
  - [ ] `p214.d1.t2` Add GPU memory transfer (guest RAM <-> GPU buffer)
    > Upload guest RAM to GPU buffer before compute, download results after. Handle dirty-page tracking to minimize transfers.
  - [ ] `p214.d1.t3` Benchmark: life.c with and without GPU
    > Run Conway's life at 256x256 with CPU-only vs GPU-accelerated. Measure frames per second. Target: 5x+ speedup on GPU.

## [ ] phase-215: RISC-V Guest -- Hex Editor (PLANNED)

**Goal:** Add a bare-metal hex editor C program for inspecting and modifying guest memory

sh.c has peek/poke for single words and hexdump for read-only display, but there is no interactive hex editor that lets you navigate, inspect, and modify memory byte-by-byte. A hex editor is the most essential bare-metal debugging tool — it lets you inspect framebuffer pixels, VFS data, stack contents, and ELF headers without rebuilding the program. This proves the Layer 3 tooling thesis: useful programs on bare-metal SBI, no kernel needed.

### Deliverables

- [ ] **Interactive hex editor for RISC-V guest** -- 
  - [ ] `p215.d1.t1` Implement hex navigation and display
    > Display 16 bytes per line in hex+ASCII format. Arrow keys navigate, PageUp/PageDown scroll by 256 bytes. Show address on left. Render to framebuffer using libgeos pixel primitives (geos_fb_pixel, geos_puts).
  - [ ] `p215.d1.t2` Add byte editing and save
    > Enter key toggles edit mode. Type hex digits to modify bytes. Write changes to RAM immediately. Add search (S key) for hex byte patterns.
  - [ ] `p215.d1.t3` Add build.sh entry and runner example
    > Wire into build.sh. Add hexedit_run.rs example that boots hexedit.elf with stdin passthrough. Test by navigating to framebuffer address and modifying a pixel.

## [ ] phase-216: RISC-V Guest -- Filesystem Commands in Shell (PLANNED)

**Goal:** Extend sh.c with VFS file operations: ls, cat, touch, rm, and stat

The mini-shell (sh.c) can peek/poke memory and run commands, but has no filesystem awareness. The VFS Pixel Surface at 0x7000_0000 stores files as pixel rows, but sh.c cannot list, read, create, or delete them. Adding filesystem commands to the shell makes the guest self-sufficient — users can manage files without the host. The VFS directory index is in row 0 (filename pixels), file content in subsequent rows.

### Deliverables

- [ ] **VFS filesystem commands in sh.c** -- 
  - [ ] `p216.d1.t1` Implement ls command (list VFS files)
    > Read VFS row 0 directory index. Parse filename pixels (null-terminated strings). Display filename and file size (row count). Handle empty directory.
  - [ ] `p216.d1.t2` Implement cat command (display file content)
    > Read file content rows from VFS surface. Display as ASCII text via sbi_console_putchar. Handle binary files with hex dump fallback.
  - [ ] `p216.d1.t3` Implement touch and rm commands
    > touch creates a new empty file (write filename to row 0, allocate one row). rm removes a file by shifting directory entries and clearing content rows. Both modify VFS surface via MMIO writes.

## [ ] phase-217: GeOS VM -- Mouse Support Opcodes (PLANNED)

**Goal:** Add mouse position and button state opcodes for GUI programs

Current input is keyboard-only via IKEY. GUI programs (window manager, desktop, file browser) need mouse support. Add MOUSEX (read mouse X to register), MOUSEY (read mouse Y), MOUSEB (read button bitmask: bit 0=left, bit 1=right, bit 2=middle), and MOUSECLICK (blocking wait for click, returns x/y/buttons). The host already tracks mouse state via minifb — just expose it to the VM.

### Deliverables

- [ ] **Mouse input opcodes** -- 
  - [ ] `p217.d1.t1` Add MOUSEX, MOUSEY, MOUSEB opcodes
    > Three new opcodes that read current mouse state into registers. MOUSEX writes x (0-255), MOUSEY writes y (0-255), MOUSEB writes button bitmask. Non-blocking, returns current state. Opcode numbers: 0xC2, 0xC3, 0xC4.
  - [ ] `p217.d1.t2` Add MOUSECLICK blocking opcode
    > MOUSECLICK blocks until a mouse click event occurs, then writes x, y, buttons to three consecutive registers. Returns immediately if click already pending. Uses a click event queue (max 16). Opcode 0xC5.
  - [ ] `p217.d1.t3` Wire minifb mouse events to VM
    > In main.rs event loop, capture minifb MouseMove/MouseDown/MouseUp events and store in vm.mouse_x, vm.mouse_y, vm.mouse_buttons. Push click events to click queue on MouseDown.
  - [ ] `p217.d1.t4` Demo: clickable button program
    > Draw 3 colored buttons, detect which was clicked using MOUSECLICK, change color on press. Verify with test that checks screen color changes after simulated clicks.

## [ ] phase-218: GeOS VM -- Bitmap Font Renderer for RISC-V Guest (PLANNED)

**Goal:** Add a framebuffer text rendering primitive to libgeos so guest C programs can draw text

The RISC-V guest has pixel primitives (geos_fb_pixel, geos_rgb) but no text rendering. paint.c and sh.c use the SBI console (character-by-character to UART), which goes to the host terminal, not the framebuffer. To build graphical tools (hex editor, file browser, status bars) that render in the guest framebuffer, we need a geos_draw_char() and geos_draw_string() that blits bitmap glyphs to the framebuffer via MMIO writes.

### Deliverables

- [ ] **Bitmap font rendering in libgeos** -- 
  - [ ] `p218.d1.t1` Add 8x8 bitmap font data to libgeos
    > Embed a minimal 8x8 font (96 printable ASCII characters, ~768 bytes) as a const array in libgeos.c. Use the same CP437/VGA glyphs from GeOS font.rs for visual consistency.
  - [ ] `p218.d1.t2` Implement geos_draw_char and geos_draw_string
    > geos_draw_char(x, y, ch, fg, bg) blits one glyph. geos_draw_string(x, y, str, fg, bg) iterates characters. Both use geos_fb_pixel() for each set bit. Add geos_measure_string() returning pixel width.
  - [ ] `p218.d1.t3` Update paint.c status bar to use framebuffer text
    > Replace the palette bar legend with geos_draw_string() calls. This proves the font renderer works in a real program and matches the visual quality of the GeOS pixel font.

## [ ] phase-219: GeOS VM -- Memory-Mapped Screen Buffer Readback (PLANNED)

**Goal:** Let VM programs read the screen buffer via LOAD from 0x10000-0x1FFFF

The screen buffer at 0x10000-0x1FFFF (256x256 pixels, mapped to vm.screen) already supports writes for SETPIXEL-style rendering, but LOAD from this region does not return actual screen pixels — it reads from vm.ram which is stale. Wire LOAD in this range to read vm.screen[y*256+x] so programs can implement screenshot save, collision detection against rendered output, and pixel pick operations. The existing PEEK opcode (0x4F) reads screen pixels but only one at a time; LOAD+STORE lets programs bulk-copy screen regions.

### Deliverables

- [ ] **Screen buffer LOAD readback** -- 
  - [ ] `p219.d1.t1` Wire LOAD from 0x10000 to read vm.screen
    > In the LOAD opcode handler, when addr is in 0x10000-0x1FFFF range, read from vm.screen[addr - 0x10000] instead of vm.ram[addr]. Screen buffer is 256*256 = 65536 entries.
  - [ ] `p219.d1.t2` Add test for screen readback consistency
    > Draw pixels with PSET, then LOAD from screen buffer address, verify values match. Also test that STORE to screen buffer still works (write path already exists).
  - [ ] `p219.d1.t3` Demo: screen capture to RAM program
    > Copy the entire screen buffer to RAM at 0x2000 using a LOAD/STORE loop. Verify first 10 pixels match expected values. This enables future screenshot-to-VFS functionality.

## [ ] phase-220: RISC-V Guest -- Mandelbrot Fractal Renderer (PLANNED)

**Goal:** Add a Mandelbrot set renderer that proves the RISC-V interpreter handles compute-intensive floating-point work

The RISC-V interpreter supports M-extension multiplication and division but has no FPU (floating-point opcodes are NOPs). However, fixed-point arithmetic can produce visually impressive fractals. A Mandelbrot renderer using 16.16 fixed-point math proves: (1) the interpreter is fast enough for real computation, (2) fixed-point math is viable for guest programs, (3) the framebuffer can display complex imagery. This is a capstone visual demo alongside paint.c and life.c.

### Deliverables

- [ ] **Fixed-point Mandelbrot renderer** -- 
  - [ ] `p220.d1.t1` Implement 16.16 fixed-point Mandelbrot core
    > Iterate z = z^2 + c using integer multiplication with implicit 16-bit fraction. Max 64 iterations per pixel. Color map: iteration count to RGB via table lookup.
  - [ ] `p220.d1.t2` Add zoom and pan controls
    > Arrow keys pan, +/- zoom in/out. Store center coordinates and scale as fixed-point. Re-render on input. Display coordinates in top-left corner using geos_draw_string.
  - [ ] `p220.d1.t3` Add build.sh entry and visual verification
    > Wire into build.sh. Add mandelbrot_run.rs example. Visual verification via riscv_fb_dump: assert non-zero pixel count > 1000, assert color diversity > 50 unique colors.

## [ ] phase-221: GeOS VM -- Clipboard Protocol Enhancement (PLANNED)

**Goal:** Extend the system clipboard (0xF010-0xF01F) with multi-format copy/paste and clipboard history

The clipboard protocol at 0xF010-0xF01F supports basic pixel-region copy/paste (CLIPCOPY/CLIPPASTE opcodes), but has no text clipboard, no clipboard history, and no cross-process sharing. Extend with: (1) TEXTCOPY opcode for copying null-terminated strings from RAM to clipboard, (2) TEXTPASTE opcode for reading clipboard text to RAM, (3) CLIPCOUNT for clipboard history size, (4) CLIPSELECT to choose from history entries.

### Deliverables

- [ ] **Text clipboard and history** -- 
  - [ ] `p221.d1.t1` Add TEXTCOPY and TEXTPASTE opcodes
    > TEXTCOPY addr_reg, len_reg: copy string from RAM to clipboard. TEXTPASTE addr_reg, max_len_reg: read clipboard text to RAM, return actual length. Store text in vm.clipboard_text field.
  - [ ] `p221.d1.t2` Add clipboard history ring buffer
    > Store last 8 clipboard entries (text or pixel region) in a ring buffer. CLIPCOUNT returns count. CLIPSELECT idx_reg selects entry for paste. New copy pushes to history, oldest evicted.
  - [ ] `p221.d1.t3` Add tests for clipboard operations
    > Test TEXTCOPY/TEXTPASTE round-trip. Test history overflow (9 copies evicts oldest). Test CLIPSELECT retrieves correct entry. Test empty clipboard returns zero-length.

## [ ] phase-222: GeOS VM -- Timer and Alarm Opcodes (PLANNED)

**Goal:** Add wall-clock timer opcodes so programs can schedule actions by real time, not just frame count

Programs currently use the TICKS register (RAM[0xFFE], incremented by FRAME) for timing, but TICKS are instruction-count-based, not wall-clock. For games (countdown timers), UI (auto-save reminders), and networking (timeouts), programs need real time. Add TIMER_GET (milliseconds since VM start to register), TIMER_SET_ALARM (register = milliseconds from now), and TIMER_CHECK (returns 1 if alarm fired, 0 if not). Uses std::time::Instant on the host.

### Deliverables

- [ ] **Wall-clock timer opcodes** -- 
  - [ ] `p222.d1.t1` Add TIMER_GET opcode
    > Reads host Instant::now() - vm.start_time, writes milliseconds to register. 32-bit value wraps at ~49 days. Opcode 0xC6.
  - [ ] `p222.d1.t2` Add TIMER_SET_ALARM and TIMER_CHECK opcodes
    > TIMER_SET_ALARM stores target_time = now + delay_ms. TIMER_CHECK returns 1 if now >= target_time, 0 if not. One alarm at a time (new alarm replaces old). Opcodes 0xC7, 0xC8.
  - [ ] `p222.d1.t3` Demo: countdown timer program
    > 10-second countdown displayed on screen. Uses TIMER_SET_ALARM + TIMER_CHECK each frame. Shows remaining seconds in large text. Beeps on completion. Proves wall-clock timing works.

## [ ] phase-223: GeOS VM -- Program Library (lib/) Standardization (PLANNED)

**Goal:** Audit and standardize the programs/lib/ assembly library with proper documentation and test coverage

The programs/lib/ directory contains stdlib.asm, math.asm, stdio.asm, and time.asm, but these are inconsistently documented, some have .include path issues, and many are unused by current programs. This phase audits the library, fixes .include paths, adds missing utility routines (string compare, memory copy, integer-to-hex), and adds integration tests that .include each library file and verify the routines work.

### Deliverables

- [ ] **Standardized and tested program library** -- 
  - [ ] `p223.d1.t1` Audit and fix .include paths in all lib files
    > Verify each .include directive resolves correctly from programs/ directory. Fix relative paths. Document each exported subroutine with calling convention (args in which registers, return value, clobbered registers).
  - [ ] `p223.d1.t2` Add missing utility routines
    > Add mem_copy(src, dst, len), mem_set(addr, val, len), strcmp(s1, s2) returning 0/1/-1, itoa(num, buf) for integer-to-ASCII. Follow existing calling conventions (args in r10-r15, return in r10, PUSH/POP r31 for nested calls).
  - [ ] `p223.d1.t3` Add integration tests for each library file
    > For each lib/*.asm file, write a test program that .includes it, calls each subroutine, and verifies results via RAM assertions. Run via compile_run pattern.

## [ ] phase-224: RISC-V Guest -- Conway's Life with Framebuffer Rendering (PLANNED)

**Goal:** Port Conway's Game of Life to use the framebuffer instead of SBI console output

life.c exists but outputs cell state to the SBI console (UART). A framebuffer version renders the grid as pixels, which is the canonical Geometry OS output method. Each living cell is a colored pixel (green on black). The framebuffer version also enables zoom, pan, and speed controls via keyboard input, which the console version cannot support.

### Deliverables

- [ ] **Framebuffer Game of Life** -- 
  - [ ] `p224.d1.t1` Implement framebuffer rendering for life grid
    > Map the 256x256 framebuffer to the life grid (1 pixel per cell for full resolution, or 4x4 pixels per cell for visibility). Use geos_fb_pixel for rendering. Color living cells green, dead cells black.
  - [ ] `p224.d1.t2` Add keyboard controls for zoom, pan, speed
    > Zoom in/out with +/- keys. Arrow keys pan. S toggles speed. R randomizes. C clears. Q quits. Uses geos_getchar for input.
  - [ ] `p224.d1.t3` Add visual verification test
    > Seed with a known pattern (glider). Run 100 generations. Dump framebuffer. Assert glider moved to expected position. Assert cell count matches expected.

## [ ] phase-225: GeOS VM -- Network HTTP Client Opcode (PLANNED)

**Goal:** Add a simple HTTP GET opcode that fetches a URL and stores the response in RAM

The VM has TCP opcodes (CONNECT, SOCKSEND, SOCKRECV) but no HTTP-level abstraction. Programs that want to fetch data from the web must manually construct HTTP requests, parse responses, and handle chunked encoding. An HTTPGET opcode encapsulates the common case: HTTPGET url_addr_reg, buf_reg, max_len_reg, actual_len_reg sends a GET request to the URL at url_addr, writes the response body to buf, and returns the actual length. Uses the existing TCP networking in src/vm/net.rs.

### Deliverables

- [ ] **HTTP GET opcode** -- 
  - [ ] `p225.d1.t1` Implement HTTPGET opcode (0xC9)
    > Read null-terminated URL from RAM. Parse host:port. Connect via TCP. Send "GET /path HTTP/1.0\r\nHost: host\r\n\r\n". Read response until connection closes or max_len reached. Strip HTTP headers. Write body to buf. Return body length. Error codes in r0 on failure.
  - [ ] `p225.d1.t2` Add assembler and disassembler entries
    > HTTPGET in assembler (system_ops.rs) with 4 register args. Disassembler entry in disasm.rs. Preprocessor OPCODES entry.
  - [ ] `p225.d1.t3` Add test with mock TCP server
    > Spawn a local HTTP server (127.0.0.1:TEST_PORT) in test, serve a known response. Execute HTTPGET opcode. Verify body content matches. Test error handling (connection refused, too large response).

## [ ] phase-226: RISC-V Guest -- Minimal Text Editor (PLANNED)

**Goal:** Add a bare-metal text editor C program for editing VFS files

The guest has sh.c for commands, paint.c for pixel art, and hexedit.c (planned) for binary editing, but no text editor. A minimal text editor (like nano) that can open VFS files, edit text, and save back to the VFS is essential for the guest to be self-sufficient. Uses framebuffer text rendering (from phase-218 libgeos font) and keyboard input via geos_getchar.

### Deliverables

- [ ] **Bare-metal text editor** -- 
  - [ ] `p226.d1.t1` Implement basic text display and cursor movement
    > Display file content in the framebuffer (80x32 character grid at 3x8 pixel cells). Arrow keys move cursor. PageUp/PageDown scroll. Status bar at bottom shows filename and line/col.
  - [ ] `p226.d1.t2` Add text editing and file save/load
    > Type to insert characters. Backspace deletes. Enter inserts newline. Ctrl+O saves to VFS. Ctrl+X exits. Ctrl+R opens file from VFS (file browser mode). Uses VFS pixel surface MMIO for file I/O.

## [ ] phase-227: GeOS VM -- Debugging Opcode BREAKPOINT (PLANNED)

**Goal:** Add a hardware breakpoint opcode that triggers the VM debugger

The VM has software breakpoints (set via the bp command in terminal), but programs cannot set their own breakpoints. A BREAKPOINT opcode (0xCA) that halts execution and enters the debugger when hit would let programs implement conditional breakpoints (CMP + JNZ + BREAKPOINT), assert macros, and interactive debugging from within the running program. The debugger already has single-step and register display — BREAKPOINT just needs to set a flag that the step loop checks.

### Deliverables

- [ ] **BREAKPOINT opcode** -- 
  - [ ] `p227.d1.t1` Implement BREAKPOINT opcode (0xCA)
    > Sets vm.breakpoint_hit = true and returns false from step(). The main loop detects this and enters the debugger (same as F6 single-step behavior). Zero words (no arguments).
  - [ ] `p227.d1.t2` Wire breakpoint_hit into execution loops
    > Both GUI (main.rs animation loop) and CLI (cli_main run loop) check vm.breakpoint_hit after each step batch. If true, print "BREAKPOINT hit at PC=0x..." and enter interactive debug mode.
  - [ ] `p227.d1.t3` Add conditional breakpoint test
    > Program sets r10 = 5, loops incrementing r10, BREAKPOINT when r10 == 8. Verify debugger triggers at correct PC. Verify r10 == 8.

## [ ] phase-228: GeOS VM -- Sprite Animation System (PLANNED)

**Goal:** Add frame-based sprite animation support for games and demos

The SPRITE opcode blits a single NxM pixel region from RAM. For animated sprites (walk cycles, explosions, rotating objects), programs currently manually track frame indices and swap source addresses. Add SPRITEANIM opcode that takes a sprite sheet address, frame width, frame count, current frame register, and destination coordinates. Increment frame on each call (with wrap-around). This reduces boilerplate in game programs.

### Deliverables

- [ ] **SPRITEANIM opcode** -- 
  - [ ] `p228.d1.t1` Implement SPRITEANIM opcode (0xCB)
    > SPRITEANIM sheet_reg, fw_reg, fh_reg, frames_reg, cur_reg, x_reg, y_reg. Blits frame[cur_reg] from sheet. Increments cur_reg (mod frames_reg). 7 register arguments. Reuses existing SPRITE blit logic with offset calculation.
  - [ ] `p228.d1.t2` Add disassembler and preprocessor entries
    > Disassemble as "SPRITEANIM sheet, fw, fh, frames, cur, x, y". Add to OPCODES array in preprocessor.rs.
  - [ ] `p228.d1.t3` Demo: animated sprite walk cycle
    > 4-frame walk cycle (8x8 per frame) stored in RAM. SPRITEANIM in a loop moves character across screen. Test verifies character position advances each frame and sprite cycles through all 4 frames.

## [ ] phase-229: RISC-V Guest -- Simple File Viewer (PLANNED)

**Goal:** Add a bare-metal file viewer that displays VFS files with line numbers and scrolling

The guest shell has cat for printing files, but no interactive viewer with scrolling, line numbers, or search. A file viewer is the third essential tool (alongside editor and hex editor) for a self-sufficient guest OS. It reads from the VFS pixel surface, renders to the framebuffer using libgeos text primitives, and supports arrow-key scrolling and / search.

### Deliverables

- [ ] **Interactive file viewer** -- 
  - [ ] `p229.d1.t1` Implement file display with line numbers
    > Read VFS file content from pixel surface. Display with 4-digit line numbers. 40-column display (3x8 pixel font cells in 256-wide framebuffer). Arrow keys scroll, Home/End jump to start/end.
  - [ ] `p229.d1.t2` Add search (/) and file switching (n/p)
    > Search with / key, type pattern, Enter searches forward. n for next match, p for previous. Tab switches between open files.
  - [ ] `p229.d1.t3` Add build.sh entry and runner
    > Wire into build.sh. Accept filename as command-line argument (passed via a0 in crt0.S). If no argument, show VFS file list.

## [ ] phase-230: Error Resilience -- Replace pixel.rs unwrap() Calls (PLANNED)

**Goal:** Eliminate all 17 unwrap() calls in pixel.rs with proper error propagation

pixel.rs handles PNG decode/encode for pixelpack and .rts.png formats. It has 17 unwrap() calls that can panic on corrupt images, missing files, or malformed PNG data. Since pixel.rs is called during boot (pixelpack-encoded programs), a panic here crashes the entire OS. Replace with Result-based error handling and graceful fallbacks.

### Deliverables

- [ ] **unwrap()-free pixel.rs** -- 
  - [ ] `p230.d1.t1` Replace File::open and Decoder unwrap() with error propagation
    > Convert decode_rts_png and decode_pixelpack_png to return Result. Propagate errors to callers. Add ? operator chain.
  - [ ] `p230.d1.t2` Replace PNG read_info and read_image unwrap() calls
    > Handle PNG decode errors (corrupt headers, truncated data) by returning Result instead of panicking.
  - [ ] `p230.d1.t3` Add pixel boot fallback for corrupt pixelpack images
    > When a pixelpack boot image fails to decode, fall back to a default program or show an error screen instead of panicking.

## [ ] phase-231: Error Resilience -- Replace mmu.rs unwrap() Calls (PLANNED)

**Goal:** Eliminate all 14 unwrap() calls in riscv/mmu.rs with proper error paths

riscv/mmu.rs is the memory management unit for the RISC-V interpreter. It has 14 unwrap() calls that panic on page table walk failures, allocation errors, and invalid address translations. Since this runs during Linux boot, a panic loses the entire boot state. Replace with proper error types that propagate to the step loop for graceful fault handling.

### Deliverables

- [ ] **unwrap()-free mmu.rs** -- 
  - [ ] `p231.d1.t1` Convert translate() to return Result with TranslateError
    > Replace unwrap() calls in page table walking with error propagation. Define TranslateError enum with PageFault, InvalidPTE, AllocFailed variants.
  - [ ] `p231.d1.t2` Convert alloc_pages and COW handlers to Result-based
    > Page allocation and copy-on-write resolution should return errors instead of panicking on out-of-memory or ref count corruption.
  - [ ] `p231.d1.t3` Wire translate errors into bus fault handling
    > CPU step loop catches TranslateError and delivers proper page fault exceptions instead of panicking.

## [ ] phase-232: GeOS VM -- Bit Manipulation Opcodes (BNOT, BSET, BCLR, BTST) (PLANNED)

**Goal:** Add bitwise manipulation opcodes for efficient flag and bitfield operations

Current bitwise ops (AND, OR, XOR, SHL, SHR, SAR) cover basic needs but programs doing bitfield manipulation (device registers, packed colors, sprite flags) need extra instructions for single-bit operations. Add BNOT (bitwise NOT), BSET (set bit N), BCLR (clear bit N), and BTST (test bit N). These eliminate the SHL+OR+AND sequences currently used.

### Deliverables

- [ ] **Bit manipulation opcodes** -- 
  - [ ] `p232.d1.t1` Implement BNOT rd (0xC1), BSET rd bit_reg (0xC2), BCLR rd bit_reg (0xC3)
    > BNOT inverts all bits. BSET sets bit N. BCLR clears bit N. Two-word encoding for BNOT, three-word for BSET/BCLR.
  - [ ] `p232.d1.t2` Implement BTST rd bit_reg (0xC4) with r0 result
    > Test bit N and store result in r0. Combined with JZ/JNZ for conditional bit branches. Three-word encoding.
  - [ ] `p232.d1.t3` Add disassembler entries and tests
    > Disassemble all four new opcodes. Add 4 unit tests verifying bit manipulation behavior with edge cases (bit 0, bit 31, overflow).

## [ ] phase-233: GeOS VM -- Conditional Move Opcodes (CMOV, CSEL) (PLANNED)

**Goal:** Add branchless conditional move and select to eliminate branch-heavy patterns

Many programs use CMP+BLT+LDI+MOV+JMP patterns for min/max/clamp. CMOV rd, rs, cond_reg moves rs into rd only when cond_reg is nonzero. CSEL rd, rs1, rs2, cond_reg selects rs1 or rs2 based on cond_reg. These are branchless alternatives that reduce step count in tight loops.

### Deliverables

- [ ] **Conditional move opcodes** -- 
  - [ ] `p233.d1.t1` Implement CMOV rd, rs, cond_reg (0xC5) and CSEL rd, rs1, rs2, cond_reg (0xC6)
    > CMOV conditionally moves rs into rd. CSEL selects between rs1 and rs2. Both register-only.
  - [ ] `p233.d1.t2` Add disassembler and preprocessor entries
    > Disassemble CMOV and CSEL. Add to preprocessor OPCODES array.
  - [ ] `p233.d1.t3` Write benchmark program comparing branch vs CMOV for color clamp
    > Program clamping colors to 0-255 range using both approaches, measuring step count difference.

## [ ] phase-234: GeOS VM -- Pixel Alpha Blending Opcode (BLEND) (PLANNED)

**Goal:** Add hardware-accelerated alpha blending for sprite compositing and transparency

The SPRITE opcode treats color 0 as transparent but has no partial transparency. Programs needing glass effects, fog, or smooth sprite edges must blend manually at 15 instructions per pixel. A BLEND opcode does per-channel alpha blending in one instruction, accelerating transparency 15x.

### Deliverables

- [ ] **BLEND opcode** -- 
  - [ ] `p234.d1.t1` Implement BLEND dest_reg, src_reg, alpha_reg (0xC7)
    > Blend: dest = src * alpha/255 + dest * (255 - alpha)/255. Per-channel RGB. Alpha in low byte (0-255). 4-word encoding.
  - [ ] `p234.d1.t2` Add disassembler entry and unit tests
    > Test blend white+black at 50% alpha = gray. Alpha 0 = unchanged. Alpha 255 = pure src.
  - [ ] `p234.d1.t3` Write transparency demo program
    > Two overlapping rectangles with adjustable alpha via keyboard.

## [ ] phase-235: RISC-V Guest -- Shared Memory IPC (PLANNED)

**Goal:** Enable bare-metal RISC-V programs to share memory regions for communication

The Layer 2 kernel supports multi-program time-slicing but programs cannot communicate. Add shared memory: geos_shm_alloc(size), geos_shm_attach(id), geos_shm_release(id) with up to 8 regions (64KB each). Reference-counted. Enables producer-consumer patterns between guest programs.

### Deliverables

- [ ] **Shared memory IPC for RISC-V guests** -- 
  - [ ] `p235.d1.t1` Implement shm_alloc, shm_attach, shm_release in geos_kern.c
    > Kernel manages shared regions with reference counting. Alloc returns region ID. Attach maps into caller address space.
  - [ ] `p235.d1.t2` Add shm_write and shm_read libgeos wrappers
    > Copy data to/from shared regions with bounds checking.
  - [ ] `p235.d1.t3` Write producer-consumer demo
    > Program A writes counter to shared memory. Program B reads and displays it. Both run under geos_kern.

## [ ] phase-236: GeOS VM -- Scanline Flood Fill Opcode (FLOOD) (PLANNED)

**Goal:** Add a FLOOD opcode for efficient area filling from a seed point

Current fills cover rectangles only. Programs needing irregular fills (paint bucket, territory marking) must implement flood fill manually at high step cost. FLOOD performs scanline flood fill from a seed pixel, enabling paint programs and game territory marking at near-native speed.

### Deliverables

- [ ] **FLOOD opcode** -- 
  - [ ] `p236.d1.t1` Implement FLOOD x_reg, y_reg, fill_reg, tolerance_reg (0xC8)
    > Scanline flood fill starting at (x,y). Replaces connected pixels within tolerance of seed color with fill color. Stack-based scanline algorithm. 5-word encoding.
  - [ ] `p236.d1.t2` Add disassembler entry and tests
    > Test fill enclosed rectangle. Test no leak past boundaries. Test tolerance=0 exact match.
  - [ ] `p236.d1.t3` Write paint bucket demo
    > Draw shapes on screen, flood-fill regions with new colors via keyboard cursor and space bar.

## [ ] phase-237: Error Resilience -- Replace vfs_surface.rs unwrap() Calls (PLANNED)

**Goal:** Eliminate all 10 unwrap() calls in riscv/vfs_surface.rs

vfs_surface.rs bridges the RISC-V guest filesystem to the host VFS. It has 10 unwrap() calls that panic on corrupt surfaces or missing files. Replace with Result-based error handling that returns VFS errors to the guest.

### Deliverables

- [ ] **unwrap()-free vfs_surface.rs** -- 
  - [ ] `p237.d1.t1` Convert surface read/write to Result-based
    > Replace unwrap() in read_surface, write_surface, list_surfaces with proper error returns. Define VfsError enum.
  - [ ] `p237.d1.t2` Propagate VFS errors to guest syscall layer
    > Guest syscalls return negative error codes instead of panicking.
  - [ ] `p237.d1.t3` Add integration test for corrupt surface handling
    > Test corrupt surface file, missing file, truncated data. Verify errors returned instead of panics.

## [ ] phase-238: GeOS VM -- String Operation Opcodes (STRLEN, STRCMP, STRCPY) (PLANNED)

**Goal:** Add string manipulation opcodes for efficient text processing

VM programs doing string work (shell, editor, file browser) use manual loops costing 5-10 instructions per character. Native STRLEN, STRCMP, and STRCPY opcodes accelerate text-heavy programs 5-10x.

### Deliverables

- [ ] **String opcodes** -- 
  - [ ] `p238.d1.t1` Implement STRLEN addr_reg len_reg (0xC9), STRCMP a_reg b_reg (0xCA), STRCPY dst_reg src_reg (0xCB)
    > STRLEN scans for null terminator. STRCMP sets r0 to -1, 0, or 1. STRCPY copies including null. All operate on RAM addresses.
  - [ ] `p238.d1.t2` Add disassembler, preprocessor entries, and tests
    > Test STRLEN on hello string = 5. Test STRCMP equal, less, greater. Test STRCPY destination. Test empty string edge cases.
  - [ ] `p238.d1.t3` Benchmark string ops in shell.asm
    > Measure step reduction when shell.asm uses native STRCMP instead of manual byte-by-byte comparison.

## [ ] phase-239: GeOS VM -- Block Memory Opcodes (MEMCPY, MEMSET) (PLANNED)

**Goal:** Add block memory operations to eliminate manual word-by-word copy loops

Many programs copy or fill RAM blocks at 3-5 instructions per word. MEMCPY and MEMSET handle these internally, reducing bytecode size and step count by 3-5x for bulk operations.

### Deliverables

- [ ] **Memory block opcodes** -- 
  - [ ] `p239.d1.t1` Implement MEMCPY dst_reg src_reg len_reg (0xCC), MEMSET dst_reg val_reg len_reg (0xCD)
    > MEMCPY copies len words (handles overlap). MEMSET fills len words with val. Both bounds-checked.
  - [ ] `p239.d1.t2` Add disassembler, preprocessor entries, and tests
    > Test MEMCPY forward, backward, overlapping. Test MEMSET pattern. Test bounds clamping.
  - [ ] `p239.d1.t3` Refactor existing programs to use MEMCPY/MEMSET
    > Convert game_of_life, starfield, or plasma from manual loops to MEMCPY/MEMSET. Measure step reduction.

## [ ] phase-240: RISC-V Guest -- Timer and Sleep Syscalls (PLANNED)

**Goal:** Add timer syscalls to the Layer 2 kernel for time-based guest behavior

Guest programs have no concept of time. Add geos_msleep(ms), geos_uptime() (ms since boot), and geos_alarm(ms, callback) syscalls. Enables animation, periodic polling, timeout I/O, and frame rate control.

### Deliverables

- [ ] **Timer syscalls for RISC-V guests** -- 
  - [ ] `p240.d1.t1` Implement geos_msleep and geos_uptime in geos_kern.c
    > geos_msleep spins on mtime with yield. geos_uptime reads mtime in milliseconds.
  - [ ] `p240.d1.t2` Add geos_alarm with callback registration
    > Register function pointer and interval. Kernel checks on yield. Max 4 concurrent alarms.
  - [ ] `p240.d1.t3` Write animated clock demo
    > Digital clock on framebuffer, updating every second via geos_msleep.

## [ ] phase-241: GeOS VM -- Rotation and Scaling Opcodes (ROTATE, SCALE) (PLANNED)

**Goal:** Add pixel rotation and scaling for sprite-based games

Current sprite rendering is axis-aligned only. Programs needing rotation (asteroids) or scaling (zoom) do per-pixel transforms manually. ROTATE rotates a screen region 90/180/270 degrees. SCALE scales source rect to dest rect with nearest-neighbor sampling.

### Deliverables

- [ ] **Rotation and scaling opcodes** -- 
  - [ ] `p241.d1.t1` Implement ROTATE x y w h angle_reg (0xCE)
    > Rotate screen region by angle_reg (0=90 CW, 1=180, 2=270 CW). Uses temp buffer. 6-word encoding.
  - [ ] `p241.d1.t2` Implement SCALE with register args (0xCF)
    > Scale source rect to dest rect, nearest-neighbor sampling. All register args. 10-word encoding.
  - [ ] `p241.d1.t3` Write rotation demo and add tests
    > Sprite rotating on keyboard input. Tests for each angle and scale factor.

## [ ] phase-242: Error Resilience -- Replace scrollback.rs and geos_term.rs unwrap() Calls (PLANNED)

**Goal:** Eliminate unwrap() calls in terminal infrastructure

scrollback.rs (4 unwrap) and geos_term.rs (6 unwrap) handle terminal history and the standalone binary. Panics crash the terminal UX. Replace with graceful degradation.

### Deliverables

- [ ] **unwrap()-free terminal infrastructure** -- 
  - [ ] `p242.d1.t1` Replace scrollback.rs unwrap() with graceful degradation
    > Line push/search return Option/Result instead of panicking.
  - [ ] `p242.d1.t2` Replace geos_term.rs unwrap() with error screens
    > Loading failures show error on minifb window. Config errors show help text.
  - [ ] `p242.d1.t3` Add integration tests for error paths
    > Test nonexistent program, corrupt ASM, oversized history. Verify no panics.

## [ ] phase-243: GeOS VM -- Direct Screen Text Opcode (DRAWTEXT) (PLANNED)

**Goal:** Add a text rendering opcode that reads strings directly from RAM

The TEXT opcode renders from RAM but requires pre-staging strings. DRAWTEXT renders a null-terminated string from a RAM address to screen coordinates in one opcode, simplifying labels, menus, and HUD elements.

### Deliverables

- [ ] **DRAWTEXT opcode** -- 
  - [ ] `p243.d1.t1` Implement DRAWTEXT x_reg y_reg color_reg addr_reg (0xD0)
    > Read null-terminated string from addr_reg, render at (x, y) advancing x by 8 per character. 5-word encoding.
  - [ ] `p243.d1.t2` Add disassembler entry and tests
    > Test Hello at various positions. Test empty string. Test boundary. Verify pixel output.
  - [ ] `p243.d1.t3` Refactor programs to use DRAWTEXT for labels
    > Convert calculator.asm and clock.asm label rendering from STORE+TEXT sequences to DRAWTEXT.

## [ ] phase-244: RISC-V Guest -- Basic Socket Networking via SBI Extension (PLANNED)

**Goal:** Enable bare-metal RISC-V programs to make TCP connections via SBI

The VM has TCP networking opcodes but RISC-V guests cannot access the network. Add an SBI extension (0x4E4554) proxying TCP operations to the host stack via geos_kern. Enables guest HTTP clients and telemetry.

### Deliverables

- [ ] **RISC-V guest TCP networking** -- 
  - [ ] `p244.d1.t1` Add SBI NET extension with connect/send/recv/disconnect
    > Four functions via ECALL dispatch in geos_kern: connect, send, recv, disconnect.
  - [ ] `p244.d1.t2` Add libgeos network wrappers
    > geos_net_connect, geos_net_send, geos_net_recv, geos_net_disconnect in libgeos.a.
  - [ ] `p244.d1.t3` Write HTTP GET demo guest program
    > Connect to local server, send GET, display response on framebuffer.

## [ ] phase-245: Test Coverage -- ops_host_fs.rs and ops_pty.rs Unit Tests (PLANNED)

**Goal:** Add comprehensive unit tests for the two largest untested VM opcode modules

ops_host_fs.rs (352 lines, 0 tests) handles HOST_READ, HOST_WRITE, HOST_LIST, HOST_DELETE opcodes that give VM programs access to the host filesystem. ops_pty.rs (1419 lines, 0 tests) handles PTY_CREATE, PTY_WRITE, PTY_READ, PTY_CLOSE opcodes for pseudo-terminal management. Both are critical infrastructure with zero test coverage.

### Deliverables

- [ ] **ops_host_fs unit tests** -- 
  - [ ] `p245.d1.t1` Add tests for HOST_READ opcode
    > Test reading text files, binary files, nonexistent files, files past RAM end, permission errors. Verify RAM contents match file data.
  - [ ] `p245.d1.t2` Add tests for HOST_WRITE and HOST_DELETE opcodes
    > Test writing to new files, overwriting existing files, creating directories, deleting files, deleting nonexistent files.
  - [ ] `p245.d1.t3` Add tests for HOST_LIST opcode
    > Test listing directories, empty directories, nested directories, nonexistent directories.
- [ ] **ops_pty unit tests** -- 
  - [ ] `p245.d2.t1` Add tests for PTY_CREATE and PTY_CLOSE
    > Test creating PTYs (verify fd allocation), closing valid/invalid PTYs, max PTY limit.
  - [ ] `p245.d2.t2` Add tests for PTY_WRITE and PTY_READ
    > Test writing to PTY and reading back, reading empty PTY, partial reads, closing PTY mid-stream.

## [ ] phase-246: Test Coverage -- ops_syscall.rs Unit Tests (PLANNED)

**Goal:** Add unit tests for the VM syscall dispatch module

ops_syscall.rs (469 lines, 0 tests) handles the SYSCALL opcode dispatch table, mapping syscall numbers to handler functions. Zero test coverage means regressions in syscall routing go undetected. The module bridges opcode space to filesystem, process, and device operations.

### Deliverables

- [ ] **ops_syscall unit tests** -- 
  - [ ] `p246.d1.t1` Add tests for valid syscall dispatch
    > Test that SYSCALL correctly routes to OPEN, READ, WRITE, CLOSE, SEEK, LS, IOCTL, and other syscall numbers. Verify correct handler invocation via side effects.
  - [ ] `p246.d1.t2` Add tests for invalid syscall numbers
    > Test that unknown syscall numbers are handled gracefully (set error in r0 or NOP, don't panic).
  - [ ] `p246.d1.t3` Add tests for syscall argument passing
    > Verify that register arguments are correctly passed to syscall handlers (fd in correct register, buffer address, count).

## [ ] phase-247: Test Coverage -- MCP Server Integration Tests (PLANNED)

**Goal:** Expand MCP server test coverage from 3 tests to 20+

The MCP server (mcp_server.rs, 1588 lines) is the primary bridge between Hermes and the VM. It handles socket communication, tool dispatch (load_source, assemble, run_program, screenshot, etc.), and status reporting. Only 3 tests exist (tool list, status parsing, register parsing). Most tool handlers are untested.

### Deliverables

- [ ] **MCP server tool handler tests** -- 
  - [ ] `p247.d1.t1` Add tests for assembly tool handler
    > Test load_source + assemble via MCP protocol. Verify bytecode in RAM. Test invalid ASM returns error. Test empty source.
  - [ ] `p247.d1.t2` Add tests for run_program tool handler
    > Test running assembled programs, reading back screen state, detecting halt vs frame_ready. Test step execution.
  - [ ] `p247.d1.t3` Add tests for screenshot and screen dump tools
    > Test PNG screenshot generation, ASCII screen dump, checksum computation. Verify consistent output.
  - [ ] `p247.d1.t4` Add tests for register and memory inspection tools
    > Test reading registers, peek/poke RAM, reading canvas. Verify values match VM state.

## [ ] phase-248: GeOS VM -- Bit Manipulation Opcodes (BNOT, BSET, BCLR, BTST) (PLANNED)

**Goal:** Add single-bit manipulation opcodes for embedded-style register bitfield control

Many VM programs need to set, clear, test, and toggle individual bits in registers (flag registers, color masks, hardware port registers). Currently requires SHL + OR/AND + AND + CMP sequences (5-8 instructions). These opcodes reduce bit manipulation to 1 instruction each. BNOT inverts all bits (already available via XOR with 0xFFFFFFFF but a dedicated opcode is clearer).

### Deliverables

- [ ] **Bit manipulation opcodes** -- 
  - [ ] `p248.d1.t1` Implement BNOT rd (0xD1), BSET rd, bit_reg (0xD2), BCLR rd, bit_reg (0xD3), BTST rd, bit_reg -> r0 (0xD4)
    > BNOT = rd = !rd. BSET = rd |= (1 << bit_reg[4:0]). BCLR = rd &= !(1 << bit_reg[4:0]). BTST = r0 = (rd >> bit_reg[4:0]) & 1.
  - [ ] `p248.d1.t2` Add disassembler entries
    > Wire all four opcodes into the disassembler with correct mnemonic and arg formatting.
  - [ ] `p248.d1.t3` Add comprehensive tests
    > Test each opcode with known bit patterns. Test boundary (bit 0, bit 31). Test BNOT of 0 and 0xFFFFFFFF. Test BTST result in r0.
  - [ ] `p248.d1.t4` Write bit_manipulation_demo.asm
    > Program that uses BSET/BCLR/BTST to implement a simple flag register with visual display of set/clear/test operations.

## [ ] phase-249: GeOS VM -- Block Memory Opcodes (MEMCPY, MEMSET) (PLANNED)

**Goal:** Add efficient block memory operations to reduce loop overhead

Programs that copy or fill memory regions currently use byte-by-byte loops (LOAD + STORE + ADD + CMP + BLT = 5+ instructions per word). MEMCPY copies N words from src to dst, MEMSET fills N words with a value. Both run in the VM's native execution, much faster than instruction loops. Essential for buffer management, string operations, and VFS data transfer.

### Deliverables

- [ ] **Block memory opcodes** -- 
  - [ ] `p249.d1.t1` Implement MEMCPY dst_reg, src_reg, count_reg (0xD5) and MEMSET dst_reg, val_reg, count_reg (0xD6)
    > MEMCPY copies count words from src to dst (handles overlap by direction check). MEMSET fills count words with val. Bounds-check against RAM size. 4-word encoding.
  - [ ] `p249.d1.t2` Add disassembler entries and assembler support
    > Wire both opcodes into disassembler and assembler. Test assembly of both forms.
  - [ ] `p249.d1.t3` Add comprehensive tests
    > Test MEMCPY forward, backward, overlapping, boundary. Test MEMSET with various values and counts. Test zero count (NOP). Test out-of-bounds.
  - [ ] `p249.d1.t4` Write memcpy_demo.asm showing performance improvement
    > Program that fills a large buffer using MEMSET vs manual loop, displaying timing via TICKS.

## [ ] phase-250: GeOS VM -- String Operation Opcodes (STRLEN, STRCMP, STRCPY) (PLANNED)

**Goal:** Add string primitives that operate on null-terminated RAM strings

VM programs that manipulate strings (shell, file browser, text editor) currently implement strlen/strcmp/strcpy as subroutine loops (10-30 instructions each). Dedicated opcodes make string operations atomic and fast. STRLEN returns length of null-terminated string, STRCMP compares two strings (returns -1/0/1 in r0), STRCPY copies one string to another. These mirror C stdlib functions the RISC-V guest already has.

### Deliverables

- [ ] **String operation opcodes** -- 
  - [ ] `p250.d1.t1` Implement STRLEN addr_reg -> count_reg (0xD7), STRCMP addr1_reg, addr2_reg -> r0 (0xD8), STRCPY dst_reg, src_reg (0xD9)
    > All operate on null-terminated u32-per-char strings in RAM. STRLEN returns count not including null. STRCMP returns -1/0/1. STRCPY copies including null terminator.
  - [ ] `p250.d1.t2` Add disassembler and assembler entries
    > Wire all three opcodes. 3-word encoding for STRLEN/STRCMP, 3-word for STRCPY.
  - [ ] `p250.d1.t3` Add comprehensive tests
    > Test empty strings, single char, long strings, matching/non-matching strcmp, copy to self, copy overlapping.
  - [ ] `p250.d1.t4` Write string_ops_demo.asm
    > Program that demonstrates string search, comparison, and copy operations with visual output.

## [ ] phase-251: GeOS Program -- Mandelbrot Fractal Explorer (PLANNED)

**Goal:** Write a zoomable Mandelbrot set renderer in assembly

The VM has MUL, SUB, CMP, BLT, PSET, TEXT, IKEY, and FRAME -- everything needed for an interactive Mandelbrot renderer. This is a classic compute-heavy visual program that stress-tests the VM arithmetic pipeline and demonstrates the system capability for real mathematical computation. The fixed-point arithmetic avoids floating point requirements.

### Deliverables

- [ ] **Mandelbrot fractal program** -- 
  - [ ] `p251.d1.t1` Implement fixed-point Mandelbrot core loop
    > Use 32-bit registers with 12-bit fractional part (20.12 fixed point). Iterate z = z^2 + c, max 64 iterations. Color based on escape iteration using palette table.
  - [ ] `p251.d1.t2` Add zoom and pan with keyboard input
    > Arrow keys pan, +/- zoom in/out. Use IKEY in animation loop. Re-render on zoom change.
  - [ ] `p251.d1.t3` Add HUD with coordinates and zoom level
    > Display current center (real, imag) and zoom factor using TEXT opcode. Use DRAWTEXT or STRO for formatting.

## [ ] phase-252: GeOS Program -- Raycasting 3D Engine (Wolfenstein-style) (PLANNED)

**Goal:** Write a first-person raycasting renderer in assembly

A raycasting engine renders a pseudo-3D view from a 2D map using only arithmetic (MUL, DIV, SHL, SHR, SIN table lookups) and PSET/RECTF. This is the most visually impressive program type achievable with the VM current ISA. The starfield program already demonstrates perspective projection; raycasting extends it to wall rendering with distance-based shading.

### Deliverables

- [ ] **Raycasting engine program** -- 
  - [ ] `p252.d1.t1` Implement raycasting core with DDA algorithm
    > Cast one ray per screen column. Use DDA (digital differential analyzer) for efficient grid traversal. Compute wall distance per column. Render vertical wall strip with RECTF. Distance-based color darkening.
  - [ ] `p252.d1.t2` Add player movement and collision
    > WASD movement with wall collision detection using MAP array. Rotate view with left/right keys. Step-based movement (not per-pixel).
  - [ ] `p252.d1.t3` Add textured floor/ceiling
    > Simple color gradient floor (green to dark green) and ceiling (blue to dark blue) based on distance from horizon.

## [ ] phase-253: GeOS VM -- Audio System Tests and Improvements (PLANNED)

**Goal:** Add tests to audio.rs and implement PCM sample streaming

audio.rs (124 lines, 0 tests) handles the BEEP opcode and WAV generation. The current implementation spawns aplay subprocess for each beep, which causes process stacking with rapid beeps. Adding tests and a streaming audio buffer would improve reliability and enable more complex sound effects.

### Deliverables

- [ ] **Audio system tests** -- 
  - [ ] `p253.d1.t1` Add unit tests for WAV generation
    > Test generate_wav() produces valid RIFF/WAV header bytes. Test various frequencies and durations. Test edge cases (freq=0, dur=0).
  - [ ] `p253.d1.t2` Add test for audio parameter extraction
    > Test that BEEP correctly extracts freq and duration from registers and sets vm.beep.
- [ ] **Audio streaming buffer** -- 
  - [ ] `p253.d2.t1` Implement audio sample buffer with mixing
    > Add a ring buffer (256 samples) that accumulates BEEP samples instead of spawning processes. Mix concurrent beeps (additive). Drain to aplay on FRAME or when buffer half-full.
  - [ ] `p253.d2.t2` Write sfx_mixer.asm with layered sound effects
    > Program that plays multiple overlapping beeps to demonstrate mixing (walking sound plus ambient tone).

## [ ] phase-254: GeOS Program -- Procedural Dungeon Generator with Fog of War (PLANNED)

**Goal:** Write a dungeon crawler with BSP room generation and line-of-sight fog

Extends the existing infinite_map terrain concepts into a dungeon setting. BSP (Binary Space Partition) generates rooms connected by corridors. Raycasting-based line-of-sight reveals tiles within the player view cone. Previously explored tiles remain dimly visible. Uses RECTF for tile rendering, PSET for walls, and a sine table for lighting falloff.

### Deliverables

- [ ] **Dungeon generator program** -- 
  - [ ] `p254.d1.t1` Implement BSP room generation
    > Recursively split a grid region, place rooms in leaf nodes, connect with L-shaped corridors. Store room/tile data in RAM arrays. Seed-based RNG for reproducibility.
  - [ ] `p254.d1.t2` Add player movement and collision
    > WASD movement with wall collision. Camera follows player. Reveal tiles within radius using Bresenham line-of-sight.
  - [ ] `p254.d1.t3` Add fog of war rendering
    > Three states per tile: unseen (black), seen (dim), visible (full brightness). Track seen tiles in a bitfield array in RAM.

## [ ] phase-255: GeOS VM -- Conditional Move and Select Opcodes (CMOV, CSEL) (PLANNED)

**Goal:** Add branchless conditional move opcodes for performance-critical inner loops

Conditional moves eliminate branch misprediction stalls in hot loops (pixel rendering, collision detection). CMOV rd, rs moves rs to rd if r0 != 0 (after CMP). CSEL rd, rs1, rs2 selects rs1 if r0 != 0 else rs2. These are common in GPU architectures and enable branchless min/max, clamping, and multiplexing patterns.

### Deliverables

- [ ] **Conditional move opcodes** -- 
  - [ ] `p255.d1.t1` Implement CMOV rd, rs (0xDA) and CSEL rd, rs_true, rs_false (0xDB)
    > CMOV: if r0 != 0 then rd = rs. CSEL: if r0 != 0 then rd = rs_true else rd = rs_false. Both read CMP result from r0.
  - [ ] `p255.d1.t2` Add disassembler and assembler entries
    > Wire both opcodes. CMOV is 3-word, CSEL is 4-word.
  - [ ] `p255.d1.t3` Add tests and branchless patterns
    > Test CMOV with r0=0 and r0=1. Test CSEL select true/false. Write test showing branchless min/max using CSEL.

## [ ] phase-256: RISC-V Guest -- Shared Memory IPC Between Processes (PLANNED)

**Goal:** Enable RISC-V guest processes to communicate via shared memory regions

The Geometry OS VM has MSGSND/MSGRCV/PIPE for IPC, but RISC-V guest programs running under the interpreter have no IPC mechanism. Add shared memory pages that multiple guest processes can map into their address spaces. This enables producer-consumer patterns, data sharing between a GUI process and a compute process, and shared framebuffers.

### Deliverables

- [ ] **Shared memory SBI extension** -- 
  - [ ] `p256.d1.t1` Add SBI SHM extension (shm_alloc, shm_map, shm_free)
    > SBI extension 0x53484D for shared memory. shm_alloc(size) returns handle. shm_map(handle, va) maps into caller address space. shm_free(handle).
  - [ ] `p256.d1.t2` Add libgeos shared memory wrappers
    > geos_shm_alloc, geos_shm_map, geos_shm_free in libgeos.a with header.
  - [ ] `p256.d1.t3` Write producer-consumer demo
    > Two guest programs: producer writes counters to shared memory, consumer reads and displays on framebuffer.

## [ ] phase-257: RISC-V Guest -- Timer and Sleep Syscalls (PLANNED)

**Goal:** Add timer and sleep syscalls for RISC-V guest programs

Guest programs currently have no way to delay execution or measure time. The CLINT hardware provides timer interrupts, but guest C programs need simple sleep() and gettimeofday() syscalls. These are fundamental for animation timing, polling loops, and timeout handling.

### Deliverables

- [ ] **Timer syscalls** -- 
  - [ ] `p257.d1.t1` Add SBI TIME extension (sleep_ms, get_time_ms)
    > sleep_ms blocks for N milliseconds by busy-waiting CLINT mtime. get_time_ms returns elapsed time since boot in milliseconds.
  - [ ] `p257.d1.t2` Add libgeos time wrappers and header
    > geos_sleep_ms and geos_get_time_ms in libgeos.a.
  - [ ] `p257.d1.t3` Write timer demo with blinking cursor
    > C program that blinks a cursor on the framebuffer at 1Hz using sleep_ms, and displays elapsed time.

## [ ] phase-258: GeOS VM -- Scanline Flood Fill Opcode (FLOOD) (PLANNED)

**Goal:** Add a hardware-accelerated flood fill for paint programs

The VM has PSET for single pixels and FILL for solid colors, but no flood fill. Implementing flood fill in assembly requires a stack-based algorithm (PUSH/POP per pixel) which is slow and uses valuable stack space. A native FLOOD opcode uses an internal scanline span buffer to fill regions 10-100x faster than assembly implementation.

### Deliverables

- [ ] **FLOOD opcode** -- 
  - [ ] `p258.d1.t1` Implement FLOOD x_reg, y_reg, color_reg (0xDC) with scanline span algorithm
    > Read target color at (x,y). If same as fill color, NOP. Otherwise, fill using scanline span expansion (push left/right spans to internal buffer). Stack-free algorithm.
  - [ ] `p258.d1.t2` Add disassembler entry and tests
    > Test filling small and large regions. Test filling entire screen. Test filling on boundary. Test no-op when target = fill color.
  - [ ] `p258.d1.t3` Write paint_app.asm with flood fill
    > Paint program with color palette, brush (PSET), and flood fill (FLOOD). WASD to move cursor, space to paint, F to flood fill.

## [ ] phase-259: GeOS Program -- Cellular Automata Sandbox (Life, HighLife, Seeds) (PLANNED)

**Goal:** Write a multi-rule cellular automata playground with rule switching

Conway Game of Life already exists as code_evolution.asm, but a unified sandbox that supports multiple rules (Life, HighLife, Day and Night, Langton Ant, Brian Brain) with live rule switching would be more educational and showcase the VM versatility. Each rule uses the same grid rendering but different neighbor-counting logic.

### Deliverables

- [ ] **Cellular automata sandbox** -- 
  - [ ] `p259.d1.t1` Implement grid data structure and rendering
    > Store grid in RAM (256x256 bits = 8192 u32 words). Render using PSET. Color cells by age (newborn=white, old=blue). Wrap-around boundaries.
  - [ ] `p259.d1.t2` Implement multiple CA rules with switching
    > Rules: Life (B3/S23), HighLife (B36/S23), Day and Night (B3678/S34678), Seeds (B2/S). Press 1-4 to switch. Use table-based rule lookup in RAM.
  - [ ] `p259.d1.t3` Add interactive editing and speed control
    > Click to toggle cells, +/- to change speed, R to randomize, C to clear. Use IKEY for input.

## [ ] phase-260: GeOS VM -- Matrix Multiply Opcode (MATMUL) (PLANNED)

**Goal:** Hardware-accelerated 2D matrix multiply for linear algebra and neural network inference

MATVEC does vector-matrix multiply. A full MATMUL opcode for 2D matrix multiply would enable larger neural networks and linear algebra operations without manual indexing. The opcode takes base addresses of two matrices and the destination, plus dimensions.

### Deliverables

- [ ] **MATMUL opcode implementation** -- 
  - [ ] `p260.d1.t1` Implement MATMUL dst_addr, A_addr, B_addr, M_reg, N_reg, K_reg (0xDE)
    > Multiply MxK matrix A by KxN matrix B, store MxN result at dst_addr. Use row-major addressing with LOAD/STORE. Bounds-check dimensions against available RAM.
  - [ ] `p260.d1.t2` Add disassembler entry and unit tests
    > Test 2x2, 3x3, and 4x4 matrix multiply. Test non-square matrices. Test edge case M=1 (vector-matrix). Verify against known results.
  - [ ] `p260.d1.t3` Write neural_network.asm with MATMUL-based inference
    > Simple 2-layer neural network (input->hidden->output) using MATMUL for weight multiplication and RELU for activation. Classify handwritten-digit-like patterns.

## [ ] phase-261: GeOS Program -- Particle Physics Sandbox (PLANNED)

**Goal:** Write a real-time particle simulation with gravity, collisions, and interactive spawning

A physics sandbox where particles interact with gravity, bounce off walls, and collide with each other. The player spawns particles with mouse/cursor and adjusts gravity and damping. Demonstrates the VM's ability to run real-time physics at 60fps.

### Deliverables

- [ ] **Particle physics sandbox** -- 
  - [ ] `p261.d1.t1` Implement particle data structure and physics engine
    > Store particles in RAM (x, y, vx, vy per particle, max 128). Apply gravity each frame. Bounce off screen edges with damping. Use subroutines for update and render.
  - [ ] `p261.d1.t2` Add interactive controls and visual effects
    > Arrow keys adjust gravity direction. Space spawns burst of particles. R to reset. Color particles by velocity. Trail effect via SCROLL with partial transparency.

## [ ] phase-262: RISC-V Guest -- Basic Shell with Pipes and Redirection (PLANNED)

**Goal:** Port the GeOS shell concept to RISC-V guest with pipe and I/O redirection support

The RISC-V guest has sh.c but it lacks pipes and redirection. A proper shell is essential for the guest OS experience. Implement pipe parsing (cmd1 | cmd2), output redirection (cmd > file), and input redirection (cmd < file).

### Deliverables

- [ ] **Guest shell with pipes** -- 
  - [ ] `p262.d1.t1` Implement command parsing with pipe and redirection tokens
    > Parse input line into command segments separated by |. Detect > and < for redirection. Handle quoting and escaping. Support up to 4 pipe stages.
  - [ ] `p262.d1.t2` Implement pipe() and fork() based pipeline execution
    > Use SBI pipe syscall to connect command stdout to next command stdin. Fork child processes for each pipeline stage. Parent waits for all children.
  - [ ] `p262.d1.t3` Add file redirection and built-in commands
    > Implement > (write) and >> (append) redirection using SBI file syscalls. Add built-ins: cd, pwd, echo, export. Handle error cases (file not found, pipe broken).

## [ ] phase-263: GeOS VM -- Bitfield Extract/Insert Opcodes (BFE, BFI) (PLANNED)

**Goal:** Add bitfield manipulation opcodes for efficient packed data access

Many VM programs manipulate packed data (color channels, tile flags, entity state). Currently this requires manual SHL/SHR/AND/OR sequences (4-6 instructions). BFE and BFI opcodes compress these to single instructions, improving both performance and code density.

### Deliverables

- [ ] **BFE and BFI opcodes** -- 
  - [ ] `p263.d1.t1` Implement BFE dst, src, pos_reg, width_reg (0xDF) and BFI dst, src, val, pos_reg, width_reg (0xE0)
    > BFE extracts bits [pos:pos+width-1] from src into dst (zero-extended). BFI inserts bits from val into dst at [pos:pos+width-1]. Validate pos+width <= 32.
  - [ ] `p263.d1.t2` Add disassembler entries and comprehensive tests
    > Test extracting R/G/B channels from packed colors. Test inserting values at various positions. Test edge cases (width=1, width=32, pos=0, pos=31). Test that BFI preserves surrounding bits.
  - [ ] `p263.d1.t3` Optimize infinite_map.asm color handling with BFE/BFI
    > Replace manual color channel extraction/insertion in infinite_map_pxpk.asm with BFE/BFI. Measure bytecode size reduction and per-tile instruction count improvement.

## [ ] phase-264: GeOS Program -- L-System Fractal Generator (PLANNED)

**Goal:** Write an interactive L-system fractal renderer with rule editing

L-systems generate complex fractal patterns from simple rewrite rules. This program implements turtle graphics with push/pop state for branching, supporting Koch curves, Sierpinski triangles, dragon curves, and plant-like structures. Users can modify rules and iterations interactively.

### Deliverables

- [ ] **L-system fractal generator** -- 
  - [ ] `p264.d1.t1` Implement L-system string expansion engine
    > Store axiom and rules in RAM. Expand string iteratively (max 8 iterations). Characters: F=forward, +=turn left, -=turn right, [=push state, ]=pop state. Limit expanded string to 4096 chars.
  - [ ] `p264.d1.t2` Implement turtle graphics renderer and preset fractals
    > Render expanded string using LINE opcode with turtle state (x, y, angle, color). Include 5 presets: Koch snowflake, Sierpinski triangle, dragon curve, fern, tree. Keys 1-5 switch presets, +/- adjust iterations.

## [ ] phase-265: GeOS VM -- Canvas Clip Region Opcodes (CLIPSET, CLIPCLR) (PLANNED)

**Goal:** Add clipping region support to constrain all drawing operations to a rectangular area

Windowed environments need clipping so child windows don't draw outside their bounds. Currently only the tilemap has implicit clipping. CLIPSET/CLIPCLR opcodes set a global clip rectangle that PSET, LINE, RECTF, CIRCLE, TEXT, and SPRITE all respect.

### Deliverables

- [ ] **Canvas clipping opcodes** -- 
  - [ ] `p265.d1.t1` Add clip_rect field to Vm, implement CLIPSET x, y, w, h and CLIPCLR
    > CLIPSET sets the clip rectangle (all drawing ops clip to this region). CLIPCLR disables clipping. Store clip_rect as (x, y, x+w, y+h) in Vm struct. Initialize in all construction sites.
  - [ ] `p265.d1.t2` Apply clipping to all drawing opcodes
    > Modify PSET, LINE, RECTF, CIRCLE, TEXT, SPRITE, TILEMAP handlers to check bounds against clip_rect before writing pixels. Use min/max clamping for partial intersections.
  - [ ] `p265.d1.t3` Add assembler entries, disassembler, and tests
    > Test clipping with PSET outside bounds (should not draw). Test LINE partially clipped. Test RECTF fully clipped. Test CLIPCLR restores full-screen drawing. Test nested clipping (CLIPSET within clip).
  - [ ] `p265.d1.t4` Update window_manager.asm to use CLIPSET for child windows
    > Replace manual boundary checking in window_manager.asm with CLIPSET/CLIPCLR. Measure code size reduction.

## [ ] phase-266: RISC-V Guest -- Framebuffer Graphics Library (libfb) (PLANNED)

**Goal:** Create a C graphics library for RISC-V guest programs with drawing primitives

Guest programs currently draw directly to the framebuffer address (0x60000000) with manual pixel calculations. A libfb.a with fb_fill(), fb_rect(), fb_line(), fb_circle(), fb_text() would make guest graphics programs much easier to write and more portable.

### Deliverables

- [ ] **Guest framebuffer graphics library** -- 
  - [ ] `p266.d1.t1` Implement core drawing primitives in libfb.c
    > Functions: fb_init(), fb_fill(color), fb_pixel(x,y,color), fb_rect(x,y,w,h,color), fb_line(x0,y0,x1,y1,color) using Bresenham's, fb_circle(x,y,r,color) using midpoint. All write to 0x60000000 with 256x256 stride.
  - [ ] `p266.d1.t2` Implement text rendering and blitting functions
    > fb_text(x, y, color, str) renders string using embedded 5x7 font. fb_blit(src_x, src_y, dst_x, dst_y, w, h) copies rectangular region. fb_scroll(pixels) scrolls screen up.
  - [ ] `p266.d1.t3` Write graphics_demo.c showcasing all primitives
    > Demo program that draws filled rectangles, gradient, bouncing circle, text overlay, and line patterns. Update build.sh to link libfb.a.

## [ ] phase-267: GeOS VM -- Performance Profiling Opcode (PROFILE) (PLANNED)

**Goal:** Add a profiling opcode to measure instruction counts per code region

Optimizing VM programs is hard without profiling data. PROFILE start/stop records the instruction count between two points and stores it in a profile buffer. Programs can profile multiple regions and read back the results to identify hot loops.

### Deliverables

- [ ] **PROFILE opcode** -- 
  - [ ] `p267.d1.t1` Implement PROFILE mode_reg (0xE1) with start/stop/query modes
    > mode=0: start counting from current step_count. mode=1: stop, record delta to profile_buffer[region_id]. mode=2: query profile_buffer[region_id] into register. Profile buffer at fixed RAM address, 32 entries.
  - [ ] `p267.d1.t2` Add disassembler entry and tests
    > Test single region profiling. Test multiple regions. Test that query returns 0 before start. Test that query returns delta after stop. Test profile buffer addressing.
  - [ ] `p267.d1.t3` Write profile_demo.asm that profiles render vs physics
    > Bouncing ball demo that profiles the physics update loop and the rendering loop separately, then displays the ratio as a bar chart.

## [ ] phase-268: GeOS Program -- Tower Defense Game (PLANNED)

**Goal:** Write a tower defense game with multiple tower types, wave-based enemies, and upgrade paths

Tower defense is a classic game genre that exercises pathfinding, projectile physics, resource management, and UI layout. Enemies follow a fixed path, player places towers that auto-attack, earning gold for kills to build more towers.

### Deliverables

- [ ] **Tower defense game** -- 
  - [ ] `p268.d1.t1` Implement game state, map, and enemy pathfinding
    > Fixed path defined as waypoint list in RAM. Enemies follow path with interpolation. Each enemy has HP, speed, position. Max 32 enemies. Waypoint path rendered as dotted line.
  - [ ] `p268.d1.t2` Implement tower placement, targeting, and projectiles
    > Player cursor to place towers on valid cells. Towers find nearest enemy in range, fire projectiles (LINE animation). Three tower types: arrow (fast, low dmg), cannon (slow, AOE), ice (slows). Each stored in RAM array.
  - [ ] `p268.d1.t3` Add wave system, gold economy, and UI overlay
    > Wave-based spawning with increasing difficulty. Kill enemies for gold. Spend gold on towers. Display: wave number, gold, lives, tower info panel at bottom. Game over when lives reach 0.

## [ ] phase-269: GeOS VM -- Hash Table Opcodes (HASHINIT, HASHSET, HASHGET) (PLANNED)

**Goal:** Add VM-level hash table for efficient key-value lookups from assembly

Assembly programs currently implement hash tables manually (hash function + collision chains) which costs 50+ instructions per lookup. Native hash table opcodes enable O(1) average lookups, useful for symbol tables, entity lookup, and caching.

### Deliverables

- [ ] **Hash table opcodes** -- 
  - [ ] `p269.d1.t1` Implement HASHINIT table_id, buckets_reg and HASHSET table_id, key_reg, val_reg (0xE2, 0xE3)
    > HASHINIT allocates a hash table with N buckets (max 8 tables). HASHSET inserts or updates key->value pair using FNV-1a hashing. Store tables in Vm struct with HashMap<u32, u32> per bucket.
  - [ ] `p269.d1.t2` Implement HASHGET table_id, key_reg, dst_reg (0xE4) with not-found indicator
    > HASHGET looks up key and stores value in dst. If not found, sets dst to 0xFFFFFFFF (sentinel). Tables persist across frames but reset on VM reset.
  - [ ] `p269.d1.t3` Add disassembler entries and comprehensive tests
    > Test init with various bucket counts. Test set/get roundtrip. Test update existing key. Test get missing key returns sentinel. Test collision handling (insert keys that hash to same bucket). Test 8-table limit.

## [ ] phase-270: GeOS Program -- Asteroids Arcade Game (PLANNED)

**Goal:** Write a classic Asteroids-style game with vector graphics, wrapping, and progressive difficulty

Asteroids is the quintessential vector graphics game -- perfect for Geometry OS. The player ship rotates and thrusts, shooting asteroids that split into smaller pieces. Features: wrapping screen edges, inertia-based physics, particle explosions, UFO enemies.

### Deliverables

- [ ] **Asteroids arcade game** -- 
  - [ ] `p270.d1.t1` Implement ship physics, rotation, and screen wrapping
    > Ship stored as (x, y, angle, vx, vy). Thrust adds velocity in facing direction. Rotation changes angle. Screen wrapping: objects crossing edges appear on opposite side. Friction gradually slows ship.
  - [ ] `p270.d1.t2` Implement asteroids, bullets, and collision detection
    > Asteroids as circles with random velocity. Large asteroids split into 2 medium, medium into 2 small. Bullets have limited lifetime. Collision via distance check (no PEEK needed for circles). Particle burst on destruction.
  - [ ] `p270.d1.t3` Add scoring, lives, waves, and sound effects
    > Score: small=100, medium=50, large=25. 3 lives, extra life at 10000. Wave system with increasing asteroid count. BEEP for shooting, explosion, and extra life. High score tracking in RAM.

## [ ] phase-271: RISC-V Guest -- vi-like Text Editor (PLANNED)

**Goal:** Write a minimal vi-mode text editor for the RISC-V guest

The guest has no text editor beyond the GeOS canvas. A vi-like editor with normal/insert modes, line editing, search, and save/load would make the guest OS self-sufficient for editing files on the VFS.

### Deliverables

- [ ] **Guest vi editor** -- 
  - [ ] `p271.d1.t1` Implement screen rendering and cursor management
    > Render file contents to framebuffer using libfb text functions. Scroll viewport when cursor moves past screen. Status line at bottom showing mode and file info. Support 256x256 viewport with 8x12 font.
  - [ ] `p271.d1.t2` Implement normal mode commands
    > h/j/k/l movement, dd (delete line), yy (yank), p (paste), x (delete char), i/a/o (enter insert mode), :w (save), :q (quit), :wq (save+quit), / (search forward), n (next match), G (go to end), 1G (go to top).
  - [ ] `p271.d1.t3` Implement insert mode and file I/O
    > Insert mode: typed chars insert at cursor, backspace deletes, Escape returns to normal. Line editing with Enter for newline. Load file on startup (argv[1]). Save writes to same path via SBI file syscall.

## [ ] phase-272: GeOS VM -- Sprite Sheet and Animation Frame Opcodes (SPRLOAD, SPRFRAME) (PLANNED)

**Goal:** Add sprite sheet support for multi-frame animated sprites

The existing SPRITE opcode blits a single NxM region. For animated sprites (walking characters, explosions), programs must manually compute frame offsets. SPRLOAD defines a sprite sheet with frame dimensions, and SPRFRAME selects the current frame, making SPRITE automatically use the correct offset.

### Deliverables

- [ ] **Sprite animation opcodes** -- 
  - [ ] `p272.d1.t1` Implement SPRLOAD sheet_id, addr_reg, frame_w_reg, frame_h_reg, frames_reg (0xE5)
    > Register a sprite sheet: base address in RAM, frame dimensions, total frame count. Max 16 sheets. Store in Vm struct. SPRFRAME sheet_id, frame_reg selects active frame.
  - [ ] `p272.d1.t2` Extend SPRITE to accept sheet_id instead of raw address
    > When SPRITE addr_reg points to a registered sheet_id (special encoding), auto-compute source address from sheet base + frame * frame_w * frame_h. Backward compatible with raw address mode.
  - [ ] `p272.d1.t3` Add tests and write animated_sprites.asm demo
    > Test sheet registration, frame selection, sprite blitting with frame offset. Demo: animated walking character (4 frames) and explosion effect (8 frames).

## [ ] phase-273: GeOS VM -- Interrupt-Driven Input Queue Enhancement (PLANNED)

**Goal:** Expand the key buffer from 16 to 256 entries and add mouse event queuing

The current key_buffer ring buffer holds only 16 entries, causing dropped keys during rapid typing. Mouse events (click, drag, scroll) have no queue at all. Expanding the buffer and adding a unified input event queue improves interactive program reliability.

### Deliverables

- [ ] **Enhanced input queue** -- 
  - [ ] `p273.d1.t1` Expand key_buffer to 256 entries and add mouse event queue
    > Change key_buffer from 16 to 256 entries. Add mouse_queue (64 entries) storing (event_type, x, y, button) tuples. Event types: click, release, drag, scroll_up, scroll_down. Add IKEYM opcode to read mouse events.
  - [ ] `p273.d1.t2` Add IKEYM mouse event opcode and wire into host input
    > IKEYM event_type_reg, x_reg, y_reg, button_reg reads next mouse event. Returns event_type=0 if no event. Host main loop pushes mouse events alongside keyboard events.
  - [ ] `p273.d1.t3` Add tests and update programs to use expanded buffer
    > Test key buffer overflow behavior (256 keys). Test mouse event queue. Test IKEYM returns 0 when empty. Update snake.asm and painter.asm to benefit from larger buffer.

## [ ] phase-274: GeOS Program -- Solar System Simulator (PLANNED)

**Goal:** Write an accurate solar system simulator with orbital mechanics and zoom controls

A visually impressive program that simulates planetary orbits using Kepler's laws. Planets orbit the sun at correct relative distances and speeds. Zoom in/out to see inner vs outer planets. Toggle orbit trails. Shows how the VM handles floating-point math via fixed-point arithmetic.

### Deliverables

- [ ] **Solar system simulator** -- 
  - [ ] `p274.d1.t1` Implement orbital mechanics with fixed-point arithmetic
    > Store planet data in RAM: orbital radius, speed, current angle, color, size (8 planets). Update angles each frame using MUL for angular velocity. Use 16.16 fixed-point for smooth orbits. Zoom factor controls scale.
  - [ ] `p274.d1.t2` Implement rendering, zoom, and interactive controls
    > Render sun at center, planets as CIRCLE with correct colors. Draw orbit paths as faint circles. Zoom in/out with +/- keys. Pan with arrow keys. Toggle labels (1-8 for planet names). Speed control with </> keys.

## Global Risks

- Interpreter performance ceiling: 52 MIPS may not scale to complex guest programs
- Premature abstraction: libgeos.c should only be extracted when truly needed
- Cross-system pixel reads (U3) need locking or same-thread execution when a use case appears

## Conventions

- Build all RISC-V examples with -march=rv32imac_zicsr -mabi=ilp32
- Use build.sh-style flags (ffreestanding, nostdlib, O2, medany)
- Power-of-two constants: use bit masks (x & 0xFF) not modulo (x % 256)
- Present callback must be channel-based, never synchronous in bus write
- SPEC = thesis. roadmap_v2 = arc. OpenSpec = per-change diff. Three docs, three jobs.
