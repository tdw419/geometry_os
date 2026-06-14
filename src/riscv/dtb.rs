use super::bus::Bus;
use crate::riscv::loader;

// FDT constants
const FDT_MAGIC: u32 = 0xd00dfeed;
const FDT_BEGIN_NODE: u32 = 0x00000001;
const FDT_END_NODE: u32 = 0x00000002;
const FDT_PROP: u32 = 0x00000003;
const FDT_NOP: u32 = 0x00000004;
const FDT_END: u32 = 0x00000009;

#[derive(Debug, Clone)]
pub struct DtbConfig {
    pub ram_base: u64,
    pub ram_size: u64,
    pub clint_base: u64,
    pub plic_base: u64,
    pub uart_base: u64,
    pub virtio_base: u64,
    pub virtio_net_base: u64,
    pub virtio_gpu_base: u64,
    pub virtio_serial_base: u64,
    pub spi_sd_base: u64,
    pub bootargs: String,
    pub skip_plic: bool,
    pub initrd_start: Option<u64>,
    pub initrd_end: Option<u64>,
    pub reserved_regions: Vec<(u64, u64)>,
}

impl Default for DtbConfig {
    fn default() -> Self {
        Self {
            ram_base: 0x80000000,
            ram_size: 128 * 1024 * 1024,
            clint_base: 0x02000000,
            plic_base: 0x0c000000,
            uart_base: 0x10000000,
            virtio_base: 0x10001000,
            virtio_net_base: 0x10002000,
            virtio_gpu_base: 0x10003000,
            virtio_serial_base: 0x10006000,
            spi_sd_base: 0x10004000,
            bootargs: "earlycon=sbi rdinit=/init nosmp".to_string(),
            skip_plic: false,
            initrd_start: None,
            initrd_end: None,
            reserved_regions: Vec::new(),
        }
    }
}

struct DtbBuilder {
    struct_block: Vec<u8>,
    string_block: Vec<u8>,
    reserved_map: Vec<u8>,
    string_offsets: std::collections::HashMap<String, u32>,
}

impl DtbBuilder {
    fn new() -> Self {
        Self {
            struct_block: Vec::new(),
            string_block: Vec::new(),
            reserved_map: Vec::new(),
            string_offsets: std::collections::HashMap::new(),
        }
    }

    fn align4(buf: &mut Vec<u8>) {
        while buf.len() % 4 != 0 {
            buf.push(0);
        }
    }

    fn push_u32(buf: &mut Vec<u8>, val: u32) {
        buf.extend_from_slice(&val.to_be_bytes());
    }

    fn add_mem_reserve(&mut self, addr: u64, size: u64) {
        // Reserve map is always 64-bit entries
        self.reserved_map.extend_from_slice(&addr.to_be_bytes());
        self.reserved_map.extend_from_slice(&size.to_be_bytes());
    }

    fn add_string(&mut self, s: &str) -> u32 {
        if let Some(&off) = self.string_offsets.get(s) {
            return off;
        }
        let off = self.string_block.len() as u32;
        self.string_block.extend_from_slice(s.as_bytes());
        self.string_block.push(0);
        self.string_offsets.insert(s.to_string(), off);
        off
    }

    fn begin_node(&mut self, name: &str) {
        Self::push_u32(&mut self.struct_block, FDT_BEGIN_NODE);
        self.struct_block.extend_from_slice(name.as_bytes());
        self.struct_block.push(0);
        Self::align4(&mut self.struct_block);
    }

    fn end_node(&mut self) {
        Self::push_u32(&mut self.struct_block, FDT_END_NODE);
    }

    fn prop_empty(&mut self, name: &str) {
        let name_off = self.add_string(name);
        Self::push_u32(&mut self.struct_block, FDT_PROP);
        Self::push_u32(&mut self.struct_block, 0);
        Self::push_u32(&mut self.struct_block, name_off);
    }

    fn prop_u32(&mut self, name: &str, val: u32) {
        let name_off = self.add_string(name);
        let data = val.to_be_bytes();
        Self::push_u32(&mut self.struct_block, FDT_PROP);
        Self::push_u32(&mut self.struct_block, 4);
        Self::push_u32(&mut self.struct_block, name_off);
        self.struct_block.extend_from_slice(&data);
        Self::align4(&mut self.struct_block);
    }

