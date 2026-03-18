# Geos-Boot Frozen Bootloader Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a frozen Rust shell that initializes WebGPU, forwards events to GPU mailbox, and loads .glyph programs - never requiring recompilation after freeze.

**Architecture:** Extract patterns from gvpie_bootstrap to create a minimal CPU shell that talks to the existing Glyph VM via a fixed I/O contract. The CPU handles windowing/events, GPU handles all logic.

**Tech Stack:** Rust, wgpu 0.19+, winit 0.29+, bytemuck, pollster

---

## Task 1: Project Structure

**Files:**
- Create: `systems/geos-boot/Cargo.toml`
- Create: `systems/geos-boot/src/lib.rs`

**Step 1: Create Cargo.toml**

```toml
[package]
name = "geos-boot"
version = "0.1.0"
edition = "2021"
description = "Frozen Rust bootloader for Geometry OS - CPU shell that never changes"

[dependencies]
wgpu = "0.19"
winit = "0.29"
bytemuck = { version = "1.14", features = ["derive"] }
pollster = "0.3"
log = "0.4"
env_logger = "0.11"

[lib]
name = "geos_boot"
path = "src/lib.rs"

[[bin]]
name = "geos-boot"
path = "src/main.rs"
```

**Step 2: Create lib.rs stub**

```rust
//! Geos-Boot: Frozen Rust Bootloader for Geometry OS
//!
//! This crate provides the immutable CPU shell that:
//! - Initializes WebGPU surface
//! - Forwards events to GPU mailbox at 0x200
//! - Loads .glyph programs into GPU memory
//!
//! After freeze, no modifications to this code are permitted.
//! All evolution happens in WGSL shaders.

pub mod io_contract;
pub mod gpu_requirements;

pub const GEOS_BOOT_VERSION: &str = env!("CARGO_PKG_VERSION");
```

**Step 3: Commit**

```bash
git add systems/geos-boot/Cargo.toml systems/geos-boot/src/lib.rs
git commit -m "feat(geos-boot): initialize frozen bootloader project structure"
```

---

## Task 2: I/O Contract Module

**Files:**
- Create: `systems/geos-boot/src/io_contract.rs`

**Step 1: Create io_contract.rs**

```rust
//! Geos-Boot I/O Contract v1.0
//!
//! Immutable interface between frozen CPU and evolving GPU.
//! This module is FROZEN - no changes after freeze ceremony.

#![allow(dead_code)]

pub const IO_CONTRACT_VERSION: u32 = 1;

// Memory layout matching existing Glyph VM
pub const VM_STATE_OFFSET: u64 = 0x0000;      // 512 bytes - PC, registers, flags
pub const MAILBOX_OFFSET: u64 = 0x0200;       // 256 bytes - CPU→GPU events
pub const EVENT_BUFFER_OFFSET: u64 = 0x0300;  // 1024 bytes - event queue
pub const PROGRAM_MEMORY_OFFSET: u64 = 0x1000; // ~1MB - glyph programs

pub const VM_STATE_SIZE: u64 = 512;
pub const MAILBOX_SIZE: u64 = 256;
pub const EVENT_BUFFER_SIZE: u64 = 1024;
pub const PROGRAM_MEMORY_SIZE: u64 = 1_048_576; // 1 MiB

pub const TOTAL_IO_SIZE: u64 = VM_STATE_SIZE + MAILBOX_SIZE + EVENT_BUFFER_SIZE + PROGRAM_MEMORY_SIZE;

// Event type codes (match gvpie_bootstrap)
pub const EVENT_MOUSE_MOVE: u32 = 1;
pub const EVENT_MOUSE_BUTTON: u32 = 2;
pub const EVENT_KEYBOARD: u32 = 3;
pub const EVENT_SCROLL: u32 = 4;

pub const MAX_EVENTS_PER_FRAME: usize = 64;

/// Single event entry - 4 u32 words
#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
pub struct Event {
    pub event_type: u32,
    pub param_1: u32,  // x/scanCode/button
    pub param_2: u32,  // y/keyCode/state
    pub param_3: u32,  // mods/clicks/deltaY
}

impl Event {
    pub fn none() -> Self {
        Self::default()
    }

    pub fn mouse_move(x: f32, y: f32, width: f32, height: f32) -> Self {
        Self {
            event_type: EVENT_MOUSE_MOVE,
            param_1: x.to_bits(),
            param_2: y.to_bits(),
            param_3: ((width as u32) << 16) | (height as u32),
        }
    }

    pub fn mouse_button(button: u32, pressed: bool) -> Self {
        Self {
            event_type: EVENT_MOUSE_BUTTON,
            param_1: button,
            param_2: if pressed { 1 } else { 0 },
            param_3: 0,
        }
    }

    pub fn keyboard(keycode: u32, modifiers: u32) -> Self {
        Self {
            event_type: EVENT_KEYBOARD,
            param_1: keycode,
            param_2: modifiers,
            param_3: 0,
        }
    }

    pub fn scroll(delta_y: f32) -> Self {
        Self {
            event_type: EVENT_SCROLL,
            param_1: delta_y.to_bits(),
            param_2: 0,
            param_3: 0,
        }
    }
}

/// Event buffer for CPU→GPU communication
#[repr(C)]
#[derive(Clone, Copy)]
pub struct EventsBuffer {
    pub version: u32,
    pub frame_number: u32,
    pub event_count: u32,
    pub _padding: u32,
    pub events: [Event; MAX_EVENTS_PER_FRAME],
}

impl EventsBuffer {
    pub fn new() -> Self {
        Self {
            version: IO_CONTRACT_VERSION,
            frame_number: 0,
            event_count: 0,
            _padding: 0,
            events: [Event::none(); MAX_EVENTS_PER_FRAME],
        }
    }

    pub fn clear(&mut self) {
        self.event_count = 0;
        self.frame_number += 1;
    }

    pub fn push(&mut self, event: Event) -> bool {
        if (self.event_count as usize) < MAX_EVENTS_PER_FRAME {
            self.events[self.event_count as usize] = event;
            self.event_count += 1;
            true
        } else {
            false
        }
    }

    pub fn as_bytes(&self) -> &[u8] {
        unsafe {
            std::slice::from_raw_parts(
                self as *const Self as *const u8,
                std::mem::size_of::<Self>(),
            )
        }
    }
}

impl Default for EventsBuffer {
    fn default() -> Self {
        Self::new()
    }
}

/// VM state header at offset 0x0000
#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
pub struct VmState {
    pub pc: u32,
    pub cycle: u32,
    pub halted: u32,
    pub _padding: u32,
    pub registers: [u32; 120], // 480 bytes of registers
}

/// Mailbox at offset 0x0200
#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
pub struct Mailbox {
    pub command: u32,
    pub param_a: u32,
    pub param_b: u32,
    pub param_c: u32,
    pub response: u32,
    pub status: u32,
    pub _reserved: [u32; 58], // Pad to 256 bytes
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_event_sizes() {
        assert_eq!(std::mem::size_of::<Event>(), 16);
    }

    #[test]
    fn test_events_buffer_push() {
        let mut buf = EventsBuffer::new();
        assert!(buf.push(Event::keyboard(65, 0)));
        assert_eq!(buf.event_count, 1);
    }

    #[test]
    fn test_offsets_aligned() {
        assert_eq!(MAILBOX_OFFSET, VM_STATE_OFFSET + VM_STATE_SIZE);
        assert_eq!(EVENT_BUFFER_OFFSET, MAILBOX_OFFSET + MAILBOX_SIZE);
    }
}
```

