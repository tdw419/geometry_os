// riscv/plic.rs -- Platform-Level Interrupt Controller (Phase 36)
//
// Emulates a SiFive-style PLIC with dual contexts per hart (M-mode + S-mode).
// Supports up to 32 interrupt sources with configurable priority,
// enable bits, threshold, and claim/complete mechanism.
//
// MMIO address map (base at 0x0C00_0000, matching QEMU virt):
//   0x0C00_0000 - 0x0C00_007C  Priority registers (32 x 4 bytes, src 0-31)
//   0x0C00_1000               Interrupt pending bit 0-31
//   0x0C00_2000               Enable bits for context 0 (M-mode, hart 0)
//   0x0C00_2080               Enable bits for context 1 (S-mode, hart 0)
//   0x0C20_0000               Priority threshold (context 0, M-mode)
//   0x0C20_0004               Claim/Complete (context 0, M-mode)
//   0x0C20_1000               Priority threshold (context 1, S-mode)
//   0x0C20_1004               Claim/Complete (context 1, S-mode)
//
// Context layout matches QEMU virt machine: enable_stride=0x80, context_stride=0x1000.

/// PLIC MMIO base address.
pub const PLIC_BASE: u64 = 0x0C00_0000;
/// PLIC MMIO size (2MB region).
pub const PLIC_SIZE: u64 = 0x0020_0000;

/// Maximum number of interrupt sources.
const MAX_SOURCES: usize = 32;

/// Number of contexts per hart (M-mode + S-mode).
const NUM_CONTEXTS: usize = 2;

/// Priority register base (source 0 through 31, 4 bytes each).
const PRIORITY_BASE: u64 = 0x0C00_0000;
/// Pending register base (bitfield, 0x1000 offset).
const PENDING_BASE: u64 = 0x0C00_1000;
/// Enable register base for context 0 (0x2000 offset).
const ENABLE_BASE: u64 = 0x0C00_2000;
/// Stride between enable regions for each context (128 bytes, matches QEMU virt).
const ENABLE_STRIDE: u64 = 0x80;
/// Context register base (threshold + claim/complete for context 0).
const CONTEXT_BASE: u64 = 0x0C20_0000;
/// Stride between context regions (4096 bytes, matches QEMU virt).
const CONTEXT_STRIDE: u64 = 0x1000;
/// Offset of threshold register within a context region.
const THRESHOLD_OFFSET: u64 = 0x0;
/// Offset of claim/complete register within a context region.
const CLAIM_OFFSET: u64 = 0x4;

/// External interrupt source IDs.
pub const IRQ_UART: u32 = 10; // UART interrupt (matches QEMU virt)
pub const IRQ_VIRTIO: u32 = 1; // Virtio block device interrupt
pub const IRQ_VIRTIO_NET: u32 = 2; // Virtio network device interrupt
pub const IRQ_VIRTIO_GPU: u32 = 3; // Virtio GPU device interrupt
pub const IRQ_SPI_SD: u32 = 4; // SPI SD card controller interrupt
pub const IRQ_VIRTIO_SERIAL: u32 = 5; // Virtio serial console interrupt

/// Context index constants.
pub const CTX_MMODE: usize = 0;
pub const CTX_SMODE: usize = 1;

/// Per-context PLIC state.
#[derive(Clone, Debug)]
pub struct PlicContext {
    /// Enable bits (bit N = source N enabled for this context).
    pub enable: u32,
    /// Priority threshold (interrupts at or below this priority are masked).
    pub threshold: u32,
}

impl Default for PlicContext {
    fn default() -> Self {
        Self::new()
    }
}

impl PlicContext {
    pub fn new() -> Self {
        Self {
            enable: 0,
            threshold: 0,
        }
    }
}

