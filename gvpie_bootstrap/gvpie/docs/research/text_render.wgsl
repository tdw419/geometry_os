// ============================================================================
// GVPIE Render Pipeline v1.0
// ============================================================================
// Procedural text rendering from gap buffer. No vertex buffers required -
// everything is computed on the fly from editor state.

// ----------------------------------------------------------------------------
// CONSTANTS
// ----------------------------------------------------------------------------

const CHAR_WIDTH: f32 = 9.0;          // Character cell width in pixels
const CHAR_HEIGHT: f32 = 16.0;        // Character cell height in pixels
const VIEWPORT_WIDTH: f32 = 1920.0;   // Adjust based on window
const VIEWPORT_HEIGHT: f32 = 1080.0;  // Adjust based on window
const CURSOR_BLINK_RATE: f32 = 1.0;   // Seconds per blink cycle

// ----------------------------------------------------------------------------
// SHARED DATA STRUCTURES
// ----------------------------------------------------------------------------

struct TextBuffer {
    data: array<u32, 262144>,
    gap_start: u32,
    gap_end: u32,
    total_chars: u32,
    cursor_pos: u32,
    dirty: u32,
}

struct LineIndex {
    offsets: array<u32, 65536>,
    count: u32,
    dirty: u32,
}

struct EditorState {
    buffer: TextBuffer,
    lines: LineIndex,
    cursor_line: u32,
    cursor_col: u32,
    scroll_offset: u32,
    selection_start: u32,
    selection_end: u32,
}

// ----------------------------------------------------------------------------
// UNIFORMS
// ----------------------------------------------------------------------------

struct RenderUniforms {
    time: f32,              // Time in seconds for cursor blink
    viewport_width: f32,
    viewport_height: f32,
    _padding: f32,
}

// ----------------------------------------------------------------------------
// BINDINGS
// ----------------------------------------------------------------------------

@group(0) @binding(0) var<storage, read> state: EditorState;
@group(0) @binding(1) var<uniform> uniforms: RenderUniforms;
@group(0) @binding(2) var font_texture: texture_2d<f32>;
@group(0) @binding(3) var font_sampler: sampler;

// ----------------------------------------------------------------------------
// VERTEX SHADER
// ----------------------------------------------------------------------------

struct VertexInput {
    @builtin(vertex_index) vertex_index: u32,
    @builtin(instance_index) instance_index: u32,
}

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) tex_coord: vec2<f32>,
    @location(1) color: vec4<f32>,
}

// Convert screen coordinates to NDC (Normalized Device Coordinates)
fn screen_to_ndc(x: f32, y: f32) -> vec2<f32> {
    let ndc_x = (x / uniforms.viewport_width) * 2.0 - 1.0;
    let ndc_y = 1.0 - (y / uniforms.viewport_height) * 2.0;
    return vec2<f32>(ndc_x, ndc_y);
}

// Get character at logical position (accounting for gap)
fn get_char_at_logical(pos: u32) -> u32 {
    if (pos < state.buffer.gap_start) {
        return state.buffer.data[pos];
    } else {
        let gap_size = state.buffer.gap_end - state.buffer.gap_start;
        return state.buffer.data[pos + gap_size];
    }
}

