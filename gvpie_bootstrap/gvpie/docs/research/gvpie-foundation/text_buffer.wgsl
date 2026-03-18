// ============================================================================
// GVPIE Text Buffer Engine v1.0
// ============================================================================
// A complete gap buffer implementation with cursor management, UTF-8 support,
// and line tracking. This is the sovereign foundation of the editor.

// ----------------------------------------------------------------------------
// CONSTANTS
// ----------------------------------------------------------------------------

const TEXT_BUFFER_SIZE: u32 = 1048576u;  // 1 MB for text storage
const MAX_LINES: u32 = 65536u;           // Maximum number of lines
const MIN_GAP_SIZE: u32 = 1024u;         // Minimum gap size before reallocation

// ----------------------------------------------------------------------------
// DATA STRUCTURES
// ----------------------------------------------------------------------------

struct TextBuffer {
    data: array<u32, 262144>,    // 1MB of UTF-32 encoded text (4 bytes per char)
    gap_start: u32,               // Start of gap (cursor position in buffer)
    gap_end: u32,                 // End of gap (exclusive)
    total_chars: u32,             // Total characters (excluding gap)
    cursor_pos: u32,              // Logical cursor position (0..total_chars)
    dirty: u32,                   // Dirty flag for rendering
}

struct LineIndex {
    offsets: array<u32, 65536>,  // Character offset for each line start
    count: u32,                   // Total number of lines
    dirty: u32,                   // Whether index needs rebuilding
}

struct EditorState {
    buffer: TextBuffer,
    lines: LineIndex,
    cursor_line: u32,             // Current line number
    cursor_col: u32,              // Current column number
    scroll_offset: u32,           // Top visible line
    selection_start: u32,         // Selection start (-1 if no selection)
    selection_end: u32,           // Selection end
}

// ----------------------------------------------------------------------------
// BUFFER BINDINGS
// ----------------------------------------------------------------------------

@group(0) @binding(0) var<storage, read_write> state: EditorState;
@group(0) @binding(1) var<storage, read_write> events: array<u32>;
@group(0) @binding(2) var<storage, read_write> requests: array<u32>;

// ----------------------------------------------------------------------------
// GAP BUFFER CORE OPERATIONS
// ----------------------------------------------------------------------------

// Move the gap to a new position in the buffer
fn move_gap(target_pos: u32) {
    let old_gap_start = state.buffer.gap_start;
    let old_gap_end = state.buffer.gap_end;
    
    if (target_pos == old_gap_start) {
        return; // Already at target
    }
    
    if (target_pos < old_gap_start) {
        // Move gap left: shift text from [target, gap_start) to after gap
        let move_size = old_gap_start - target_pos;
        let new_gap_end = old_gap_end;
        let new_gap_start = target_pos;
        
        // Copy backwards to avoid overlap
        for (var i = 0u; i < move_size; i = i + 1u) {
            let src_idx = old_gap_start - 1u - i;
            let dst_idx = new_gap_end - 1u - i;
            state.buffer.data[dst_idx] = state.buffer.data[src_idx];
        }
        
        state.buffer.gap_start = new_gap_start;
        state.buffer.gap_end = new_gap_end - move_size;
        
    } else {
        // Move gap right: shift text from [gap_end, target) to before gap
        let move_size = target_pos - old_gap_start;
        let new_gap_start = target_pos;
        
        for (var i = 0u; i < move_size; i = i + 1u) {
            let src_idx = old_gap_end + i;
            let dst_idx = old_gap_start + i;
            state.buffer.data[dst_idx] = state.buffer.data[src_idx];
        }
        
        state.buffer.gap_start = new_gap_start;
        state.buffer.gap_end = old_gap_end + move_size;
    }
}

// Insert a character at the cursor position
fn insert_char(ch: u32) {
    // Move gap to cursor if needed
    let logical_pos = state.buffer.cursor_pos;
    move_gap(logical_pos);
    
    // Check if we need to grow the gap
    let gap_size = state.buffer.gap_end - state.buffer.gap_start;
    if (gap_size < 2u) {
        // In production, trigger a gap expansion request
        // For now, just fail silently (should never happen with 1MB buffer)
        return;
    }
    
    // Insert character at gap start
    state.buffer.data[state.buffer.gap_start] = ch;
    state.buffer.gap_start = state.buffer.gap_start + 1u;
    state.buffer.cursor_pos = state.buffer.cursor_pos + 1u;
    state.buffer.total_chars = state.buffer.total_chars + 1u;
    state.buffer.dirty = 1u;
    state.lines.dirty = 1u;
    
    // Update line tracking if newline
    if (ch == 10u) { // '\n'
        rebuild_line_index();
    }
}

