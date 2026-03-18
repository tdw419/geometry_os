# Text Overlay Integration Plan

**Date:** 2026-03-18
**Component:** Execution Zone Renderer
**Goal:** Render overlay text (shader name, workgroup size, status) at execution zone positions

## Architecture Discovery

### Initial Approach (Abandoned)
- **Option 2:** Use TextEngine with viewport transform
- **Problem:** TextEngine designed for full-screen editing, not positioned overlays
- **Blocker:** Would require significant refactoring

### Discovered Infrastructure
- **GlyphAtlas** (`systems/infinite_map_rs/src/glyph_atlas.rs`)
  - Renders glyphs to pixel data (CPU-side)
  - Supports ASCII (embedded bitmap) and Unicode (fontdue)
  - Returns `GlyphInfo` with pixel data, dimensions, bearings
  
- **GlyphSubstrate** (`systems/infinite_map_rs/src/glyph_substrate.rs`)
  - GPU buffer for storing glyph data
  
- **GlyphRenderer** (`systems/infinite_map_rs/src/rendering/glyph_renderer.rs`)
  - GPU pipeline for blitting glyphs to screen
  - Currently renders as fullscreen quad
  - Uses `glyph_shell.wgsl` shader

## Implementation Path

### Phase 1: Add Infrastructure (Next Step)
Add to `ExecutionZoneRenderer`:
```rust
pub struct ExecutionZoneRenderer {
    // ... existing fields ...
    glyph_atlas: GlyphAtlas,
    glyph_renderer: Option<GlyphRenderer>,
    glyph_substrate: Option<GlyphSubstrate>,
}
```

### Phase 2: Initialize Glyph Infrastructure
- Create GlyphAtlas in `ExecutionZoneRenderer::new()`
- Lazy-initialize GlyphRenderer/GlyphSubstrate on first use
- Pass device/queue for GPU resource creation

### Phase 3: Render Text Overlay
- Generate overlay text using existing `generate_zone_overlay_text_with_position()`
- Render each character using GlyphAtlas
- Position text at zone location (top-left corner)
- Integrate into render pass after border rendering

### Phase 4: Handle Positioning
- Modify GlyphRenderer to support positioned rendering (not just fullscreen)
- OR: Use viewport/scissor to render text at specific location
- OR: Pre-render to texture, then blit at position

## Architectural Considerations

### Borrow Conflict Issue
Previous attempt (commit 19080639) noted borrow conflicts between:
- Mutable borrow of `glyph_atlas` (for rendering)
- Immutable borrow of `zones` iterator

**Solutions:**
1. Pre-render text in separate pass before main render loop
2. Use interior mutability (`RefCell`) for glyph_atlas
3. Pass mutable glyph_atlas as separate parameter

### Recommended Approach
Pre-render text overlays in a separate method called before the main render loop:
```rust
pub fn render(&mut self, encoder: &mut CommandEncoder, output_texture: &Texture) {
    // 1. Render text overlays first (separate pass)
    self.render_text_overlays(encoder, output_texture);
    
    // 2. Then render zones (existing code)
    for zone in &self.zones { ... }
    
    // 3. Render borders (existing code)
    self.render_borders(encoder, output_texture, screen_size);
}
```

## Benefits of GlyphAtlas Approach
- ✅ Lightweight (no full-screen TextEngine needed)
- ✅ Purpose-built for character rendering
- ✅ Caching for performance
- ✅ Unicode support via fontdue
- ✅ Clear separation of concerns

## Next Action
Add GlyphAtlas, GlyphRenderer, GlyphSubstrate fields to ExecutionZoneRenderer struct and initialize in `new()` method.

## Related Files
- `systems/infinite_map_rs/src/rendering/execution_zone_renderer.rs`
- `systems/infinite_map_rs/src/glyph_atlas.rs`
- `systems/infinite_map_rs/src/rendering/glyph_renderer.rs`
- `systems/infinite_map_rs/src/ui/zone_overlay.rs` (text generation utilities)
