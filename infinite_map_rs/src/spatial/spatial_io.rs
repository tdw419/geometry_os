//! Phase 12.3: Spatial I/O System
//!
//! Input/output system for spatial hardware access. Provides device drivers,
//! interrupt handling, DMA transfers, and device discovery for spatial programs.
//!
//! Architecture:
//! - Devices represented as MMIO regions in spatial memory
//! - I/O dispatch via special TYPE_IO_* opcodes
//! - Interrupts as token-based signaling through spatial cells
//! - DMA for bulk data movement (bypasses routing validation)
//! - Device discovery via MMIO space scanning

use crate::spatial::path_cache::{GRID_H, GRID_W};
use thiserror::Error;

/// Device identifier (16-bit)
pub type DeviceId = u16;

/// Device capabilities flags
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct DeviceCaps {
    pub can_read: bool,
    pub can_write: bool,
    pub supports_dma: bool,
    pub generates_interrupts: bool,
}

impl DeviceCaps {
    pub fn as_u32(&self) -> u32 {
        let mut flags = 0u32;
        if self.can_read {
            flags |= 0x01;
        }
        if self.can_write {
            flags |= 0x02;
        }
        if self.supports_dma {
            flags |= 0x04;
        }
        if self.generates_interrupts {
            flags |= 0x08;
        }
        flags
    }

    pub fn from_u32(value: u32) -> Self {
        Self {
            can_read: (value & 0x01) != 0,
            can_write: (value & 0x02) != 0,
            supports_dma: (value & 0x04) != 0,
            generates_interrupts: (value & 0x08) != 0,
        }
    }
}

/// Device descriptor (stored in device registry region)
#[derive(Debug, Clone, Copy)]
pub struct DeviceDescriptor {
    pub device_id: DeviceId,
    pub base_addr: u32,      // Linear cell index of MMIO region
    pub register_count: u32, // Number of registers
    pub caps: DeviceCaps,
    pub interrupt_line: Option<u8>, // Interrupt line number (0-255)
}

impl DeviceDescriptor {
    pub fn size_in_cells(&self) -> u32 {
        self.register_count
    }
}

/// I/O opcode types
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum IoOpcode {
    IORead = 50,  // Read from device register
    IOWrite = 51, // Write to device register
    IOBusyWait = 52, // Wait for device status
}

/// DMA opcode types
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DmaOpcode {
    DMACopy = 53, // Copy cells (bulk transfer)
    DMAFill = 54, // Fill cells with value
}

/// Interrupt line status
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum InterruptStatus {
    Idle = 0,
    Pending = 1,
    InService = 2,
    Acknowledged = 3,
}

/// Spatial I/O errors
#[derive(Error, Debug)]
pub enum IoError {
    #[error("Device {0} not found")]
    DeviceNotFound(DeviceId),

    #[error("Register offset {0} out of bounds for device {1}")]
    RegisterOutOfBounds(u32, DeviceId),

    #[error("Device {0} does not support this operation")]
    UnsupportedOperation(DeviceId),

    #[error("DMA transfer failed: {0}")]
    DmaTransferFailed(String),

    #[error("Interrupt line {0} not mapped to handler")]
    InterruptLineNotMapped(u8),

    #[error("Invalid DMA parameters: {0}")]
    InvalidDmaParameters(String),

    #[error("Configuration error: {0}")]
    Custom(String),
}

/// Device registry - manages all registered devices
pub struct DeviceRegistry {
    devices: Vec<DeviceDescriptor>,
    next_device_id: DeviceId,
    // Interrupt line mapping: line_number -> handler_cell_index
    interrupt_handlers: [Option<u32>; 256],
}

impl DeviceRegistry {
    pub fn new() -> Self {
        Self {
            devices: Vec::new(),
            next_device_id: 1,
            interrupt_handlers: [None; 256],
        }
    }

    /// Register a new device
    pub fn register_device(
        &mut self,
        base_addr: u32,
        register_count: u32,
        caps: DeviceCaps,
        interrupt_line: Option<u8>,
    ) -> Result<DeviceId, IoError> {
        let device_id = self.next_device_id;
        self.next_device_id = self.next_device_id.wrapping_add(1);

        if device_id == 0 {
            return Err(IoError::UnsupportedOperation(0)); // Overflow
        }

        let descriptor = DeviceDescriptor {
            device_id,
            base_addr,
            register_count,
            caps,
            interrupt_line,
        };

        self.devices.push(descriptor);
        Ok(device_id)
    }

