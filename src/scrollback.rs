// scrollback.rs -- Terminal scrollback ring buffer for Geometry OS
// Stores past terminal output lines so PageUp/PageDown can scroll through history.
// Supports configurable capacity, search, line deletion, and memory efficiency tracking.

/// Canvas dimensions (must match render.rs SCROLLBACK_COLS/SCROLLBACK_VISIBLE_ROWS).
pub const SCROLLBACK_COLS: usize = 32;
pub const SCROLLBACK_VISIBLE_ROWS: usize = 32;

/// Default scrollback capacity (lines stored in the ring buffer).
pub const DEFAULT_SCROLLBACK_CAPACITY: usize = 1000;

/// Maximum allowed scrollback capacity (hard upper bound).
pub const MAX_SCROLLBACK_CAPACITY: usize = 100_000;

/// A ring buffer of terminal output lines for scrollback navigation.
/// Each line is SCROLLBACK_COLS u32 values (matching canvas_buffer format).
///
/// The buffer uses a configurable capacity (default 1000, max 100_000).
/// When the buffer is full, the oldest line is overwritten (ring buffer behavior).
pub struct ScrollbackBuffer {
    /// Ring buffer of lines. lines[slot][0..SCROLLBACK_COLS] = one row of output.
    lines: Vec<[u32; SCROLLBACK_COLS]>,
    /// Total number of lines ever written (may exceed capacity).
    total_written: usize,
    /// Index of the oldest line in the ring buffer.
    oldest: usize,
    /// Number of valid lines currently in the buffer (min(total_written, capacity)).
    count: usize,
    /// Maximum capacity (configurable, clamped to MAX_SCROLLBACK_CAPACITY).
    capacity: usize,
}

impl ScrollbackBuffer {
    /// Create a new scrollback buffer with default capacity (1000 lines).
    pub fn new() -> Self {
        Self::with_capacity(DEFAULT_SCROLLBACK_CAPACITY)
    }

    /// Create a new scrollback buffer with the given capacity.
    /// Capacity is clamped to [1, MAX_SCROLLBACK_CAPACITY].
    pub fn with_capacity(capacity: usize) -> Self {
        let capacity = capacity.clamp(1, MAX_SCROLLBACK_CAPACITY);
        let mut lines = Vec::with_capacity(capacity);
        for _ in 0..capacity {
            lines.push([0u32; SCROLLBACK_COLS]);
        }
        ScrollbackBuffer {
            lines,
            total_written: 0,
            oldest: 0,
            count: 0,
            capacity,
        }
    }

    /// Current maximum capacity of the buffer.
    pub fn capacity(&self) -> usize {
        self.capacity
    }

    /// Resize the buffer to a new capacity.
    /// If shrinking, oldest lines are discarded. If growing, buffer expands.
    /// Returns the number of lines discarded (if any).
    pub fn resize(&mut self, new_capacity: usize) -> usize {
        let new_capacity = new_capacity.clamp(1, MAX_SCROLLBACK_CAPACITY);
        if new_capacity == self.capacity {
            return 0;
        }

        let mut discarded = 0;
        if new_capacity < self.capacity {
            // Shrinking: discard oldest lines if count > new_capacity
            discarded = if self.count > new_capacity {
                self.count - new_capacity
            } else {
                0
            };
            // Update oldest to skip discarded entries
            self.oldest = (self.oldest + discarded) % self.capacity;
            self.count = self.count.saturating_sub(discarded);
            self.total_written = self.total_written.saturating_sub(discarded);
            // Compact: copy surviving entries to start of Vec in order
            // This handles the case where entries wrap around the end of the Vec
            let mut compacted = Vec::with_capacity(new_capacity);
            for i in 0..self.count {
                let idx = (self.oldest + i) % self.capacity;
                compacted.push(self.lines[idx]);
            }
            self.lines = compacted;
            self.oldest = 0;
        } else {
            // Growing: expand with zero-filled lines
            for _ in self.capacity..new_capacity {
                self.lines.push([0u32; SCROLLBACK_COLS]);
            }
        }

        self.capacity = new_capacity;
        discarded
    }

