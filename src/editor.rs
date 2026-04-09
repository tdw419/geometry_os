// ═══════════════════════════════════════════════════════════════════════
// EDITOR BUFFER — SELF-AUTHORING PRIMITIVES
//
// The editor is the bridge between "a program that runs" and "a program
// that writes programs." It provides insert, delete, overwrite, and cursor
// operations on a pixel buffer — the same buffer the VM executes from.
//
// The self-authoring loop:
//   1. VM runs a program
//   2. Program uses EDITOR opcodes to write NEW instructions into RAM
//   3. VM jumps to or calls the newly written code
//   4. That code runs — and may itself write more code
//   5. Repeat forever
//
// This is the bootstrap: the system editing itself.
// ═══════════════════════════════════════════════════════════════════════

/// A cursor into the editor buffer. Tracks position for sequential editing.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Cursor {
    /// Byte (pixel) offset into the buffer.
    pub pos: usize,
}

impl Cursor {
    pub fn new() -> Self {
        Cursor { pos: 0 }
    }

    pub fn at(pos: usize) -> Self {
        Cursor { pos }
    }

    pub fn advance(&mut self, n: usize) {
        self.pos += n;
    }

    pub fn retreat(&mut self, n: usize) {
        self.pos = self.pos.saturating_sub(n);
    }
}

impl Default for Cursor {
    fn default() -> Self {
        Self::new()
    }
}

/// The editor buffer. Wraps a pixel array with insert/delete semantics.
///
/// Unlike raw STORE (which overwrites), the editor can:
/// - INSERT: shift pixels right to make room, then write
/// - DELETE: shift pixels left to close the gap
/// - OVERWRITE: direct pixel write (like STORE but editor-aware)
///
/// All operations are bounds-checked and silently clamp or no-op on overflow.
#[derive(Debug, Clone)]
pub struct EditorBuffer {
    /// The pixel buffer — shared with the VM's RAM.
    pixels: Vec<u32>,
    /// Capacity cap to prevent unbounded growth during self-authoring.
    max_len: usize,
}

impl EditorBuffer {
    pub fn new(pixels: Vec<u32>, max_len: usize) -> Self {
        EditorBuffer { pixels, max_len }
    }

    pub fn from_slice(pixels: &[u32]) -> Self {
        EditorBuffer {
            pixels: pixels.to_vec(),
            max_len: 65536,
        }
    }

    // ── Read operations ──────────────────────────────────────────────

    /// Read pixel at position. Returns 0 if out of bounds.
    pub fn get(&self, pos: usize) -> u32 {
        self.pixels.get(pos).copied().unwrap_or(0)
    }

    /// Read a slice of pixels starting at `pos` for `len` pixels.
    pub fn get_slice(&self, pos: usize, len: usize) -> Vec<u32> {
        if pos >= self.pixels.len() {
            return vec![];
        }
        let end = (pos + len).min(self.pixels.len());
        self.pixels[pos..end].to_vec()
    }

    /// Current buffer length.
    pub fn len(&self) -> usize {
        self.pixels.len()
    }

    pub fn is_empty(&self) -> bool {
        self.pixels.is_empty()
    }

    /// Access the underlying pixel slice.
    pub fn as_slice(&self) -> &[u32] {
        &self.pixels
    }

    // ── Write operations ─────────────────────────────────────────────

    /// Overwrite pixel at position. No-op if out of bounds.
    pub fn overwrite(&mut self, pos: usize, value: u32) {
        if let Some(slot) = self.pixels.get_mut(pos) {
            *slot = value;
        }
    }

    /// Insert a pixel at position, shifting everything right by 1.
    /// If the buffer is at max_len, the last pixel is discarded.
    pub fn insert(&mut self, pos: usize, value: u32) {
        if self.pixels.len() >= self.max_len {
            // At capacity — overwrite instead of grow
            self.overwrite(pos, value);
            return;
        }
        let pos = pos.min(self.pixels.len());
        self.pixels.insert(pos, value);
    }

