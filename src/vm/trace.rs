// vm/trace.rs -- Execution Trace Ring Buffer (Phase 38a)
//                 Frame Checkpointing (Phase 38b)
//                 Timeline Forking (Phase 38d)
//
// Records every instruction execution to a fixed-size ring buffer.
// Zero overhead when recording is off (one bool check per step).
// Ring buffer allocated once, never grows. No heap allocation in the hot path.
//
// Phase 38b: Snapshots the full screen buffer at every FRAME opcode.
// Combined with the trace ring buffer, you can reconstruct the screen
// at any point without re-executing.
//
// Phase 38d: Full VM state snapshots for timeline forking.
// Save the complete state (RAM, registers, PC, screen, all config) and
// restore it later to explore alternate execution paths.

/// Default ring buffer capacity (entries).
pub const DEFAULT_TRACE_CAPACITY: usize = 10_000;

/// Default render log capacity (entries). Ring buffer of graphics ops.
pub const DEFAULT_RENDER_LOG_CAPACITY: usize = 4096;

/// Default frame checkpoint capacity (frames).
/// At 256x256 screen (65536 u32s per frame), 60 frames ≈ 15MB.
pub const DEFAULT_FRAME_CHECK_CAPACITY: usize = 60;

/// A single recorded execution step.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct TraceEntry {
    /// Monotonically increasing step counter at time of recording.
    pub step_number: u64,
    /// Program counter value before this instruction executed.
    pub pc: u32,
    /// First 16 registers (r0-r15) at time of recording.
    pub regs: [u32; 16],
    /// The opcode that was executed.
    pub opcode: u32,
}

// --- Render Log: High-Level Graphics Operation History ---

/// A single high-level graphics operation recorded by the render log.
#[derive(Debug, Clone)]
pub struct RenderLogEntry {
    pub frame: u32,
    pub opcode: u8,
    pub name: &'static str,
    pub args: [u32; 6],
    pub argc: u8,
}

/// Fixed-size ring buffer of render log entries.
#[derive(Debug)]
pub struct RenderLog {
    entries: Vec<RenderLogEntry>,
    capacity: usize,
    head: usize,
    len: usize,
}

impl RenderLog {
    pub fn new(capacity: usize) -> Self {
        let capacity = capacity.max(1);
        RenderLog {
            entries: vec![
                RenderLogEntry {
                    frame: 0,
                    opcode: 0,
                    name: "",
                    args: [0; 6],
                    argc: 0
                };
                capacity
            ],
            capacity,
            head: 0,
            len: 0,
        }
    }

    #[inline]
    pub fn push(&mut self, frame: u32, opcode: u8, name: &'static str, args: &[u32]) {
        let entry = &mut self.entries[self.head];
        entry.frame = frame;
        entry.opcode = opcode;
        entry.name = name;
        entry.argc = args.len().min(6) as u8;
        for (i, &v) in args.iter().take(6).enumerate() {
            entry.args[i] = v;
        }
        self.head = (self.head + 1) % self.capacity;
        if self.len < self.capacity {
            self.len += 1;
        }
    }

    pub fn len(&self) -> usize {
        self.len
    }
    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    pub fn clear(&mut self) {
        self.head = 0;
        self.len = 0;
    }

    pub fn iter(&self) -> RenderLogIter<'_> {
        let start = if self.len < self.capacity {
            0
        } else {
            self.head
        };
        RenderLogIter {
            log: self,
            pos: 0,
            start,
        }
    }
}

pub struct RenderLogIter<'a> {
    log: &'a RenderLog,
    pos: usize,
    start: usize,
}

impl<'a> Iterator for RenderLogIter<'a> {
    type Item = &'a RenderLogEntry;
    fn next(&mut self) -> Option<Self::Item> {
        if self.pos >= self.log.len {
            return None;
        }
        let idx = (self.start + self.pos) % self.log.capacity;
        self.pos += 1;
        Some(&self.log.entries[idx])
    }
}

/// Fixed-size circular buffer of TraceEntry.
///
/// Pre-allocated to `capacity` entries. Old entries are overwritten
/// when the buffer wraps around. No heap allocation after construction.
#[derive(Debug)]
pub struct TraceBuffer {
    entries: Vec<TraceEntry>,
    capacity: usize,
    head: usize,       // next write position
    len: usize,        // number of valid entries (up to capacity)
    step_counter: u64, // monotonically increasing step counter
}

#[allow(dead_code)]
impl TraceBuffer {
    /// Create a new ring buffer with the given capacity.
    pub fn new(capacity: usize) -> Self {
        let capacity = capacity.max(1);
        TraceBuffer {
            entries: vec![
                TraceEntry {
                    step_number: 0,
                    pc: 0,
                    regs: [0; 16],
                    opcode: 0,
                };
                capacity
            ],
            capacity,
            head: 0,
            len: 0,
            step_counter: 0,
        }
    }

    /// Push a new entry into the ring buffer.
    /// Overwrites the oldest entry if the buffer is full.
    /// No heap allocation -- writes into pre-allocated slot.
    #[inline]
    pub fn push(&mut self, pc: u32, regs: &[u32; 32], opcode: u32) {
        let entry = &mut self.entries[self.head];
        entry.step_number = self.step_counter;
        entry.pc = pc;
        entry.regs.copy_from_slice(&regs[..16]);
        entry.opcode = opcode;

        self.head = (self.head + 1) % self.capacity;
        if self.len < self.capacity {
            self.len += 1;
        }
        self.step_counter += 1;
    }