    /// Push a single line into the ring buffer.
    /// `line` is SCROLLBACK_COLS u32 values from the canvas buffer.
    pub fn push_line(&mut self, line: &[u32]) {
        let idx = (self.oldest + self.count) % self.capacity;
        let dest = &mut self.lines[idx];
        dest.copy_from_slice(&line[..SCROLLBACK_COLS]);
        if self.count < self.capacity {
            self.count += 1;
        } else {
            self.oldest = (self.oldest + 1) % self.capacity;
        }
        self.total_written += 1;
    }

    /// Push all non-empty rows from a canvas buffer section [start_row..end_row).
    /// Empty rows (all zeros) are skipped.
    pub fn push_canvas_rows(&mut self, canvas_buffer: &[u32], start_row: usize, end_row: usize) {
        let max_row = canvas_buffer.len() / SCROLLBACK_COLS;
        let end_row = end_row.min(max_row);
        for row in start_row..end_row {
            let offset = row * SCROLLBACK_COLS;
            // Check if row has any non-zero content
            let mut has_content = false;
            for col in 0..SCROLLBACK_COLS {
                if canvas_buffer[offset + col] != 0 {
                    has_content = true;
                    break;
                }
            }
            if has_content {
                let mut line = [0u32; SCROLLBACK_COLS];
                line.copy_from_slice(&canvas_buffer[offset..offset + SCROLLBACK_COLS]);
                self.push_line(&line);
            }
        }
    }

    /// Number of valid lines in the buffer.
    pub fn len(&self) -> usize {
        self.count
    }

    /// Total lines ever written (for debugging).
    pub fn total_written(&self) -> usize {
        self.total_written
    }

    /// Lines discarded due to ring buffer overflow.
    pub fn lines_discarded(&self) -> usize {
        self.total_written.saturating_sub(self.count)
    }

    /// Get a line by absolute index (0 = oldest line in buffer).
    /// Returns None if index >= count.
    pub fn get_line(&self, index: usize) -> Option<&[u32; SCROLLBACK_COLS]> {
        if index >= self.count {
            return None;
        }
        let idx = (self.oldest + index) % self.capacity;
        Some(&self.lines[idx])
    }

    /// Get a mutable line by absolute index (0 = oldest line in buffer).
    /// Returns None if index >= count.
    pub fn get_line_mut(&mut self, index: usize) -> Option<&mut [u32; SCROLLBACK_COLS]> {
        if index >= self.count {
            return None;
        }
        let idx = (self.oldest + index) % self.capacity;
        Some(&mut self.lines[idx])
    }

    /// Get lines for display at a given scroll position.
    /// Returns up to SCROLLBACK_VISIBLE_ROWS lines starting from `scroll_offset` in the buffer.
    /// The returned slice contains references to the ring buffer entries.
    pub fn get_page(&self, scroll_offset: usize) -> Vec<&[u32; SCROLLBACK_COLS]> {
        let mut result = Vec::with_capacity(SCROLLBACK_VISIBLE_ROWS);
        for i in 0..SCROLLBACK_VISIBLE_ROWS {
            if let Some(line) = self.get_line(scroll_offset + i) {
                result.push(line);
            } else {
                break;
            }
        }
        result
    }

    /// Maximum scroll position (count - visible_rows).
    pub fn max_scroll(&self) -> usize {
        if self.count > SCROLLBACK_VISIBLE_ROWS {
            self.count - SCROLLBACK_VISIBLE_ROWS
        } else {
            0
        }
    }

    /// Check if the buffer is empty.
    pub fn is_empty(&self) -> bool {
        self.count == 0
    }

    /// Delete N lines from the end of the buffer (newest lines first).
    /// Returns the number of lines actually removed.
    pub fn delete_newest(&mut self, n: usize) -> usize {
        let to_remove = n.min(self.count);
        self.count -= to_remove;
        self.total_written = self.total_written.saturating_sub(to_remove);
        to_remove
    }

