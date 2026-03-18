// ============================================================================
// EXAMPLE EXTENSION: Word Jumping
// ============================================================================
// This file demonstrates how to add new features to GVPIE by extending the
// WGSL shaders. Copy these functions into your editor_compute.wgsl.

// ----------------------------------------------------------------------------
// WORD BOUNDARY DETECTION
// ----------------------------------------------------------------------------

// Determine if a character is a word boundary
fn is_word_char(ch: u32) -> bool {
    // Alphanumeric or underscore
    return (ch >= 48u && ch <= 57u) ||   // 0-9
           (ch >= 65u && ch <= 90u) ||   // A-Z
           (ch >= 97u && ch <= 122u) ||  // a-z
           (ch == 95u);                  // _
}

fn is_whitespace(ch: u32) -> bool {
    return ch == 32u ||   // Space
           ch == 9u ||    // Tab
           ch == 10u ||   // Newline
           ch == 13u;     // Carriage return
}

// ----------------------------------------------------------------------------
// WORD JUMPING IMPLEMENTATION
// ----------------------------------------------------------------------------

// Jump cursor forward to next word start
fn move_cursor_word_forward() {
    let total = state.buffer.total_chars;
    if (state.buffer.cursor_pos >= total) {
        return; // At end of buffer
    }
    
    var pos = state.buffer.cursor_pos;
    
    // Skip current word
    while (pos < total && is_word_char(get_char_at_logical(pos))) {
        pos = pos + 1u;
    }
    
    // Skip whitespace
    while (pos < total && is_whitespace(get_char_at_logical(pos))) {
        pos = pos + 1u;
    }
    
    // Now at start of next word or punctuation
    set_cursor_pos(pos);
}

// Jump cursor backward to previous word start
fn move_cursor_word_backward() {
    if (state.buffer.cursor_pos == 0u) {
        return; // At start of buffer
    }
    
    var pos = state.buffer.cursor_pos;
    
    // Move back one character to start
    pos = pos - 1u;
    
    // Skip whitespace
    while (pos > 0u && is_whitespace(get_char_at_logical(pos))) {
        pos = pos - 1u;
    }
    
    // Skip word characters to find word start
    while (pos > 0u && is_word_char(get_char_at_logical(pos))) {
        pos = pos - 1u;
    }
    
    // If we stopped on non-word char, advance one
    if (pos > 0u || !is_word_char(get_char_at_logical(pos))) {
        if (!is_word_char(get_char_at_logical(pos))) {
            pos = pos + 1u;
        }
    }
    
    set_cursor_pos(pos);
}

// ----------------------------------------------------------------------------
// DELETE WORD OPERATIONS
// ----------------------------------------------------------------------------

// Delete from cursor to end of word (Ctrl+Delete)
fn delete_word_forward() {
    let start_pos = state.buffer.cursor_pos;
    let total = state.buffer.total_chars;
    
    if (start_pos >= total) {
        return;
    }
    
    var end_pos = start_pos;
    
    // Skip current word
    while (end_pos < total && is_word_char(get_char_at_logical(end_pos))) {
        end_pos = end_pos + 1u;
    }
    
    // Skip trailing whitespace
    while (end_pos < total && is_whitespace(get_char_at_logical(end_pos))) {
        end_pos = end_pos + 1u;
    }
    
    // Delete characters
    let delete_count = end_pos - start_pos;
    for (var i = 0u; i < delete_count; i = i + 1u) {
        delete_char_forward();
    }
}

// Delete from cursor to start of word (Ctrl+Backspace)
fn delete_word_backward() {
    let end_pos = state.buffer.cursor_pos;
    
    if (end_pos == 0u) {
        return;
    }
    
    var start_pos = end_pos;
    
    // Move back one
    start_pos = start_pos - 1u;
    
    // Skip whitespace
    while (start_pos > 0u && is_whitespace(get_char_at_logical(start_pos))) {
        start_pos = start_pos - 1u;
    }
    
    // Skip word characters
    while (start_pos > 0u && is_word_char(get_char_at_logical(start_pos))) {
        start_pos = start_pos - 1u;
    }
    
    // Adjust if we stopped on non-word char
    if (start_pos > 0u || !is_word_char(get_char_at_logical(start_pos))) {
        if (!is_word_char(get_char_at_logical(start_pos))) {
            start_pos = start_pos + 1u;
        }
    }
    
    // Delete characters
    let delete_count = end_pos - start_pos;
    for (var i = 0u; i < delete_count; i = i + 1u) {
        delete_char_back();
    }
}

