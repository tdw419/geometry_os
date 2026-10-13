# COMPOSITOR LADDER — infinite_map_rs

Own lane + own roadmap, separate from the glyph builder's supply loop (Jericho,
2026-10-13). Direction: build a real Ubuntu Wayland compositor on the infinite-map
canvas library; "actual OS" comes later by swapping the guest userspace. Each rung:
measure first, bounded scope, receipt with before/after, gate re-runs for anyone.

## Status line (update after each rung)

- Rung 0: **DONE 2026-10-13** — compile-green (47→0 errors), smithay pinned
  (01f3f4bd), bridge tests 14/14, suite 925 pass / 29 pre-existing rot failures.
  Receipt: `rung0_lane/RUNG0_RECEIPT.md`. **Commit deferred — hollow git object
  store (see receipt forensics).** Next: heal repo, then rung 1.
- Rung 1: winit window shows the canvas (grid + camera pan/zoom via existing tested
  gesture code). First run of the binary ever.
- Rung 2: host one real Wayland client (weston-terminal from Ubuntu rootfs) as a
  pane. The "actual compositor" proof via smithay.
- Rung 3: window management as canvas objects — drag/z-order/hit-test through
  SceneGraph/HitTester; the infinite map becomes the desktop.
- Rung 4: dmabuf zero-copy Ubuntu VM surfaces (existing QEMU/virtio
  pixel stack becomes canvas windows; unifies with doc-to-video containers).
- Rung 5: KMS fullscreen session on the 5090 box — boots into it ("actual OS" feel);
  later swap guest Ubuntu for own RISC-V/pixel userspace.

## Lane rules

- Edits: lane copy (rung0_lane/) → gates in lane → merge back file-by-file with
  md5 verification (constitution's intent; git worktree impossible on hollow tree).
- Do NOT touch: visual_audio glyph lane (separate repo/charter), the uncommitted
  Phase-17 WIP files we did not author (rendering/mod.rs etc.), sibling worktree
  swarm_int_004.
- Deps: smithay stays pinned (01f3f4bd) until a rung explicitly upgrades it with a
  receipt. No new optional features (python/hypervisor/wasmtime/ruffle) for rungs 1–3.
- The 29 pre-existing `spatial::*` failures: separate hygiene rung, do not silently
  absorb into compositor rungs.
- Receipts per rung, stored in rung0_lane/ (until the repo heals and can hold them).
