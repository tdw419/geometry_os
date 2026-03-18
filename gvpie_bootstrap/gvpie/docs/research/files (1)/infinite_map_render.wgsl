// ============================================================================
// GVPIE Infinite Map - Render Shader v1.0
// ============================================================================
// Renders the infinite grid, cards, and card content. Everything procedural.

// ----------------------------------------------------------------------------
// SHARED STRUCTURES (must match compute shader)
// ----------------------------------------------------------------------------

struct Camera {
    x: f32,
    y: f32,
    zoom: f32,
    target_zoom: f32,
    velocity_x: f32,
    velocity_y: f32,
    drag: f32,
}

struct Card {
    x: f32,
    y: f32,
    width: f32,
    height: f32,
    content_offset: u32,
    content_length: u32,
    color: u32,
    flags: u32,
    title_offset: u32,
    title_length: u32,
}

struct MapState {
    camera: Camera,
    cards: array<Card, 4096>,
    card_count: u32,
    selected_card: u32,
    hovered_card: u32,
    dragging_card: u32,
    drag_offset_x: f32,
    drag_offset_y: f32,
    mouse_world_x: f32,
    mouse_world_y: f32,
    mouse_screen_x: f32,
    mouse_screen_y: f32,
    grid_visible: u32,
    _padding: array<u32, 3>,
}

struct ContentBuffer {
    data: array<u32, 67108864>,
    next_offset: u32,
}

struct RenderUniforms {
    viewport_width: f32,
    viewport_height: f32,
    time: f32,
    _padding: f32,
}

// ----------------------------------------------------------------------------
// BINDINGS
// ----------------------------------------------------------------------------

@group(0) @binding(0) var<storage, read> state: MapState;
@group(0) @binding(1) var<storage, read> content: ContentBuffer;
@group(0) @binding(2) var<uniform> uniforms: RenderUniforms;
@group(0) @binding(3) var font_texture: texture_2d<f32>;
@group(0) @binding(4) var font_sampler: sampler;

// ----------------------------------------------------------------------------
// VERTEX OUTPUT
// ----------------------------------------------------------------------------

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) tex_coord: vec2<f32>,
    @location(2) flags: u32,
}

// ----------------------------------------------------------------------------
// UTILITY FUNCTIONS
// ----------------------------------------------------------------------------

fn world_to_screen(world_x: f32, world_y: f32) -> vec2<f32> {
    let rel_x = (world_x - state.camera.x) * state.camera.zoom;
    let rel_y = (world_y - state.camera.y) * state.camera.zoom;
    
    let ndc_x = rel_x / (uniforms.viewport_width / 2.0);
    let ndc_y = rel_y / (uniforms.viewport_height / 2.0);
    
    let screen_x = (ndc_x + 1.0) * uniforms.viewport_width / 2.0;
    let screen_y = (1.0 - ndc_y) * uniforms.viewport_height / 2.0;
    
    return vec2<f32>(screen_x, screen_y);
}

fn screen_to_ndc(x: f32, y: f32) -> vec2<f32> {
    let ndc_x = (x / uniforms.viewport_width) * 2.0 - 1.0;
    let ndc_y = 1.0 - (y / uniforms.viewport_height) * 2.0;
    return vec2<f32>(ndc_x, ndc_y);
}

fn unpack_color(packed: u32) -> vec4<f32> {
    let r = f32((packed >> 24u) & 0xFFu) / 255.0;
    let g = f32((packed >> 16u) & 0xFFu) / 255.0;
    let b = f32((packed >> 8u) & 0xFFu) / 255.0;
    let a = f32(packed & 0xFFu) / 255.0;
    return vec4<f32>(r, g, b, a);
}

// ----------------------------------------------------------------------------
// CARD RENDERING (Instance per card)
// ----------------------------------------------------------------------------