    /// Number of valid entries currently in the buffer.
    pub fn len(&self) -> usize {
        self.len
    }

    /// Whether the buffer is empty.
    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    /// Current step counter value.
    pub fn step_counter(&self) -> u64 {
        self.step_counter
    }

    /// Clear all entries and reset the step counter.
    pub fn clear(&mut self) {
        self.head = 0;
        self.len = 0;
        self.step_counter = 0;
    }

    /// Iterate over entries from oldest to newest.
    pub fn iter(&self) -> TraceIter<'_> {
        let start = if self.len < self.capacity {
            0
        } else {
            self.head // oldest is at head (which wrapped around)
        };
        TraceIter {
            buffer: self,
            pos: 0,
            start,
        }
    }

    /// Get the Nth most recent entry (0 = newest).
    /// Returns None if index >= len.
    pub fn get_recent(&self, index: usize) -> Option<&TraceEntry> {
        if index >= self.len {
            return None;
        }
        let idx = (self.head + self.capacity - 1 - index) % self.capacity;
        Some(&self.entries[idx])
    }

    /// Get entry by absolute index (0 = oldest).
    /// Used by TRACE_READ opcode for sequential access.
    /// Returns None if index >= len.
    pub fn get_at(&self, index: usize) -> Option<&TraceEntry> {
        if index >= self.len {
            return None;
        }
        let start = if self.len < self.capacity {
            0
        } else {
            self.head
        };
        let idx = (start + index) % self.capacity;
        Some(&self.entries[idx])
    }

    /// Count entries with a specific opcode.
    pub fn count_opcode(&self, target: u32) -> usize {
        self.iter().filter(|e| e.opcode == target).count()
    }

    /// Collect indices of entries with a specific opcode.
    /// Returns at most `max_results` indices (oldest to newest).
    pub fn find_opcode_indices(&self, target: u32, max_results: usize) -> Vec<usize> {
        let mut result = Vec::with_capacity(max_results);
        for (i, entry) in self.iter().enumerate() {
            if entry.opcode == target {
                result.push(i);
                if result.len() >= max_results {
                    break;
                }
            }
        }
        result
    }

    /// Replay backward from a given step number.
    /// Returns entries in reverse chronological order (newest first) starting
    /// at or before the given step number. Limited to `limit` entries.
    /// If step > current step_counter, starts from the most recent entry.
    pub fn replay_from(&self, step: u64, limit: usize) -> Vec<TraceEntry> {
        if self.len == 0 {
            return Vec::new();
        }

        // Find the starting index: the most recent entry with step_number <= step
        let start_idx = if step >= self.step_counter {
            // Start from most recent
            0
        } else {
            // Walk from newest backward to find first entry with step_number <= step
            let mut found = 0;
            for i in 0..self.len {
                if let Some(entry) = self.get_recent(i) {
                    if entry.step_number <= step {
                        found = i;
                        break;
                    }
                }
            }
            found
        };

        let limit = limit.min(self.len - start_idx);
        let mut result = Vec::with_capacity(limit);
        for i in start_idx..(start_idx + limit) {
            if let Some(entry) = self.get_recent(i) {
                result.push(entry.clone());
            }
        }
        result
    }

    /// Iterate over entries from newest to oldest (reverse order).
    pub fn iter_rev(&self) -> TraceRevIter<'_> {
        TraceRevIter {
            buffer: self,
            pos: 0,
        }
    }

    /// Return chronologically-ordered entries whose step_number falls within
    /// `[step - radius, step + radius]`. Entries evicted from the ring buffer
    /// are silently omitted -- the caller can detect truncation by comparing
    /// the oldest returned step_number against `step - radius`.
    pub fn range_around(&self, step: u64, radius: u64) -> Vec<TraceEntry> {
        let lo = step.saturating_sub(radius);
        let hi = step.saturating_add(radius);
        self.iter()
            .filter(|e| e.step_number >= lo && e.step_number <= hi)
            .cloned()
            .collect()
    }
}

/// Iterator over trace entries from oldest to newest.
#[allow(dead_code)]
pub struct TraceIter<'a> {
    buffer: &'a TraceBuffer,
    pos: usize,
    start: usize,
}

impl<'a> Iterator for TraceIter<'a> {
    type Item = &'a TraceEntry;

    fn next(&mut self) -> Option<Self::Item> {
        if self.pos >= self.buffer.len {
            return None;
        }
        let idx = (self.start + self.pos) % self.buffer.capacity;
        self.pos += 1;
        Some(&self.buffer.entries[idx])
    }
}

/// Iterator over trace entries from newest to oldest.
#[allow(dead_code)]
pub struct TraceRevIter<'a> {
    buffer: &'a TraceBuffer,
    pos: usize,
}

impl<'a> Iterator for TraceRevIter<'a> {
    type Item = &'a TraceEntry;

    fn next(&mut self) -> Option<Self::Item> {
        if self.pos >= self.buffer.len {
            return None;
        }
        let idx = (self.buffer.head + self.buffer.capacity - 1 - self.pos) % self.buffer.capacity;
        self.pos += 1;
        Some(&self.buffer.entries[idx])
    }
}

// --- Phase 38b: Frame Checkpointing ---