/// PLIC state with M-mode and S-mode contexts.
#[derive(Clone, Debug)]
pub struct Plic {
    /// Priority for each interrupt source (0 = disabled, 1-7 = priority).
    pub priority: [u32; MAX_SOURCES],
    /// Pending bits (bit N = source N pending). Shared across all contexts.
    pub pending: u32,
    /// Per-context state: context 0 = M-mode, context 1 = S-mode.
    pub contexts: [PlicContext; NUM_CONTEXTS],
}

impl Default for Plic {
    fn default() -> Self {
        Self::new()
    }
}

impl Plic {
    /// Create a new PLIC with all interrupts disabled and zero priorities.
    pub fn new() -> Self {
        Self {
            priority: [0u32; MAX_SOURCES],
            pending: 0,
            contexts: [PlicContext::new(), PlicContext::new()],
        }
    }

    /// Check if address is in PLIC range.
    pub fn contains(addr: u64) -> bool {
        (PLIC_BASE..PLIC_BASE + PLIC_SIZE).contains(&addr)
    }

    /// Resolve an MMIO address to a context index and register type.
    /// Returns None if the address doesn't map to a known register.
    fn resolve_addr(addr: u64) -> Option<PlicRegister> {
        // Priority registers: 0x0C00_0000 + src*4
        if addr >= PRIORITY_BASE && addr < PRIORITY_BASE + (MAX_SOURCES as u64) * 4 {
            let idx = ((addr - PRIORITY_BASE) / 4) as usize;
            if idx < MAX_SOURCES {
                return Some(PlicRegister::Priority(idx));
            }
        }

        // Pending register: 0x0C00_1000
        if addr == PENDING_BASE {
            return Some(PlicRegister::Pending);
        }

        // Enable registers: 0x0C00_2000 + ctx*0x80
        if addr >= ENABLE_BASE {
            let offset = addr - ENABLE_BASE;
            let ctx = (offset / ENABLE_STRIDE) as usize;
            let within = offset % ENABLE_STRIDE;
            if ctx < NUM_CONTEXTS && within == 0 {
                return Some(PlicRegister::Enable(ctx));
            }
        }

        // Context registers: 0x0C20_0000 + ctx*0x1000 + {0=threshold, 4=claim}
        if addr >= CONTEXT_BASE {
            let offset = addr - CONTEXT_BASE;
            let ctx = (offset / CONTEXT_STRIDE) as usize;
            let within = offset % CONTEXT_STRIDE;
            if ctx < NUM_CONTEXTS {
                return match within {
                    THRESHOLD_OFFSET => Some(PlicRegister::Threshold(ctx)),
                    CLAIM_OFFSET => Some(PlicRegister::Claim(ctx)),
                    _ => None,
                };
            }
        }

        None
    }

    /// Read a 32-bit word from PLIC MMIO space.
    /// Takes &mut self because claim reads clear the pending bit.
    pub fn read(&mut self, addr: u64) -> Option<u32> {
        match Self::resolve_addr(addr)? {
            PlicRegister::Priority(idx) => Some(self.priority[idx]),
            PlicRegister::Pending => Some(self.pending),
            PlicRegister::Enable(ctx) => Some(self.contexts[ctx].enable),
            PlicRegister::Threshold(ctx) => Some(self.contexts[ctx].threshold),
            PlicRegister::Claim(ctx) => Some(self.claim(ctx)),
        }
    }

    /// Write a 32-bit word to PLIC MMIO space.
    pub fn write(&mut self, addr: u64, val: u32) -> bool {
        match Self::resolve_addr(addr) {
            Some(PlicRegister::Priority(idx)) => {
                if idx < MAX_SOURCES {
                    self.priority[idx] = val & 0x07; // Priority 0-7
                    return true;
                }
            },
            Some(PlicRegister::Pending) => {
                // Pending is read-only (set by devices, cleared by claim/complete).
                return true;
            },
            Some(PlicRegister::Enable(ctx)) => {
                self.contexts[ctx].enable = val;
                return true;
            },
            Some(PlicRegister::Threshold(ctx)) => {
                self.contexts[ctx].threshold = val & 0x07;
                return true;
            },
            Some(PlicRegister::Claim(ctx)) => {
                // Complete: write the IRQ ID to acknowledge.
                self.complete(val, ctx);
                return true;
            },
            None => {},
        }
        false
    }

