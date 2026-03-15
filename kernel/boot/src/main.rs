#![no_main]
#![no_std]

extern crate alloc;

use log::info;
use uefi::prelude::*;
use uefi::proto::console::gop::GraphicsOutput;
use uefi::proto::media::fs::SimpleFileSystem;
use uefi::proto::pci::{PciIoAddress, root_bridge::PciRootBridgeIo};
use uefi::boot::SearchType;
use uefi::mem::memory_map::MemoryType;
use uefi::fs::FileSystem;
use uefi::CStr16;
use uefi::Identify;
use uefi::cstr16;

const KERNEL_LOAD_ADDR: u64 = 0x100000; // 1MB
const AMD_VENDOR_ID: u16 = 0x1002;
const INTEL_VENDOR_ID: u16 = 0x8086;
const PCI_CLASS_DISPLAY: u8 = 0x03;

// Boot info passed to kernel
#[repr(C)]
pub struct GeometryOsBootInfo {
    pub magic: u64,
    pub gpu_mmio_base: u64,
    pub gpu_mmio_size: u64,
    pub glyph_memory_base: u64,
    pub glyph_memory_size: u64,
    pub glyph_program_base: u64,
    pub glyph_program_size: u64,
    pub guest_os_base: u64,
    pub guest_os_size: u64,
    pub fw_pfp_base: u64,
    pub fw_me_base: u64,
    pub fw_ce_base: u64,
    pub fw_mec_base: u64,
    pub fw_rlc_base: u64,
    pub gpu_vendor_id: u32,
    pub gpu_device_id: u32,
}

const GEOS_MAGIC: u64 = 0x47454F535F525354; // "GEOSRST"

#[entry]
fn main() -> Status {
    uefi::helpers::init().unwrap();

    info!("===============================================");
    info!(" Geometry OS - Phase 4: Bare Metal Bootloader  ");
    info!("===============================================");
    info!("");

    info!("[1/8] Initializing Graphics Output Protocol...");
    init_graphics();

    info!("[2/8] Scanning for GPU (AMD/Intel)...");
    let gpu_info = scan_for_gpu();

    info!("[3/8] Allocating Glyph Substrate (256MB)...");
    let glyph_mem = allocate_glyph_memory();

    info!("[4/8] Loading Glyph Programs...");
    let glyph_program = load_file_to_memory(cstr16!("\\glyphs\\window_manager.rts.png"), 0x200000);

    info!("[5/8] Loading Guest OS...");
    let guest_os = load_file_to_memory(cstr16!("\\ubuntu_native.rts.png"), 0);

    info!("[6/8] Loading AMD Firmware...");
    let _firmware = Firmware::default();

    info!("[7/8] Loading Kernel...");
    let kernel = load_kernel();

    info!("[8/8] Preparing Handoff...");

    let boot_info = GeometryOsBootInfo {
        magic: GEOS_MAGIC,
        gpu_mmio_base: gpu_info.mmio_base,
        gpu_mmio_size: 0x1000000,
        glyph_memory_base: glyph_mem,
        glyph_memory_size: 256 * 1024 * 1024,
        glyph_program_base: glyph_program.addr,
        glyph_program_size: glyph_program.size,
        guest_os_base: guest_os.addr,
        guest_os_size: guest_os.size,
        fw_pfp_base: 0,
        fw_me_base: 0,
        fw_ce_base: 0,
        fw_mec_base: 0,
        fw_rlc_base: 0,
        gpu_vendor_id: gpu_info.vendor_id as u32,
        gpu_device_id: gpu_info.device_id as u32,
    };

    info!("");
    info!("Boot Configuration:");
    info!("  GPU:          {:04X}:{:04X}", gpu_info.vendor_id, gpu_info.device_id);
    info!("  Glyph Memory: 0x{:016X}", glyph_mem);
    info!("  Kernel:       {} bytes at 0x{:X}", kernel.size, KERNEL_LOAD_ADDR);
    info!("");

    info!("Exiting UEFI Boot Services...");

    // Exit boot services and jump to kernel
    unsafe {
        let _mem_map = uefi::boot::exit_boot_services(None);
        // Jump to kernel at 1MB
        let entry: extern "sysv64" fn(*const GeometryOsBootInfo) =
            core::mem::transmute(KERNEL_LOAD_ADDR as *const ());
        entry(&boot_info);
    }

    Status::SUCCESS
}

