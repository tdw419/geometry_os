---
spec: phase-30-8-terminal-ui
phase: tasks
total_tasks: 6
created: 2026-02-20T11:00:00Z
generated: auto
---

# Tasks: phase-30-8-terminal-ui

## Phase 1: Make It Work (POC)

Focus: Validate Unicode rendering and damage tracking work end-to-end. Skip performance optimization.

- [ ] 1.1 Create GlyphAtlas component
  - **Do**: Create `src/glyph_atlas.rs` with fontdue integration, implement `GlyphAtlas::new()`, `render_glyph()`, `get_glyph()`
  - **Files**: `systems/infinite_map_rs/src/glyph_atlas.rs`, `systems/infinite_map_rs/src/lib.rs`
  - **Done when**: All 4 tests in `test_glyph_atlas.rs` pass (creation, cache_miss, render_and_cache, unicode)
  - **Verify**: `cargo test --features hypervisor test_glyph_atlas -- --nocapture`
  - **Commit**: `feat(glyph): add GlyphAtlas for Unicode font rendering`
  - _Requirements: FR-1, FR-2, FR-3_
  - _Design: Component 1 - GlyphAtlas_

- [ ] 1.2 Create DamageTracker component
  - **Do**: Create `src/damage_tracker.rs` with `mark_dirty()`, `compute_dirty_rects()`, `clear()`, Hilbert mapping
  - **Files**: `systems/infinite_map_rs/src/damage_tracker.rs`, `systems/infinite_map_rs/src/lib.rs`
  - **Done when**: All 6 tests in `test_damage_tracker.rs` pass (creation, mark_dirty, single_rect, disjoint_rects, clear, hilbert)
  - **Verify**: `cargo test --features hypervisor test_damage_tracker -- --nocapture`
  - **Commit**: `feat(damage): add DamageTracker for partial terminal updates`
  - _Requirements: FR-4, FR-5_
  - _Design: Component 2 - DamageTracker_

- [ ] 1.3 Integrate GlyphAtlas into VmTextureManager
  - **Do**: Add `glyph_atlas` field to VmTextureManager, implement `render_terminal_buffer_unicode()` and `blit_glyph()`
  - **Files**: `systems/infinite_map_rs/src/vm_texture_manager.rs`
  - **Done when**: Test `test_unicode_terminal_rendering` passes, Unicode characters render without crash
  - **Verify**: `cargo test --features hypervisor test_unicode_terminal_rendering -- --nocapture`
  - **Commit**: `feat(terminal): integrate GlyphAtlas for Unicode rendering`
  - _Requirements: FR-1, AC-1.2_
  - _Design: Component 3 - VmTextureManager Enhancement_

- [ ] 1.4 Integrate DamageTracker into update loop
  - **Do**: Add `write_char_tracked()` to TerminalBuffer, implement `update_terminal_texture_partial()` in VmTextureManager
  - **Files**: `systems/infinite_map_rs/src/terminal_emulator.rs`, `systems/infinite_map_rs/src/vm_texture_manager.rs`
  - **Done when**: Tests in `test_damage_integration.rs` pass, partial updates work for dirty regions
  - **Verify**: `cargo test --features hypervisor test_damage_integration -- --nocapture`
  - **Commit**: `feat(damage): integrate DamageTracker for partial texture updates`
  - _Requirements: FR-6, FR-7_
  - _Design: Data Flow - Partial Update Path_

- [ ] 1.5 POC Checkpoint
  - **Do**: Run terminal with Unicode content (CJK chars), verify visual rendering and partial updates
  - **Done when**: Manual test shows Chinese characters correctly, single-line edit doesn't cause full-screen flash
  - **Verify**: Run app, type Unicode, observe smooth updates
  - **Commit**: `feat(terminal): complete Unicode + damage tracking POC`

## Phase 2: Refactoring

After POC validated, clean up code and handle edge cases.

- [ ] 2.1 Handle wide characters (CJK)
  - **Do**: Detect wide characters in `write_char_tracked()`, mark 2 cells dirty for CJK
  - **Files**: `systems/infinite_map_rs/src/terminal_emulator.rs`, `systems/infinite_map_rs/src/damage_tracker.rs`
  - **Done when**: CJK characters don't cause overlap or truncation
  - **Verify**: Visual test with mixed ASCII/CJK text
  - **Commit**: `refactor(terminal): handle wide character damage tracking`
  - _Design: Error Handling - Invalid dirty rect_

