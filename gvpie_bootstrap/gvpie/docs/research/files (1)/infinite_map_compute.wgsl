// ============================================================================
// GVPIE Infinite Map - Compute Shader v1.0
// ============================================================================
// A spatial organization system for code. Pan, zoom, and place cards
// containing WGSL shaders, docs, or any content. Everything lives on GPU.

// ----------------------------------------------------------------------------
// CONSTANTS
// ----------------------------------------------------------------------------

const MAX_CARDS: u32 = 4096u;           // Maximum number of cards on map
const CARD_CONTENT_SIZE: u32 = 16384u;  // 64KB per card (16K UTF-32 chars)
const ZOOM_MIN: f32 = 0.1;              // 10% zoom
const ZOOM_MAX: f32 = 10.0;             // 1000% zoom
const PAN_SPEED: f32 = 500.0;           // Pixels per second at 1.0 zoom
const ZOOM_SPEED: f32 = 2.0;            // Zoom multiplier per second

// ----------------------------------------------------------------------------
// DATA STRUCTURES
// ----------------------------------------------------------------------------

struct Camera {
    x: f32,              // World X position (center of view)
    y: f32,              // World Y position (center of view)
    zoom: f32,           // Zoom level (1.0 = 100%)
    target_zoom: f32,    // Smooth zoom target
    velocity_x: f32,     // Pan velocity for smooth movement
    velocity_y: f32,
    drag: f32,           // Friction coefficient
}

struct Card {
    x: f32,              // World X position (top-left corner)
    y: f32,              // World Y position
    width: f32,          // Card width in world units
    height: f32,         // Card height in world units
    content_offset: u32, // Offset into content buffer
    content_length: u32, // Length of content (in u32s)
    color: u32,          // RGBA color (packed)
    flags: u32,          // Bit flags: selected, hovered, etc.
    title_offset: u32,   // Offset into content buffer for title
    title_length: u32,   // Title length (max 64 chars)
}

struct MapState {
    camera: Camera,
    cards: array<Card, 4096>,
    card_count: u32,
    selected_card: u32,       // Index of selected card (-1 if none)
    hovered_card: u32,        // Index of hovered card (-1 if none)
    dragging_card: u32,       // Index of card being dragged (-1 if none)
    drag_offset_x: f32,       // Offset from card origin to mouse
    drag_offset_y: f32,
    mouse_world_x: f32,       // Mouse position in world coordinates
    mouse_world_y: f32,
    mouse_screen_x: f32,      // Mouse position in screen coordinates
    mouse_screen_y: f32,
    grid_visible: u32,        // Whether to show grid
    _padding: array<u32, 3>,
}

// Content buffer stores all card text data
struct ContentBuffer {
    data: array<u32, 67108864>, // 256MB of UTF-32 content
    next_offset: u32,            // Next free offset for allocation
}

// ----------------------------------------------------------------------------
// BUFFER BINDINGS
// ----------------------------------------------------------------------------

@group(0) @binding(0) var<storage, read_write> state: MapState;
@group(0) @binding(1) var<storage, read_write> content: ContentBuffer;
@group(0) @binding(2) var<storage, read_write> events: array<u32>;
@group(0) @binding(3) var<storage, read_write> requests: array<u32>;

// ----------------------------------------------------------------------------
// CAMERA OPERATIONS
// ----------------------------------------------------------------------------

fn init_camera() {
    state.camera.x = 0.0;
    state.camera.y = 0.0;
    state.camera.zoom = 1.0;
    state.camera.target_zoom = 1.0;
    state.camera.velocity_x = 0.0;
    state.camera.velocity_y = 0.0;
    state.camera.drag = 0.9; // 90% velocity retained per frame
}

