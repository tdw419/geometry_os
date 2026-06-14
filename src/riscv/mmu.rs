use super::{loader, memory};
use crate::riscv::bus::Bus;
use crate::riscv::cpu::Privilege;

// PTE flags
pub const PTE_V: u32 = 1 << 0;
pub const PTE_R: u32 = 1 << 1;
pub const PTE_W: u32 = 1 << 2;
pub const PTE_X: u32 = 1 << 3;
pub const PTE_U: u32 = 1 << 4;
pub const PTE_G: u32 = 1 << 5;
pub const PTE_A: u32 = 1 << 6;
pub const PTE_D: u32 = 1 << 7;

/// Size of the scratch page pool reserved at the end of RAM for vmalloc fallback.
/// The DTB reports RAM as (total - this) so the kernel won't touch these pages.
pub const VMALLOC_SCRATCH_POOL_SIZE: u64 = 2 * 1024 * 1024; // 2MB = 512 pages

#[derive(Debug, Clone, Copy, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub enum AccessType {
    Fetch,
    Load,
    Store,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TranslateResult {
    Ok(u64),
    FetchFault,
    LoadFault,
    StoreFault,
}

#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
#[serde(tag = "type")]
pub enum MmuEvent {
    PageTableWalk {
        va: u32,
        pa: u64,
        ptes: Vec<u32>,
    },
    PageFault {
        va: u32,
        access: AccessType,
        ptes: Vec<u32>,
    },
    SatpWrite {
        old: u32,
        new: u32,
    },
}

#[derive(Debug, Clone, Copy, Default)]
struct TlbEntry {
    vpn: u32,
    asid: u32,
    ppn: u32,
    flags: u32,
    valid: bool,
}

#[derive(Debug, Clone)]
pub struct Tlb {
    entries: [TlbEntry; 512],
    /// Monotonically increasing counter bumped on every flush.
    /// Block cache reads this to detect stale cached blocks.
    pub flush_seq: u64,
}

impl Tlb {
    pub fn new() -> Self {
        Self {
            entries: [TlbEntry::default(); 512],
            flush_seq: 0,
        }
    }

    #[inline]
    pub fn lookup(&self, combined_vpn: u32, asid: u32) -> Option<(u32, u32)> {
        let index = (combined_vpn % 512) as usize;
        let entry = &self.entries[index];

        if entry.valid && entry.vpn == combined_vpn {
            // Match if ASID matches OR if page is Global (flags & PTE_G)
            if (entry.flags & PTE_G) != 0 || entry.asid == asid {
                return Some((entry.ppn, entry.flags));
            }
        }
        None
    }

    pub fn insert(&mut self, combined_vpn: u32, asid: u32, ppn: u32, flags: u32) {
        let index = (combined_vpn % 512) as usize;
        self.entries[index] = TlbEntry {
            vpn: combined_vpn,
            asid,
            ppn,
            flags,
            valid: true,
        };
    }

    pub fn flush_all(&mut self) {
        self.flush_seq = self.flush_seq.wrapping_add(1);
        for entry in self.entries.iter_mut() {
            entry.valid = false;
        }
    }

    pub fn flush_asid(&mut self, asid: u32) {
        self.flush_seq = self.flush_seq.wrapping_add(1);
        for entry in self.entries.iter_mut() {
            if entry.valid && (entry.flags & PTE_G) == 0 && entry.asid == asid {
                entry.valid = false;
            }
        }
    }

    pub fn flush_va(&mut self, vpn: u32, _asid: u32) {
        self.flush_seq = self.flush_seq.wrapping_add(1);
        let index = (vpn % 512) as usize;
        let entry = &mut self.entries[index];
        if entry.valid && entry.vpn == vpn {
            entry.valid = false;
        }
    }

    pub fn flush_va_asid(&mut self, vpn: u32, asid: u32) {
        self.flush_va(vpn, asid);
    }

    pub fn valid_count(&self) -> usize {
        self.entries.iter().filter(|e| e.valid).count()
    }
}