    /// Lookup device by ID
    pub fn get_device(&self, device_id: DeviceId) -> Option<&DeviceDescriptor> {
        self.devices.iter().find(|d| d.device_id == device_id)
    }

    /// Map interrupt line to handler cell
    pub fn map_interrupt(&mut self, line: u8, handler_cell: u32) -> Result<(), IoError> {
        self.interrupt_handlers[line as usize] = Some(handler_cell);
        Ok(())
    }

    /// Get interrupt handler for a line
    pub fn get_interrupt_handler(&self, line: u8) -> Option<u32> {
        self.interrupt_handlers[line as usize]
    }

    /// Get all devices
    pub fn devices(&self) -> &[DeviceDescriptor] {
        &self.devices
    }

    /// Discover devices by scanning MMIO space (placeholder for future)
    pub fn discover_devices(&mut self, mmio_start: u32, mmio_size: u32) -> Result<u32, IoError> {
        // TODO: Scan MMIO space for device signatures
        // For now, return count of manually registered devices
        Ok(self.devices.len() as u32)
    }
}

/// DMA transfer descriptor
#[derive(Debug, Clone, Copy)]
pub struct DmaTransfer {
    pub src_addr: u32,   // Source linear cell index
    pub dest_addr: u32,  // Destination linear cell index
    pub size: u32,       // Number of cells to transfer
    pub direction: DmaDirection,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DmaDirection {
    MemoryToMemory,
    DeviceToMemory,
    MemoryToDevice,
    DeviceToDevice,
}

impl DmaTransfer {
    pub fn validate(&self) -> Result<(), IoError> {
        // Check bounds
        if self.src_addr >= GRID_W as u32 * GRID_H as u32 {
            return Err(IoError::InvalidDmaParameters(
                format!("Source address {} out of bounds", self.src_addr)
            ));
        }
        if self.dest_addr >= GRID_W as u32 * GRID_H as u32 {
            return Err(IoError::InvalidDmaParameters(
                format!("Destination address {} out of bounds", self.dest_addr)
            ));
        }

        // Check transfer doesn't exceed grid
        let src_end = self.src_addr.saturating_add(self.size);
        let dest_end = self.dest_addr.saturating_add(self.size);
        if src_end > GRID_W as u32 * GRID_H as u32 {
            return Err(IoError::InvalidDmaParameters(
                format!("Source transfer end {} exceeds grid", src_end)
            ));
        }
        if dest_end > GRID_W as u32 * GRID_H as u32 {
            return Err(IoError::InvalidDmaParameters(
                format!("Destination transfer end {} exceeds grid", dest_end)
            ));
        }

        Ok(())
    }
}

/// Interrupt controller - manages interrupt delivery to spatial programs
pub struct InterruptController {
    // Interrupt line status: 0=idle, 1=pending, 2=in_service, 3=acknowledged
    line_status: [InterruptStatus; 256],
    // Mask register: bit 1 = enabled
    interrupt_mask: [bool; 256],
}

impl InterruptController {
    pub fn new() -> Self {
        Self {
            line_status: [InterruptStatus::Idle; 256],
            interrupt_mask: [false; 256],
        }
    }

    /// Trigger an interrupt on a line
    pub fn trigger(&mut self, line: u8) {
        if self.interrupt_mask[line as usize] {
            self.line_status[line as usize] = InterruptStatus::Pending;
        }
    }

    /// Check if interrupt is pending
    pub fn is_pending(&self, line: u8) -> bool {
        self.line_status[line as usize] == InterruptStatus::Pending
    }

    /// Service interrupt (mark as in-service)
    pub fn service(&mut self, line: u8) -> Result<(), IoError> {
        if self.line_status[line as usize] != InterruptStatus::Pending {
            return Err(IoError::InterruptLineNotMapped(line));
        }
        self.line_status[line as usize] = InterruptStatus::InService;
        Ok(())
    }

    /// Acknowledge interrupt (mark as idle)
    pub fn acknowledge(&mut self, line: u8) -> Result<(), IoError> {
        if self.line_status[line as usize] != InterruptStatus::InService {
            return Err(IoError::InterruptLineNotMapped(line));
        }
        self.line_status[line as usize] = InterruptStatus::Idle;
        Ok(())
    }

    /// Enable/disable interrupt line
    pub fn set_mask(&mut self, line: u8, enabled: bool) {
        self.interrupt_mask[line as usize] = enabled;
    }