    /// Delete N lines from the start of the buffer (oldest lines first).
    /// Returns the number of lines actually removed.
    pub fn delete_oldest(&mut self, n: usize) -> usize {
        let to_remove = n.min(self.count);
        self.oldest = (self.oldest + to_remove) % self.capacity;
        self.count -= to_remove;
        self.total_written = self.total_written.saturating_sub(to_remove);
        to_remove
    }

    /// Delete a specific line by index (0 = oldest).
    /// This is O(count) because it shifts subsequent lines.
    /// Returns true if the line was found and removed.
    pub fn delete_line(&mut self, index: usize) -> bool {
        if index >= self.count {
            return false;
        }
        // Shift all lines after `index` one position toward the start
        // by copying them in order from index+1 to the end
        let _target_idx = (self.oldest + index) % self.capacity;
        let mut src = index + 1;
        while src < self.count {
            let src_idx = (self.oldest + src) % self.capacity;
            let dst_idx = (self.oldest + src - 1) % self.capacity;
            let tmp = self.lines[src_idx];
            self.lines[dst_idx] = tmp;
            src += 1;
        }
        self.count -= 1;
        self.total_written = self.total_written.saturating_sub(1);
        true
    }

    /// Clear all lines from the buffer, resetting to empty state.
    /// Capacity is preserved.
    pub fn clear(&mut self) {
        self.count = 0;
        self.total_written = 0;
        self.oldest = 0;
    }

    /// Memory usage in bytes (approximate: count * SCROLLBACK_COLS * 4).
    pub fn memory_usage_bytes(&self) -> usize {
        // Always report full capacity since the Vec is pre-allocated
        self.capacity * SCROLLBACK_COLS * std::mem::size_of::<u32>()
    }

    /// Memory used by actual content (count * line size).
    pub fn content_memory_bytes(&self) -> usize {
        self.count * SCROLLBACK_COLS * std::mem::size_of::<u32>()
    }

    /// Search for a pattern in the scrollback buffer.
    /// `pattern` is a slice of u32 values to search for within each line.
    /// Returns indices of all matching lines (0 = oldest).
    /// `max_results` caps the number of returned results (0 = unlimited).
    pub fn search(&self, pattern: &[u32], max_results: usize) -> Vec<usize> {
        if pattern.is_empty() {
            return Vec::new();
        }
        let mut results = Vec::new();
        let limit = if max_results == 0 {
            usize::MAX
        } else {
            max_results
        };

        for i in 0..self.count {
            if results.len() >= limit {
                break;
            }
            if let Some(line) = self.get_line(i) {
                if line.windows(pattern.len()).any(|w| w == pattern) {
                    results.push(i);
                }
            }
        }
        results
    }

    /// Search for an ASCII substring in the scrollback buffer.
    /// Each u32 in a line is treated as a single ASCII character (low byte).
    /// Returns indices of all matching lines.
    pub fn search_ascii(&self, text: &str, max_results: usize) -> Vec<usize> {
        if text.is_empty() {
            return Vec::new();
        }
        let pattern: Vec<u32> = text.bytes().map(|b| b as u32).collect();
        self.search(&pattern, max_results)
    }

    /// Search backward from a given line index.
    /// Returns the index of the first match at or before `from_index`.
    /// Returns None if no match found.
    pub fn search_backward(&self, pattern: &[u32], from_index: usize) -> Option<usize> {
        if pattern.is_empty() || self.count == 0 {
            return None;
        }
        let start = from_index.min(self.count.saturating_sub(1));
        for i in (0..=start).rev() {
            if let Some(line) = self.get_line(i) {
                if line.windows(pattern.len()).any(|w| w == pattern) {
                    return Some(i);
                }
            }
        }
        None
    }