    /// Insert a slice of pixels at position, shifting right.
    pub fn insert_slice(&mut self, pos: usize, values: &[u32]) {
        let pos = pos.min(self.pixels.len());
        let available = self.max_len.saturating_sub(self.pixels.len());
        let to_insert = &values[..values.len().min(available)];
        if to_insert.is_empty() {
            return;
        }
        // Use splice for efficiency
        self.pixels.splice(pos..pos, to_insert.iter().copied());
        // Trim if we overshot
        if self.pixels.len() > self.max_len {
            self.pixels.truncate(self.max_len);
        }
    }

    /// Delete pixel at position, shifting everything left by 1.
    /// Returns the deleted value, or 0 if out of bounds.
    pub fn delete(&mut self, pos: usize) -> u32 {
        if pos >= self.pixels.len() {
            return 0;
        }
        self.pixels.remove(pos)
    }

    /// Delete a range of pixels. Returns count deleted.
    pub fn delete_range(&mut self, start: usize, count: usize) -> usize {
        if start >= self.pixels.len() {
            return 0;
        }
        let end = (start + count).min(self.pixels.len());
        let deleted = end - start;
        self.pixels.splice(start..end, std::iter::empty());
        deleted
    }

    // ── Self-authoring helpers ───────────────────────────────────────

    /// Write an instruction (opcode + args) at a given position.
    /// This is the primary self-authoring operation: stamp a complete
    /// instruction into the buffer. Extends the buffer if needed.
    pub fn write_instruction(&mut self, pos: usize, pixels: &[u32]) {
        let end = pos + pixels.len();
        if end > self.pixels.len() {
            self.pixels.resize(end.min(self.max_len), 0);
        }
        for (i, &pixel) in pixels.iter().enumerate() {
            if pos + i < self.pixels.len() {
                self.pixels[pos + i] = pixel;
            }
        }
    }

    /// Assemble an instruction from opcode + args into pixel values.
    /// Returns the pixel sequence ready for write_instruction.
    pub fn assemble(opcode: u8, args: &[u32]) -> Vec<u32> {
        let mut pixels = vec![opcode as u32];
        pixels.extend_from_slice(args);
        pixels
    }

    /// Check if a position contains a valid instruction by reading the
    /// opcode pixel and verifying it's a known opcode.
    pub fn is_valid_opcode(&self, pos: usize) -> bool {
        let pixel = self.get(pos);
        crate::opcodes::is_valid((pixel & 0xFF) as u8)
    }

    /// Read a complete instruction at a position: returns (opcode, args).
    pub fn read_instruction(&self, pos: usize) -> (u8, Vec<u32>) {
        let opcode_pixel = self.get(pos);
        let opcode = (opcode_pixel & 0xFF) as u8;
        let width = crate::opcodes::width(opcode);
        let args = self.get_slice(pos + 1, width.saturating_sub(1));
        (opcode, args)
    }