    fn prop_u32_list(&mut self, name: &str, vals: &[u32]) {
        let name_off = self.add_string(name);
        let mut data = Vec::new();
        for &v in vals {
            data.extend_from_slice(&v.to_be_bytes());
        }
        Self::push_u32(&mut self.struct_block, FDT_PROP);
        Self::push_u32(&mut self.struct_block, data.len() as u32);
        Self::push_u32(&mut self.struct_block, name_off);
        self.struct_block.extend_from_slice(&data);
        Self::align4(&mut self.struct_block);
    }

    fn prop_u64(&mut self, name: &str, val: u64) {
        let name_off = self.add_string(name);
        let data = val.to_be_bytes();
        Self::push_u32(&mut self.struct_block, FDT_PROP);
        Self::push_u32(&mut self.struct_block, 8);
        Self::push_u32(&mut self.struct_block, name_off);
        self.struct_block.extend_from_slice(&data);
        Self::align4(&mut self.struct_block);
    }

    fn prop_reg(&mut self, name: &str, addr: u64, size: u64) {
        let name_off = self.add_string(name);
        let mut data = Vec::new();
        // RV32: 1 cell for address, 1 cell for size
        data.extend_from_slice(&(addr as u32).to_be_bytes());
        data.extend_from_slice(&(size as u32).to_be_bytes());
        Self::push_u32(&mut self.struct_block, FDT_PROP);
        Self::push_u32(&mut self.struct_block, data.len() as u32);
        Self::push_u32(&mut self.struct_block, name_off);
        self.struct_block.extend_from_slice(&data);
        Self::align4(&mut self.struct_block);
    }

    fn prop_string(&mut self, name: &str, val: &str) {
        let name_off = self.add_string(name);
        let mut data = val.as_bytes().to_vec();
        data.push(0);
        Self::push_u32(&mut self.struct_block, FDT_PROP);
        Self::push_u32(&mut self.struct_block, data.len() as u32);
        Self::push_u32(&mut self.struct_block, name_off);
        self.struct_block.extend_from_slice(&data);
        Self::align4(&mut self.struct_block);
    }

    fn build(mut self) -> Vec<u8> {
        self.reserved_map.extend_from_slice(&[0u8; 16]); // End marker
        let mut fdt = Vec::new();
        Self::push_u32(&mut fdt, FDT_MAGIC);
        let off_mem_rsvmap = 40;
        let off_dt_struct = off_mem_rsvmap + self.reserved_map.len() as u32;
        let off_dt_strings = off_dt_struct + self.struct_block.len() as u32;
        let totalsize = off_dt_strings + self.string_block.len() as u32;

        Self::push_u32(&mut fdt, totalsize);
        Self::push_u32(&mut fdt, off_dt_struct);
        Self::push_u32(&mut fdt, off_dt_strings);
        Self::push_u32(&mut fdt, off_mem_rsvmap);
        Self::push_u32(&mut fdt, 17); // version
        Self::push_u32(&mut fdt, 16); // last_comp_version
        Self::push_u32(&mut fdt, 0); // boot_cpuid_phys
        Self::push_u32(&mut fdt, self.string_block.len() as u32);
        Self::push_u32(&mut fdt, self.struct_block.len() as u32);

        fdt.extend_from_slice(&self.reserved_map);
        fdt.extend_from_slice(&self.struct_block);
        fdt.extend_from_slice(&self.string_block);
        fdt
    }
}