    /// Search forward from a given line index.
    /// Returns the index of the first match at or after `from_index`.
    /// Returns None if no match found.
    pub fn search_forward(&self, pattern: &[u32], from_index: usize) -> Option<usize> {
        if pattern.is_empty() || self.count == 0 {
            return None;
        }
        let start = from_index.min(self.count.saturating_sub(1));
        for i in start..self.count {
            if let Some(line) = self.get_line(i) {
                if line.windows(pattern.len()).any(|w| w == pattern) {
                    return Some(i);
                }
            }
        }
        None
    }

    /// Trim all trailing empty lines (lines that are all zeros).
    /// Returns the number of lines trimmed.
    pub fn trim_trailing_empty(&mut self) -> usize {
        let mut trimmed = 0;
        while self.count > 0 {
            let last_idx = (self.oldest + self.count - 1) % self.capacity;
            if self.lines[last_idx].iter().all(|&v| v == 0) {
                self.count -= 1;
                self.total_written = self.total_written.saturating_sub(1);
                trimmed += 1;
            } else {
                break;
            }
        }
        trimmed
    }

    /// Trim all leading empty lines (lines that are all zeros).
    /// Returns the number of lines trimmed.
    pub fn trim_leading_empty(&mut self) -> usize {
        let mut trimmed = 0;
        while self.count > 0 {
            if self.lines[self.oldest].iter().all(|&v| v == 0) {
                self.oldest = (self.oldest + 1) % self.capacity;
                self.count -= 1;
                self.total_written = self.total_written.saturating_sub(1);
                trimmed += 1;
            } else {
                break;
            }
        }
        trimmed
    }
}

impl Default for ScrollbackBuffer {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // === Basic operations ===

    #[test]
    fn test_new_default_capacity() {
        let sb = ScrollbackBuffer::new();
        assert_eq!(sb.capacity(), DEFAULT_SCROLLBACK_CAPACITY);
        assert!(sb.is_empty());
        assert_eq!(sb.len(), 0);
    }

    #[test]
    fn test_with_custom_capacity() {
        let sb = ScrollbackBuffer::with_capacity(500);
        assert_eq!(sb.capacity(), 500);
    }

    #[test]
    fn test_with_capacity_clamped_to_max() {
        let sb = ScrollbackBuffer::with_capacity(1_000_000);
        assert_eq!(sb.capacity(), MAX_SCROLLBACK_CAPACITY);
    }

    #[test]
    fn test_with_capacity_clamped_to_min() {
        let sb = ScrollbackBuffer::with_capacity(0);
        assert_eq!(sb.capacity(), 1);
    }

    #[test]
    fn test_scrollback_push_and_get() {
        let mut sb = ScrollbackBuffer::new();
        let mut line = [0u32; SCROLLBACK_COLS];
        line[0] = b'H' as u32;
        line[1] = b'i' as u32;
        sb.push_line(&line);
        assert_eq!(sb.len(), 1);
        let got = sb.get_line(0).expect("line 0 should exist after push");
        assert_eq!(got[0], b'H' as u32);
        assert_eq!(got[1], b'i' as u32);
    }

    #[test]
    fn test_scrollback_is_empty() {
        let sb = ScrollbackBuffer::new();
        assert!(sb.is_empty());
        let mut sb = sb;
        let line = [0u32; SCROLLBACK_COLS];
        sb.push_line(&line);
        assert!(!sb.is_empty());
    }

    #[test]
    fn test_default_trait() {
        let sb = ScrollbackBuffer::default();
        assert_eq!(sb.capacity(), DEFAULT_SCROLLBACK_CAPACITY);
        assert!(sb.is_empty());
    }

    // === Ring wrap-around ===