fn update_camera(delta_time: f32) {
    // Smooth zoom interpolation
    let zoom_diff = state.camera.target_zoom - state.camera.zoom;
    state.camera.zoom = state.camera.zoom + zoom_diff * ZOOM_SPEED * delta_time;
    
    // Clamp zoom
    state.camera.zoom = clamp(state.camera.zoom, ZOOM_MIN, ZOOM_MAX);
    state.camera.target_zoom = clamp(state.camera.target_zoom, ZOOM_MIN, ZOOM_MAX);
    
    // Apply velocity to camera position
    state.camera.x = state.camera.x + state.camera.velocity_x * delta_time;
    state.camera.y = state.camera.y + state.camera.velocity_y * delta_time;
    
    // Apply drag
    state.camera.velocity_x = state.camera.velocity_x * state.camera.drag;
    state.camera.velocity_y = state.camera.velocity_y * state.camera.drag;
    
    // Stop if velocity is tiny
    if (abs(state.camera.velocity_x) < 0.1) { state.camera.velocity_x = 0.0; }
    if (abs(state.camera.velocity_y) < 0.1) { state.camera.velocity_y = 0.0; }
}

fn screen_to_world(screen_x: f32, screen_y: f32, viewport_width: f32, viewport_height: f32) -> vec2<f32> {
    // Convert screen coordinates to world coordinates
    let ndc_x = (screen_x / viewport_width) * 2.0 - 1.0;
    let ndc_y = 1.0 - (screen_y / viewport_height) * 2.0;
    
    let world_x = state.camera.x + (ndc_x * viewport_width / 2.0) / state.camera.zoom;
    let world_y = state.camera.y + (ndc_y * viewport_height / 2.0) / state.camera.zoom;
    
    return vec2<f32>(world_x, world_y);
}

fn world_to_screen(world_x: f32, world_y: f32, viewport_width: f32, viewport_height: f32) -> vec2<f32> {
    let rel_x = (world_x - state.camera.x) * state.camera.zoom;
    let rel_y = (world_y - state.camera.y) * state.camera.zoom;
    
    let ndc_x = rel_x / (viewport_width / 2.0);
    let ndc_y = rel_y / (viewport_height / 2.0);
    
    let screen_x = (ndc_x + 1.0) * viewport_width / 2.0;
    let screen_y = (1.0 - ndc_y) * viewport_height / 2.0;
    
    return vec2<f32>(screen_x, screen_y);
}

// ----------------------------------------------------------------------------
// CARD OPERATIONS
// ----------------------------------------------------------------------------

fn create_card(x: f32, y: f32, width: f32, height: f32, title: ptr<function, array<u32, 64>>, title_len: u32) -> u32 {
    if (state.card_count >= MAX_CARDS) {
        return 0xFFFFFFFFu; // Max cards reached
    }
    
    let index = state.card_count;
    state.card_count = state.card_count + 1u;
    
    // Allocate space for title
    let title_offset = content.next_offset;
    for (var i = 0u; i < title_len; i = i + 1u) {
        content.data[title_offset + i] = (*title)[i];
    }
    content.next_offset = content.next_offset + title_len;
    
    // Initialize card
    state.cards[index].x = x;
    state.cards[index].y = y;
    state.cards[index].width = width;
    state.cards[index].height = height;
    state.cards[index].content_offset = content.next_offset; // Empty content for now
    state.cards[index].content_length = 0u;
    state.cards[index].color = 0xFF334455u; // Dark blue-gray
    state.cards[index].flags = 0u;
    state.cards[index].title_offset = title_offset;
    state.cards[index].title_length = title_len;
    
    return index;
}

fn set_card_content(card_index: u32, text: ptr<function, array<u32, 4096>>, length: u32) {
    if (card_index >= state.card_count) { return; }
    
    // Allocate content space
    let offset = content.next_offset;
    let copy_len = min(length, 4096u);
    
    for (var i = 0u; i < copy_len; i = i + 1u) {
        content.data[offset + i] = (*text)[i];
    }
    
    state.cards[card_index].content_offset = offset;
    state.cards[card_index].content_length = copy_len;
    content.next_offset = content.next_offset + copy_len;
}