**Step 2: Run tests**

```bash
cd systems/geos-boot && cargo test io_contract
```

Expected: 3 tests pass

**Step 3: Commit**

```bash
git add systems/geos-boot/src/io_contract.rs
git commit -m "feat(geos-boot): add I/O contract module with event types and memory layout"
```

---

## Task 3: GPU Requirements Validation

**Files:**
- Create: `systems/geos-boot/src/gpu_requirements.rs`

**Step 1: Create gpu_requirements.rs**

```rust
//! GPU Capability Validation
//!
//! Validates that the GPU meets minimum requirements for Glyph VM execution.

use log::{info, warn};
use wgpu::Adapter;

/// Minimum GPU requirements for Geos-Boot v1.0
pub struct GpuRequirements {
    pub min_storage_buffer: u64,
    pub min_buffer_size: u64,
    pub min_workgroup_size_x: u32,
    pub min_bind_groups: u32,
}

impl GpuRequirements {
    /// Minimum requirements for Glyph VM
    pub const MINIMUM: Self = Self {
        min_storage_buffer: 128_000_000, // 128 MB
        min_buffer_size: 128_000_000,
        min_workgroup_size_x: 256,
        min_bind_groups: 4,
    };

    /// Recommended for best experience
    pub const RECOMMENDED: Self = Self {
        min_storage_buffer: 1_000_000_000, // 1 GB
        min_buffer_size: 1_000_000_000,
        min_workgroup_size_x: 1024,
        min_bind_groups: 8,
    };
}

pub struct ValidationResult {
    pub gpu_name: String,
    pub warnings: Vec<String>,
    pub meets_recommended: bool,
}

impl ValidationResult {
    pub fn log(&self) {
        info!("GPU: {}", self.gpu_name);
        if self.meets_recommended {
            info!("✓ GPU meets all recommended requirements");
        } else {
            info!("✓ GPU meets minimum requirements");
            for warning in &self.warnings {
                warn!("  ⚠ {}", warning);
            }
        }
    }
}

pub struct ValidationError {
    pub gpu_name: String,
    pub errors: Vec<String>,
}

impl std::fmt::Display for ValidationError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        writeln!(f, "GPU DOES NOT MEET MINIMUM REQUIREMENTS")?;
        writeln!(f, "GPU: {}", self.gpu_name)?;
        for error in &self.errors {
            writeln!(f, "  ✗ {}", error)?;
        }
        writeln!(f, "Required: 128 MB storage buffer, 256+ compute threads")?;
        Ok(())
    }
}

/// Validate GPU meets minimum requirements
pub fn validate_gpu(adapter: &Adapter) -> Result<ValidationResult, ValidationError> {
    let limits = adapter.limits();
    let info = adapter.get_info();
    let mut warnings = Vec::new();
    let mut errors = Vec::new();

    if u64::from(limits.max_storage_buffer_binding_size) < GpuRequirements::MINIMUM.min_storage_buffer {
        errors.push(format!(
            "Storage buffer too small: {} MB (minimum: 128 MB)",
            limits.max_storage_buffer_binding_size / 1_000_000
        ));
    }

    if u64::from(limits.max_buffer_size) < GpuRequirements::MINIMUM.min_buffer_size {
        errors.push(format!(
            "Buffer size too small: {} MB",
            limits.max_buffer_size / 1_000_000
        ));
    }

    if limits.max_compute_workgroup_size_x < GpuRequirements::MINIMUM.min_workgroup_size_x {
        errors.push(format!(
            "Compute workgroup too small: {} (minimum: 256)",
            limits.max_compute_workgroup_size_x
        ));
    }

    if limits.max_bind_groups < GpuRequirements::MINIMUM.min_bind_groups {
        errors.push(format!(
            "Too few bind groups: {} (minimum: 4)",
            limits.max_bind_groups
        ));
    }

    // Check for recommended
    if u64::from(limits.max_storage_buffer_binding_size) < GpuRequirements::RECOMMENDED.min_storage_buffer {
        warnings.push("Storage buffer below 1 GB recommended".to_string());
    }

    if !errors.is_empty() {
        return Err(ValidationError {
            gpu_name: info.name.clone(),
            errors,
        });
    }

    Ok(ValidationResult {
        gpu_name: info.name.clone(),
        warnings,
        meets_recommended: warnings.is_empty(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_requirements_constants() {
        assert_eq!(GpuRequirements::MINIMUM.min_bind_groups, 4);
        assert_eq!(GpuRequirements::RECOMMENDED.min_bind_groups, 8);
    }
}
```