    #[test]
    fn test_scrollback_ring_wrap() {
        let mut sb = ScrollbackBuffer::with_capacity(256);
        // Fill beyond capacity
        for i in 0..356u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i & 0xFF;
            sb.push_line(&line);
        }
        assert_eq!(sb.len(), 256);
        assert_eq!(sb.total_written(), 356);
        // First line should be the 100th entry (356 - 256 = 100)
        let first = sb
            .get_line(0)
            .expect("line 0 should exist after filling buffer");
        assert_eq!(first[0], 100);
        // Last line should be the 355th entry (355 & 0xFF = 99)
        let last = sb.get_line(255).expect("line 255 should exist");
        assert_eq!(last[0], 355 & 0xFF);
    }

    #[test]
    fn test_scrollback_wrap_around_boundary() {
        let mut sb = ScrollbackBuffer::with_capacity(10);
        for i in 0..20u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        // Lines 10-19 should be present
        assert_eq!(sb.len(), 10);
        for i in 0..10 {
            let line = sb.get_line(i).unwrap();
            assert_eq!(line[0], 10 + i as u32, "line {} should be {}", i, 10 + i);
        }
    }

    #[test]
    fn test_scrollback_1000_lines() {
        let mut sb = ScrollbackBuffer::new();
        for i in 0..1100u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = (i % 256) as u32;
            line[1] = ((i / 256) % 256) as u32;
            sb.push_line(&line);
        }
        assert_eq!(sb.len(), DEFAULT_SCROLLBACK_CAPACITY);
        assert!(sb.max_scroll() >= DEFAULT_SCROLLBACK_CAPACITY - SCROLLBACK_VISIBLE_ROWS);
        let page = sb.get_page(sb.max_scroll());
        assert!(!page.is_empty());
    }

    // === Scroll boundaries ===

    #[test]
    fn test_scrollback_page() {
        let mut sb = ScrollbackBuffer::new();
        for i in 0..50u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let page = sb.get_page(0);
        assert_eq!(page.len(), SCROLLBACK_VISIBLE_ROWS.min(50));
        assert_eq!(page[0][0], 0);
    }

    #[test]
    fn test_scrollback_max_scroll() {
        let mut sb = ScrollbackBuffer::new();
        for _ in 0..50 {
            let line = [0u32; SCROLLBACK_COLS];
            sb.push_line(&line);
        }
        let expected = if 50 > SCROLLBACK_VISIBLE_ROWS {
            50 - SCROLLBACK_VISIBLE_ROWS
        } else {
            0
        };
        assert_eq!(sb.max_scroll(), expected);
    }

    #[test]
    fn test_scrollback_max_scroll_empty() {
        let sb = ScrollbackBuffer::new();
        assert_eq!(sb.max_scroll(), 0);
    }

    #[test]
    fn test_scrollback_max_scroll_exactly_visible() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for _ in 0..SCROLLBACK_VISIBLE_ROWS {
            sb.push_line(&[0u32; SCROLLBACK_COLS]);
        }
        assert_eq!(sb.max_scroll(), 0);
    }

    #[test]
    fn test_scrollback_max_scroll_one_over_visible() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for _ in 0..(SCROLLBACK_VISIBLE_ROWS + 1) {
            sb.push_line(&[0u32; SCROLLBACK_COLS]);
        }
        assert_eq!(sb.max_scroll(), 1);
    }

    #[test]
    fn test_scrollback_page_at_max_scroll() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..50u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let max_s = sb.max_scroll();
        let page = sb.get_page(max_s);
        assert_eq!(page.len(), SCROLLBACK_VISIBLE_ROWS.min(50 - max_s));
    }

    // === Canvas row pushing ===

    #[test]
    fn test_scrollback_push_canvas_rows() {
        let mut sb = ScrollbackBuffer::new();
        let mut canvas = vec![0u32; 10 * SCROLLBACK_COLS];
        canvas[2 * SCROLLBACK_COLS] = b'H' as u32;
        canvas[2 * SCROLLBACK_COLS + 1] = b'e' as u32;
        canvas[5 * SCROLLBACK_COLS] = b'W' as u32;
        canvas[5 * SCROLLBACK_COLS + 1] = b'o' as u32;

        sb.push_canvas_rows(&canvas, 0, 8);
        assert_eq!(sb.len(), 2);
        assert_eq!(sb.get_line(0).expect("line 0 should exist")[0], b'H' as u32);
        assert_eq!(sb.get_line(1).expect("line 1 should exist")[0], b'W' as u32);
    }

    #[test]
    fn test_push_canvas_rows_skips_empty() {
        let mut sb = ScrollbackBuffer::new();
        let canvas = vec![0u32; 5 * SCROLLBACK_COLS];
        sb.push_canvas_rows(&canvas, 0, 5);
        assert_eq!(sb.len(), 0);
    }

    #[test]
    fn test_push_canvas_rows_out_of_bounds() {
        let mut sb = ScrollbackBuffer::new();
        let mut canvas = vec![0u32; 3 * SCROLLBACK_COLS];
        canvas[0] = 42;
        sb.push_canvas_rows(&canvas, 0, 100);
        assert_eq!(sb.len(), 1);
    }

    // === Line deletion ===

    #[test]
    fn test_delete_newest() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..10u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let removed = sb.delete_newest(3);
        assert_eq!(removed, 3);
        assert_eq!(sb.len(), 7);
        // Newest remaining should be line 6 (value 6)
        let last = sb.get_line(6).unwrap();
        assert_eq!(last[0], 6);
    }

    #[test]
    fn test_delete_newest_more_than_count() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..5u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let removed = sb.delete_newest(100);
        assert_eq!(removed, 5);
        assert!(sb.is_empty());
    }

    #[test]
    fn test_delete_oldest() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..10u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let removed = sb.delete_oldest(3);
        assert_eq!(removed, 3);
        assert_eq!(sb.len(), 7);
        // New oldest should be line 3 (value 3)
        let first = sb.get_line(0).unwrap();
        assert_eq!(first[0], 3);
    }

    #[test]
    fn test_delete_specific_line() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..5u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        assert!(sb.delete_line(2));
        assert_eq!(sb.len(), 4);
        // Remaining lines should be 0, 1, 3, 4
        assert_eq!(sb.get_line(0).unwrap()[0], 0);
        assert_eq!(sb.get_line(1).unwrap()[0], 1);
        assert_eq!(sb.get_line(2).unwrap()[0], 3);
        assert_eq!(sb.get_line(3).unwrap()[0], 4);
    }

    #[test]
    fn test_delete_specific_line_out_of_bounds() {
        let mut sb = ScrollbackBuffer::new();
        assert!(!sb.delete_line(0));
        let mut line = [0u32; SCROLLBACK_COLS];
        line[0] = 1;
        sb.push_line(&line);
        assert!(!sb.delete_line(1));
    }

    #[test]
    fn test_delete_first_line() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..5u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        assert!(sb.delete_line(0));
        assert_eq!(sb.len(), 4);
        assert_eq!(sb.get_line(0).unwrap()[0], 1);
    }

    #[test]
    fn test_delete_last_line() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..5u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        assert!(sb.delete_line(4));
        assert_eq!(sb.len(), 4);
        assert_eq!(sb.get_line(3).unwrap()[0], 3);
        assert!(sb.get_line(4).is_none());
    }

    // === Clear ===

    #[test]
    fn test_clear_preserves_capacity() {
        let mut sb = ScrollbackBuffer::with_capacity(500);
        for i in 0..100u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        assert_eq!(sb.len(), 100);
        sb.clear();
        assert!(sb.is_empty());
        assert_eq!(sb.capacity(), 500);
    }

    #[test]
    fn test_clear_allows_reuse() {
        let mut sb = ScrollbackBuffer::with_capacity(50);
        for i in 0..50u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        sb.clear();
        for i in 100..110u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        assert_eq!(sb.len(), 10);
        assert_eq!(sb.get_line(0).unwrap()[0], 100);
    }

    // === Resize ===

    #[test]
    fn test_resize_grow() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..80u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        sb.resize(200);
        assert_eq!(sb.capacity(), 200);
        assert_eq!(sb.len(), 80);
        // Content preserved
        assert_eq!(sb.get_line(0).unwrap()[0], 0);
        assert_eq!(sb.get_line(79).unwrap()[0], 79);
    }

    #[test]
    fn test_resize_shrink_discards_oldest() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..80u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let discarded = sb.resize(50);
        assert_eq!(discarded, 30);
        assert_eq!(sb.capacity(), 50);
        assert_eq!(sb.len(), 50);
        // Oldest remaining should be line 30
        assert_eq!(sb.get_line(0).unwrap()[0], 30);
        assert_eq!(sb.get_line(49).unwrap()[0], 79);
    }

    #[test]
    fn test_resize_same_capacity_noop() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..50u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let discarded = sb.resize(100);
        assert_eq!(discarded, 0);
        assert_eq!(sb.len(), 50);
    }

    // === Memory tracking ===

    #[test]
    fn test_memory_usage() {
        let sb = ScrollbackBuffer::with_capacity(1000);
        let expected = 1000 * SCROLLBACK_COLS * 4;
        assert_eq!(sb.memory_usage_bytes(), expected);
    }

    #[test]
    fn test_content_memory_empty() {
        let sb = ScrollbackBuffer::new();
        assert_eq!(sb.content_memory_bytes(), 0);
    }

    #[test]
    fn test_content_memory_partial() {
        let mut sb = ScrollbackBuffer::with_capacity(1000);
        for _ in 0..100 {
            sb.push_line(&[0u32; SCROLLBACK_COLS]);
        }
        let expected = 100 * SCROLLBACK_COLS * 4;
        assert_eq!(sb.content_memory_bytes(), expected);
        assert!(sb.memory_usage_bytes() > sb.content_memory_bytes());
    }

    #[test]
    fn test_lines_discarded() {
        let mut sb = ScrollbackBuffer::with_capacity(50);
        for _ in 0..100 {
            sb.push_line(&[0u32; SCROLLBACK_COLS]);
        }
        assert_eq!(sb.lines_discarded(), 50);
    }

    #[test]
    fn test_lines_discarded_empty() {
        let sb = ScrollbackBuffer::new();
        assert_eq!(sb.lines_discarded(), 0);
    }

    // === Search ===

    #[test]
    fn test_search_ascii_basic() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        let mut line = [0u32; SCROLLBACK_COLS];
        // Push "Hello" line
        for (i, &b) in b"Hello".iter().enumerate() {
            line[i] = b as u32;
        }
        sb.push_line(&line);
        // Push "World" line
        let mut line2 = [0u32; SCROLLBACK_COLS];
        for (i, &b) in b"World".iter().enumerate() {
            line2[i] = b as u32;
        }
        sb.push_line(&line2);
        // Push "Hello again" line
        let mut line3 = [0u32; SCROLLBACK_COLS];
        for (i, &b) in b"Hello again".iter().enumerate() {
            line3[i] = b as u32;
        }
        sb.push_line(&line3);

        let results = sb.search_ascii("Hello", 0);
        assert_eq!(results, vec![0, 2]);

        let results_limited = sb.search_ascii("Hello", 1);
        assert_eq!(results_limited, vec![0]);
    }

    #[test]
    fn test_search_empty_pattern() {
        let mut sb = ScrollbackBuffer::new();
        let line = [0u32; SCROLLBACK_COLS];
        sb.push_line(&line);
        let results = sb.search(&[], 10);
        assert!(results.is_empty());
    }

    #[test]
    fn test_search_no_match() {
        let mut sb = ScrollbackBuffer::new();
        let mut line = [0u32; SCROLLBACK_COLS];
        line[0] = b'X' as u32;
        sb.push_line(&line);
        let results = sb.search_ascii("ZZZ", 10);
        assert!(results.is_empty());
    }

    #[test]
    fn test_search_backward() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..10u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = b't' as u32;
            line[1] = b'e' as u32;
            line[2] = b's' as u32;
            line[3] = b't' as u32;
            sb.push_line(&line);
        }
        // All lines match "test", search backward from index 9 should find 9
        let pattern: Vec<u32> = b"test".iter().map(|&b| b as u32).collect();
        assert_eq!(sb.search_backward(&pattern, 9), Some(9));
        assert_eq!(sb.search_backward(&pattern, 0), Some(0));
    }

    #[test]
    fn test_search_forward() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..5u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = b'X' as u32;
            sb.push_line(&line);
        }
        let mut match_line = [0u32; SCROLLBACK_COLS];
        match_line[0] = b'Y' as u32;
        sb.push_line(&match_line);
        for _ in 0..5 {
            sb.push_line(&[0u32; SCROLLBACK_COLS]);
        }

        let pattern = vec![b'Y' as u32];
        assert_eq!(sb.search_forward(&pattern, 0), Some(5));
        assert_eq!(sb.search_forward(&pattern, 6), None);
    }

    // === Trim ===

    #[test]
    fn test_trim_trailing_empty() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..5u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        for _ in 0..3 {
            sb.push_line(&[0u32; SCROLLBACK_COLS]);
        }
        assert_eq!(sb.len(), 8);
        let trimmed = sb.trim_trailing_empty();
        assert_eq!(trimmed, 3);
        assert_eq!(sb.len(), 5);
        assert_eq!(sb.get_line(4).unwrap()[0], 4);
    }

    #[test]
    fn test_trim_leading_empty() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for _ in 0..3 {
            sb.push_line(&[0u32; SCROLLBACK_COLS]);
        }
        for i in 1..=5u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        assert_eq!(sb.len(), 8);
        let trimmed = sb.trim_leading_empty();
        assert_eq!(trimmed, 3);
        assert_eq!(sb.len(), 5);
        assert_eq!(sb.get_line(0).unwrap()[0], 1);
    }

    #[test]
    fn test_trim_trailing_no_empty() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        for i in 0..3u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        let trimmed = sb.trim_trailing_empty();
        assert_eq!(trimmed, 0);
        assert_eq!(sb.len(), 3);
    }

    // === get_line_mut ===

    #[test]
    fn test_get_line_mut() {
        let mut sb = ScrollbackBuffer::with_capacity(100);
        let mut line = [0u32; SCROLLBACK_COLS];
        line[0] = 42;
        sb.push_line(&line);

        let fetched = sb.get_line_mut(0).unwrap();
        fetched[0] = 99;
        assert_eq!(sb.get_line(0).unwrap()[0], 99);
    }

    #[test]
    fn test_get_line_mut_out_of_bounds() {
        let mut sb = ScrollbackBuffer::new();
        assert!(sb.get_line_mut(0).is_none());
    }

    // === Edge cases ===

    #[test]
    fn test_single_line_operations() {
        let mut sb = ScrollbackBuffer::with_capacity(10);
        let line = [0u32; SCROLLBACK_COLS];
        sb.push_line(&line);
        assert_eq!(sb.len(), 1);
        assert_eq!(sb.max_scroll(), 0);
        assert!(sb.get_line(0).is_some());
        assert!(sb.get_line(1).is_none());
    }

    #[test]
    fn test_exact_capacity_fill() {
        let cap = 50usize;
        let mut sb = ScrollbackBuffer::with_capacity(cap);
        for i in 0..cap as u32 {
            let mut line = [0u32; SCROLLBACK_COLS];
            line[0] = i;
            sb.push_line(&line);
        }
        assert_eq!(sb.len(), cap);
        assert_eq!(sb.lines_discarded(), 0);
        // Add one more to trigger wrap
        let mut line = [0u32; SCROLLBACK_COLS];
        line[0] = 255;
        sb.push_line(&line);
        assert_eq!(sb.len(), cap);
        assert_eq!(sb.lines_discarded(), 1);
        assert_eq!(sb.get_line(0).unwrap()[0], 1); // oldest was 0, now 1
    }
}