/// A snapshot of the screen buffer captured at a FRAME opcode.
#[derive(Debug, Clone)]
#[allow(dead_code)]
pub struct FrameCheckpoint {
    /// Step number at which this frame was captured.
    pub step_number: u64,
    /// The frame_count value when this checkpoint was taken.
    pub frame_count: u32,
    /// Full screen buffer snapshot (256x256 = 65536 u32s).
    pub screen: Vec<u32>,
}

/// Ring buffer of frame checkpoints.
///
/// Unlike TraceBuffer (which pre-allocates entries), this uses a Vec ring
/// buffer because each frame is 256KB. Frames are only allocated when pushed
/// (only when trace_recording is on and a FRAME opcode fires).
#[derive(Debug)]
pub struct FrameCheckBuffer {
    entries: Vec<Option<FrameCheckpoint>>,
    capacity: usize,
    head: usize, // next write position
    len: usize,  // number of valid entries (up to capacity)
}

#[allow(dead_code)]
impl FrameCheckBuffer {
    /// Create a new frame checkpoint buffer with the given capacity.
    pub fn new(capacity: usize) -> Self {
        let capacity = capacity.max(1);
        FrameCheckBuffer {
            entries: (0..capacity).map(|_| None).collect(),
            capacity,
            head: 0,
            len: 0,
        }
    }

    /// Push a new frame checkpoint into the ring buffer.
    /// Overwrites the oldest entry if the buffer is full.
    /// The `None` slot is reused; the `Some` slot's Vec is replaced.
    pub fn push(&mut self, step_number: u64, frame_count: u32, screen: &[u32]) {
        let checkpoint = FrameCheckpoint {
            step_number,
            frame_count,
            screen: screen.to_vec(),
        };
        self.entries[self.head] = Some(checkpoint);
        self.head = (self.head + 1) % self.capacity;
        if self.len < self.capacity {
            self.len += 1;
        }
    }

    /// Number of valid frame checkpoints currently in the buffer.
    pub fn len(&self) -> usize {
        self.len
    }

    /// Whether the buffer is empty.
    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    /// Clear all frame checkpoints.
    pub fn clear(&mut self) {
        for entry in self.entries.iter_mut() {
            entry.take();
        }
        self.head = 0;
        self.len = 0;
    }

    /// Get the Nth most recent frame checkpoint (0 = newest).
    /// Returns None if index >= len.
    pub fn get_recent(&self, index: usize) -> Option<&FrameCheckpoint> {
        if index >= self.len {
            return None;
        }
        let idx = (self.head + self.capacity - 1 - index) % self.capacity;
        self.entries[idx].as_ref()
    }

    /// Iterate over frame checkpoints from oldest to newest.
    pub fn iter(&self) -> FrameCheckIter<'_> {
        let start = if self.len < self.capacity {
            0
        } else {
            self.head
        };
        FrameCheckIter {
            buffer: self,
            pos: 0,
            start,
        }
    }

    /// Replay a frame: return a cloned screen buffer for the Nth most recent checkpoint.
    /// Returns None if index >= len.
    pub fn replay_frame(&self, index: usize) -> Option<Vec<u32>> {
        self.get_recent(index).map(|cp| cp.screen.clone())
    }
}

/// Iterator over frame checkpoints from oldest to newest.
#[allow(dead_code)]
pub struct FrameCheckIter<'a> {
    buffer: &'a FrameCheckBuffer,
    pos: usize,
    start: usize,
}

impl<'a> Iterator for FrameCheckIter<'a> {
    type Item = &'a FrameCheckpoint;

    fn next(&mut self) -> Option<Self::Item> {
        if self.pos >= self.buffer.len {
            return None;
        }
        let idx = (self.start + self.pos) % self.buffer.capacity;
        self.pos += 1;
        self.buffer.entries[idx].as_ref()
    }
}

// --- Phase 38d: Timeline Forking ---

/// Maximum number of VM snapshots that can be stored simultaneously.
/// At 256KB per snapshot (64K u32 RAM), 16 snapshots = 4MB total.
pub const MAX_SNAPSHOTS: usize = 16;

// --- Phase 54: Pixel Write History ---

/// Default pixel write log capacity (entries).
/// Each entry is 20 bytes (x: u16, y: u16, step_lo: u32, step_hi: u32, opcode: u8, color: u32).
/// 262144 entries (4x screen size) = ~5MB. Survives 4 full-screen passes.
/// Memory is cheap; silent data loss is expensive.
pub const DEFAULT_PIXEL_WRITE_CAPACITY: usize = 262_144;

/// A single recorded pixel write event.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct PixelWriteEntry {
    /// X coordinate of the pixel written (0-255).
    pub x: u16,
    /// Y coordinate of the pixel written (0-255).
    pub y: u16,
    /// Step number when this write occurred (low 32 bits).
    pub step_lo: u32,
    /// Step number when this write occurred (high 32 bits).
    pub step_hi: u32,
    /// The opcode that caused this write (e.g., 0x40 for PSET, 0x41 for PSETI).
    pub opcode: u8,
    /// The color value written to the pixel.
    pub color: u32,
}

impl PixelWriteEntry {
    /// Get the full step number as u64.
    #[allow(dead_code)]
    pub fn step(&self) -> u64 {
        (self.step_hi as u64) << 32 | (self.step_lo as u64)
    }
}