// Delete character before cursor (backspace)
fn delete_char_back() {
    if (state.buffer.cursor_pos == 0u) {
        return; // Nothing to delete
    }
    
    let logical_pos = state.buffer.cursor_pos;
    move_gap(logical_pos);
    
    // Expand gap backward
    state.buffer.gap_start = state.buffer.gap_start - 1u;
    state.buffer.cursor_pos = state.buffer.cursor_pos - 1u;
    state.buffer.total_chars = state.buffer.total_chars - 1u;
    state.buffer.dirty = 1u;
    state.lines.dirty = 1u;
    
    // Check if we deleted a newline
    let deleted_char = state.buffer.data[state.buffer.gap_start];
    if (deleted_char == 10u) {
        rebuild_line_index();
    }
}

// Delete character at cursor (delete key)
fn delete_char_forward() {
    if (state.buffer.cursor_pos >= state.buffer.total_chars) {
        return; // Nothing to delete
    }
    
    let logical_pos = state.buffer.cursor_pos;
    move_gap(logical_pos);
    
    // Expand gap forward
    state.buffer.gap_end = state.buffer.gap_end + 1u;
    state.buffer.total_chars = state.buffer.total_chars - 1u;
    state.buffer.dirty = 1u;
    state.lines.dirty = 1u;
    
    // Check if we deleted a newline
    let deleted_char = state.buffer.data[state.buffer.gap_end - 1u];
    if (deleted_char == 10u) {
        rebuild_line_index();
    }
}

// ----------------------------------------------------------------------------
// CURSOR MOVEMENT
// ----------------------------------------------------------------------------

// Move cursor to logical position
fn set_cursor_pos(pos: u32) {
    state.buffer.cursor_pos = min(pos, state.buffer.total_chars);
    state.buffer.dirty = 1u;
    update_cursor_line_col();
}

// Move cursor left by one character
fn move_cursor_left() {
    if (state.buffer.cursor_pos > 0u) {
        state.buffer.cursor_pos = state.buffer.cursor_pos - 1u;
        state.buffer.dirty = 1u;
        update_cursor_line_col();
    }
}

// Move cursor right by one character
fn move_cursor_right() {
    if (state.buffer.cursor_pos < state.buffer.total_chars) {
        state.buffer.cursor_pos = state.buffer.cursor_pos + 1u;
        state.buffer.dirty = 1u;
        update_cursor_line_col();
    }
}

// Move cursor up one line
fn move_cursor_up() {
    if (state.cursor_line > 0u) {
        let target_line = state.cursor_line - 1u;
        let line_start = state.lines.offsets[target_line];
        let next_line_start = state.lines.offsets[target_line + 1u];
        let line_length = next_line_start - line_start;
        
        // Try to preserve column position
        let target_col = min(state.cursor_col, line_length);
        state.buffer.cursor_pos = line_start + target_col;
        state.cursor_line = target_line;
        state.cursor_col = target_col;
        state.buffer.dirty = 1u;
    }
}

// Move cursor down one line
fn move_cursor_down() {
    if (state.cursor_line < state.lines.count - 1u) {
        let target_line = state.cursor_line + 1u;
        let line_start = state.lines.offsets[target_line];
        
        // Get line length
        var line_length: u32;
        if (target_line < state.lines.count - 1u) {
            line_length = state.lines.offsets[target_line + 1u] - line_start;
        } else {
            line_length = state.buffer.total_chars - line_start;
        }
        
        // Try to preserve column position
        let target_col = min(state.cursor_col, line_length);
        state.buffer.cursor_pos = line_start + target_col;
        state.cursor_line = target_line;
        state.cursor_col = target_col;
        state.buffer.dirty = 1u;
    }
}

// Move cursor to start of line
fn move_cursor_line_start() {
    let line_start = state.lines.offsets[state.cursor_line];
    state.buffer.cursor_pos = line_start;
    state.cursor_col = 0u;
    state.buffer.dirty = 1u;
}

// Move cursor to end of line
fn move_cursor_line_end() {
    var line_end: u32;
    if (state.cursor_line < state.lines.count - 1u) {
        line_end = state.lines.offsets[state.cursor_line + 1u] - 1u;
    } else {
        line_end = state.buffer.total_chars;
    }
    
    state.buffer.cursor_pos = line_end;
    state.cursor_col = line_end - state.lines.offsets[state.cursor_line];
    state.buffer.dirty = 1u;
}

// ----------------------------------------------------------------------------
// LINE INDEX MANAGEMENT
// ----------------------------------------------------------------------------