**Step 2: Run tests**

```bash
cd systems/geos-boot && cargo test gpu_requirements
```

Expected: 1 test pass

**Step 3: Commit**

```bash
git add systems/geos-boot/src/gpu_requirements.rs
git commit -m "feat(geos-boot): add GPU requirements validation module"
```

---

## Task 4: Adapter Selection

**Files:**
- Create: `systems/geos-boot/src/adapter_selector.rs`
- Modify: `systems/geos-boot/src/lib.rs`

**Step 1: Create adapter_selector.rs**

```rust
//! GPU Adapter Selection
//!
//! Smart GPU selection preferring discrete GPUs for best Glyph VM performance.

use log::{error, info};
use wgpu::{Adapter, DeviceType, Instance, Surface};

pub struct AdapterSelector {
    instance: Instance,
}

impl AdapterSelector {
    pub fn new() -> Self {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });
        Self { instance }
    }

    pub fn instance(&self) -> &Instance {
        &self.instance
    }

    pub fn select_adapter(&self, surface: &Surface) -> Adapter {
        let mut adapters = self.instance.enumerate_adapters(wgpu::Backends::all());

        info!("Available GPU Adapters: {}", adapters.len());

        if adapters.is_empty() {
            error!("No GPU adapters found!");
            panic!("No GPU adapters available - check graphics drivers");
        }

        for (i, adapter) in adapters.iter().enumerate() {
            let info = adapter.get_info();
            info!("  [{}] {} ({:?})", i, info.name, info.device_type);
        }

        let adapter = if let Ok(gpu_index) = std::env::var("GEOS_GPU") {
            self.select_by_index(&mut adapters, &gpu_index)
        } else {
            self.auto_select(&mut adapters)
        };

        self.log_adapter_details(&adapter, surface);
        adapter
    }

    fn select_by_index(&self, adapters: &mut Vec<Adapter>, index_str: &str) -> Adapter {
        match index_str.parse::<usize>() {
            Ok(idx) if idx < adapters.len() => {
                info!("Using GPU {} (GEOS_GPU env)", idx);
                adapters.swap_remove(idx)
            }
            _ => {
                error!("Invalid GEOS_GPU value: {}", index_str);
                panic!("GEOS_GPU must be a valid adapter index");
            }
        }
    }

    fn auto_select(&self, adapters: &mut Vec<Adapter>) -> Adapter {
        info!("Auto-selecting GPU...");

        // Prefer discrete GPU
        let discrete_idx = adapters
            .iter()
            .position(|a| a.get_info().device_type == DeviceType::DiscreteGpu);

        let integrated_idx = adapters
            .iter()
            .position(|a| a.get_info().device_type == DeviceType::IntegratedGpu);

        let idx = discrete_idx
            .or(integrated_idx)
            .unwrap_or(0);

        let selected = adapters.swap_remove(idx);
        info!("✓ Selected: {} ({:?})", selected.get_info().name, selected.get_info().device_type);
        selected
    }

    fn log_adapter_details(&self, adapter: &Adapter, surface: &Surface) {
        let info = adapter.get_info();
        let limits = adapter.limits();

        info!("Selected GPU: {}", info.name);
        info!("  Type: {:?}", info.device_type);
        info!("  Backend: {:?}", info.backend);
        info!("  Max Storage Buffer: {} MB", limits.max_storage_buffer_binding_size / 1_000_000);
        info!("  Max Compute Workgroup: {}", limits.max_compute_workgroup_size_x);

        if adapter.is_surface_supported(surface) {
            info!("  Surface: ✓ Compatible");
        } else {
            error!("  Surface: ✗ NOT COMPATIBLE");
            panic!("Selected GPU cannot render to window surface");
        }
    }
}

impl Default for AdapterSelector {
    fn default() -> Self {
        Self::new()
    }
}
```