/// Fixed-size ring buffer of pixel write events.
///
/// Records every individual pixel write (PSET/PSETI) when trace recording is on.
/// Zero overhead when off (one bool check per PSET). Ring buffer allocated once,
/// never grows. Bulk operations (FILL, RECTF, etc.) are NOT logged per-pixel --
/// they record a single "region marker" entry at the origin pixel.
#[derive(Debug)]
pub struct PixelWriteLog {
    entries: Vec<PixelWriteEntry>,
    capacity: usize,
    head: usize, // next write position
    len: usize,  // number of valid entries (up to capacity)
}

#[allow(dead_code)]
impl PixelWriteLog {
    /// Create a new pixel write log with the given capacity.
    pub fn new(capacity: usize) -> Self {
        let capacity = capacity.max(1);
        PixelWriteLog {
            entries: vec![
                PixelWriteEntry {
                    x: 0,
                    y: 0,
                    step_lo: 0,
                    step_hi: 0,
                    opcode: 0,
                    color: 0,
                };
                capacity
            ],
            capacity,
            head: 0,
            len: 0,
        }
    }

    /// Record a pixel write event.
    /// Only call this when trace recording is on.
    #[inline]
    pub fn push(&mut self, x: u16, y: u16, step: u64, opcode: u8, color: u32) {
        let entry = &mut self.entries[self.head];
        entry.x = x;
        entry.y = y;
        entry.step_lo = step as u32;
        entry.step_hi = (step >> 32) as u32;
        entry.opcode = opcode;
        entry.color = color;

        self.head = (self.head + 1) % self.capacity;
        if self.len < self.capacity {
            self.len += 1;
        }
    }

    /// Number of valid entries currently in the buffer.
    pub fn len(&self) -> usize {
        self.len
    }

    /// Total capacity of the ring buffer.
    pub fn capacity(&self) -> usize {
        self.capacity
    }

    /// Whether the buffer is empty.
    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    /// Whether old entries have been evicted (buffer wrapped).
    pub fn is_full(&self) -> bool {
        self.len >= self.capacity
    }

    /// Clear all entries.
    pub fn clear(&mut self) {
        self.head = 0;
        self.len = 0;
    }

    /// Get entry by absolute index (0 = oldest).
    /// Returns None if index >= len.
    pub fn get_at(&self, index: usize) -> Option<&PixelWriteEntry> {
        if index >= self.len {
            return None;
        }
        let start = if self.len < self.capacity {
            0
        } else {
            self.head
        };
        let idx = (start + index) % self.capacity;
        Some(&self.entries[idx])
    }

    /// Count writes to a specific pixel (x, y).
    pub fn count_at(&self, x: u16, y: u16) -> usize {
        self.iter().filter(|e| e.x == x && e.y == y).count()
    }

    /// Get the N most recent writes to a specific pixel (x, y).
    /// Returns entries in reverse chronological order (newest first).
    /// Limits results to `max_results`.
    pub fn recent_at(&self, x: u16, y: u16, max_results: usize) -> Vec<PixelWriteEntry> {
        let mut result = Vec::with_capacity(max_results);
        for entry in self.iter_rev() {
            if entry.x == x && entry.y == y {
                result.push(entry.clone());
                if result.len() >= max_results {
                    break;
                }
            }
        }
        result
    }

    /// Iterate over entries from oldest to newest.
    pub fn iter(&self) -> PixelWriteIter<'_> {
        let start = if self.len < self.capacity {
            0
        } else {
            self.head
        };
        PixelWriteIter {
            log: self,
            pos: 0,
            start,
        }
    }

    /// Iterate over entries from newest to oldest.
    pub fn iter_rev(&self) -> PixelWriteRevIter<'_> {
        PixelWriteRevIter { log: self, pos: 0 }
    }
}

/// Iterator over pixel write entries from oldest to newest.
pub struct PixelWriteIter<'a> {
    log: &'a PixelWriteLog,
    pos: usize,
    start: usize,
}

impl<'a> Iterator for PixelWriteIter<'a> {
    type Item = &'a PixelWriteEntry;

    fn next(&mut self) -> Option<Self::Item> {
        if self.pos >= self.log.len {
            return None;
        }
        let idx = (self.start + self.pos) % self.log.capacity;
        self.pos += 1;
        Some(&self.log.entries[idx])
    }
}

/// Iterator over pixel write entries from newest to oldest.
pub struct PixelWriteRevIter<'a> {
    log: &'a PixelWriteLog,
    pos: usize,
}

impl<'a> Iterator for PixelWriteRevIter<'a> {
    type Item = &'a PixelWriteEntry;

    fn next(&mut self) -> Option<Self::Item> {
        if self.pos >= self.log.len {
            return None;
        }
        let idx = (self.log.head + self.log.capacity - 1 - self.pos) % self.log.capacity;
        self.pos += 1;
        Some(&self.log.entries[idx])
    }
}

// --- Phase 38d: Timeline Forking ---