pub fn generate_dtb(config: &DtbConfig) -> Vec<u8> {
    let mut b = DtbBuilder::new();
    for &(addr, size) in &config.reserved_regions {
        b.add_mem_reserve(addr, size);
    }

    b.begin_node("");
    b.prop_u32("#address-cells", 1);
    b.prop_u32("#size-cells", 1);
    b.prop_string("compatible", "geometry-os,riscv-virt\0riscv-virtio");
    b.prop_string("model", "Geometry OS RISC-V Virtual Machine");

    b.begin_node("cpus");
    b.prop_u32("#address-cells", 1);
    b.prop_u32("#size-cells", 0);
    b.prop_u32("timebase-frequency", 10_000_000);
    b.begin_node("cpu@0");
    b.prop_string("device_type", "cpu");
    b.prop_u32("reg", 0);
    b.prop_string("compatible", "riscv");
    b.prop_string("mmu-type", "riscv,sv32");
    b.prop_string("riscv,isa", "rv32imac");
    b.prop_string("status", "okay");
    b.begin_node("interrupt-controller");
    b.prop_u32("#interrupt-cells", 1);
    b.prop_empty("interrupt-controller");
    b.prop_u32("phandle", 1);
    b.prop_string("compatible", "riscv,cpu-intc");
    b.end_node();
    b.end_node();
    b.end_node(); // cpus

    let mem_name = format!("memory@{:x}", config.ram_base);
    b.begin_node(&mem_name);
    b.prop_string("device_type", "memory");
    b.prop_reg("reg", config.ram_base, config.ram_size);
    b.end_node();

    b.begin_node("chosen");
    b.prop_string("bootargs", &config.bootargs);
    b.prop_string("stdout-path", "/soc/uart@10000000");
    if let (Some(s), Some(e)) = (config.initrd_start, config.initrd_end) {
        b.prop_u32("linux,initrd-start", s as u32);
        b.prop_u32("linux,initrd-end", e as u32);
    }
    b.end_node();

    b.begin_node("soc");
    b.prop_u32("#address-cells", 1);
    b.prop_u32("#size-cells", 1);
    b.prop_string("compatible", "simple-bus");
    b.prop_empty("ranges");

    b.begin_node("uart@10000000");
    b.prop_string("compatible", "ns16550a");
    b.prop_reg("reg", config.uart_base, 0x100);
    if !config.skip_plic {
        b.prop_u32("interrupts", 10);
        b.prop_u32("interrupt-parent", 2);
    }
    b.prop_u32("reg-shift", 0);
    b.prop_u32("reg-io-width", 1);
    b.prop_u32("clock-frequency", 0);
    b.end_node();

    b.begin_node("clint@2000000");
    b.prop_string("compatible", "riscv,clint0");
    b.prop_reg("reg", config.clint_base, 0x10000);
    b.prop_u32("interrupts-extended", 1);
    b.end_node();

    // riscv,timer: required for kernel's time_init() to register clockevent device.
    // Without this node, the kernel's timer_probe() finds no matching driver,
    // no clockevent device is registered, and SBI_SET_TIMER is never called.
    // The timer interrupt (STIP) stays pending forever because mtimecmp is never
    // reset by the kernel — causing a timer storm in __irqentry_text_start.
    b.begin_node("timer");
    b.prop_string("compatible", "riscv,timer");
    b.prop_u32_list("interrupts-extended", &[1, 5]);
    b.end_node();

    if !config.skip_plic {
        b.begin_node("plic@c000000");
        b.prop_string("compatible", "riscv,plic0");
        b.prop_reg("reg", config.plic_base, 0x200000);
        b.prop_empty("interrupt-controller");
        b.prop_u32("#interrupt-cells", 1);
        b.prop_u32("riscv,ndev", 31);
        b.prop_u32("phandle", 2);
        b.prop_u32_list("interrupts-extended", &[1, 9, 1, 11]);
        b.end_node();

        b.begin_node("virtio@10001000");
        b.prop_string("compatible", "virtio,mmio");
        b.prop_reg("reg", config.virtio_base, 0x1000);
        b.prop_u32("interrupts", 1);
        b.prop_u32("interrupt-parent", 2);
        b.end_node();

        b.begin_node("virtio@10002000");
        b.prop_string("compatible", "virtio,mmio");
        b.prop_reg("reg", config.virtio_net_base, 0x1000);
        b.prop_u32("interrupts", 2);
        b.prop_u32("interrupt-parent", 2);
        b.end_node();

        b.begin_node("virtio@10003000");
        b.prop_string("compatible", "virtio,mmio");
        b.prop_reg("reg", config.virtio_gpu_base, 0x1000);
        b.prop_u32("interrupts", 3);
        b.prop_u32("interrupt-parent", 2);
        b.end_node();

        b.begin_node("virtio@10006000");
        b.prop_string("compatible", "virtio,mmio");
        b.prop_reg("reg", config.virtio_serial_base, 0x1000);
        b.prop_u32("interrupts", 5);
        b.prop_u32("interrupt-parent", 2);
        b.end_node();

        b.begin_node("spi-sd@10004000");
        b.prop_string("compatible", "geometry-os,spi-sd");
        b.prop_reg("reg", config.spi_sd_base, 0x1000);
        b.prop_u32("interrupts", 4);
        b.prop_u32("interrupt-parent", 2);
        b.end_node();
    }
    b.end_node(); // soc
    b.end_node(); // root
    DtbBuilder::push_u32(&mut b.struct_block, FDT_END);
    b.build()
}