    /// Claim the highest-priority enabled pending interrupt for a given context.
    /// Returns 0 if no interrupt is pending/enabled or all are below threshold.
    /// Per PLIC spec, claiming clears the pending bit for the claimed IRQ globally.
    pub fn claim(&mut self, ctx: usize) -> u32 {
        let best_irq = self.find_best_irq(ctx);
        if best_irq > 0 {
            // Clear pending globally (PLIC spec: claim atomically clears pending).
            self.pending &= !(1 << best_irq);
        }
        best_irq
    }

    /// Complete (acknowledge) an interrupt for a given context.
    /// Clears the pending bit for the source.
    pub fn complete(&mut self, irq: u32, _ctx: usize) {
        if irq > 0 && (irq as usize) < MAX_SOURCES {
            self.pending &= !(1 << irq);
        }
    }

    /// Signal an interrupt from a device.
    /// Sets the pending bit for the given source.
    pub fn signal(&mut self, irq: u32) {
        if irq > 0 && (irq as usize) < MAX_SOURCES {
            self.pending |= 1 << irq;
        }
    }

    /// Check if there is an enabled, pending interrupt above threshold for any context.
    /// Returns Some(irq) if so. Does NOT claim or clear pending.
    /// This checks the M-mode context for backward compatibility.
    pub fn pending_interrupt(&self) -> Option<u32> {
        self.pending_interrupt_ctx(CTX_MMODE)
    }

    /// Check if there is an enabled, pending interrupt for a specific context.
    pub fn pending_interrupt_ctx(&self, ctx: usize) -> Option<u32> {
        let irq = self.find_best_irq(ctx);
        if irq > 0 {
            Some(irq)
        } else {
            None
        }
    }

    /// Find the highest-priority enabled pending interrupt for a given context.
    fn find_best_irq(&self, ctx: usize) -> u32 {
        let c = &self.contexts[ctx];
        let mut best_irq: u32 = 0;
        let mut best_pri: u32 = 0;
        for i in 1..MAX_SOURCES {
            if (self.pending & (1 << i)) != 0 && (c.enable & (1 << i)) != 0 {
                let pri = self.priority[i];
                if pri > 0 && pri > best_pri && pri > c.threshold {
                    best_irq = i as u32;
                    best_pri = pri;
                }
            }
        }
        best_irq
    }
}

/// Resolved PLIC register target for an MMIO address.
#[derive(Debug, Clone, Copy)]
enum PlicRegister {
    Priority(usize),
    Pending,
    Enable(usize),
    Threshold(usize),
    Claim(usize),
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn new_plic_defaults() {
        let plic = Plic::new();
        assert_eq!(plic.priority, [0u32; MAX_SOURCES]);
        assert_eq!(plic.pending, 0);
        assert_eq!(plic.contexts[CTX_MMODE].enable, 0);
        assert_eq!(plic.contexts[CTX_SMODE].enable, 0);
        assert_eq!(plic.contexts[CTX_MMODE].threshold, 0);
        assert_eq!(plic.contexts[CTX_SMODE].threshold, 0);
    }

    #[test]
    fn signal_sets_pending() {
        let mut plic = Plic::new();
        plic.signal(IRQ_UART);
        assert_ne!(plic.pending & (1 << IRQ_UART), 0);
    }

    #[test]
    fn claim_m_mode_returns_highest_priority() {
        let mut plic = Plic::new();
        plic.priority[1] = 2;
        plic.priority[2] = 5;
        plic.contexts[CTX_MMODE].enable = (1 << 1) | (1 << 2);
        plic.signal(1);
        plic.signal(2);
        assert_eq!(plic.claim(CTX_MMODE), 2); // Higher priority
    }