**Step 2: Update lib.rs**

```rust
pub mod io_contract;
pub mod gpu_requirements;
pub mod adapter_selector;

pub use io_contract::{Event, EventsBuffer, Mailbox, VmState};
pub use gpu_requirements::{validate_gpu, GpuRequirements};
pub use adapter_selector::AdapterSelector;
```

**Step 3: Commit**

```bash
git add systems/geos-boot/src/adapter_selector.rs systems/geos-boot/src/lib.rs
git commit -m "feat(geos-boot): add smart GPU adapter selection"
```

---

## Task 5: Glyph Loader

**Files:**
- Create: `systems/geos-boot/src/glyph_loader.rs`

**Step 1: Create glyph_loader.rs**

```rust
//! Glyph Program Loader
//!
//! Loads .glyph files into GPU buffer for VM execution.

use std::fs;
use std::path::Path;
use log::{info, warn};

/// Loaded glyph program ready for GPU upload
pub struct GlyphProgram {
    pub data: Vec<u32>,
    pub entry_point: u32,
}

impl GlyphProgram {
    /// Load a .glyph file (binary u32 words)
    pub fn from_file<P: AsRef<Path>>(path: P) -> Result<Self, String> {
        let path = path.as_ref();
        info!("Loading glyph program: {}", path.display());

        let bytes = fs::read(path)
            .map_err(|e| format!("Failed to read {}: {}", path.display(), e))?;

        // Convert bytes to u32 words (little-endian)
        if bytes.len() % 4 != 0 {
            return Err("Glyph file size must be multiple of 4 bytes".to_string());
        }

        let data: Vec<u32> = bytes
            .chunks_exact(4)
            .map(|chunk| u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]))
            .collect();

        info!("Loaded {} u32 words from {}", data.len(), path.display());

        Ok(Self {
            data,
            entry_point: 0, // Default entry point
        })
    }

    /// Load from raw u32 data
    pub fn from_words(words: Vec<u32>) -> Self {
        Self {
            data: words,
            entry_point: 0,
        }
    }

    /// Create a simple test program (LDI r0, 42; HALT)
    pub fn test_program() -> Self {
        // Opcode format: (opcode << 24) | (rd << 16) | imm16
        // LDI r0, 42 = (1 << 24) | (0 << 16) | 42 = 0x0100002A
        // HALT = 13 << 24 = 0x0D000000
        Self {
            data: vec![0x0100002A, 0x0D000000],
            entry_point: 0,
        }
    }

    /// Get bytes for GPU upload
    pub fn as_bytes(&self) -> Vec<u8> {
        self.data
            .iter()
            .flat_map(|word| word.to_le_bytes())
            .collect()
    }

    /// Get word count
    pub fn word_count(&self) -> usize {
        self.data.len()
    }
}

/// Glyph file format detection
pub fn detect_format<P: AsRef<Path>>(path: P) -> GlyphFormat {
    let path = path.as_ref();
    match path.extension().and_then(|s| s.to_str()) {
        Some("glyph") => GlyphFormat::Binary,
        Some("gasm") => GlyphFormat::Assembly,
        _ => GlyphFormat::Unknown,
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum GlyphFormat {
    Binary,
    Assembly,
    Unknown,
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;
    use tempfile::NamedTempFile;

    #[test]
    fn test_test_program() {
        let prog = GlyphProgram::test_program();
        assert_eq!(prog.word_count(), 2);
        assert_eq!(prog.data[0], 0x0100002A); // LDI r0, 42
        assert_eq!(prog.data[1], 0x0D000000); // HALT
    }

    #[test]
    fn test_as_bytes() {
        let prog = GlyphProgram::test_program();
        let bytes = prog.as_bytes();
        assert_eq!(bytes.len(), 8); // 2 words * 4 bytes
    }

    #[test]
    fn test_from_file() {
        let mut file = NamedTempFile::new().unwrap();
        // Write 2 u32 words
        file.write_all(&0x0100002Au32.to_le_bytes()).unwrap();
        file.write_all(&0x0D000000u32.to_le_bytes()).unwrap();
        file.flush().unwrap();

        let prog = GlyphProgram::from_file(file.path()).unwrap();
        assert_eq!(prog.word_count(), 2);
    }
}
```