// Generate quad vertices for rendering
// Each instance is a character, vertex_index selects corner
@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var output: VertexOutput;
    
    let chars_per_line = u32(uniforms.viewport_width / CHAR_WIDTH);
    let visible_lines = u32(uniforms.viewport_height / CHAR_HEIGHT);
    
    // Determine which character this instance represents
    let line_num = input.instance_index / chars_per_line + state.scroll_offset;
    let col_num = input.instance_index % chars_per_line;
    
    // Skip if beyond visible area or beyond document
    if (line_num >= state.lines.count || line_num >= state.scroll_offset + visible_lines) {
        output.position = vec4<f32>(0.0, 0.0, 0.0, 0.0); // Degenerate triangle
        output.color = vec4<f32>(0.0);
        return output;
    }
    
    // Get character at this position
    let line_start = state.lines.offsets[line_num];
    var line_end: u32;
    if (line_num < state.lines.count - 1u) {
        line_end = state.lines.offsets[line_num + 1u];
    } else {
        line_end = state.buffer.total_chars;
    }
    
    let char_pos = line_start + col_num;
    
    // Check if this is a valid character position
    var ch: u32 = 32u; // Space by default
    var is_visible = false;
    
    if (char_pos < line_end) {
        ch = get_char_at_logical(char_pos);
        is_visible = true;
    }
    
    // Generate quad corners based on vertex_index
    // 0: top-left, 1: top-right, 2: bottom-left, 3: bottom-right
    let corner = input.vertex_index % 4u;
    var offset = vec2<f32>(0.0, 0.0);
    var tex_offset = vec2<f32>(0.0, 0.0);
    
    switch (corner) {
        case 0u: { // Top-left
            offset = vec2<f32>(0.0, 0.0);
            tex_offset = vec2<f32>(0.0, 0.0);
        }
        case 1u: { // Top-right
            offset = vec2<f32>(CHAR_WIDTH, 0.0);
            tex_offset = vec2<f32>(1.0, 0.0);
        }
        case 2u: { // Bottom-left
            offset = vec2<f32>(0.0, CHAR_HEIGHT);
            tex_offset = vec2<f32>(0.0, 1.0);
        }
        case 3u: { // Bottom-right
            offset = vec2<f32>(CHAR_WIDTH, CHAR_HEIGHT);
            tex_offset = vec2<f32>(1.0, 1.0);
        }
        default: {}
    }
    
    // Calculate screen position
    let screen_x = f32(col_num) * CHAR_WIDTH + offset.x;
    let screen_y = f32(line_num - state.scroll_offset) * CHAR_HEIGHT + offset.y;
    let ndc = screen_to_ndc(screen_x, screen_y);
    
    output.position = vec4<f32>(ndc, 0.0, 1.0);
    
    // Calculate texture coordinates for this character in font atlas
    // Assume 16x16 grid of characters (256 chars total)
    let atlas_col = ch % 16u;
    let atlas_row = ch / 16u;
    let atlas_cell_size = 1.0 / 16.0;
    
    output.tex_coord = vec2<f32>(
        (f32(atlas_col) + tex_offset.x) * atlas_cell_size,
        (f32(atlas_row) + tex_offset.y) * atlas_cell_size
    );
    
    // Set color based on state
    if (is_visible) {
        // Check if this is the cursor position
        if (char_pos == state.buffer.cursor_pos) {
            // Blinking cursor
            let blink = fract(uniforms.time / CURSOR_BLINK_RATE);
            if (blink < 0.5) {
                output.color = vec4<f32>(1.0, 1.0, 1.0, 1.0); // White
            } else {
                output.color = vec4<f32>(0.0, 0.8, 1.0, 1.0); // Cyan (cursor)
            }
        } else {
            output.color = vec4<f32>(1.0, 1.0, 1.0, 1.0); // White
        }
    } else {
        output.color = vec4<f32>(0.0, 0.0, 0.0, 0.0); // Transparent
    }
    
    return output;
}

// ----------------------------------------------------------------------------
// FRAGMENT SHADER
// ----------------------------------------------------------------------------

@fragment
fn fs_main(input: VertexOutput) -> @location(0) vec4<f32> {
    // Sample from font atlas
    let glyph = textureSample(font_texture, font_sampler, input.tex_coord);
    
    // Multiply by color (for cursor highlighting)
    let final_color = glyph * input.color;
    
    // Discard fully transparent fragments
    if (final_color.a < 0.01) {
        discard;
    }
    
    return final_color;
}

// ----------------------------------------------------------------------------
// CURSOR RENDERING (Separate Pass)
// ----------------------------------------------------------------------------

// Dedicated cursor rendering to ensure it's always visible
@vertex
fn vs_cursor(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var output: VertexOutput;
    
    // Calculate cursor screen position
    let cursor_line = state.cursor_line;
    let cursor_col = state.cursor_col;
    
    // Check if cursor is visible
    if (cursor_line < state.scroll_offset || 
        cursor_line >= state.scroll_offset + u32(uniforms.viewport_height / CHAR_HEIGHT)) {
        output.position = vec4<f32>(0.0);
        return output;
    }
    
    let visible_line = cursor_line - state.scroll_offset;
    
    // Generate cursor quad
    let corner = vertex_index % 4u;
    var offset = vec2<f32>(0.0, 0.0);
    
    switch (corner) {
        case 0u: { offset = vec2<f32>(0.0, 0.0); }
        case 1u: { offset = vec2<f32>(2.0, 0.0); }  // 2px wide cursor
        case 2u: { offset = vec2<f32>(0.0, CHAR_HEIGHT); }
        case 3u: { offset = vec2<f32>(2.0, CHAR_HEIGHT); }
        default: {}
    }
    
    let screen_x = f32(cursor_col) * CHAR_WIDTH + offset.x;
    let screen_y = f32(visible_line) * CHAR_HEIGHT + offset.y;
    let ndc = screen_to_ndc(screen_x, screen_y);
    
    output.position = vec4<f32>(ndc, 0.0, 1.0);
    
    // Blinking cursor color
    let blink = fract(uniforms.time / CURSOR_BLINK_RATE);
    if (blink < 0.5) {
        output.color = vec4<f32>(0.0, 1.0, 1.0, 1.0); // Cyan
    } else {
        output.color = vec4<f32>(0.0, 1.0, 1.0, 0.5); // Dimmed
    }
    
    output.tex_coord = vec2<f32>(0.0); // Unused
    
    return output;
}

@fragment
fn fs_cursor(input: VertexOutput) -> @location(0) vec4<f32> {
    return input.color;
}

// ----------------------------------------------------------------------------
// SELECTION HIGHLIGHTING (Future Pass)
// ----------------------------------------------------------------------------

// TODO: Implement selection rendering
// - Check if character position is within selection range
// - Render blue highlight quad behind selected text