// ----------------------------------------------------------------------------
// KEYBINDING UPDATES
// ----------------------------------------------------------------------------

// Add to your handle_special_key function:
fn handle_special_key(key: u32, mods: u32) {
    switch (key) {
        case 37u: { // Left arrow
            if ((mods & 1u) != 0u) { // Ctrl held
                move_cursor_word_backward();
            } else {
                move_cursor_left();
            }
        }
        case 39u: { // Right arrow
            if ((mods & 1u) != 0u) { // Ctrl held
                move_cursor_word_forward();
            } else {
                move_cursor_right();
            }
        }
        case 8u: {  // Backspace
            if ((mods & 1u) != 0u) { // Ctrl held
                delete_word_backward();
            } else {
                delete_char_back();
            }
        }
        case 127u: { // Delete
            if ((mods & 1u) != 0u) { // Ctrl held
                delete_word_forward();
            } else {
                delete_char_forward();
            }
        }
        // ... rest of your cases
        default: {}
    }
}

// ----------------------------------------------------------------------------
// TESTING & VALIDATION
// ----------------------------------------------------------------------------

// Test cases to verify word jumping works correctly:
//
// Input: "hello world test"
// Cursor at 0, Ctrl+Right -> Cursor at 5 (start of "world")
// Cursor at 5, Ctrl+Right -> Cursor at 11 (start of "test")
//
// Input: "hello    world" (multiple spaces)
// Cursor at 0, Ctrl+Right -> Cursor at 9 (start of "world")
//
// Input: "hello_world_test"
// Cursor at 0, Ctrl+Right -> Cursor at 16 (underscores are word chars)
//
// Input: "hello.world"
// Cursor at 0, Ctrl+Right -> Cursor at 5 (dot is boundary)

// ----------------------------------------------------------------------------
// PERFORMANCE NOTES
// ----------------------------------------------------------------------------

// Word jumping is O(n) where n is the distance to next word boundary.
// For typical use (words are ~5-10 chars), this is effectively O(1).
// No parallelism is used here, but could be added for longer operations.

// Future optimization: Build a word index similar to line index
// - Store word boundaries in a buffer
// - Binary search for next/previous word
// - Rebuild incrementally on edits

// ----------------------------------------------------------------------------
// DEVELOPMENT PATTERNS
// ----------------------------------------------------------------------------

// This example demonstrates key GVPIE development patterns:
//
// 1. **Character Classification**: is_word_char, is_whitespace
//    - Pure functions that make logic clear
//    - Easy to extend for different languages
//
// 2. **Buffer Iteration**: while loops with get_char_at_logical
//    - Gap buffer abstraction hides complexity
//    - Same pattern for forward/backward operations
//
// 3. **Cursor Manipulation**: set_cursor_pos at end
//    - Modify temporary variable during calculation
//    - Single atomic update to actual cursor
//
// 4. **Keybinding Integration**: Check modifiers in switch
//    - Ctrl = 1, Shift = 2, Alt = 4
//    - Combine with bitwise AND
//
// 5. **Incremental Enhancement**: Functions compose
//    - delete_word_forward calls delete_char_forward
//    - Reuse existing primitives
//
// Use these patterns when adding your own features!

// ============================================================================
// NEXT STEPS
// ============================================================================

// 1. Copy these functions into editor_compute.wgsl
// 2. Update handle_special_key to include Ctrl+Arrow keybindings
// 3. Test with: cargo run --release
// 4. Try Ctrl+Left/Right to jump between words
//
// Once working, extend with:
// - Paragraph jumping (Ctrl+Up/Down)
// - Sentence jumping (Alt+Left/Right)
// - Camel case word jumping (moveThisWay)
// - Language-specific boundaries (Rust :: operator, etc.)

// ============================================================================
// CONTRIBUTING BACK
// ============================================================================

// If you make improvements:
// 1. Test thoroughly with various edge cases
// 2. Document your changes
// 3. Submit a PR with updated shaders
// 4. Remember: The bootstrap stays frozen, shaders evolve