/// A complete snapshot of VM state, used for timeline forking.
///
/// Captures everything needed to restore the VM to an exact prior state:
/// full RAM, screen buffer, all registers, PC, and configuration fields.
/// This enables "what if" exploration -- save a snapshot, run forward,
/// then restore and try a different path.
///
/// Size: ~384KB per snapshot (64K RAM words + 64K screen words + overhead).
/// Delta compression can reduce this later; for now, keep it simple.
#[derive(Debug, Clone)]
#[allow(dead_code)]
pub struct VmSnapshot {
    /// Full RAM contents (65536 u32 words = 256KB).
    pub ram: Vec<u32>,
    /// Full screen buffer (65536 u32 words = 256KB).
    pub screen: Vec<u32>,
    /// All 32 general-purpose registers.
    pub regs: [u32; 32],
    /// Program counter.
    pub pc: u32,
    /// CPU privilege mode (Kernel/User).
    pub mode: super::types::CpuMode,
    /// Whether the VM was halted.
    pub halted: bool,
    /// Whether SHUTDOWN opcode was triggered (kernel mode).
    pub shutdown_requested: bool,
    /// Frame counter value.
    pub frame_count: u32,
    /// LCG random state.
    pub rand_state: u32,
    /// Current PID.
    pub current_pid: u32,
    /// Step number when this snapshot was taken (from trace buffer).
    pub step_number: u64,
}

#[cfg(test)]
mod tests {
    use super::*;

    // ── TraceBuffer: construction and basic operations ──────────

    #[test]
    fn trace_buffer_new_empty() {
        let buf = TraceBuffer::new(100);
        assert!(buf.is_empty());
        assert_eq!(buf.len(), 0);
        assert_eq!(buf.step_counter(), 0);
    }

    #[test]
    fn trace_buffer_new_minimum_capacity() {
        let mut buf = TraceBuffer::new(0);
        assert_eq!(buf.len(), 0);
        // capacity 0 is clamped to 1
        let regs = [0u32; 32];
        buf.push_ref(&regs, 0, 0x10);
        assert_eq!(buf.len(), 1);
    }