- [ ] 2.2 Add atlas overflow handling
  - **Do**: Implement atlas growth strategy or LRU eviction when atlas fills
  - **Files**: `systems/infinite_map_rs/src/glyph_atlas.rs`
  - **Done when**: Atlas overflow logs warning and falls back gracefully
  - **Verify**: Render 1000+ unique glyphs, verify no panic
  - **Commit**: `refactor(glyph): add atlas overflow handling`
  - _Design: Component 1 - State Machine [Full]_

## Phase 3: Testing

- [ ] 3.1 Unit tests for GlyphAtlas edge cases
  - **Do**: Add tests for atlas full, glyph too large, repeated render (cache hit)
  - **Files**: `systems/infinite_map_rs/tests/test_glyph_atlas.rs`
  - **Done when**: Coverage >90% on glyph_atlas.rs
  - **Verify**: `cargo test --features hypervisor test_glyph_atlas`
  - **Commit**: `test(glyph): add edge case unit tests`

- [ ] 3.2 Unit tests for DamageTracker edge cases
  - **Do**: Add tests for full-screen damage, single-cell damage, merge behavior
  - **Files**: `systems/infinite_map_rs/tests/test_damage_tracker.rs`
  - **Done when**: Coverage >90% on damage_tracker.rs
  - **Verify**: `cargo test --features hypervisor test_damage_tracker`
  - **Commit**: `test(damage): add edge case unit tests`

- [ ] 3.3 Integration tests
  - **Do**: Create test that writes tracked chars, computes rects, verifies partial upload
  - **Files**: `systems/infinite_map_rs/tests/test_damage_integration.rs`
  - **Done when**: E2E flow from write to partial upload verified
  - **Verify**: `cargo test --features hypervisor test_damage_integration`
  - **Commit**: `test(terminal): add damage integration tests`

## Phase 4: Quality Gates

- [ ] 4.1 Add performance benchmarks
  - **Do**: Create criterion benchmarks for full render, partial render, damage tracking overhead
  - **Files**: `systems/infinite_map_rs/benches/terminal_rendering_benchmark.rs`
  - **Done when**: Benchmarks run and report numbers
  - **Verify**: `cargo bench --features hypervisor terminal_rendering`
  - **Commit**: `perf(bench): add terminal rendering performance benchmarks`

- [ ] 4.2 Validate <2% CPU overhead
  - **Do**: Run benchmark, compare full-frame vs partial update times
  - **Done when**: Single-line update <0.5ms, cursor blink <0.1ms
  - **Verify**: Benchmark output shows target metrics
  - **Commit**: `fix(terminal): optimize to meet <2% CPU target` (if needed)

- [ ] 4.3 Update documentation
  - **Do**: Create `PHASE_30_8_TERMINAL_UI_ENHANCEMENTS_COMPLETE.md` with results
  - **Files**: `PHASE_30_8_TERMINAL_UI_ENHANCEMENTS_COMPLETE.md`
  - **Done when**: Document reflects actual implementation and metrics
  - **Verify**: Review doc completeness
  - **Commit**: `docs: complete Phase 30.8 Terminal UI Enhancements`

- [ ] 4.4 Local quality check
  - **Do**: Run `cargo test --features hypervisor`, `cargo clippy`, `cargo fmt --check`
  - **Done when**: All pass with no errors
  - **Verify**: All commands exit 0
  - **Commit**: `fix(terminal): address lint/format issues` (if needed)

- [ ] 4.5 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI, verify CI passes
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review, all CI checks pass

## Notes

- **POC shortcuts taken**: Atlas growth not implemented, wide char handling deferred to Phase 2
- **Production TODOs**: Add LRU eviction for atlas, implement variable font sizes, emoji color atlas
- **Font file**: Need to add `fonts/JetBrainsMono-Regular.ttf` (download from JetBrains repo or use system font)

## Task Summary

| Task | Component | Tests | Files |
|------|-----------|-------|-------|
| 1.1 | GlyphAtlas | 4 | glyph_atlas.rs, lib.rs |
| 1.2 | DamageTracker | 6 | damage_tracker.rs, lib.rs |
| 1.3 | Unicode Integration | 1 | vm_texture_manager.rs |
| 1.4 | Damage Integration | 2 | terminal_emulator.rs, vm_texture_manager.rs |
| 1.5 | POC Checkpoint | - | Manual |
| 2.1 | Wide Char Handling | - | terminal_emulator.rs |
| 2.2 | Atlas Overflow | - | glyph_atlas.rs |
| 3.1-3.3 | Testing | ~10 | test files |
| 4.1-4.5 | Quality Gates | - | benchmarks, docs |
| **Total** | **6 components** | **~23 tests** | **11 files** |