    /// Disassemble the buffer into a vector of (address, opcode_name, args).
    pub fn disassemble(&self) -> Vec<(usize, String, Vec<u32>)> {
        let mut result = Vec::new();
        let mut pos = 0;
        while pos < self.pixels.len() {
            let (opcode, args) = self.read_instruction(pos);
            let name = crate::opcodes::name(opcode).to_string();
            let width = crate::opcodes::width(opcode);
            result.push((pos, name, args));
            pos += width;
        }
        result
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::opcodes::op;

    #[test]
    fn insert_shifts_right() {
        let mut buf = EditorBuffer::from_slice(&[10, 20, 30]);
        buf.insert(1, 99);
        assert_eq!(buf.as_slice(), &[10, 99, 20, 30]);
    }

    #[test]
    fn delete_shifts_left() {
        let mut buf = EditorBuffer::from_slice(&[10, 20, 30]);
        let deleted = buf.delete(1);
        assert_eq!(deleted, 20);
        assert_eq!(buf.as_slice(), &[10, 30]);
    }

    #[test]
    fn overwrite_in_place() {
        let mut buf = EditorBuffer::from_slice(&[10, 20, 30]);
        buf.overwrite(1, 99);
        assert_eq!(buf.as_slice(), &[10, 99, 30]);
    }

    #[test]
    fn insert_at_end_appends() {
        let mut buf = EditorBuffer::from_slice(&[10, 20]);
        buf.insert(2, 30);
        assert_eq!(buf.as_slice(), &[10, 20, 30]);
    }

    #[test]
    fn insert_respects_max_len() {
        let mut buf = EditorBuffer::new(vec![1, 2, 3], 3);
        buf.insert(1, 99); // at capacity, should overwrite
        assert_eq!(buf.as_slice(), &[1, 99, 3]);
    }

    #[test]
    fn delete_out_of_bounds_returns_zero() {
        let mut buf = EditorBuffer::from_slice(&[10, 20]);
        assert_eq!(buf.delete(5), 0);
        assert_eq!(buf.as_slice(), &[10, 20]);
    }

    #[test]
    fn write_instruction_stamps_pixels() {
        let mut buf = EditorBuffer::from_slice(&[0, 0, 0, 0, 0]);
        // Write LDI r0, 42 = [0x49, 0x30, 0x2A]
        buf.write_instruction(0, &[op::LDI as u32, 0x30, 0x2A]);
        assert_eq!(buf.get(0), op::LDI as u32);
        assert_eq!(buf.get(1), 0x30);
        assert_eq!(buf.get(2), 0x2A);
    }

    #[test]
    fn assemble_creates_pixel_sequence() {
        let pixels = EditorBuffer::assemble(op::ADD, &[0x30, 0x31]);
        assert_eq!(pixels, &[op::ADD as u32, 0x30, 0x31]);
    }

    #[test]
    fn read_instruction_parses_opcode_and_args() {
        // LDI r0, 42
        let mut buf = EditorBuffer::from_slice(&[0; 3]);
        buf.write_instruction(0, &[op::LDI as u32, 0x30, 0x2A]);
        let (opcode, args) = buf.read_instruction(0);
        assert_eq!(opcode, op::LDI);
        assert_eq!(args, &[0x30, 0x2A]);
    }

    #[test]
    fn disassemble_produces_listing() {
        let mut buf = EditorBuffer::from_slice(&[0; 2]);
        // Address 0: NOP (width 1)
        buf.overwrite(0, op::NOP as u32);
        // Address 1: HALT (width 1)
        buf.overwrite(1, op::HALT as u32);

        let listing = buf.disassemble();
        assert_eq!(listing.len(), 2);
        assert_eq!(listing[0], (0, "NOP".to_string(), vec![]));
        assert_eq!(listing[1], (1, "HALT".to_string(), vec![]));
    }

    #[test]
    fn cursor_advance_and_retreat() {
        let mut cur = Cursor::new();
        assert_eq!(cur.pos, 0);
        cur.advance(5);
        assert_eq!(cur.pos, 5);
        cur.retreat(2);
        assert_eq!(cur.pos, 3);
        cur.retreat(100); // saturating sub
        assert_eq!(cur.pos, 0);
    }

    #[test]
    fn insert_slice_shifts_and_clamps() {
        let mut buf = EditorBuffer::from_slice(&[1, 2, 3]);
        buf.insert_slice(1, &[10, 20]);
        assert_eq!(buf.as_slice(), &[1, 10, 20, 2, 3]);
    }

    #[test]
    fn delete_range_removes_multiple() {
        let mut buf = EditorBuffer::from_slice(&[1, 2, 3, 4, 5]);
        let count = buf.delete_range(1, 2);
        assert_eq!(count, 2);
        assert_eq!(buf.as_slice(), &[1, 4, 5]);
    }
}
