// riscv/block_cache.rs -- Basic Block Cache for RISC-V interpreter
//
// Caches decoded instruction sequences ("basic blocks") keyed by physical address.
// A basic block ends at any branch, jump, system instruction, or page boundary.
// On cache hit, the interpreter skips fetch/decode/MMU-translate for every
// instruction in the block, running them in a tight loop.
//
// Invalidation triggers:
//   - TLB flush (SFENCE.VMA, SATP write)
//   - Privilege change (block decoded at M-mode can't be used at S-mode)

use super::bus::Bus;
use super::cpu::{RiscvCpu, StepResult};
use super::decode::{self, Operation};
use std::collections::HashMap;

/// Maximum instructions in a single basic block.
/// Most blocks are 5-30 instructions (straight-line code until branch/jump).
const MAX_BLOCK_LEN: usize = 32;
/// Maximum number of cached blocks.
const MAX_CACHE_ENTRIES: usize = 4096;

/// A decoded instruction within a basic block.
#[derive(Clone, Copy, Debug)]
pub struct DecodedInst {
    pub op: Operation,
    pub inst_len: u32,
    /// Virtual address of this instruction (needed for PC-relative ops).
    pub va: u32,
}

/// A basic block: a sequence of decoded instructions from one physical address
/// up to the first terminator (branch/jump/system/invalid).
#[derive(Clone, Debug)]
pub struct BasicBlock {
    /// Decoded instructions in execution order.
    pub insts: Vec<DecodedInst>,
    /// Privilege level when this block was decoded.
    pub privilege: super::cpu::Privilege,
    /// TLB flush sequence at compile time. If TLB was flushed since,
    /// the cached physical addresses may be stale.
    pub tlb_seq: u64,
}

/// Result of attempting to execute from the block cache.
#[derive(Debug)]
pub enum CacheExecResult {
    /// Executed the block (or part of it).
    Executed(StepResult),
    /// Cache miss -- caller should fall back to normal step().
    Miss,
}

/// Basic block cache.
pub struct BlockCache {
    /// Cached blocks keyed by physical address of the first instruction.
    blocks: HashMap<u64, BasicBlock>,
    /// Whether block caching is active. Defaults to false; enable for Linux boot.
    pub enabled: bool,
    /// Diagnostics.
    pub compile_count: u64,
    pub hit_count: u64,
    pub miss_count: u64,
}

impl BlockCache {
    pub fn new() -> Self {
        Self {
            blocks: HashMap::new(),
            enabled: false,
            compile_count: 0,
            hit_count: 0,
            miss_count: 0,
        }
    }

    /// Invalidate all cached blocks (called on explicit cache flush).
    pub fn invalidate(&mut self) {
        self.blocks.clear();
    }

    /// Compile a basic block starting at the given physical address.
    fn compile_block(
        start_pa: u64,
        start_va: u32,
        privilege: super::cpu::Privilege,
        bus: &mut Bus,
        tlb_seq: u64,
    ) -> Option<BasicBlock> {
        let mut insts = Vec::with_capacity(16);
        let mut pa = start_pa;
        let mut va = start_va;

        for _ in 0..MAX_BLOCK_LEN {
            let word = match bus.read_word(pa) {
                Ok(w) => w,
                Err(_) => break,
            };

            let halfword = (word & 0xFFFF) as u16;
            let (op, inst_len) = if decode::is_compressed(halfword) {
                (decode::decode_c(halfword), 2u32)
            } else {
                (decode::decode(word), 4u32)
            };

            insts.push(DecodedInst { op, inst_len, va });

            if is_terminator(&op) {
                break;
            }

            let next_pa = pa + inst_len as u64;
            let next_va = va.wrapping_add(inst_len);
            // Stop at page boundary (4K)
            if (pa & 0xFFF) > (next_pa & 0xFFF) && (next_pa & 0xFFF) != 0 {
                break;
            }
            pa = next_pa;
            va = next_va;
        }

        if insts.is_empty() {
            return None;
        }

        Some(BasicBlock {
            insts,
            privilege,
            tlb_seq,
        })
    }