    #[test]
    fn claim_s_mode_returns_highest_priority() {
        let mut plic = Plic::new();
        plic.priority[1] = 2;
        plic.priority[2] = 5;
        plic.contexts[CTX_SMODE].enable = (1 << 1) | (1 << 2);
        plic.signal(1);
        plic.signal(2);
        assert_eq!(plic.claim(CTX_SMODE), 2); // Higher priority
    }

    #[test]
    fn claim_returns_zero_if_disabled() {
        let mut plic = Plic::new();
        plic.priority[1] = 5;
        plic.signal(1);
        assert_eq!(plic.claim(CTX_MMODE), 0); // Not enabled
        assert_eq!(plic.claim(CTX_SMODE), 0);
    }

    #[test]
    fn claim_respects_threshold() {
        let mut plic = Plic::new();
        plic.priority[1] = 3;
        plic.contexts[CTX_MMODE].enable = 1 << 1;
        plic.contexts[CTX_MMODE].threshold = 4; // Threshold higher than priority
        plic.signal(1);
        assert_eq!(plic.claim(CTX_MMODE), 0);
    }

    #[test]
    fn claim_s_mode_respects_threshold() {
        let mut plic = Plic::new();
        plic.priority[1] = 3;
        plic.contexts[CTX_SMODE].enable = 1 << 1;
        plic.contexts[CTX_SMODE].threshold = 4;
        plic.signal(1);
        assert_eq!(plic.claim(CTX_SMODE), 0);
    }

    #[test]
    fn complete_clears_pending() {
        let mut plic = Plic::new();
        plic.signal(1);
        plic.complete(1, CTX_MMODE);
        assert_eq!(plic.pending & (1 << 1), 0);
    }

    #[test]
    fn read_write_priority() {
        let mut plic = Plic::new();
        plic.write(PRIORITY_BASE + 4, 5); // Source 1 priority
        assert_eq!(plic.read(PRIORITY_BASE + 4), Some(5));
    }

    #[test]
    fn read_write_enable_m_mode() {
        let mut plic = Plic::new();
        plic.write(ENABLE_BASE, 0xFFFF); // Context 0 (M-mode)
        assert_eq!(plic.read(ENABLE_BASE), Some(0xFFFF));
    }

    #[test]
    fn read_write_enable_s_mode() {
        let mut plic = Plic::new();
        let smode_enable = ENABLE_BASE + ENABLE_STRIDE; // 0x0C00_2080
        plic.write(smode_enable, 0xFF00); // Context 1 (S-mode)
        assert_eq!(plic.read(smode_enable), Some(0xFF00));
    }

    #[test]
    fn read_write_threshold_m_mode() {
        let mut plic = Plic::new();
        plic.write(CONTEXT_BASE + THRESHOLD_OFFSET, 3); // M-mode threshold
        assert_eq!(plic.read(CONTEXT_BASE + THRESHOLD_OFFSET), Some(3));
    }

    #[test]
    fn read_write_threshold_s_mode() {
        let mut plic = Plic::new();
        let s_thresh = CONTEXT_BASE + CONTEXT_STRIDE + THRESHOLD_OFFSET; // 0x0C20_1000
        plic.write(s_thresh, 5);
        assert_eq!(plic.read(s_thresh), Some(5));
    }

    #[test]
    fn claim_via_mmio_m_mode() {
        let mut plic = Plic::new();
        plic.priority[IRQ_UART as usize] = 5;
        plic.contexts[CTX_MMODE].enable = 1 << IRQ_UART;
        plic.signal(IRQ_UART);
        assert_eq!(plic.read(CONTEXT_BASE + CLAIM_OFFSET), Some(IRQ_UART));
    }