**Step 2: Add tempfile dev dependency to Cargo.toml**

```toml
[dev-dependencies]
tempfile = "3.10"
```

**Step 3: Run tests**

```bash
cd systems/geos-boot && cargo test glyph_loader
```

Expected: 3 tests pass

**Step 4: Commit**

```bash
git add systems/geos-boot/src/glyph_loader.rs systems/geos-boot/Cargo.toml
git commit -m "feat(geos-boot): add glyph program loader with test program"
```

---

## Task 6: Frozen Bootstrap Core

**Files:**
- Create: `systems/geos-boot/src/bootstrap.rs`
- Modify: `systems/geos-boot/src/lib.rs`

**Step 1: Create bootstrap.rs**

```rust
//! Frozen Bootstrap Core
//!
//! The main GPU initialization and event loop structure.
//! This code is FROZEN after initial development.

use std::sync::Arc;
use std::time::Instant;

use log::{error, info};
use wgpu::util::DeviceExt;
use winit::{
    dpi::{LogicalSize, PhysicalSize},
    event::{ElementState, Event, MouseButton, MouseScrollDelta, WindowEvent},
    event_loop::{ControlFlow, EventLoop},
    keyboard::{KeyCode, ModifiersState, PhysicalKey},
    window::{Window, WindowBuilder},
};

use crate::adapter_selector::AdapterSelector;
use crate::gpu_requirements::validate_gpu;
use crate::io_contract::{Event, EventsBuffer, PROGRAM_MEMORY_OFFSET, TOTAL_IO_SIZE};
use crate::glyph_loader::GlyphProgram;

/// Render uniforms for viewport
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
struct RenderUniforms {
    viewport_width: f32,
    viewport_height: f32,
    time: f32,
    _padding: f32,
}

/// The frozen bootstrap - handles GPU init and event forwarding
pub struct FrozenBootstrap {
    _window: Arc<Window>,
    device: wgpu::Device,
    queue: wgpu::Queue,
    surface: wgpu::Surface<'static>,
    surface_config: wgpu::SurfaceConfiguration,

    compute_pipeline: wgpu::ComputePipeline,
    render_pipeline: wgpu::RenderPipeline,

    vm_buffer: wgpu::Buffer,         // Full VM memory
    events_buffer: wgpu::Buffer,      // CPU→GPU events
    render_uniforms: wgpu::Buffer,

    compute_bind_group: wgpu::BindGroup,
    render_bind_group: wgpu::BindGroup,

    start_time: Instant,
    window_size: PhysicalSize<u32>,
    events: EventsBuffer,
}

impl FrozenBootstrap {
    pub async fn new(window: Arc<Window>, program: Option<GlyphProgram>) -> Self {
        info!("Initializing Geos-Boot...");

        // Create instance and surface
        let selector = AdapterSelector::new();
        let surface = selector.instance()
            .create_surface(window.clone())
            .expect("Failed to create surface");

        // Select and validate adapter
        let adapter = selector.select_adapter(&surface);
        validate_gpu(&adapter).unwrap_or_else(|e| {
            error!("{}", e);
            panic!("GPU validation failed");
        });

        // Request device
        let mut limits = adapter.limits();
        limits.max_storage_buffer_binding_size = limits.max_storage_buffer_binding_size.min(2_000_000_000);
        limits.max_buffer_size = limits.max_buffer_size.min(2_000_000_000);

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor {
                label: Some("Geos-Boot Device"),
                required_features: wgpu::Features::empty(),
                required_limits: limits,
                ..Default::default()
            }, None)
            .await
            .expect("Failed to create device");

        // Configure surface
        let surface_caps = surface.get_capabilities(&adapter);
        let surface_format = surface_caps.formats.iter()
            .copied()
            .find(|f| f.is_srgb())
            .unwrap_or(surface_caps.formats[0]);

        let size = window.inner_size();
        let surface_config = wgpu::SurfaceConfiguration {
            usage: wgpu::TextureUsages::RENDER_ATTACHMENT,
            format: surface_format,
            width: size.width.max(1),
            height: size.height.max(1),
            present_mode: wgpu::PresentMode::Fifo,
            alpha_mode: surface_caps.alpha_modes[0],
            view_formats: vec![],
            desired_maximum_frame_latency: 1,
        };
        surface.configure(&device, &surface_config);

        // Create buffers
        let vm_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("VM Memory"),
            size: TOTAL_IO_SIZE,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let events_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Events Buffer"),
            size: std::mem::size_of::<EventsBuffer>() as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let render_uniforms = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Render Uniforms"),
            size: std::mem::size_of::<RenderUniforms>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Load program if provided
        if let Some(prog) = &program {
            let bytes = prog.as_bytes();
            queue.write_buffer(&vm_buffer, PROGRAM_MEMORY_OFFSET, &bytes);
            info!("Loaded {} words into VM memory at 0x{:X}", prog.word_count(), PROGRAM_MEMORY_OFFSET);
        }

        // Create pipelines (placeholder shaders)
        let (compute_pipeline, render_pipeline, compute_bind_group, render_bind_group) =
            Self::create_pipelines(&device, &vm_buffer, &events_buffer, &render_uniforms, surface_format);

        info!("✓ Geos-Boot initialized");

        Self {
            _window: window,
            device,
            queue,
            surface,
            surface_config,
            compute_pipeline,
            render_pipeline,
            vm_buffer,
            events_buffer,
            render_uniforms,
            compute_bind_group,
            render_bind_group,
            start_time: Instant::now(),
            window_size: size,
            events: EventsBuffer::new(),
        }
    }

    fn create_pipelines(
        device: &wgpu::Device,
        vm_buffer: &wgpu::Buffer,
        events_buffer: &wgpu::Buffer,
        render_uniforms: &wgpu::Buffer,
        surface_format: wgpu::TextureFormat,
    ) -> (wgpu::ComputePipeline, wgpu::RenderPipeline, wgpu::BindGroup, wgpu::BindGroup) {
        // Placeholder shaders - real WGSL will be loaded from files
        let compute_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Compute"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/glyph_vm_compute.wgsl").into()),
        });

        let render_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Render"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/glyph_vm_render.wgsl").into()),
        });

        // Bind group layouts
        let compute_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Compute Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let render_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Render Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Bind groups
        let compute_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Compute Bind Group"),
            layout: &compute_layout,
            entries: &[
                wgpu::BindGroupEntry { binding: 0, resource: vm_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 1, resource: events_buffer.as_entire_binding() },
            ],
        });

        let render_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Render Bind Group"),
            layout: &render_layout,
            entries: &[
                wgpu::BindGroupEntry { binding: 0, resource: vm_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 1, resource: render_uniforms.as_entire_binding() },
            ],
        });

        // Pipelines
        let compute_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Compute Pipeline Layout"),
            bind_group_layouts: &[&compute_layout],
            push_constant_ranges: &[],
        });

        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph VM Compute Pipeline"),
            layout: Some(&compute_pipeline_layout),
            module: &compute_shader,
            entry_point: "main",
        });

        let render_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Render Pipeline Layout"),
            bind_group_layouts: &[&render_layout],
            push_constant_ranges: &[],
        });

        let render_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Glyph VM Render Pipeline"),
            layout: Some(&render_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &render_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            primitive: wgpu::PrimitiveState::default(),
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            fragment: Some(wgpu::FragmentState {
                module: &render_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            multiview: None,
        });

        (compute_pipeline, render_pipeline, compute_bind_group, render_bind_group)
    }

    pub fn dispatch_compute(&mut self) {
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Compute Encoder"),
        });

        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph VM Compute Pass"),
                timestamp_writes: None,
            });
            pass.set_pipeline(&self.compute_pipeline);
            pass.set_bind_group(0, &self.compute_bind_group, &[]);
            pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(Some(encoder.finish()));
    }

    pub fn render(&mut self) {
        // Update uniforms
        let uniforms = RenderUniforms {
            viewport_width: self.window_size.width.max(1) as f32,
            viewport_height: self.window_size.height.max(1) as f32,
            time: self.start_time.elapsed().as_secs_f32(),
            _padding: 0.0,
        };
        self.queue.write_buffer(&self.render_uniforms, 0, bytemuck::bytes_of(&uniforms));

        // Flush events to GPU
        self.queue.write_buffer(&self.events_buffer, 0, self.events.as_bytes());
        self.events.clear();

        // Render
        let output = match self.surface.get_current_texture() {
            Ok(tex) => tex,
            Err(wgpu::SurfaceError::Lost) => {
                self.surface.configure(&self.device, &self.surface_config);
                return;
            }
            Err(e) => {
                error!("Surface error: {:?}", e);
                return;
            }
        };

        let view = output.texture.create_view(&wgpu::TextureViewDescriptor::default());
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Render Encoder"),
        });

        {
            let mut pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                label: Some("Glyph VM Render Pass"),
                color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                    view: &view,
                    resolve_target: None,
                    ops: wgpu::Operations {
                        load: wgpu::LoadOp::Clear(wgpu::Color { r: 0.05, g: 0.06, b: 0.08, a: 1.0 }),
                        store: wgpu::StoreOp::Store,
                    },
                })],
                depth_stencil_attachment: None,
                timestamp_writes: None,
                occlusion_query_set: None,
            });
            pass.set_pipeline(&self.render_pipeline);
            pass.set_bind_group(0, &self.render_bind_group, &[]);
            pass.draw(0..3, 0..1);
        }

        self.queue.submit(Some(encoder.finish()));
        output.present();
    }

    pub fn push_event(&mut self, event: Event) {
        self.events.push(event);
    }

    pub fn resize(&mut self, size: PhysicalSize<u32>) {
        if size.width == 0 || size.height == 0 {
            return;
        }
        self.window_size = size;
        self.surface_config.width = size.width;
        self.surface_config.height = size.height;
        self.surface.configure(&self.device, &self.surface_config);
    }
}

/// Run the frozen bootstrap with optional program
pub fn run(program: Option<GlyphProgram>) {
    env_logger::Builder::from_default_env()
        .filter_level(log::LevelFilter::Info)
        .init();

    info!("Geos-Boot v{} starting", crate::GEOS_BOOT_VERSION);

    let event_loop = EventLoop::new().expect("Failed to create event loop");
    let window = Arc::new(
        WindowBuilder::new()
            .with_title("Geometry OS - Glyph VM")
            .with_inner_size(LogicalSize::new(1200, 800))
            .build(&event_loop)
            .expect("Failed to create window"),
    );

    let mut bootstrap = pollster::block_on(FrozenBootstrap::new(window.clone(), program));
    let window_id = window.id();
    let mut modifiers = ModifiersState::empty();

    event_loop.run(move |event, target| {
        target.set_control_flow(ControlFlow::Wait);

        match event {
            Event::WindowEvent { window_id: id, event } if id == window_id => {
                match event {
                    WindowEvent::CloseRequested => target.exit(),
                    WindowEvent::Resized(size) => bootstrap.resize(size),
                    WindowEvent::ModifiersChanged(state) => modifiers = state.state(),
                    WindowEvent::CursorMoved { position, .. } => {
                        bootstrap.push_event(Event::mouse_move(
                            position.x as f32,
                            position.y as f32,
                            bootstrap.window_size.width as f32,
                            bootstrap.window_size.height as f32,
                        ));
                    }
                    WindowEvent::MouseInput { state, button, .. } => {
                        let btn = match button {
                            MouseButton::Left => 0,
                            MouseButton::Right => 1,
                            MouseButton::Middle => 2,
                            _ => 3,
                        };
                        bootstrap.push_event(Event::mouse_button(btn, state == ElementState::Pressed));
                    }
                    WindowEvent::MouseWheel { delta, .. } => {
                        let dy = match delta {
                            MouseScrollDelta::LineDelta(_, y) => y,
                            MouseScrollDelta::PixelDelta(p) => p.y as f32 / 60.0,
                        };
                        bootstrap.push_event(Event::scroll(dy));
                    }
                    WindowEvent::KeyboardInput { event, .. } if !event.repeat => {
                        if let PhysicalKey::Code(code) = event.physical_key {
                            let mods = modifiers_to_bits(modifiers);
                            bootstrap.push_event(Event::keyboard(code as u32, mods));
                        }
                    }
                    WindowEvent::RedrawRequested => {
                        bootstrap.dispatch_compute();
                        bootstrap.render();
                    }
                    _ => {}
                }
            }
            Event::AboutToWait => {
                window.request_redraw();
            }
            _ => {}
        }
    }).expect("Event loop error");
}

fn modifiers_to_bits(modifiers: ModifiersState) -> u32 {
    let mut bits = 0u32;
    if modifiers.control_key() { bits |= 1; }
    if modifiers.shift_key() { bits |= 2; }
    if modifiers.alt_key() { bits |= 4; }
    bits
}
```