    #[test]
    fn trace_buffer_push_and_len() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        buf.push_ref(&regs, 0x1000, 0x10); // LDI
        buf.push_ref(&regs, 0x1002, 0x20); // ADD
        assert_eq!(buf.len(), 2);
        assert!(!buf.is_empty());
        assert_eq!(buf.step_counter(), 2);
    }

    #[test]
    fn trace_buffer_push_copies_first_16_regs() {
        let mut buf = TraceBuffer::new(100);
        let mut regs = [0u32; 32];
        for i in 0..32 {
            regs[i] = (i + 1) as u32 * 100;
        }
        buf.push_ref(&regs, 0x2000, 0x44); // TEXT
        let entry = buf.get_recent(0).unwrap();
        // Only first 16 registers are recorded
        for i in 0..16 {
            assert_eq!(entry.regs[i], regs[i], "reg r{} mismatch", i);
        }
    }

    #[test]
    fn trace_buffer_push_increments_step_counter() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..5 {
            buf.push_ref(&regs, 0x1000 + (i as u32 * 3), 0x10);
            assert_eq!(buf.step_counter(), (i + 1) as u64);
        }
    }

    // ── TraceBuffer: ring buffer wrap-around ──────────────────

    #[test]
    fn trace_buffer_wrap_around() {
        let capacity = 5;
        let mut buf = TraceBuffer::new(capacity);
        let regs = [0u32; 32];
        // Push 8 entries into a 5-entry buffer
        for i in 0..8 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i as u32);
        }
        assert_eq!(buf.len(), capacity); // capped at capacity
        // Newest entry (index 7) should be at get_recent(0)
        let newest = buf.get_recent(0).unwrap();
        assert_eq!(newest.step_number, 7);
        assert_eq!(newest.opcode, 0x17);
        // Oldest surviving entry (index 3) should be at get_recent(4)
        let oldest = buf.get_recent(capacity - 1).unwrap();
        assert_eq!(oldest.step_number, 3);
        assert_eq!(oldest.opcode, 0x13);
        // Entries 0-2 should be evicted
        assert_eq!(buf.get_at(0).unwrap().step_number, 3);
    }

    #[test]
    fn trace_buffer_get_recent_out_of_bounds() {
        let buf = TraceBuffer::new(100);
        assert!(buf.get_recent(0).is_none());
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        buf.push_ref(&regs, 0, 0);
        assert!(buf.get_recent(1).is_none());
    }

    #[test]
    fn trace_buffer_get_at_sequential() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..5u32 {
            buf.push_ref(&regs, 0x1000 + i * 3, 0x10 + i);
        }
        // get_at(0) = oldest, get_at(4) = newest
        assert_eq!(buf.get_at(0).unwrap().step_number, 0);
        assert_eq!(buf.get_at(4).unwrap().step_number, 4);
        assert_eq!(buf.get_at(5).is_none(), true);
    }

    // ── TraceBuffer: iterators ─────────────────────────────────

    #[test]
    fn trace_buffer_iter_oldest_to_newest() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..5u32 {
            buf.push_ref(&regs, 0x1000 + i * 3, 0x10 + i);
        }
        let steps: Vec<u64> = buf.iter().map(|e| e.step_number).collect();
        assert_eq!(steps, vec![0, 1, 2, 3, 4]);
    }

    #[test]
    fn trace_buffer_iter_rev_newest_to_oldest() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..5u32 {
            buf.push_ref(&regs, 0x1000 + i * 3, 0x10 + i);
        }
        let steps: Vec<u64> = buf.iter_rev().map(|e| e.step_number).collect();
        assert_eq!(steps, vec![4, 3, 2, 1, 0]);
    }

    #[test]
    fn trace_buffer_iter_after_wrap() {
        let mut buf = TraceBuffer::new(3);
        let regs = [0u32; 32];
        for i in 0..6u32 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i);
        }
        let steps: Vec<u64> = buf.iter().map(|e| e.step_number).collect();
        assert_eq!(steps, vec![3, 4, 5]);
    }

    #[test]
    fn trace_buffer_iter_rev_after_wrap() {
        let mut buf = TraceBuffer::new(3);
        let regs = [0u32; 32];
        for i in 0..6u32 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i);
        }
        let steps: Vec<u64> = buf.iter_rev().map(|e| e.step_number).collect();
        assert_eq!(steps, vec![5, 4, 3]);
    }

    // ── TraceBuffer: search operations ─────────────────────────

    #[test]
    fn trace_buffer_count_opcode() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        // Push: LDI, LDI, ADD, LDI, ADD, HALT
        let opcodes = [0x10, 0x10, 0x20, 0x10, 0x20, 0x00];
        for (i, &op) in opcodes.iter().enumerate() {
            buf.push_ref(&regs, 0x1000 + i as u32, op);
        }
        assert_eq!(buf.count_opcode(0x10), 3); // LDI
        assert_eq!(buf.count_opcode(0x20), 2); // ADD
        assert_eq!(buf.count_opcode(0x00), 1); // HALT
        assert_eq!(buf.count_opcode(0xFF), 0); // nonexistent
    }

    #[test]
    fn trace_buffer_find_opcode_indices() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        let opcodes = [0x10, 0x20, 0x10, 0x30, 0x10, 0x20];
        for (i, &op) in opcodes.iter().enumerate() {
            buf.push_ref(&regs, 0x1000 + i as u32, op);
        }
        let indices = buf.find_opcode_indices(0x10, 10);
        assert_eq!(indices, vec![0, 2, 4]);

        let indices_limited = buf.find_opcode_indices(0x10, 2);
        assert_eq!(indices_limited, vec![0, 2]);
    }

    #[test]
    fn trace_buffer_replay_from_current() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..5u32 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i);
        }
        // step_counter is 5, replay_from(10, 3) should return newest 3
        let entries = buf.replay_from(10, 3);
        assert_eq!(entries.len(), 3);
        assert_eq!(entries[0].step_number, 4); // newest first
        assert_eq!(entries[1].step_number, 3);
        assert_eq!(entries[2].step_number, 2);
    }

    #[test]
    fn trace_buffer_replay_from_past() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..10u32 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i);
        }
        // Replay from step 5, limit 3
        let entries = buf.replay_from(5, 3);
        assert_eq!(entries.len(), 3);
        // replay_from always returns in get_recent order (newest-first).
        // Starting from step 5, the 3 most recent entries at or before step 5
        // are: step5, step4, step3 (going backward in time).
        assert_eq!(entries[0].step_number, 5);
        assert_eq!(entries[1].step_number, 4);
        assert_eq!(entries[2].step_number, 3);
    }

    #[test]
    fn trace_buffer_replay_from_empty() {
        let buf = TraceBuffer::new(100);
        let entries = buf.replay_from(0, 10);
        assert!(entries.is_empty());
    }

    #[test]
    fn trace_buffer_range_around() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..10u32 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i);
        }
        // range_around(5, 2) -> steps 3,4,5,6,7
        let entries = buf.range_around(5, 2);
        let steps: Vec<u64> = entries.iter().map(|e| e.step_number).collect();
        assert_eq!(steps, vec![3, 4, 5, 6, 7]);
    }

    #[test]
    fn trace_buffer_range_around_clamps_low() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..5u32 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i);
        }
        // range_around(0, 2) -> steps 0,1,2 (no negative steps)
        let entries = buf.range_around(0, 2);
        let steps: Vec<u64> = entries.iter().map(|e| e.step_number).collect();
        assert_eq!(steps, vec![0, 1, 2]);
    }

    // ── TraceBuffer: clear ─────────────────────────────────────

    #[test]
    fn trace_buffer_clear() {
        let mut buf = TraceBuffer::new(100);
        let regs = [0u32; 32];
        for i in 0..10u32 {
            buf.push_ref(&regs, 0x1000 + i, 0x10 + i);
        }
        assert_eq!(buf.len(), 10);
        assert_eq!(buf.step_counter(), 10);
        buf.clear();
        assert!(buf.is_empty());
        assert_eq!(buf.step_counter(), 0);
        // Can push again after clear
        buf.push_ref(&regs, 0x2000, 0x20);
        assert_eq!(buf.len(), 1);
        assert_eq!(buf.step_counter(), 1);
    }

    // ── TraceEntry equality ────────────────────────────────────

    #[test]
    fn trace_entry_equality() {
        let regs = [0u32; 32];
        let mut buf = TraceBuffer::new(100);
        buf.push_ref(&regs, 0x1000, 0x10);
        let entry1 = buf.get_recent(0).unwrap().clone();
        let entry2 = buf.get_recent(0).unwrap().clone();
        assert_eq!(entry1, entry2);
    }

    #[test]
    fn trace_entry_inequality_different_opcode() {
        let regs = [0u32; 32];
        let mut buf = TraceBuffer::new(100);
        buf.push_ref(&regs, 0x1000, 0x10);
        buf.push_ref(&regs, 0x1003, 0x20);
        let e1 = buf.get_recent(1).unwrap();
        let e2 = buf.get_recent(0).unwrap();
        assert_ne!(e1, e2);
    }

    // ── RenderLog: construction and operations ─────────────────

    #[test]
    fn render_log_new_empty() {
        let log = RenderLog::new(100);
        assert!(log.is_empty());
        assert_eq!(log.len(), 0);
    }

    #[test]
    fn render_log_push_and_iter() {
        let mut log = RenderLog::new(100);
        log.push(0, 0x43, "CIRCLE", &[10, 20, 5, 0xFF0000]);
        log.push(0, 0x40, "PSET", &[50, 60, 0x00FF00]);
        assert_eq!(log.len(), 2);
        let entries: Vec<_> = log.iter().collect();
        assert_eq!(entries[0].name, "CIRCLE");
        assert_eq!(entries[1].name, "PSET");
    }

    #[test]
    fn render_log_push_truncates_args() {
        let mut log = RenderLog::new(100);
        // Push 8 args, should only store 6
        log.push(0, 0x4C, "TILEMAP", &[1, 2, 3, 4, 5, 6, 7, 8]);
        let entry = log.iter().next().unwrap();
        assert_eq!(entry.argc, 6);
        assert_eq!(entry.args[5], 6);
        // 7th and 8th args should not be stored
    }

    #[test]
    fn render_log_wrap_around() {
        let mut log = RenderLog::new(3);
        log.push(0, 0x40, "PSET", &[1]);
        log.push(0, 0x41, "PSETI", &[2]);
        log.push(0, 0x42, "FILL", &[3]);
        log.push(1, 0x43, "CIRCLE", &[4]); // overwrites oldest
        assert_eq!(log.len(), 3);
        let entries: Vec<_> = log.iter().collect();
        assert_eq!(entries[0].name, "PSETI"); // oldest surviving
        assert_eq!(entries[2].name, "CIRCLE"); // newest
    }

    #[test]
    fn render_log_clear() {
        let mut log = RenderLog::new(100);
        log.push(0, 0x40, "PSET", &[1, 2, 3]);
        assert_eq!(log.len(), 1);
        log.clear();
        assert!(log.is_empty());
        assert_eq!(log.len(), 0);
    }

    // ── FrameCheckBuffer: construction and operations ───────────

    #[test]
    fn frame_check_new_empty() {
        let buf = FrameCheckBuffer::new(10);
        assert!(buf.is_empty());
        assert_eq!(buf.len(), 0);
    }

    #[test]
    fn frame_check_push_and_get_recent() {
        let mut buf = FrameCheckBuffer::new(10);
        let screen1 = vec![1u32; 256 * 256];
        let screen2 = vec![2u32; 256 * 256];
        buf.push(100, 0, &screen1);
        buf.push(200, 1, &screen2);
        assert_eq!(buf.len(), 2);
        // get_recent(0) = newest
        let newest = buf.get_recent(0).unwrap();
        assert_eq!(newest.step_number, 200);
        assert_eq!(newest.frame_count, 1);
        assert_eq!(newest.screen[0], 2);
        // get_recent(1) = oldest
        let oldest = buf.get_recent(1).unwrap();
        assert_eq!(oldest.step_number, 100);
        assert_eq!(oldest.frame_count, 0);
    }

    #[test]
    fn frame_check_wrap_around() {
        let mut buf = FrameCheckBuffer::new(2);
        let screen = vec![42u32; 256];
        buf.push(100, 0, &screen);
        buf.push(200, 1, &screen);
        buf.push(300, 2, &screen); // overwrites frame 0
        assert_eq!(buf.len(), 2);
        let newest = buf.get_recent(0).unwrap();
        assert_eq!(newest.step_number, 300);
        let oldest = buf.get_recent(1).unwrap();
        assert_eq!(oldest.step_number, 200);
    }

    #[test]
    fn frame_check_iter_oldest_to_newest() {
        let mut buf = FrameCheckBuffer::new(10);
        let screen = vec![0u32; 256];
        for i in 0..3u64 {
            buf.push(i * 100, i as u32, &screen);
        }
        let steps: Vec<u64> = buf.iter().map(|c| c.step_number).collect();
        assert_eq!(steps, vec![0, 100, 200]);
    }

    #[test]
    fn frame_check_replay_frame() {
        let mut buf = FrameCheckBuffer::new(10);
        let screen = vec![99u32; 256 * 256];
        buf.push(500, 5, &screen);
        let replayed = buf.replay_frame(0).unwrap();
        assert_eq!(replayed.len(), 256 * 256);
        assert_eq!(replayed[0], 99);
        assert!(buf.replay_frame(1).is_none());
    }

    #[test]
    fn frame_check_clear() {
        let mut buf = FrameCheckBuffer::new(10);
        let screen = vec![0u32; 256];
        buf.push(100, 0, &screen);
        buf.clear();
        assert!(buf.is_empty());
        assert!(buf.get_recent(0).is_none());
    }

    // ── PixelWriteLog: construction and operations ─────────────

    #[test]
    fn pixel_write_log_new_empty() {
        let log = PixelWriteLog::new(100);
        assert!(log.is_empty());
        assert!(!log.is_full());
        assert_eq!(log.len(), 0);
        assert_eq!(log.capacity(), 100);
    }

    #[test]
    fn pixel_write_log_push_and_get_at() {
        let mut log = PixelWriteLog::new(100);
        log.push(10, 20, 1000, 0x40, 0xFF0000);
        log.push(30, 40, 1001, 0x41, 0x00FF00);
        assert_eq!(log.len(), 2);
        let e0 = log.get_at(0).unwrap();
        assert_eq!(e0.x, 10);
        assert_eq!(e0.y, 20);
        assert_eq!(e0.step(), 1000);
        assert_eq!(e0.opcode, 0x40);
        assert_eq!(e0.color, 0xFF0000);
    }

    #[test]
    fn pixel_write_log_step_u64() {
        let mut log = PixelWriteLog::new(100);
        let big_step: u64 = 0x1_0000_0005; // exceeds u32
        log.push(0, 0, big_step, 0x40, 0);
        let entry = log.get_at(0).unwrap();
        assert_eq!(entry.step(), big_step);
        assert_eq!(entry.step_lo, 5);
        assert_eq!(entry.step_hi, 1);
    }

    #[test]
    fn pixel_write_log_count_at() {
        let mut log = PixelWriteLog::new(100);
        log.push(10, 20, 1, 0x40, 0xFF0000);
        log.push(10, 20, 2, 0x41, 0x00FF00);
        log.push(30, 40, 3, 0x40, 0x0000FF);
        assert_eq!(log.count_at(10, 20), 2);
        assert_eq!(log.count_at(30, 40), 1);
        assert_eq!(log.count_at(50, 60), 0);
    }

    #[test]
    fn pixel_write_log_recent_at() {
        let mut log = PixelWriteLog::new(100);
        log.push(10, 20, 1, 0x40, 0xFF0000);
        log.push(10, 20, 2, 0x41, 0x00FF00);
        log.push(10, 20, 3, 0x40, 0x0000FF);
        log.push(30, 40, 4, 0x40, 0xFFFFFF);
        let recent = log.recent_at(10, 20, 2);
        assert_eq!(recent.len(), 2);
        // newest first
        assert_eq!(recent[0].step(), 3);
        assert_eq!(recent[1].step(), 2);
    }

    #[test]
    fn pixel_write_log_wrap_and_is_full() {
        let mut log = PixelWriteLog::new(3);
        log.push(0, 0, 1, 0x40, 1);
        log.push(1, 1, 2, 0x40, 2);
        log.push(2, 2, 3, 0x40, 3);
        assert!(log.is_full());
        log.push(3, 3, 4, 0x40, 4); // evicts step 1
        assert_eq!(log.len(), 3);
        let oldest = log.get_at(0).unwrap();
        assert_eq!(oldest.step(), 2); // step 1 was evicted
    }

    #[test]
    fn pixel_write_log_iter_oldest_to_newest() {
        let mut log = PixelWriteLog::new(100);
        for i in 0..5u64 {
            log.push(i as u16, (i as u16) * 10, i * 100, 0x40, i as u32);
        }
        let steps: Vec<u64> = log.iter().map(|e| e.step()).collect();
        assert_eq!(steps, vec![0, 100, 200, 300, 400]);
    }

    #[test]
    fn pixel_write_log_iter_rev_newest_to_oldest() {
        let mut log = PixelWriteLog::new(100);
        for i in 0..5u64 {
            log.push(i as u16, 0, i * 100, 0x40, 0);
        }
        let steps: Vec<u64> = log.iter_rev().map(|e| e.step()).collect();
        assert_eq!(steps, vec![400, 300, 200, 100, 0]);
    }

    #[test]
    fn pixel_write_log_clear() {
        let mut log = PixelWriteLog::new(100);
        log.push(0, 0, 1, 0x40, 0);
        log.push(1, 1, 2, 0x40, 0);
        log.clear();
        assert!(log.is_empty());
        assert_eq!(log.len(), 0);
    }

    #[test]
    fn pixel_write_entry_equality() {
        let e1 = PixelWriteEntry { x: 10, y: 20, step_lo: 100, step_hi: 0, opcode: 0x40, color: 0xFF0000 };
        let e2 = PixelWriteEntry { x: 10, y: 20, step_lo: 100, step_hi: 0, opcode: 0x40, color: 0xFF0000 };
        assert_eq!(e1, e2);
    }

    #[test]
    fn pixel_write_entry_inequality() {
        let e1 = PixelWriteEntry { x: 10, y: 20, step_lo: 100, step_hi: 0, opcode: 0x40, color: 0xFF0000 };
        let e2 = PixelWriteEntry { x: 10, y: 20, step_lo: 100, step_hi: 0, opcode: 0x40, color: 0x00FF00 };
        assert_ne!(e1, e2);
    }

    // ── Constants ──────────────────────────────────────────────

    #[test]
    fn trace_constants_are_reasonable() {
        assert!(DEFAULT_TRACE_CAPACITY >= 1000);
        assert!(DEFAULT_RENDER_LOG_CAPACITY >= 100);
        assert!(DEFAULT_FRAME_CHECK_CAPACITY >= 10);
        assert!(MAX_SNAPSHOTS >= 4);
        assert!(DEFAULT_PIXEL_WRITE_CAPACITY >= 10000);
    }
}

// Helper: push method that takes &[u32; 32] directly (avoids constructing full Vm)
impl TraceBuffer {
    #[cfg(test)]
    fn push_ref(&mut self, regs: &[u32; 32], pc: u32, opcode: u32) {
        self.push(pc, regs, opcode);
    }
}