    /// Get next pending interrupt (priority scan)
    pub fn get_next_pending(&self) -> Option<u8> {
        for (line, &status) in self.line_status.iter().enumerate() {
            if status == InterruptStatus::Pending && self.interrupt_mask[line] {
                return Some(line as u8);
            }
        }
        None
    }
}

/// Spatial I/O subsystem - main controller
pub struct SpatialIo {
    registry: DeviceRegistry,
    interrupt_controller: InterruptController,
}

impl SpatialIo {
    pub fn new() -> Self {
        Self {
            registry: DeviceRegistry::new(),
            interrupt_controller: InterruptController::new(),
        }
    }

    /// Register a device
    pub fn register_device(
        &mut self,
        base_addr: u32,
        register_count: u32,
        caps: DeviceCaps,
        interrupt_line: Option<u8>,
    ) -> Result<DeviceId, IoError> {
        self.registry.register_device(base_addr, register_count, caps, interrupt_line)
    }

    /// Perform I/O read
    pub fn read_device_register(
        &self,
        device_id: DeviceId,
        offset: u32,
        mmio_cells: &[u32],
    ) -> Result<u32, IoError> {
        let device = self.registry.get_device(device_id)
            .ok_or(IoError::DeviceNotFound(device_id))?;

        if !device.caps.can_read {
            return Err(IoError::UnsupportedOperation(device_id));
        }

        if offset >= device.register_count {
            return Err(IoError::RegisterOutOfBounds(offset, device_id));
        }

        let cell_index = (device.base_addr + offset) as usize;
        if cell_index >= mmio_cells.len() {
            return Err(IoError::RegisterOutOfBounds(offset, device_id));
        }

        Ok(mmio_cells[cell_index])
    }

    /// Perform I/O write
    pub fn write_device_register(
        &mut self,
        device_id: DeviceId,
        offset: u32,
        value: u32,
        mmio_cells: &mut [u32],
    ) -> Result<(), IoError> {
        let device = self.registry.get_device(device_id)
            .ok_or(IoError::DeviceNotFound(device_id))?;

        if !device.caps.can_write {
            return Err(IoError::UnsupportedOperation(device_id));
        }

        if offset >= device.register_count {
            return Err(IoError::RegisterOutOfBounds(offset, device_id));
        }

        let cell_index = (device.base_addr + offset) as usize;
        if cell_index >= mmio_cells.len() {
            return Err(IoError::RegisterOutOfBounds(offset, device_id));
        }

        mmio_cells[cell_index] = value;

        // If device generates interrupts and this is a status register write,
        // trigger interrupt
        if device.caps.generates_interrupts {
            if let Some(line) = device.interrupt_line {
                self.interrupt_controller.trigger(line);
            }
        }

        Ok(())
    }

    /// Execute DMA transfer (returns new MMIO cells)
    pub fn execute_dma(
        &self,
        transfer: DmaTransfer,
        mmio_cells: &[u32],
    ) -> Result<Vec<u32>, IoError> {
        transfer.validate()?;

        let mut result = mmio_cells.to_vec();

        // Perform bulk copy (this is CPU-side simulation; actual DMA would be GPU-side)
        for i in 0..transfer.size {
            let src_idx = (transfer.src_addr + i) as usize;
            let dest_idx = (transfer.dest_addr + i) as usize;

            if src_idx < result.len() && dest_idx < result.len() {
                result[dest_idx] = result[src_idx];
            } else {
                return Err(IoError::DmaTransferFailed(
                    format!("Transfer exceeds buffer bounds at offset {}", i)
                ));
            }
        }

        Ok(result)
    }

    /// Get interrupt controller
    pub fn interrupt_controller(&mut self) -> &mut InterruptController {
        &mut self.interrupt_controller
    }

    /// Get device registry
    pub fn registry(&self) -> &DeviceRegistry {
        &self.registry
    }

    /// Discover devices in MMIO space
    pub fn discover_devices(&mut self, mmio_start: u32, mmio_size: u32) -> Result<u32, IoError> {
        self.registry.discover_devices(mmio_start, mmio_size)
    }
}

impl Default for SpatialIo {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_device_capabilities() {
        let caps = DeviceCaps {
            can_read: true,
            can_write: true,
            supports_dma: false,
            generates_interrupts: true,
        };

        let encoded = caps.as_u32();
        let decoded = DeviceCaps::from_u32(encoded);

        assert_eq!(decoded.can_read, caps.can_read);
        assert_eq!(decoded.can_write, caps.can_write);
        assert_eq!(decoded.supports_dma, caps.supports_dma);
        assert_eq!(decoded.generates_interrupts, caps.generates_interrupts);
    }