@vertex
fn vs_card(
    @builtin(vertex_index) vid: u32,
    @builtin(instance_index) iid: u32
) -> VertexOutput {
    var output: VertexOutput;
    
    if (iid >= state.card_count) {
        output.position = vec4<f32>(0.0);
        return output;
    }
    
    let card = state.cards[iid];
    
    // Generate quad corners
    var corner_offset = vec2<f32>(0.0, 0.0);
    var tex_offset = vec2<f32>(0.0, 0.0);
    
    switch (vid % 4u) {
        case 0u: { // Top-left
            corner_offset = vec2<f32>(0.0, 0.0);
            tex_offset = vec2<f32>(0.0, 0.0);
        }
        case 1u: { // Top-right
            corner_offset = vec2<f32>(card.width, 0.0);
            tex_offset = vec2<f32>(1.0, 0.0);
        }
        case 2u: { // Bottom-left
            corner_offset = vec2<f32>(0.0, card.height);
            tex_offset = vec2<f32>(0.0, 1.0);
        }
        case 3u: { // Bottom-right
            corner_offset = vec2<f32>(card.width, card.height);
            tex_offset = vec2<f32>(1.0, 1.0);
        }
        default: {}
    }
    
    // World position
    let world_pos = vec2<f32>(card.x, card.y) + corner_offset;
    let screen_pos = world_to_screen(world_pos.x, world_pos.y);
    let ndc = screen_to_ndc(screen_pos.x, screen_pos.y);
    
    output.position = vec4<f32>(ndc, 0.0, 1.0);
    
    // Color based on state
    var base_color = unpack_color(card.color);
    
    // Highlight if selected
    if (iid == state.selected_card) {
        base_color = base_color + vec4<f32>(0.2, 0.2, 0.0, 0.0);
    }
    
    // Highlight if hovered
    if (iid == state.hovered_card) {
        base_color = base_color + vec4<f32>(0.1, 0.1, 0.1, 0.0);
    }
    
    output.color = base_color;
    output.tex_coord = tex_offset;
    output.flags = 0u; // Card background (no text)
    
    return output;
}

@fragment
fn fs_card(input: VertexOutput) -> @location(0) vec4<f32> {
    // Simple solid color for card background
    return input.color;
}

// ----------------------------------------------------------------------------
// TEXT RENDERING (Instance per character)
// ----------------------------------------------------------------------------

const CHAR_WIDTH: f32 = 9.0;
const CHAR_HEIGHT: f32 = 16.0;

@vertex
fn vs_text(
    @builtin(vertex_index) vid: u32,
    @builtin(instance_index) iid: u32
) -> VertexOutput {
    var output: VertexOutput;
    
    // Calculate which card and character this instance represents
    // For now, render text for all cards sequentially
    var char_count = 0u;
    var current_card = 0u;
    var char_in_card = 0u;
    
    // Find which card this character belongs to
    for (var i = 0u; i < state.card_count; i = i + 1u) {
        let card_chars = state.cards[i].title_length + state.cards[i].content_length;
        if (iid < char_count + card_chars) {
            current_card = i;
            char_in_card = iid - char_count;
            break;
        }
        char_count = char_count + card_chars;
    }
    
    if (current_card >= state.card_count) {
        output.position = vec4<f32>(0.0);
        return output;
    }
    
    let card = state.cards[current_card];
    
    // Determine if this is title or content
    var ch: u32;
    var char_x: f32;
    var char_y: f32;
    
    if (char_in_card < card.title_length) {
        // Title character
        ch = content.data[card.title_offset + char_in_card];
        char_x = card.x + 10.0 + f32(char_in_card) * CHAR_WIDTH;
        char_y = card.y + 10.0;
    } else {
        // Content character
        let content_idx = char_in_card - card.title_length;
        ch = content.data[card.content_offset + content_idx];
        
        // Simple line wrapping
        let chars_per_line = u32((card.width - 20.0) / CHAR_WIDTH);
        let line_num = content_idx / chars_per_line;
        let col_num = content_idx % chars_per_line;
        
        char_x = card.x + 10.0 + f32(col_num) * CHAR_WIDTH;
        char_y = card.y + 40.0 + f32(line_num) * CHAR_HEIGHT;
    }
    
    // Generate character quad
    var corner_offset = vec2<f32>(0.0, 0.0);
    var tex_offset = vec2<f32>(0.0, 0.0);
    
    switch (vid % 4u) {
        case 0u: {
            corner_offset = vec2<f32>(0.0, 0.0);
            tex_offset = vec2<f32>(0.0, 0.0);
        }
        case 1u: {
            corner_offset = vec2<f32>(CHAR_WIDTH, 0.0);
            tex_offset = vec2<f32>(1.0, 0.0);
        }
        case 2u: {
            corner_offset = vec2<f32>(0.0, CHAR_HEIGHT);
            tex_offset = vec2<f32>(0.0, 1.0);
        }
        case 3u: {
            corner_offset = vec2<f32>(CHAR_WIDTH, CHAR_HEIGHT);
            tex_offset = vec2<f32>(1.0, 1.0);
        }
        default: {}
    }
    
    let world_pos = vec2<f32>(char_x, char_y) + corner_offset;
    let screen_pos = world_to_screen(world_pos.x, world_pos.y);
    let ndc = screen_to_ndc(screen_pos.x, screen_pos.y);
    
    output.position = vec4<f32>(ndc, 0.0, 1.0);
    
    // Font atlas texture coordinates
    let atlas_col = ch % 16u;
    let atlas_row = ch / 16u;
    let atlas_cell_size = 1.0 / 16.0;
    
    output.tex_coord = vec2<f32>(
        (f32(atlas_col) + tex_offset.x) * atlas_cell_size,
        (f32(atlas_row) + tex_offset.y) * atlas_cell_size
    );
    
    output.color = vec4<f32>(1.0, 1.0, 1.0, 1.0); // White text
    output.flags = 1u; // Text rendering
    
    return output;
}

