# RUNG 0 RECEIPT — infinite_map_rs compile-green + smithay pin

Date: 2026-10-13. Authority: Jericho in-channel GO ("fix the 54 compile errors, pin
smithay to a fixed rev (not floating git), get cargo test --lib green, receipt with
before/after. Keep it in its own lane/roadmap file, separate from the glyph builder's
supply loop — don't let the two collide or share a cron.")

## Before / After (measured)

| Metric | Before | After |
|---|---|---|
| `cargo check --lib` | exit 101, 47 errors | exit 0, 0 errors |
| `cargo build --lib` | impossible | exit 0 |
| `cargo test --lib` | impossible (does not compile) | 925 passed / 29 failed / 27 ignored |
| Failures in touched modules | n/a | **0** |
| smithay declaration | floating `git = ...smithay` (no rev) | pinned `rev = 01f3f4bd3ec3997ac6f34f9197e09e87ad286957` |
| Cargo.lock after pin | — | byte-identical md5 to pre-pin (pin captures the exact working resolution) |
| Bridge test coverage | orphaned (never compiled) | 14 tests, wired into lib, 5× consecutive green |

Before-state error inventory (all 47): 16×E0609, 11×E0034, 6×E0599, 5×E0616,
4×E0592, 1×E0432, 1×E0308, 1×E0282, 1×E0277. ~42 of 47 in the uncommitted Phase-17
file `src/process_region_bridge.rs`; 5 in its own trailing impl block.

Before md5 (main tree): lib.rs 8987fe9f..., process_region_bridge.rs 97abd202...,
process_region_bridge_test.rs 78105dce..., spatial/process_scheduler.rs 72a8218f...,
Cargo.toml ad514ad7...
After md5 (main == lane, verified): a2b50ccc / 448eb8a2 / f02e093a / a6ead932 / 30484816.

## What was actually broken (root causes, not symptoms)

1. **Phase-17 WIP written against an imaginary scheduler API.** The bridge invented
   `scheduler.cells`, `region.end_x/end_y`, `DEFAULT_TIME_SLICE`, `Debug` on
   `ProcessScheduler`, `get_process(_mut)`, `process_count`, `to_binary` — none existed.
2. **Self-inflicted duplicate impls.** The bridge's trailing
   `impl SpatialLayoutManager { get_particle, get_particle_mut, particles, particle_count }`
   duplicated methods that already exist on the type → the E0592/E0034 clusters.
   `window_particle.rs` itself needed ZERO edits.
3. **The gate test file was orphaned** — `process_region_bridge_test.rs` (425 lines,
   14 tests) was never declared in lib.rs, so it never compiled and never ran. It
   contained two latent contract bugs, now fixed: `assert_eq!(process.state, 2)`
   against an enum whose `Running` is variant #1 (now `ProcessState::Running`), and
   a missing `ProcessState` import.
4. **Floating smithay git dep** — the rot mechanism. Lock pinned 01f3f4bd; the
   declaration didn't, so any `cargo update` could move master and re-break the crate.

## What was changed (5 files, nothing else)

- `src/spatial/process_scheduler.rs` — `#[derive(Debug)]` on ProcessScheduler (all
  members already derive Debug; compiler-suggested); added `get_process`,
  `get_process_mut`, `process_count`, `ProcessRegion::width()/height()`,
  `to_binary()` (20-byte LE header, header-only payload documented — the scheduler
  owns no cell raster; walls are materialized by GeoAsmMaterializer).
- `src/process_region_bridge.rs` — rewritten against the real API. Bridge-owned
  `wall_cells: Vec<(pid, x, y, type)>` boundary overlay replaces the invented
  `scheduler.cells`; duplicate impl block deleted; `next_pid` race removed (pid read
  from `create_process` return, not a field peek); `regions_overlap` fixed to
  half-open extents (the old `end_x < start` form never detects adjacency correctly
  and `end_*` fields don't exist); `resolve_overlaps` now shifts by the first
  region's FULL extent +10 (a +50px shift can never clear 640px default windows);
  `detect_overlaps` sorts regions by PID — HashMap iteration order was
  nondeterministic and made the resolver move the wrong particle run-to-run;
  `validate_regions` checks LIVE particle positions (test moves a particle with sync
  off and expects validation to see it); `create_execution_zone` disables the layout
  manager's auto-collision-shift so bridge-level overlap detection is the authority
  (the manager was silently relocating new zones, preempting detect/resolve).
- `src/process_region_bridge_test.rs` — the two contract fixes above.
- `src/lib.rs` — `#[cfg(test)] mod process_region_bridge_test;` wired in.
- `Cargo.toml` — smithay pinned to rev 01f3f4bd (matches lock byte-for-byte),
  comment warns against unpinning.

## Repo forensics (found during worktree-isolation attempt — IMPORTANT)

The inner `geometry_os/geometry_os` git repo has a **hollow object store**:
0 packfiles, 4,620 loose objects, missing trees reachable from HEAD
(fd15278..., 4d04a31e...). `git worktree add` fails mechanically; `git log -- <path>`
fails on old paths; 38 of the crate's 39 tracked blobs are absent from git — **the
working tree is the only copy of most of this crate**. There is uncommitted Phase-17
WIP in the crate (lib.rs, rendering/mod.rs, 4 untracked files) from a parallel lane.
SSH to the GitHub origin (tdw419/geometry_os) fails host-key verification, so remote
healing was unavailable. **Commits are deferred**: committing onto a hollow tree bakes
hollow parents into new history. Heal path before any commit: fix SSH known-hosts,
then `git fetch --depth=1 --filter=blob:none origin <tip>`, verify tip tree walks,
then commit. A failed `task/rung0-smithay-pin` branch stub was left registered by the
failed worktree add (harmless; `git branch -D` when healing).

## Gate results (honest accounting)

- LANE (rung0_lane/infinite_map_rs): check 0 errors, build exit 0, suite
  918/36 — failure set proven IDENTICAL across 2 runs (deterministic; the 36 are
  pre-existing rot in untouched subsystems: spatial::* API rot, missing program
  assets, image-decode drift, GPU-file-dependent refinery tests).
- MAIN tree after merge: check 0 errors, suite **925 passed / 29 failed** (7 of the
  lane's 36 pass here — absolute-path assets that exist in the real tree).
  Zero failures in process_region_bridge / window_particle / process_scheduler.
- **"cargo test --lib green" is NOT literally met**: the 29 remaining failures are
  pre-existing `spatial::*` rot outside rung 0's mandate (compile errors + pin).
  Full inventory captured in `rung0_lane/infinite_map_rs/main_fails.txt` for the
  next lane. The compile gate (the actual blocker) is fully green.

## Not proved / out of scope

- The 29 pre-existing test failures (untouched subsystems — separate rung/lane).
- `systems/health/software_shm.py --check` (AGENTS gate): file does not exist in the
  current tree — unverifiable, recorded here rather than skipped silently.
- Binary targets (`cargo build` full, main.rs winit/Wayland path) — rung 1 territory.
- The 7 absolute-path-dependent tests rely on `projects/geometry_os/systems/...`
  hardcodes — brittle, noted for rung 1 hygiene.
- Commit deferred (see forensics above).

## Next rung

Rung 1: winit window showing the canvas (grid + camera pan/zoom from the existing
tested gesture code) — see COMPOSITOR_LADDER.md.