fn point_in_card(card_index: u32, world_x: f32, world_y: f32) -> bool {
    let card = state.cards[card_index];
    return world_x >= card.x && 
           world_x <= card.x + card.width &&
           world_y >= card.y && 
           world_y <= card.y + card.height;
}

fn find_card_at_position(world_x: f32, world_y: f32) -> u32 {
    // Search from top card down
    for (var i = 0u; i < state.card_count; i = i + 1u) {
        let index = state.card_count - 1u - i; // Reverse order (top first)
        if (point_in_card(index, world_x, world_y)) {
            return index;
        }
    }
    return 0xFFFFFFFFu; // No card found
}

fn bring_card_to_front(card_index: u32) {
    if (card_index >= state.card_count || card_index == state.card_count - 1u) {
        return; // Already at front or invalid
    }
    
    // Swap with last card (bring to front)
    let temp = state.cards[card_index];
    state.cards[card_index] = state.cards[state.card_count - 1u];
    state.cards[state.card_count - 1u] = temp;
}

// ----------------------------------------------------------------------------
// INPUT HANDLING
// ----------------------------------------------------------------------------

fn handle_mouse_move(screen_x: f32, screen_y: f32, viewport_width: f32, viewport_height: f32) {
    state.mouse_screen_x = screen_x;
    state.mouse_screen_y = screen_y;
    
    let world_pos = screen_to_world(screen_x, screen_y, viewport_width, viewport_height);
    state.mouse_world_x = world_pos.x;
    state.mouse_world_y = world_pos.y;
    
    // Update hovered card
    state.hovered_card = find_card_at_position(world_pos.x, world_pos.y);
    
    // Handle card dragging
    if (state.dragging_card != 0xFFFFFFFFu) {
        state.cards[state.dragging_card].x = world_pos.x - state.drag_offset_x;
        state.cards[state.dragging_card].y = world_pos.y - state.drag_offset_y;
    }
}

fn handle_mouse_down(button: u32) {
    if (button == 0u) { // Left click
        if (state.hovered_card != 0xFFFFFFFFu) {
            // Start dragging card
            state.dragging_card = state.hovered_card;
            state.selected_card = state.hovered_card;
            bring_card_to_front(state.hovered_card);
            
            let card = state.cards[state.hovered_card];
            state.drag_offset_x = state.mouse_world_x - card.x;
            state.drag_offset_y = state.mouse_world_y - card.y;
        } else {
            // Clicked empty space - deselect
            state.selected_card = 0xFFFFFFFFu;
        }
    }
}

fn handle_mouse_up(button: u32) {
    if (button == 0u) { // Left click
        state.dragging_card = 0xFFFFFFFFu;
    }
}

fn handle_keyboard(key: u32, modifiers: u32) {
    // WASD or Arrow keys for panning
    switch (key) {
        case 87u, 38u: { // W or Up
            state.camera.velocity_y = state.camera.velocity_y - PAN_SPEED / state.camera.zoom;
        }
        case 83u, 40u: { // S or Down
            state.camera.velocity_y = state.camera.velocity_y + PAN_SPEED / state.camera.zoom;
        }
        case 65u, 37u: { // A or Left
            state.camera.velocity_x = state.camera.velocity_x - PAN_SPEED / state.camera.zoom;
        }
        case 68u, 39u: { // D or Right
            state.camera.velocity_x = state.camera.velocity_x + PAN_SPEED / state.camera.zoom;
        }
        case 187u, 61u: { // + or =
            state.camera.target_zoom = state.camera.target_zoom * 1.2;
        }
        case 189u, 173u: { // - or _
            state.camera.target_zoom = state.camera.target_zoom / 1.2;
        }
        case 48u: { // 0 - Reset zoom
            state.camera.target_zoom = 1.0;
            state.camera.velocity_x = 0.0;
            state.camera.velocity_y = 0.0;
        }
        case 71u: { // G - Toggle grid
            state.grid_visible = 1u - state.grid_visible;
        }
        case 78u: { // N - New card
            if ((modifiers & 1u) != 0u) { // Ctrl+N
                var title: array<u32, 64>;
                title[0] = 78u; title[1] = 101u; title[2] = 119u; // "New Card"
                title[3] = 32u; title[4] = 67u; title[5] = 97u;
                title[6] = 114u; title[7] = 100u;
                create_card(state.camera.x, state.camera.y, 400.0, 300.0, &title, 8u);
            }
        }
        default: {}
    }
}