**Step 2: Update lib.rs**

```rust
pub mod io_contract;
pub mod gpu_requirements;
pub mod adapter_selector;
pub mod glyph_loader;
pub mod bootstrap;

pub use bootstrap::{FrozenBootstrap, run};
pub use glyph_loader::GlyphProgram;
```

**Step 3: Commit**

```bash
git add systems/geos-boot/src/bootstrap.rs systems/geos-boot/src/lib.rs
git commit -m "feat(geos-boot): add frozen bootstrap core with event forwarding"
```

---

## Task 7: Placeholder Shaders

**Files:**
- Create: `systems/geos-boot/shaders/glyph_vm_compute.wgsl`
- Create: `systems/geos-boot/shaders/glyph_vm_render.wgsl`

**Step 1: Create compute shader**

```wgsl
// Glyph VM Compute Shader
// Placeholder - will be replaced with actual VM implementation

@group(0) @binding(0) var<storage, read_write> vm_memory: array<u32>;
@group(0) @binding(1) var<storage, read_write> events: array<u32>;

@compute @workgroup_size(1, 1, 1)
fn main() {
    // Read event count
    let event_count = events[2u];

    // Simple VM: read PC from vm_memory[0], execute instruction at PC
    var pc = vm_memory[0u];

    if (event_count > 0u) {
        // Echo event to VM memory for visibility
        vm_memory[256u] = events[4u]; // event_type
        vm_memory[257u] = events[5u]; // param_1
    }

    // Increment cycle counter
    vm_memory[1u] += 1u;
}
```