// ============================================================================
// Helper Structures
// ============================================================================

#[derive(Default)]
struct GpuInfo {
    vendor_id: u16,
    device_id: u16,
    mmio_base: u64,
    mmio_size: u64,
}

/// Scan PCI bus for AMD or Intel GPU
fn scan_for_gpu() -> GpuInfo {
    let handles = match uefi::boot::locate_handle_buffer(SearchType::ByProtocol(&PciRootBridgeIo::GUID)) {
        Ok(h) => h,
        Err(e) => {
            info!("  PCI not available: {:?}", e);
            return GpuInfo::default();
        }
    };

    info!("  Found {} PCI root bridges", handles.len());

    for handle in handles.iter() {
        let mut pci = match uefi::boot::open_protocol_exclusive::<PciRootBridgeIo>(*handle) {
            Ok(p) => p,
            Err(_) => continue,
        };

        // Scan bus 0, devices 0-31, functions 0-7
        for bus in 0u8..=0 {
            for dev in 0u8..=31 {
                for fun in 0u8..=7 {
                    let addr = PciIoAddress::new(bus, dev, fun);

                    // Read vendor ID (offset 0x00)
                    let vendor_id: u16 = match pci.read_one(addr.with_register(0)) {
                        Ok(v) => v,
                        Err(_) => continue,
                    };

                    // Skip if no device (vendor ID 0xFFFF)
                    if vendor_id == 0xFFFF {
                        continue;
                    }

                    // Read device ID (offset 0x02)
                    let device_id: u16 = match pci.read_one(addr.with_register(2)) {
                        Ok(d) => d,
                        Err(_) => continue,
                    };

                    // Read class code (offset 0x0B)
                    let class_code: u8 = match pci.read_one(addr.with_register(0x0B)) {
                        Ok(c) => c,
                        Err(_) => continue,
                    };

                    // Check for display controller
                    if class_code != PCI_CLASS_DISPLAY {
                        continue;
                    }

                    // Check for AMD or Intel GPU
                    if vendor_id == AMD_VENDOR_ID {
                        info!("  Found AMD GPU: {:04X}:{:04X}", vendor_id, device_id);

                        // Read BAR0 (offset 0x10)
                        let bar0: u32 = match pci.read_one(addr.with_register(0x10)) {
                            Ok(b) => b,
                            Err(_) => continue,
                        };

                        // Check if memory-mapped BAR (bit 0 = 0)
                        if bar0 & 1 == 1 {
                            continue; // I/O port, skip
                        }

                        let mmio_base = (bar0 & 0xFFFFFFF0) as u64;
                        info!("  MMIO base: 0x{:016X}", mmio_base);

                        return GpuInfo {
                            vendor_id,
                            device_id,
                            mmio_base,
                            mmio_size: 0x1000000,
                        };
                    } else if vendor_id == INTEL_VENDOR_ID {
                        info!("  Found Intel GPU: {:04X}:{:04X}", vendor_id, device_id);

                        let bar0: u32 = match pci.read_one(addr.with_register(0x10)) {
                            Ok(b) => b,
                            Err(_) => continue,
                        };

                        let mmio_base = (bar0 & 0xFFFFFFF0) as u64;

                        return GpuInfo {
                            vendor_id,
                            device_id,
                            mmio_base,
                            mmio_size: 0x1000000,
                        };
                    }
                }
            }
        }
    }

    info!("  No AMD/Intel GPU found");
    GpuInfo::default()
}

struct LoadedFile {
    addr: u64,
    size: u64,
}

impl LoadedFile {
    fn empty() -> Self {
        LoadedFile { addr: 0, size: 0 }
    }

    fn new(addr: u64, size: u64) -> Self {
        LoadedFile { addr, size }
    }
}

#[derive(Default)]
struct Firmware {
    pfp: u64,
    me: u64,
    ce: u64,
    mec: u64,
    rlc: u64,
}

// ============================================================================
// Implementation
// ============================================================================

fn init_graphics() {
    match uefi::boot::locate_handle_buffer(SearchType::ByProtocol(&GraphicsOutput::GUID)) {
        Ok(handles) => {
            info!("  Found {} GOP handles", handles.len());
        }
        Err(e) => {
            info!("  GOP not available: {:?}", e);
        }
    }
}

