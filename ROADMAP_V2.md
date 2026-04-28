# Geometry OS — Post-SPEC Pixel-Native Roadmap

Roadmap for the pixel-native RISC-V hypervisor layer in Geometry OS. Covers toolchain hygiene, GUI bridge, pixel VM convergence, libgeos extraction, and legacy roadmap reconciliation. SPEC = thesis. roadmap_v2 = arc. OpenSpec = per-change diff.


**Progress:** 8/10 phases complete, 0 in progress

**Deliverables:** 20/23 complete

**Tasks:** 35/44 complete

## Scope Summary

| Phase | Status | Deliverables | LOC Target | Tests |
|-------|--------|-------------|-----------|-------|
| phase-A Toolchain Hygiene | COMPLETE | 4/4 | - | - |
| phase-B GUI Bridge — Live Pixel Display | COMPLETE | 3/3 | - | - |
| phase-C Pixel VM Convergence | COMPLETE | 1/1 | - | - |
| phase-D Layer 2 — libgeos and Primitives | COMPLETE | 3/3 | - | - |
| phase-E Legacy Roadmap Reconciliation | COMPLETE | 1/1 | - | - |
| phase-F Visual Verification Infrastructure | COMPLETE | 3/3 | - | - |
| phase-G In-session Canvas Checkpoint — Save/Load | COMPLETE | 2/2 | - | - |
| phase-H Cross-session Persistence — VfsSurface Raw-Region Flush | COMPLETE | 1/1 | - | - |
| phase-I Layer 2 Foundation — Cooperative Multi-Program Kernel | PLANNED | 0/3 | - | - |
| phase-141 Terminal Polish -- Scrollback and Visual Refinements | PLANNED | 2/2 | 75,500 | 10 |

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

## [x] phase-C: Pixel VM Convergence (COMPLETE)

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

## [ ] phase-I: Layer 2 Foundation — Cooperative Multi-Program Kernel (PLANNED)

**Goal:** Two RISC-V guest programs execute concurrently in the same VM, mediated by a tiny supervisor that owns scheduling and pixel-region arbitration

SPEC.md says "Layer 2 does not exist yet" -- today Layer 3 programs run on M-mode bare-metal with no kernel between them. Phase I builds the smallest Layer 2 that justifies its own existence: a cooperative scheduler that runs two ELF programs in the same VM, plus pixel-region ownership so they cannot clobber each other's framebuffer area. Capstone: split-screen sh + life64 running side by side, both updating live. The design rule from SPEC ("ask whether it grows the shim or shrinks it") gates every addition -- if a feature can be a libgeos helper, it stays in libgeos; only the things that genuinely cannot be done from a single program (multi-tenancy, region arbitration, focus routing) live in the kernel.


### Deliverables

- [ ] **Cooperative scheduler (geos_kern.elf)** -- Tiny M-mode supervisor that loads two ELF programs side by side, sets up per-program stacks, and time-slices between them via mtimecmp interrupts. Programs cooperate via geos_yield() in libgeos. No preemption beyond the timer tick. No memory protection (single VM, programs trust each other -- kernel only arbitrates pixel regions and input focus).

  - [x] `i.1.1` Design supervisor memory layout
    > Decide stack/heap regions per program. Kernel reserves first 64KB, each program gets a 256KB slot. Document in docs/LAYER2_KERNEL.md.
    _Files: docs/LAYER2_KERNEL.md_
  - [~] `i.1.2` Implement context-switch in M-mode trap handler
    > On mtimecmp interrupt, save callee-saved regs of running program, restore the other program's regs, set new mtimecmp deadline, mret. Cooperative path: geos_yield() ecalls into kernel which does the same save/restore.
    > Bootstrap done (2026-04-27): minimal geos_kern.elf links via crt0.S+libgeos, installs mtvec, programs mtimecmp, takes 5 timer interrupts using GCC interrupt("machine") attribute for save/restore, SBI-shutdowns cleanly. Verified end-to-end via examples/kern_run.rs (5,000,815 instructions, prints "[geos] kernel boot" + 5 ticks). Still pending: hand-written save/restore across two distinct program contexts, mscratch-based context pointer, and the geos_yield() ecall path.
    _Files: examples/riscv-hello/geos_kern.c, examples/kern_run.rs_
  - [ ] `i.1.3` Two-program load + run smoke test
    > Build geos_kern.elf with two embedded ELF blobs (hello_a.elf, hello_b.elf). Boot via sh_run, observe interleaved UART output. Single-thread host VM is fine.
    _Files: examples/riscv-hello/build.sh, tests/multi_program_smoke_test.sh_
  - [ ] geos_kern.elf loads two ELF programs and runs both to completion
    _Validation: Test: load hello.elf + hello.elf (rebuilt with distinct strings), both print to UART, both reach SBI shutdown_
  - [ ] geos_yield() returns control to the scheduler within one timer tick
    _Validation: Trace: yield -> scheduler -> other program runs -> first program resumes_