@fragment
fn fs_text(input: VertexOutput) -> @location(0) vec4<f32> {
    let glyph = textureSample(font_texture, font_sampler, input.tex_coord);
    let final_color = glyph * input.color;
    
    if (final_color.a < 0.01) {
        discard;
    }
    
    return final_color;
}

// ----------------------------------------------------------------------------
// GRID RENDERING
// ----------------------------------------------------------------------------

@vertex
fn vs_grid(@builtin(vertex_index) vid: u32) -> VertexOutput {
    var output: VertexOutput;
    
    if (state.grid_visible == 0u) {
        output.position = vec4<f32>(0.0);
        return output;
    }
    
    let grid_spacing = 100.0;
    
    // Calculate visible world bounds
    let half_width = uniforms.viewport_width / (2.0 * state.camera.zoom);
    let half_height = uniforms.viewport_height / (2.0 * state.camera.zoom);
    
    let min_x = state.camera.x - half_width;
    let max_x = state.camera.x + half_width;
    let min_y = state.camera.y - half_height;
    let max_y = state.camera.y + half_height;
    
    // Snap to grid
    let start_x = floor(min_x / grid_spacing) * grid_spacing;
    let start_y = floor(min_y / grid_spacing) * grid_spacing;
    
    let lines_x = u32((max_x - start_x) / grid_spacing) + 2u;
    let lines_y = u32((max_y - start_y) / grid_spacing) + 2u;
    
    let line_idx = vid / 2u;
    let vert_idx = vid % 2u;
    
    var world_pos: vec2<f32>;
    
    if (line_idx < lines_x) {
        // Vertical line
        let x = start_x + f32(line_idx) * grid_spacing;
        if (vert_idx == 0u) {
            world_pos = vec2<f32>(x, min_y);
        } else {
            world_pos = vec2<f32>(x, max_y);
        }
    } else {
        // Horizontal line
        let line_offset = line_idx - lines_x;
        let y = start_y + f32(line_offset) * grid_spacing;
        if (vert_idx == 0u) {
            world_pos = vec2<f32>(min_x, y);
        } else {
            world_pos = vec2<f32>(max_x, y);
        }
    }
    
    let screen_pos = world_to_screen(world_pos.x, world_pos.y);
    let ndc = screen_to_ndc(screen_pos.x, screen_pos.y);
    
    output.position = vec4<f32>(ndc, 0.0, 1.0);
    output.color = vec4<f32>(0.2, 0.2, 0.2, 1.0); // Dark gray grid
    output.tex_coord = vec2<f32>(0.0);
    output.flags = 2u; // Grid line
    
    return output;
}

@fragment
fn fs_grid(input: VertexOutput) -> @location(0) vec4<f32> {
    return input.color;
}