**Step 2: Create render shader**

```wgsl
// Glyph VM Render Shader
// Placeholder - renders viewport background

struct RenderUniforms {
    viewport_width: f32,
    viewport_height: f32,
    time: f32,
    _padding: f32,
}

@group(0) @binding(0) var<storage, read> vm_memory: array<u32>;
@group(0) @binding(1) var<uniform> uniforms: RenderUniforms;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

@vertex
fn vs_main(@builtin(vertex_index) vi: u32) -> VertexOutput {
    var positions = array<vec2<f32>, 3>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(3.0, -1.0),
        vec2<f32>(-1.0, 3.0),
    );

    var out: VertexOutput;
    out.position = vec4<f32>(positions[vi], 0.0, 1.0);
    out.uv = positions[vi] * 0.5 + 0.5;
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Read cycle counter from VM
    let cycle = vm_memory[1u];
    let flash = f32(cycle % 60u) / 60.0;

    // Dark background with subtle pulse
    let base = vec3<f32>(0.05, 0.06, 0.08);
    let pulse = vec3<f32>(0.02, 0.03, 0.04) * flash;

    return vec4<f32>(base + pulse, 1.0);
}
```

**Step 3: Commit**

```bash
mkdir -p systems/geos-boot/shaders
git add systems/geos-boot/shaders/
git commit -m "feat(geos-boot): add placeholder compute and render shaders"
```

