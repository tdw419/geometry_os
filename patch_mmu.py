import re

with open("src/riscv/mmu.rs", "r") as f:
    content = f.read()

# 1. Modify kernel_va_to_guest_pa
old_func = """fn kernel_va_to_guest_pa(va: u32, bus: &Bus) -> Option<u64> {
    let va = va as u64;
    if va >= RV32_PAGE_OFFSET {
        let linux_pa = va - RV32_PAGE_OFFSET;
        let guest_pa = bus.mem.ram_base + linux_pa;
        // Verify the guest PA is within RAM
        if guest_pa < bus.mem.ram_base + bus.mem.size() as u64 {
            return Some(guest_pa);
        }
    }
    None
}"""

new_func = """fn kernel_va_to_guest_pa(va: u32, bus: &Bus) -> Option<u64> {
    let va = va as u64;
    if va >= RV32_PAGE_OFFSET {
        let linux_pa = va - RV32_PAGE_OFFSET;
        let guest_pa = bus.mem.ram_base + linux_pa;
        // Verify the guest PA is within RAM
        if guest_pa < bus.mem.ram_base + bus.mem.size() as u64 {
            return Some(guest_pa);
        }
    } else if va >= 0xA000_0000 {
        // Vmalloc region fallback
        let linux_pa = va - 0xA000_0000;
        let guest_pa = bus.mem.ram_base + linux_pa;
        if guest_pa < bus.mem.ram_base + bus.mem.size() as u64 {
            return Some(guest_pa);
        }
    }
    None
}"""

content = content.replace(old_func, new_func)

# 2. Change vpn1 >= 768 to vpn1 >= 640 in fallback checks
content = content.replace("vpn1 >= 768 && effective_priv != Privilege::Machine && bus.low_addr_identity_map", "vpn1 >= 640 && effective_priv != Privilege::Machine && bus.low_addr_identity_map")

# 3. Fix the broken L2 pointer detection pa_base calculation
# It was panicking on vpn1 < 768 if we just used it.
# Wait, if we change vpn1 >= 768 to vpn1 >= 640 in the pa_base calculation:
old_pa_base = """        let pa_base: u64 = if vpn1 >= 768 {
            // Kernel linear mapping: VA = PA_kernel + 0xC0000000
            // PA_kernel needs ram_base offset for our VM
            (((vpn1 - 768) as u64) << 22) + (bus.mem.ram_base as u64)
        } else {
            // Low address: identity map (for MMIO devices)
            (vpn1 as u64) << 22
        };"""

new_pa_base = """        let pa_base: u64 = if vpn1 >= 768 {
            // Kernel linear mapping: VA = PA_kernel + 0xC0000000
            // PA_kernel needs ram_base offset for our VM
            (((vpn1 - 768) as u64) << 22) + (bus.mem.ram_base as u64)
        } else if vpn1 >= 640 {
            // vmalloc region mapping
            (((vpn1 - 640) as u64) << 22) + (bus.mem.ram_base as u64)
        } else {
            // Low address: identity map (for MMIO devices)
            (vpn1 as u64) << 22
        };"""

content = content.replace(old_pa_base, new_pa_base)

with open("src/riscv/mmu.rs", "w") as f:
    f.write(content)