pub fn satp_ppn(satp: u32) -> u32 {
    satp & 0x003F_FFFF
}
pub fn satp_asid(satp: u32) -> u32 {
    (satp >> 22) & 0x1FF
}
pub fn satp_mode_enabled(satp: u32) -> bool {
    (satp >> 31) != 0
}
pub fn va_vpn1(va: u32) -> u32 {
    (va >> 22) & 0x3FF
}
pub fn va_vpn0(va: u32) -> u32 {
    (va >> 12) & 0x3FF
}
pub fn va_offset(va: u32) -> u32 {
    va & 0xFFF
}
pub fn va_to_vpn(va: u32) -> u32 {
    va >> 12
}
pub fn pte_ppn(pte: u32) -> u32 {
    (pte >> 10) & 0x003F_FFFF
}

pub fn translate(
    va: u32,
    access_type: AccessType,
    effective_priv: Privilege,
    sum: bool,
    mxr: bool,
    satp: u32,
    bus: &mut Bus,
    tlb: &mut Tlb,
) -> TranslateResult {
    if !satp_mode_enabled(satp) || effective_priv == Privilege::Machine {
        // Debug: catch identity-mapped vmalloc accesses from M-mode
        let vpn1_check = va >> 22;
        if vpn1_check >= 512 && bus.mmu_debug_trace {
            eprintln!(
                "[mmu-debug] VA 0x{:08X} IDENTITY MAP: satp_mode={} priv={:?} -- returning pa=va!",
                va,
                satp_mode_enabled(satp),
                effective_priv
            );
        }
        return TranslateResult::Ok(va as u64);
    }

    let asid = satp_asid(satp);
    let combined_vpn = va_to_vpn(va);
    // Debug: catch any translate returning PA >= 0xA0000000 for VA in vmalloc range
    let vpn1_debug = va >> 22;

    if let Some((ppn, flags)) = tlb.lookup(combined_vpn, asid) {
        // Debug: log TLB hits for vmalloc region
        if vpn1_debug >= 512 && bus.mmu_debug_trace {
            let pa = ((ppn as u64) << 12) | (va_offset(va) as u64);
            eprintln!(
                "[mmu-debug] VA 0x{:08X} TLB HIT: ppn=0x{:05X} pa=0x{:08X} flags=0x{:02X} asid={}",
                va, ppn, pa, flags, asid
            );
        }
        if let Some(fault) = check_permissions(
            va,
            flags,
            access_type,
            effective_priv,
            sum,
            mxr,
            Vec::new(),
            bus,
        ) {
            return fault;
        }
        let pa = ((ppn as u64) << 12) | (va_offset(va) as u64);
        return TranslateResult::Ok(pa);
    }

    let vpn1 = va_vpn1(va);
    let vpn0 = va_vpn0(va);
    let offset = va_offset(va);
    let root_ppn = satp_ppn(satp);
    let root_addr = (root_ppn as u64) << 12;

    let page_offset_ppn: u32 = 0xC000_0000 >> 12;
    let ram_base_ppn: u32 = (bus.mem.ram_base >> 12) as u32;
    let ram_end_ppn: u32 = ram_base_ppn + (bus.mem.size() >> 12) as u32;
    let do_fixup = bus.auto_pte_fixup;

    let fixup_ppn = |ppn: u32,
                     level: usize,
                     pte: u32,
                     ram_base: u32,
                     page_offset: u32,
                     ram_end: u32,
                     enabled: bool|
     -> u32 {
        if !enabled {
            return ppn;
        }
        let fixed = if ppn >= page_offset {
            (ppn - page_offset) + ram_base
        } else if ppn >= ram_base && ppn < ram_end {
            ppn
        } else {
            // Linux-physical RAM or device MMIO.
            // Only add ram_base if the result lands in valid guest RAM.
            let candidate = ppn + ram_base;
            if candidate < ram_end {
                candidate
            } else {
                ppn // Device MMIO — leave unchanged
            }
        };
        fixed
    };

    let l1_addr = root_addr + (vpn1 as u64 * 4);
    let l1_pte = match bus.read_word(l1_addr) {
        Ok(w) => w,
        Err(_) => {
            // Debug: log L1 read failure for vmalloc region
            if vpn1 >= 512 && bus.mmu_debug_trace {
                eprintln!(
                    "[mmu-debug] L1 read FAILED for VA 0x{:08X} at PA 0x{:08X} (vpn1={})",
                    va, l1_addr, vpn1
                );
            }
            return fault_for(va, access_type, Vec::new(), bus);
        },
    };

    // Debug: log L1 entry for vmalloc region
    if vpn1 >= 512 && bus.mmu_debug_trace && !bus.mmu_log.is_empty() {
        let _ = format!(
            "[mmu-debug] VA 0x{:08X} L1[{}] at PA 0x{:08X} = 0x{:08X} (V={})",
            va,
            vpn1,
            l1_addr,
            l1_pte,
            (l1_pte & PTE_V) != 0
        );
    }

    if (l1_pte & PTE_V) == 0 {
        // Only allow identity map fallbacks for non-User modes.
        // This prevents the emulator from "helping" userspace processes (like init)
        // by mapping RAM where it doesn't belong, which can hide bugs and cause
        // conflicts with the kernel's page management.
        if bus.low_addr_identity_map && effective_priv != Privilege::User {
            // Identity map fallbacks for kernel/supervisor boot.
            // This provides "phantom" mappings that allow the kernel to boot
            // through the trampoline and probe devices without actually
            // modifying the page tables in memory (which avoids "bad pgd" errors).
            let ram_limit = bus.mem.ram_base + bus.mem.size() as u64;

            let guest_pa = if vpn1 < 512 {
                // VA 0..0x80000000: Identity map to low physical memory (MMIO).
                // Only map VAs that fall within actual RAM — everything else
                // (null page, device MMIO below 0x80000000) gets redirected
                // to the scratch pool.
                let candidate = va as u64;
                if candidate >= bus.mem.ram_base && candidate < ram_limit {
                    candidate
                } else {
                    // Redirect to scratch pool
                    let pool_base = ram_limit - VMALLOC_SCRATCH_POOL_SIZE;
                    let pool_pages = VMALLOC_SCRATCH_POOL_SIZE / 0x1000;
                    // Use va itself (not combined_vpn) for a stable per-VPN index
                    pool_base + ((va as u64 % 0x8000_0000) % pool_pages * 0x1000)
                }
            } else if vpn1 >= 768 {
                // VA 0xC0000000+: Direct map (PAGE_OFFSET)
                let offset = (va as u64).wrapping_sub(0xC000_0000u64);
                let candidate = bus.mem.ram_base + offset;
                if candidate < ram_limit {
                    candidate
                } else {
                    // Beyond RAM: use scratch pool
                    let pool_base = ram_limit - VMALLOC_SCRATCH_POOL_SIZE;
                    let pool_pages = VMALLOC_SCRATCH_POOL_SIZE / 0x1000;
                    pool_base + ((combined_vpn as u64 % pool_pages) * 0x1000)
                }
            } else {
                // VA 0x80000000..0xC0000000: RAM identity or vmalloc
                let offset = (va as u64).wrapping_sub(0x8000_0000u64);
                let candidate = bus.mem.ram_base + offset;
                if candidate < ram_limit {
                    candidate
                } else {
                    // Beyond RAM: use scratch pool
                    let pool_base = ram_limit - VMALLOC_SCRATCH_POOL_SIZE;
                    let pool_pages = VMALLOC_SCRATCH_POOL_SIZE / 0x1000;
                    pool_base + ((combined_vpn as u64 % pool_pages) * 0x1000)
                }
            };

            let tlb_flags = PTE_V | PTE_R | PTE_W | PTE_X | PTE_A | PTE_D;
            tlb.insert(combined_vpn, asid, (guest_pa >> 12) as u32, tlb_flags);
            bus.mmu_log.push(MmuEvent::PageTableWalk {
                va,
                pa: guest_pa,
                ptes: vec![l1_pte],
            });
            return TranslateResult::Ok(guest_pa);
        }
        return fault_for(va, access_type, vec![l1_pte], bus);
    }

    let is_leaf_l1 = (l1_pte & (PTE_R | PTE_W | PTE_X)) != 0;
    if is_leaf_l1 {
        let full_ppn = pte_ppn(l1_pte);
        let fixed_ppn = fixup_ppn(
            full_ppn,
            1,
            l1_pte,
            ram_base_ppn,
            page_offset_ppn,
            ram_end_ppn,
            do_fixup,
        );
        // Write-back fixup for L1 megapages: fix virtual PPNs in-place so the
        // kernel's PTE reads see correct guest-physical values.
        if do_fixup && fixed_ppn != full_ppn {
            let fixed_l1 = (l1_pte & !0xFFFF_FC00) | (fixed_ppn << 10);
            bus.mem.write_word(l1_addr, fixed_l1).ok();
        }
        let ppn_hi = (fixed_ppn >> 10) & 0xFFF;
        let pa = ((ppn_hi as u64) << 22) | ((vpn0 as u64) << 12) | (offset as u64);
        // Debug: log megapage translations for vmalloc region
        if vpn1 >= 512 && bus.mmu_debug_trace {
            eprintln!(
                "[mmu-debug] VA 0x{:08X} MEGAPAGE: l1_pte=0x{:08X} full_ppn=0x{:05X} fixed=0x{:05X} ppn_hi=0x{:03X} pa=0x{:08X}",
                va, l1_pte, full_ppn, fixed_ppn, ppn_hi, pa
            );
        }
        // If the megapage PA falls outside guest RAM, redirect to per-VPN
        // scratch page from the reserved pool.
        let ram_end_pa = (ram_end_ppn as u64) << 12;
        if pa >= ram_end_pa && vpn1 >= 512 {
            let pool_base = ram_end_pa - VMALLOC_SCRATCH_POOL_SIZE;
            let pool_pages = VMALLOC_SCRATCH_POOL_SIZE / 0x1000;
            let vpn_index = combined_vpn as u64;
            let scratch_pa = pool_base + ((vpn_index % pool_pages) * 0x1000);
            let flags = l1_pte & 0xFF;
            let mut new_flags = flags | PTE_A;
            if access_type == AccessType::Store {
                new_flags |= PTE_D;
            }
            tlb.insert(combined_vpn, asid, (scratch_pa >> 12) as u32, new_flags);
            bus.mmu_log.push(MmuEvent::PageTableWalk {
                va,
                pa: scratch_pa,
                ptes: vec![l1_pte],
            });
            return TranslateResult::Ok(scratch_pa);
        }
        let flags = l1_pte & 0xFF;
        if let Some(fault) = check_permissions(
            va,
            flags,
            access_type,
            effective_priv,
            sum,
            mxr,
            vec![l1_pte],
            bus,
        ) {
            return fault;
        }
        let mut new_flags = flags | PTE_A;
        if access_type == AccessType::Store {
            new_flags |= PTE_D;
        }
        if new_flags != flags {
            bus.mem
                .write_word(l1_addr, (l1_pte & !0xFF) | new_flags)
                .ok();
        }
        tlb.insert(combined_vpn, asid, (pa >> 12) as u32, new_flags);
        bus.mmu_log.push(MmuEvent::PageTableWalk {
            va,
            pa,
            ptes: vec![l1_pte],
        });
        return TranslateResult::Ok(pa);
    }

    let l1_ppn = pte_ppn(l1_pte);
    let fixed_l1_ppn = fixup_ppn(
        l1_ppn,
        1,
        l1_pte,
        ram_base_ppn,
        page_offset_ppn,
        ram_end_ppn,
        do_fixup,
    );
    // Write-back fixup for L1 non-leaf entries: fix virtual PPNs so the kernel
    // reads the correct L2 table address from this entry.
    if do_fixup && fixed_l1_ppn != l1_ppn {
        let fixed_l1 = (l1_pte & !0xFFFF_FC00) | (fixed_l1_ppn << 10);
        bus.mem.write_word(l1_addr, fixed_l1).ok();
    }
    // Debug: log L1 non-leaf for vmalloc region
    if vpn1 >= 512 && bus.mmu_debug_trace {
        eprintln!(
            "[mmu-debug] VA 0x{:08X} L1 non-leaf: ppn=0x{:05X} fixed=0x{:05X} l2_addr=0x{:08X}",
            va,
            l1_ppn,
            fixed_l1_ppn,
            ((fixed_l1_ppn as u64) << 12) + (vpn0 as u64 * 4)
        );
    }
    let l2_addr = ((fixed_l1_ppn as u64) << 12) + (vpn0 as u64 * 4);
    // Register the L2 page table in known_pt_pages so that future writes to
    // this L2 (e.g., from the kernel's execve path setting up user stack PTEs)
    // are intercepted and have their virtual PPNs fixed in-place.
    {
        let l2_page_base = (fixed_l1_ppn as u64) << 12;
        if l2_page_base >= bus.mem.ram_base
            && l2_page_base < bus.mem.ram_base + bus.mem.size() as u64
            && !bus.known_pt_pages.contains(&l2_page_base)
        {
            bus.known_pt_pages.insert(l2_page_base);
        }
    }
    let l2_pte = match bus.read_word(l2_addr) {
        Ok(w) => w,
        Err(_) => {
            if vpn1 >= 512 && bus.low_addr_identity_map {
                // L2 read failed — fallback identity map for vmalloc/FLATMEM
                let virt_base = if vpn1 >= 768 {
                    0xC000_0000u64 // PAGE_OFFSET — FLATMEM direct-mapped
                } else {
                    0x8000_0000u64 // RAM base — vmalloc identity region
                };
                let vmalloc_offset = (va as u64).wrapping_sub(virt_base);
                let guest_pa = bus.mem.ram_base + vmalloc_offset;
                if guest_pa < bus.mem.ram_base + bus.mem.size() as u64 {
                    let tlb_flags = PTE_V | PTE_R | PTE_W | PTE_X | PTE_A | PTE_D;
                    tlb.insert(combined_vpn, asid, (guest_pa >> 12) as u32, tlb_flags);
                    bus.mmu_log.push(MmuEvent::PageTableWalk {
                        va,
                        pa: guest_pa,
                        ptes: vec![l1_pte, 0],
                    });
                    return TranslateResult::Ok(guest_pa);
                }
            }
            return fault_for(va, access_type, vec![l1_pte], bus);
        },
    };
    if (l2_pte & PTE_V) == 0 {
        if vpn1 >= 512 && bus.low_addr_identity_map {
            // L2 PTE invalid — fallback identity map for vmalloc/FLATMEM
            let virt_base = if vpn1 >= 768 {
                0xC000_0000u64 // PAGE_OFFSET — FLATMEM direct-mapped
            } else {
                0x8000_0000u64 // RAM base — vmalloc identity region
            };
            let vmalloc_offset = (va as u64).wrapping_sub(virt_base);
            let guest_pa = bus.mem.ram_base + vmalloc_offset;
            if guest_pa < bus.mem.ram_base + bus.mem.size() as u64 {
                let tlb_flags = PTE_V | PTE_R | PTE_W | PTE_X | PTE_A | PTE_D;
                tlb.insert(combined_vpn, asid, (guest_pa >> 12) as u32, tlb_flags);
                bus.mmu_log.push(MmuEvent::PageTableWalk {
                    va,
                    pa: guest_pa,
                    ptes: vec![l1_pte, l2_pte],
                });
                return TranslateResult::Ok(guest_pa);
            }
        }
        return fault_for(va, access_type, vec![l1_pte, l2_pte], bus);
    }
    let raw_ppn = pte_ppn(l2_pte);
    let ppn = fixup_ppn(
        raw_ppn,
        2,
        l2_pte,
        ram_base_ppn,
        page_offset_ppn,
        ram_end_ppn,
        do_fixup,
    );
    // Write-back fixup: if the PPN was virtual (>= kernel_va_ppn), the kernel
    // stored a wrong PPN in memory. Fix it in-place so the kernel's own PTE
    // reads (vm_normal_page, print_bad_pte, get_arg_page) see the correct
    // guest-physical PPN. This is the key fix for E2BIG: without it, the kernel
    // validates the PTE, finds an impossible virtual PPN, and rejects the page.
    if do_fixup && ppn != raw_ppn {
        let fixed_l2 = (l2_pte & !0xFFFF_FC00) | (ppn << 10);
        bus.mem.write_word(l2_addr, fixed_l2).ok();
    }
    let pa = ((ppn as u64) << 12) | (offset as u64);
    // Debug: log L2 leaf result for vmalloc region
    if vpn1 >= 512 && bus.mmu_debug_trace {
        eprintln!(
            "[mmu-debug] VA 0x{:08X} L2 leaf: l2_pte=0x{:08X} ppn_raw=0x{:05X} ppn_fixed=0x{:05X} pa=0x{:08X} flags=0x{:02X}",
            va, l2_pte, raw_ppn, ppn, pa, l2_pte & 0xFF
        );
    }
    let flags = l2_pte & 0xFF;
    if let Some(fault) = check_permissions(
        va,
        flags,
        access_type,
        effective_priv,
        sum,
        mxr,
        vec![l1_pte, l2_pte],
        bus,
    ) {
        return fault;
    }
    let mut new_flags = flags | PTE_A;
    if access_type == AccessType::Store {
        new_flags |= PTE_D;
    }
    if new_flags != flags {
        bus.mem
            .write_word(l2_addr, (l2_pte & !0xFF) | new_flags)
            .ok();
    }
    tlb.insert(combined_vpn, asid, ppn, new_flags);
    bus.mmu_log.push(MmuEvent::PageTableWalk {
        va,
        pa,
        ptes: vec![l1_pte, l2_pte],
    });
    TranslateResult::Ok(pa)
}