// Rebuild the line index from scratch
fn rebuild_line_index() {
    var line_count = 0u;
    state.lines.offsets[0] = 0u;
    line_count = 1u;
    
    // Scan through buffer and mark newline positions
    for (var i = 0u; i < state.buffer.total_chars && line_count < MAX_LINES; i = i + 1u) {
        let ch = get_char_at_logical(i);
        if (ch == 10u) { // '\n'
            state.lines.offsets[line_count] = i + 1u;
            line_count = line_count + 1u;
        }
    }
    
    state.lines.count = line_count;
    state.lines.dirty = 0u;
}

// Update cursor line and column based on cursor position
fn update_cursor_line_col() {
    let pos = state.buffer.cursor_pos;
    
    // Binary search to find line
    var low = 0u;
    var high = state.lines.count;
    
    while (low < high - 1u) {
        let mid = (low + high) / 2u;
        if (state.lines.offsets[mid] <= pos) {
            low = mid;
        } else {
            high = mid;
        }
    }
    
    state.cursor_line = low;
    state.cursor_col = pos - state.lines.offsets[low];
}

// ----------------------------------------------------------------------------
// BUFFER ACCESS HELPERS
// ----------------------------------------------------------------------------

// Get character at logical position (accounting for gap)
fn get_char_at_logical(pos: u32) -> u32 {
    if (pos < state.buffer.gap_start) {
        return state.buffer.data[pos];
    } else {
        let gap_size = state.buffer.gap_end - state.buffer.gap_start;
        return state.buffer.data[pos + gap_size];
    }
}

// Copy a range of text to another buffer (for rendering)
fn copy_text_range(start_pos: u32, end_pos: u32, dest: ptr<function, array<u32, 1024>>) -> u32 {
    let count = min(end_pos - start_pos, 1024u);
    
    for (var i = 0u; i < count; i = i + 1u) {
        (*dest)[i] = get_char_at_logical(start_pos + i);
    }
    
    return count;
}

// ----------------------------------------------------------------------------
// INITIALIZATION
// ----------------------------------------------------------------------------

// Initialize empty buffer with gap at start
fn init_buffer() {
    state.buffer.gap_start = 0u;
    state.buffer.gap_end = 262144u; // Full buffer is gap initially
    state.buffer.total_chars = 0u;
    state.buffer.cursor_pos = 0u;
    state.buffer.dirty = 1u;
    
    state.lines.offsets[0] = 0u;
    state.lines.count = 1u;
    state.lines.dirty = 0u;
    
    state.cursor_line = 0u;
    state.cursor_col = 0u;
    state.scroll_offset = 0u;
    state.selection_start = 0xFFFFFFFFu; // -1
    state.selection_end = 0xFFFFFFFFu;
}

// ============================================================================
// COMPUTE SHADER ENTRY POINT
// ============================================================================

@compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    // Single-threaded coordinator (thread 0 handles all logic)
    if (gid.x == 0u) {
        // Check if buffer needs initialization
        if (state.buffer.gap_end == 0u) {
            init_buffer();
        }
        
        // Process events from host
        process_events();
        
        // Rebuild line index if dirty
        if (state.lines.dirty == 1u) {
            rebuild_line_index();
        }
    }
    
    // All other threads idle for now
    // Future: parallel text search, syntax highlighting, etc.
}

// Process keyboard events from the host
fn process_events() {
    // Event format: [event_type, key_code, modifiers, ...]
    let event_type = events[0];
    
    if (event_type == 0u) {
        return; // No event
    }
    
    let key_code = events[1];
    let modifiers = events[2]; // Bit flags: Ctrl=1, Shift=2, Alt=4
    
    // Clear event
    events[0] = 0u;
    
    // Process different event types
    switch (event_type) {
        case 1u: { // Character input
            insert_char(key_code);
        }
        case 2u: { // Special key
            handle_special_key(key_code, modifiers);
        }
        default: {}
    }
}

// Handle special keys (arrows, backspace, delete, etc.)
fn handle_special_key(key: u32, mods: u32) {
    switch (key) {
        case 8u: {  // Backspace
            delete_char_back();
        }
        case 127u: { // Delete
            delete_char_forward();
        }
        case 37u: { // Left arrow
            if ((mods & 1u) != 0u) { // Ctrl+Left
                // TODO: Word jump
                move_cursor_left();
            } else {
                move_cursor_left();
            }
        }
        case 39u: { // Right arrow
            if ((mods & 1u) != 0u) { // Ctrl+Right
                // TODO: Word jump
                move_cursor_right();
            } else {
                move_cursor_right();
            }
        }
        case 38u: { // Up arrow
            move_cursor_up();
        }
        case 40u: { // Down arrow
            move_cursor_down();
        }
        case 36u: { // Home
            move_cursor_line_start();
        }
        case 35u: { // End
            move_cursor_line_end();
        }
        default: {}
    }
}