---

## Task 8: Main Binary

**Files:**
- Create: `systems/geos-boot/src/main.rs`

**Step 1: Create main.rs**

```rust
//! Geos-Boot Binary Entry Point
//!
//! Usage: geos-boot [program.glyph]
//!
//! If no program is specified, runs a built-in test program.

use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    let program = if args.len() > 1 {
        geos_boot::GlyphProgram::from_file(&args[1])
            .unwrap_or_else(|e| panic!("Failed to load {}: {}", args[1], e))
    } else {
        log::info!("No program specified, using test program (LDI r0, 42; HALT)");
        geos_boot::GlyphProgram::test_program()
    };

    geos_boot::run(Some(program));
}
```

**Step 2: Build and test**

```bash
cd systems/geos-boot && cargo build --release
```

Expected: Compiles without errors

**Step 3: Commit**

```bash
git add systems/geos-boot/src/main.rs
git commit -m "feat(geos-boot): add main binary with program loading"
```

---

## Task 9: Freeze Manifest

**Files:**
- Create: `systems/geos-boot/FREEZE_MANIFEST.md`

**Step 1: Create freeze manifest**

```markdown
# ❄️ Geos-Boot Freeze Manifest

**Date:** [DATE]
**Commit:** [SHA]

## CPU Responsibilities (FROZEN)

These responsibilities will NEVER change after freeze:

1. **Windowing** - winit window creation and event loop
2. **WebGPU Init** - Surface, adapter, device creation
3. **Event Forwarding** - Mouse/keyboard → GPU mailbox at 0x200
4. **Program Loading** - .glyph files → GPU memory at 0x1000

## GPU Responsibilities (EVOLVING)

All future features go here:

- VM opcode execution
- Self-modifying code
- Visual rendering
- Text display
- UI components
- File system (via CPU requests)

## I/O Contract v1.0

| Offset | Size | Purpose |
|--------|------|---------|
| 0x0000 | 512 | VM State (PC, cycle, registers) |
| 0x0200 | 256 | Mailbox (CPU→GPU commands) |
| 0x0300 | 1024 | Event Buffer |
| 0x1000 | 1MB | Glyph Program Memory |

## The Vow

> I will never again modify `src/*.rs` without explicit unfreeze ceremony.
> If I need a feature, I will implement it in WGSL.
> The CPU is dead. Long live the GPU.

## Unfreeze Ceremony

To modify frozen code:

1. Create `UNFREEZE_REQUEST.md` with justification
2. Wait 24 hours
3. Get explicit approval
4. Document changes in `FREEZE_CHANGELOG.md`
```

**Step 2: Commit**

```bash
git add systems/geos-boot/FREEZE_MANIFEST.md
git commit -m "docs(geos-boot): add freeze manifest declaring CPU responsibilities"
```

---

## Task 10: Final Verification

**Step 1: Run all tests**

```bash
cd systems/geos-boot && cargo test
```

Expected: All tests pass

**Step 2: Build release**

```bash
cd systems/geos-boot && cargo build --release
```

Expected: Clean build

**Step 3: Final commit**

```bash
git add systems/geos-boot/
git commit -m "feat(geos-boot): complete frozen bootloader implementation

- I/O contract with event types and memory layout
- GPU requirements validation
- Smart adapter selection (discrete preferred)
- Glyph program loader
- Frozen bootstrap core with event forwarding
- Placeholder compute/render shaders
- Main binary entry point
- Freeze manifest

This shell is now FROZEN. All future features go to WGSL shaders."
```

---

## Success Criteria

After implementation:

- [ ] `cargo test` passes in `systems/geos-boot/`
- [ ] `cargo build --release` produces binary
- [ ] Binary runs with test program (displays window)
- [ ] Events forwarded to GPU mailbox
- [ ] FREEZE_MANIFEST.md committed
- [ ] No Rust modifications needed for 30 days

## References

- `docs/plans/2026-03-18-frozen-bootloader-design.md` - Design document
- `gvpie_bootstrap/gvpie/gvpie-bootstrap/` - Pattern source
- `systems/infinite_map_rs/shaders/` - Existing Glyph VM shaders