pub fn check_permissions(
    va: u32,
    flags: u32,
    access_type: AccessType,
    effective_priv: Privilege,
    sum: bool,
    mxr: bool,
    ptes: Vec<u32>,
    bus: &mut Bus,
) -> Option<TranslateResult> {
    if effective_priv == Privilege::Machine {
        return None;
    }
    if effective_priv == Privilege::User && (flags & PTE_U) == 0 {
        return Some(fault_for(va, access_type, ptes, bus));
    }
    if effective_priv == Privilege::Supervisor && (flags & PTE_U) != 0 && !sum {
        return Some(fault_for(va, access_type, ptes, bus));
    }
    match access_type {
        AccessType::Fetch => {
            if (flags & PTE_X) == 0 {
                return Some(TranslateResult::FetchFault);
            }
        },
        AccessType::Load => {
            if (flags & PTE_R) == 0 && !(mxr && (flags & PTE_X) != 0) {
                return Some(TranslateResult::LoadFault);
            }
        },
        AccessType::Store => {
            if (flags & PTE_W) == 0 {
                return Some(TranslateResult::StoreFault);
            }
        },
    }
    None
}

pub fn fault_for(
    va: u32,
    access_type: AccessType,
    ptes: Vec<u32>,
    bus: &mut Bus,
) -> TranslateResult {
    bus.mmu_log.push(MmuEvent::PageFault {
        va,
        access: access_type,
        ptes,
    });
    match access_type {
        AccessType::Fetch => TranslateResult::FetchFault,
        AccessType::Load => TranslateResult::LoadFault,
        AccessType::Store => TranslateResult::StoreFault,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::riscv::bus::Bus;

    #[test]
    fn bare_mode_identity() {
        let mut tlb = Tlb::new();
        let mut bus = Bus::new(0x8000_0000, 8192);
        let result = translate(
            0x8000_0000,
            AccessType::Fetch,
            Privilege::Machine,
            false,
            false,
            0,
            &mut bus,
            &mut tlb,
        );
        assert_eq!(result, TranslateResult::Ok(0x8000_0000));
    }
}