    #[test]
    fn claim_via_mmio_s_mode() {
        let mut plic = Plic::new();
        plic.priority[IRQ_UART as usize] = 5;
        plic.contexts[CTX_SMODE].enable = 1 << IRQ_UART;
        plic.signal(IRQ_UART);
        let s_claim = CONTEXT_BASE + CONTEXT_STRIDE + CLAIM_OFFSET; // 0x0C20_1004
        assert_eq!(plic.read(s_claim), Some(IRQ_UART));
    }

    #[test]
    fn complete_via_mmio() {
        let mut plic = Plic::new();
        plic.signal(IRQ_UART);
        plic.write(CONTEXT_BASE + CLAIM_OFFSET, IRQ_UART);
        assert_eq!(plic.pending & (1 << IRQ_UART), 0);
    }

    #[test]
    fn pending_interrupt_convenience() {
        let mut plic = Plic::new();
        assert!(plic.pending_interrupt().is_none());
        plic.priority[1] = 5;
        plic.contexts[CTX_MMODE].enable = 1 << 1;
        plic.signal(1);
        assert_eq!(plic.pending_interrupt(), Some(1));
    }

    #[test]
    fn pending_interrupt_s_mode() {
        let mut plic = Plic::new();
        assert!(plic.pending_interrupt_ctx(CTX_SMODE).is_none());
        plic.priority[1] = 5;
        plic.contexts[CTX_SMODE].enable = 1 << 1;
        plic.signal(1);
        assert_eq!(plic.pending_interrupt_ctx(CTX_SMODE), Some(1));
    }

    #[test]
    fn priority_masked_to_3_bits() {
        let mut plic = Plic::new();
        plic.write(PRIORITY_BASE + 4, 0xFF);
        assert_eq!(plic.read(PRIORITY_BASE + 4), Some(0x07));
    }

    #[test]
    fn source_0_not_interruptible() {
        let mut plic = Plic::new();
        plic.priority[0] = 7;
        plic.contexts[CTX_MMODE].enable = 1;
        plic.signal(0);
        // Source 0 is reserved (no interrupt), claim should skip it
        assert_eq!(plic.claim(CTX_MMODE), 0);
    }

    #[test]
    fn claim_clears_pending_globally() {
        // If both contexts have the same IRQ enabled, a claim from one
        // clears pending globally — the other can't claim it anymore.
        let mut plic = Plic::new();
        plic.priority[1] = 5;
        plic.contexts[CTX_MMODE].enable = 1 << 1;
        plic.contexts[CTX_SMODE].enable = 1 << 1;
        plic.signal(1);

        // M-mode claims first — gets the interrupt
        assert_eq!(plic.claim(CTX_MMODE), 1);
        // Pending is now clear, so S-mode can't claim
        assert_eq!(plic.claim(CTX_SMODE), 0);
    }

    #[test]
    fn contexts_independent_enable() {
        // Each context can enable/disable sources independently.
        let mut plic = Plic::new();
        plic.priority[1] = 5;
        plic.priority[2] = 3;
        plic.contexts[CTX_MMODE].enable = 1 << 1; // M-mode: only IRQ 1
        plic.contexts[CTX_SMODE].enable = 1 << 2; // S-mode: only IRQ 2
        plic.signal(1);
        plic.signal(2);

        // M-mode sees only IRQ 1
        assert_eq!(plic.pending_interrupt_ctx(CTX_MMODE), Some(1));
        // S-mode sees only IRQ 2
        assert_eq!(plic.pending_interrupt_ctx(CTX_SMODE), Some(2));
    }

    #[test]
    fn backward_compat_single_context_api() {
        // Verify the old single-context API still works (maps to CTX_MMODE).
        let mut plic = Plic::new();
        plic.priority[1] = 5;
        plic.write(ENABLE_BASE, 1 << 1); // Old-style enable write
        assert_eq!(plic.contexts[CTX_MMODE].enable, 1 << 1);
        plic.signal(1);
        assert_eq!(plic.pending_interrupt(), Some(1));
    }
}