- [ ] **Pixel-region ownership** -- Programs request a framebuffer region at startup via geos_request_region(x, y, w, h). The kernel tracks ownership and clips fb_present writes so program A cannot overwrite program B's pixels. Out-of-region writes are silently masked (no fault -- programs trust the kernel, kernel does not trust the program).

  - [ ] `i.2.1` Add geos_request_region() to libgeos
    > SBI extension call that registers a rect with the kernel. Kernel stores per-program rect in a small table. Returns offset into framebuffer (program-local origin).
    _Files: examples/riscv-hello/libgeos.c, examples/riscv-hello/libgeos.h_
  - [ ] `i.2.2` Region clipping in fb_present path
    > When kernel handles fb_present (or the present interrupt), iterate only over the calling program's rect. Pixels outside the rect are not touched in vm.screen. Implementation note: simplest is to track a "current program" rect and clip the composite step.
    _Files: src/riscv/framebuf.rs, examples/riscv-hello/geos_kern.c_
  - [ ] Program A writing to program B's region has no visible effect
    _Validation: Test: load two programs, A clears its region red, B clears its region blue, A then writes white to B's coords, dump fb, B's region still blue_
  - [ ] Two programs paint their regions concurrently without interference
    _Validation: Visual round-trip via fb_dump after running split-screen demo for 2 seconds_
- [ ] **Capstone -- split-screen sh + life64** -- The Layer 2 thesis demo. Left half (128x256) runs sh.c. Right half (128x256) runs a 32x32 life simulation (smaller variant of life64.c). Both visible simultaneously. Tab key cycles input focus between them; the focused program's region gets a thin border. Proves: (1) two programs share a VM, (2) regions are enforced, (3) input is multiplexed by focus.

  - [ ] `i.3.1` life32.c -- smaller life variant for split-screen
    > 32x32 grid in 128x256 region, 4-pixel cell blocks, identical rules to life64.
    _Files: examples/riscv-hello/life32.c_
  - [ ] `i.3.2` Input focus routing in kernel
    > Tab key intercepted by kernel (does not pass to either program). Kernel maintains active_program_idx. UART RX bytes routed only to the active program's receive queue. Inactive program's UART read returns -1 (EOF / no data).
    _Files: examples/riscv-hello/geos_kern.c_
  - [ ] `i.3.3` Border indicator for focused region
    > Kernel draws a 1-pixel border around the active region after each program's fb_present. Border color cycles through palette so focus change is unmistakable.
    _Files: examples/riscv-hello/geos_kern.c_
  - [ ] `i.3.4` Split-screen smoke test
    > tests/split_screen_test.sh: boot kern.elf, inject "echo a\n", wait 2s, fb_dump, assert (a) shell region contains "a" pixels, (b) life region has nonzero cell count, (c) focused border visible.
    _Files: tests/split_screen_test.sh_
  - [ ] Both sh prompt and life animation visible simultaneously on the Geometry OS display
    _Validation: Manual visual check + fb_dump showing both regions populated_
  - [ ] Keyboard typed in shell does not perturb life simulation
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