    /// Execute a cached block in a tight loop. Takes the instruction list by value
    /// to avoid holding a reference into the cache while mutating cpu/bus.
    fn run_block(insts: &[DecodedInst], cpu: &mut RiscvCpu, bus: &mut Bus) -> StepResult {
        for inst in insts {
            cpu.pc = inst.va;
            let result = cpu.execute(inst.op, bus, inst.inst_len);

            match &result {
                StepResult::Ok => {},
                _ => return result,
            }

            // If PC was changed (branch/jump taken), stop the block.
            let expected_next = inst.va.wrapping_add(inst.inst_len);
            if cpu.pc != expected_next {
                return StepResult::Ok;
            }
        }
        StepResult::Ok
    }

    /// Try to execute from the block cache.
    /// On Miss, compiles a new block and tries again.
    pub fn execute(&mut self, cpu: &mut RiscvCpu, bus: &mut Bus) -> CacheExecResult {
        if !self.enabled {
            return CacheExecResult::Miss;
        }

        // Check for pending interrupts before executing cached code.
        // Without this, tight loops (like the kernel idle loop) are cached
        // and replayed indefinitely without ever delivering interrupts.
        if cpu.csr.pending_interrupt(cpu.privilege).is_some() {
            return CacheExecResult::Miss;
        }

        let va = cpu.pc;
        let pa = match cpu.translate_va(va, super::mmu::AccessType::Fetch, bus) {
            Ok(pa) => pa,
            Err(_) => return CacheExecResult::Miss,
        };

        let cur_tlb_seq = cpu.tlb.flush_seq;
        let privilege = cpu.privilege;

        // Check cache -- clone the instruction list to release the borrow
        // before calling run_block (which mutates cpu and bus).
        if let Some(block) = self.blocks.get(&pa) {
            if block.tlb_seq == cur_tlb_seq && block.privilege == privilege {
                self.hit_count += 1;
                let insts = block.insts.clone();
                let result = Self::run_block(&insts, cpu, bus);
                return CacheExecResult::Executed(result);
            }
        }

        // Cache miss -- compile a new block
        self.miss_count += 1;
        if let Some(block) = Self::compile_block(pa, va, privilege, bus, cur_tlb_seq) {
            self.compile_count += 1;

            if self.blocks.len() >= MAX_CACHE_ENTRIES {
                // Evict blocks from older TLB generations
                self.blocks.retain(|_, b| b.tlb_seq == cur_tlb_seq);
                if self.blocks.len() >= MAX_CACHE_ENTRIES {
                    self.blocks.clear();
                }
            }

            let insts = block.insts.clone();
            self.blocks.insert(pa, block);

            let result = Self::run_block(&insts, cpu, bus);
            return CacheExecResult::Executed(result);
        }

        CacheExecResult::Miss
    }

    /// Returns (hits, misses, compiles, cached_block_count).
    pub fn stats(&self) -> (u64, u64, u64, usize) {
        (
            self.hit_count,
            self.miss_count,
            self.compile_count,
            self.blocks.len(),
        )
    }
}

/// Returns true if this operation ends a basic block.
#[inline]
fn is_terminator(op: &Operation) -> bool {
    matches!(
        op,
        Operation::Beq { .. }
            | Operation::Bne { .. }
            | Operation::Blt { .. }
            | Operation::Bge { .. }
            | Operation::Bltu { .. }
            | Operation::Bgeu { .. }
            | Operation::Jal { .. }
            | Operation::Jalr { .. }
            | Operation::Ecall
            | Operation::Ebreak
            | Operation::Mret
            | Operation::Sret
            | Operation::Fence
            | Operation::SfenceVma { .. }
            | Operation::Csrrw { .. }
            | Operation::Csrrs { .. }
            | Operation::Csrrc { .. }
            | Operation::Csrrwi { .. }
            | Operation::Csrrsi { .. }
            | Operation::Csrrci { .. }
            | Operation::Invalid(_)
    )
}