fn handle_scroll(delta_y: f32) {
    // Zoom in/out with scroll wheel
    if (delta_y < 0.0) {
        state.camera.target_zoom = state.camera.target_zoom * 1.1;
    } else if (delta_y > 0.0) {
        state.camera.target_zoom = state.camera.target_zoom / 1.1;
    }
}

// ----------------------------------------------------------------------------
// EVENT PROCESSING
// ----------------------------------------------------------------------------

fn process_events() {
    let event_type = events[0];
    
    if (event_type == 0u) { return; }
    
    switch (event_type) {
        case 1u: { // Mouse move
            let x = bitcast<f32>(events[1]);
            let y = bitcast<f32>(events[2]);
            let vw = bitcast<f32>(events[3]);
            let vh = bitcast<f32>(events[4]);
            handle_mouse_move(x, y, vw, vh);
        }
        case 2u: { // Mouse button
            let button = events[1];
            let down = events[2];
            if (down == 1u) {
                handle_mouse_down(button);
            } else {
                handle_mouse_up(button);
            }
        }
        case 3u: { // Keyboard
            let key = events[1];
            let modifiers = events[2];
            handle_keyboard(key, modifiers);
        }
        case 4u: { // Scroll
            let delta_y = bitcast<f32>(events[1]);
            handle_scroll(delta_y);
        }
        default: {}
    }
    
    // Clear event
    events[0] = 0u;
}

// ----------------------------------------------------------------------------
// INITIALIZATION
// ----------------------------------------------------------------------------

fn init_map() {
    init_camera();
    
    state.card_count = 0u;
    state.selected_card = 0xFFFFFFFFu;
    state.hovered_card = 0xFFFFFFFFu;
    state.dragging_card = 0xFFFFFFFFu;
    state.grid_visible = 1u;
    
    content.next_offset = 0u;
    
    // Create welcome card
    var title: array<u32, 64>;
    title[0] = 87u; title[1] = 101u; title[2] = 108u; // "Welcome to GVPIE"
    title[3] = 99u; title[4] = 111u; title[5] = 109u;
    title[6] = 101u; title[7] = 32u; title[8] = 116u;
    title[9] = 111u; title[10] = 32u; title[11] = 71u;
    title[12] = 86u; title[13] = 80u; title[14] = 73u;
    title[15] = 69u;
    
    let card_id = create_card(-200.0, -150.0, 400.0, 300.0, &title, 16u);
    
    // Add some content
    var text: array<u32, 4096>;
    text[0] = 84u; text[1] = 104u; text[2] = 105u; text[3] = 115u; // "This is the infinite map."
    text[4] = 32u; text[5] = 105u; text[6] = 115u; text[7] = 32u;
    text[8] = 116u; text[9] = 104u; text[10] = 101u; text[11] = 32u;
    text[12] = 105u; text[13] = 110u; text[14] = 102u; text[15] = 105u;
    text[16] = 110u; text[17] = 105u; text[18] = 116u; text[19] = 101u;
    text[20] = 32u; text[21] = 109u; text[22] = 97u; text[23] = 112u;
    text[24] = 46u;
    set_card_content(card_id, &text, 25u);
}

// ----------------------------------------------------------------------------
// COMPUTE SHADER ENTRY POINT
// ----------------------------------------------------------------------------

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    if (gid.x != 0u) { return; }
    
    // Initialize on first run
    if (state.card_count == 0u && content.next_offset == 0u) {
        init_map();
    }
    
    // Process input events
    process_events();
    
    // Update camera (assume 60fps = 0.016s delta for now)
    update_camera(0.016);
}