fn allocate_glyph_memory() -> u64 {
    let pages = (256 * 1024 * 1024) / 4096;

    match uefi::boot::allocate_pages(uefi::boot::AllocateType::Address(0x100000000), MemoryType::RUNTIME_SERVICES_DATA, pages) {
        Ok(addr) => {
            info!("  Allocated at 0x{:016X}", addr.as_ptr() as u64);
            addr.as_ptr() as u64
        }
        Err(_) => {
            match uefi::boot::allocate_pages(uefi::boot::AllocateType::AnyPages, MemoryType::RUNTIME_SERVICES_DATA, pages) {
                Ok(addr) => {
                    info!("  Allocated at 0x{:016X}", addr.as_ptr() as u64);
                    addr.as_ptr() as u64
                }
                Err(_) => {
                    info!("  [USING DEFAULT 4GB]");
                    0x100000000
                }
            }
        }
    }
}

/// Load kernel from \geometry_os.kernel to 1MB
fn load_kernel() -> LoadedFile {
    // Open filesystem
    let fs_handle = match uefi::boot::get_handle_for_protocol::<SimpleFileSystem>() {
        Ok(h) => h,
        Err(e) => {
            info!("  Failed to get filesystem handle: {:?}", e);
            return LoadedFile::empty();
        }
    };

    let sfs = match uefi::boot::open_protocol_exclusive::<SimpleFileSystem>(fs_handle) {
        Ok(s) => s,
        Err(e) => {
            info!("  Failed to open filesystem: {:?}", e);
            return LoadedFile::empty();
        }
    };

    let mut fs = FileSystem::new(sfs);

    // Read kernel file
    let kernel_data = match fs.read(cstr16!("\\geometry_os.kernel")) {
        Ok(data) => data,
        Err(e) => {
            info!("  Failed to read kernel: {:?}", e);
            return LoadedFile::empty();
        }
    };

    let kernel_size = kernel_data.len();
    info!("  Read {} bytes", kernel_size);

    // Allocate pages at 1MB for kernel
    let pages = (kernel_size + 0xFFF) / 4096;
    let kernel_addr = KERNEL_LOAD_ADDR;

    match uefi::boot::allocate_pages(
        uefi::boot::AllocateType::Address(kernel_addr),
        MemoryType::LOADER_CODE,
        pages
    ) {
        Ok(addr) => {
            // Copy kernel to 1MB
            unsafe {
                core::ptr::copy_nonoverlapping(
                    kernel_data.as_ptr(),
                    addr.as_ptr(),
                    kernel_size
                );
            }
            info!("  Loaded at 0x{:X}", kernel_addr);
            LoadedFile::new(kernel_addr, kernel_size as u64)
        }
        Err(e) => {
            info!("  Failed to allocate kernel memory: {:?}", e);
            LoadedFile::empty()
        }
    }
}

/// Load a file to a specific address (or any address if addr=0)
fn load_file_to_memory(path: &CStr16, target_addr: u64) -> LoadedFile {
    // Open filesystem
    let fs_handle = match uefi::boot::get_handle_for_protocol::<SimpleFileSystem>() {
        Ok(h) => h,
        Err(_) => return LoadedFile::empty(),
    };

    let sfs = match uefi::boot::open_protocol_exclusive::<SimpleFileSystem>(fs_handle) {
        Ok(s) => s,
        Err(_) => return LoadedFile::empty(),
    };

    let mut fs = FileSystem::new(sfs);

    // Read file
    let data = match fs.read(path) {
        Ok(d) => d,
        Err(_) => return LoadedFile::empty(),
    };

    let size = data.len();
    info!("  {} bytes loaded", size);

    // Allocate memory
    let pages = (size + 0xFFF) / 4096;
    let alloc_type = if target_addr > 0 {
        uefi::boot::AllocateType::Address(target_addr)
    } else {
        uefi::boot::AllocateType::AnyPages
    };

    match uefi::boot::allocate_pages(alloc_type, MemoryType::RUNTIME_SERVICES_DATA, pages) {
        Ok(addr) => {
            unsafe {
                core::ptr::copy_nonoverlapping(data.as_ptr(), addr.as_ptr(), size);
            }
            LoadedFile::new(addr.as_ptr() as u64, size as u64)
        }
        Err(_) => LoadedFile::empty()
    }
}