    #[test]
    fn test_device_registration() {
        let mut io = SpatialIo::new();

        let caps = DeviceCaps {
            can_read: true,
            can_write: true,
            supports_dma: true,
            generates_interrupts: false,
        };

        let device_id = io.register_device(0x1000, 4, caps, None).unwrap();
        assert_eq!(device_id, 1);

        let device = io.registry().get_device(device_id).unwrap();
        assert_eq!(device.device_id, 1);
        assert_eq!(device.base_addr, 0x1000);
        assert_eq!(device.register_count, 4);
    }

    #[test]
    fn test_device_not_found() {
        let io = SpatialIo::new();
        let mut mmio_cells = vec![0u32; 1000];

        let result = io.read_device_register(999, 0, &mmio_cells);
        assert!(matches!(result, Err(IoError::DeviceNotFound(999))));
    }

    #[test]
    fn test_register_out_of_bounds() {
        let mut io = SpatialIo::new();

        let caps = DeviceCaps {
            can_read: true,
            can_write: false,
            supports_dma: false,
            generates_interrupts: false,
        };

        io.register_device(0x1000, 4, caps, None).unwrap();
        let mut mmio_cells = vec![0u32; 1000];

        let result = io.read_device_register(1, 10, &mmio_cells);
        assert!(matches!(result, Err(IoError::RegisterOutOfBounds(10, 1))));
    }

    #[test]
    fn test_interrupt_delivery() {
        let mut io = SpatialIo::new();

        // Register device with interrupt
        let caps = DeviceCaps {
            can_read: true,
            can_write: true,
            supports_dma: false,
            generates_interrupts: true,
        };

        io.register_device(1000, 2, caps, Some(5)).unwrap();
        io.interrupt_controller().set_mask(5, true);

        let mut mmio_cells = vec![0u32; 2000];

        // Write to status register should trigger interrupt
        io.write_device_register(1, 0, 0x1234, &mut mmio_cells)
            .unwrap();

        assert!(io.interrupt_controller().is_pending(5));
    }

    #[test]
    fn test_dma_transfer_validation() {
        let io = SpatialIo::new();

        // Valid transfer
        let transfer = DmaTransfer {
            src_addr: 100,
            dest_addr: 200,
            size: 50,
            direction: DmaDirection::MemoryToMemory,
        };
        assert!(transfer.validate().is_ok());

        // Out of bounds
        let invalid_transfer = DmaTransfer {
            src_addr: GRID_W as u32 * GRID_H as u32,
            dest_addr: 0,
            size: 1,
            direction: DmaDirection::MemoryToMemory,
        };
        assert!(invalid_transfer.validate().is_err());
    }

    #[test]
    fn test_dma_copy() {
        let io = SpatialIo::new();

        let mut mmio_cells = vec![0u32; 500];
        for i in 0..100 {
            mmio_cells[100 + i] = i as u32;
        }

        let transfer = DmaTransfer {
            src_addr: 100,
            dest_addr: 300,
            size: 50,
            direction: DmaDirection::MemoryToMemory,
        };

        let result = io.execute_dma(transfer, &mmio_cells).unwrap();

        for i in 0..50 {
            assert_eq!(result[300 + i], i as u32);
        }
    }

    #[test]
    fn test_interrupt_controller() {
        let mut ic = InterruptController::new();

        // Initially idle
        assert!(!ic.is_pending(0));

        // Trigger masked interrupt (should not pend)
        ic.trigger(0);
        assert!(!ic.is_pending(0));

        // Enable and trigger
        ic.set_mask(0, true);
        ic.trigger(0);
        assert!(ic.is_pending(0));

        // Service interrupt
        ic.service(0).unwrap();
        assert!(!ic.is_pending(0));

        // Cannot acknowledge if not in service (line 1 is idle)
        assert!(ic.acknowledge(1).is_err());

        // Service then acknowledge (line 0 is now in-service)
        ic.acknowledge(0).unwrap();
        assert!(!ic.is_pending(0));

        // Full flow: trigger -> service -> acknowledge
        ic.set_mask(1, true);
        ic.trigger(1);
        ic.service(1).unwrap();
        ic.acknowledge(1).unwrap();
        assert!(!ic.is_pending(1));
    }

    #[test]
    fn test_get_next_pending_interrupt() {
        let mut ic = InterruptController::new();

        ic.set_mask(5, true);
        ic.set_mask(10, true);
        ic.set_mask(3, true);

        ic.trigger(5);
        ic.trigger(10);

        // Should return line 5 (first pending)
        assert_eq!(ic.get_next_pending(), Some(5));

        // After servicing, should return line 10
        ic.service(5).unwrap();
        ic.acknowledge(5).unwrap();
        assert_eq!(ic.get_next_pending(), Some(10));
    }
}