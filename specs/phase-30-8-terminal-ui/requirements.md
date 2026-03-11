---
spec: phase-30-8-terminal-ui
phase: requirements
created: 2026-02-20T11:00:00Z
generated: auto
---

# Requirements: phase-30-8-terminal-ui

## Summary

Replace 8x16 ASCII bitmap font with Unicode-capable TrueType rendering via fontdue, implement damage tracking for partial GPU texture updates. Target: reduce CPU overhead from ~15% to <2% during typical terminal operations.

## User Stories

### US-1: Unicode Glyph Rendering

As a terminal user, I want to see CJK characters, emojis, and Unicode symbols correctly rendered so that I can work with international text and special characters.

**Acceptance Criteria**:
- AC-1.1: GlyphAtlas renders ASCII (32-126) identically to previous bitmap font
- AC-1.2: GlyphAtlas renders CJK characters (e.g., U+4E2D 'zhong') with correct width/height
- AC-1.3: GlyphAtlas caches rendered glyphs for O(1) lookup on subsequent renders
- AC-1.4: GlyphAtlas texture atlas supports 512+ unique glyphs before overflow
- AC-1.5: Glyph rendering produces smooth edges (fontdue anti-aliasing)

### US-2: Damage Tracking

As a terminal renderer, I want to track which cells changed so that I can upload only dirty regions instead of full frame.

**Acceptance Criteria**:
- AC-2.1: DamageTracker marks individual cells dirty on write
- AC-2.2: `compute_dirty_rects()` merges adjacent dirty cells into minimal rectangles
- AC-2.3: Clear damage tracking resets all flags without memory leak
- AC-2.4: Hilbert curve mapping preserves spatial locality for PixelRTS integration
- AC-2.5: Damage tracking overhead <0.1ms per 1000 cell updates

### US-3: Performance

As a system user, I want terminal rendering to use <2% CPU so that other components have resources available.

**Acceptance Criteria**:
- AC-3.1: Full frame render (80x24) completes in <5ms
- AC-3.2: Single line update (80 chars) renders in <0.5ms
- AC-3.3: Cursor blink update (1 cell) renders in <0.1ms
- AC-3.4: Memory overhead for GlyphAtlas <2MB (512x512 R8 texture + cache)
- AC-3.5: Zero texture reallocation during steady-state operation

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | GlyphAtlas shall use fontdue for TrueType font rendering | Must | US-1 |
| FR-2 | GlyphAtlas shall cache glyphs by (char, size) key | Must | US-1 |
| FR-3 | GlyphAtlas shall pack glyphs into texture atlas using row packing | Must | US-1 |
| FR-4 | DamageTracker shall maintain per-cell dirty flags | Must | US-2 |
| FR-5 | DamageTracker shall compute dirty rectangles via scan-line expansion | Must | US-2 |
| FR-6 | VmTextureManager shall support partial texture uploads via wgpu origin offset | Must | US-2 |
| FR-7 | TerminalBuffer shall provide `write_char_tracked()` method | Must | US-2 |
| FR-8 | Partial update path shall be selectable via feature flag or runtime switch | Should | US-3 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | CPU overhead <2% for typical typing (40 chars/sec) | Performance |
| NFR-2 | GPU bandwidth reduction >90% vs full-frame for single-line updates | Performance |
| NFR-3 | No regression in visual quality (text readability maintained) | Quality |
| NFR-4 | Embedded font file (JetBrains Mono) <200KB | Resource |
| NFR-5 | All components thread-safe for future multi-terminal support | Concurrency |

## Out of Scope

- Emoji color atlas (COLR/CPAL tables) - defer to Phase 31+
- Variable font support (font variations)
- Subpixel rendering (LCD subpixel AA)
- Shaping complex scripts (Arabic, Devanagari) - would require harfbuzz

## Dependencies

| Dependency | Version | Purpose |
|------------|---------|---------|
| fontdue | 0.9 | TrueType rasterization |
| fast_hilbert | 1.0 | Coordinate mapping for PixelRTS |
| wgpu | 0.19 | GPU texture partial updates |
| JetBrainsMono-Regular.ttf | Embedded | Monospace font for terminals |

## Success Metrics

| Metric | Current | Target |
|--------|---------|--------|
| CPU overhead (typing) | ~15% | <2% |
| GPU bandwidth per frame | 640x384x4 = 983KB | <10KB average |
| Unicode support | ASCII only (95 chars) | Full Unicode BMP |
| First-render latency | N/A | <1ms per new glyph |
