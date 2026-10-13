//! Phase 12.5: Self-Configuration System
//!
//! Hardware discovery, resource allocation, driver loading, and service initialization.
//! Enables PNG-borne systems to auto-configure without external assistance.
//!
//! Architecture:
//! - Hardware discovery via MMIO space scanning
//! - Resource allocation tracking (memory, devices, interrupts)
//! - Driver registry and loading infrastructure
//! - Service initialization with dependency resolution
//! - Configuration state persistence

use crate::spatial::path_cache::{GRID_H, GRID_W};
use crate::spatial::spatial_io::{DeviceCaps, DeviceDescriptor, DeviceId, IoError};
use std::collections::{HashMap, HashSet};
use std::sync::{Arc, RwLock};

/// Configuration state stages
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ConfigStage {
    /// Initial state, no configuration performed
    Unconfigured = 0,
    /// Hardware discovery complete, devices enumerated
    HardwareDiscovered = 1,
    /// Resources allocated (memory regions, device mappings)
    ResourcesAllocated = 2,
    /// Drivers loaded and initialized
    DriversLoaded = 3,
    /// Services started
    ServicesRunning = 4,
    /// Fully configured and operational
    Configured = 5,
}

impl ConfigStage {
    /// Returns true if stage is at least as progressed as other
    pub fn at_least(&self, other: ConfigStage) -> bool {
        (*self as u8) >= (other as u8)
    }
}

/// Memory region descriptor
#[derive(Debug, Clone)]
pub struct MemoryRegion {
    pub base_addr: u32,  // Linear cell index
    pub size_cells: u32, // Size in cells
    pub purpose: String, // Purpose description (e.g., "kernel", "drivers", "userspace")
    pub is_free: bool,   // Whether region is available
}

/// Resource allocation tracking
#[derive(Debug, Clone)]
pub struct ResourceAllocation {
    pub memory_regions: Vec<MemoryRegion>,
    pub allocated_devices: HashSet<DeviceId>,
    pub allocated_interrupts: HashSet<u8>,
    pub total_cells: u32,
    pub used_cells: u32,
}

impl ResourceAllocation {
    pub fn new() -> Self {
        let total_cells = (GRID_W * GRID_H) as u32;
        Self {
            memory_regions: Vec::new(),
            allocated_devices: HashSet::new(),
            allocated_interrupts: HashSet::new(),
            total_cells,
            used_cells: 0,
        }
    }

    /// Allocate a memory region
    pub fn allocate_memory(&mut self, size_cells: u32, purpose: &str) -> Result<u32, IoError> {
        if self.used_cells + size_cells > self.total_cells {
            return Err(IoError::ResourceExhausted(format!(
                "Not enough memory: need {}, have {} free",
                size_cells,
                self.total_cells - self.used_cells
            )));
        }

        let base_addr = self.used_cells;
        self.used_cells += size_cells;

        let region = MemoryRegion {
            base_addr,
            size_cells,
            purpose: purpose.to_string(),
            is_free: false,
        };

        self.memory_regions.push(region);
        Ok(base_addr)
    }

    /// Allocate a device ID
    pub fn allocate_device(&mut self, device_id: DeviceId) -> Result<(), IoError> {
        if self.allocated_devices.contains(&device_id) {
            return Err(IoError::DeviceAlreadyAllocated(device_id));
        }
        self.allocated_devices.insert(device_id);
        Ok(())
    }

    /// Allocate an interrupt line
    pub fn allocate_interrupt(&mut self, line: u8) -> Result<(), IoError> {
        if self.allocated_interrupts.contains(&line) {
            return Err(IoError::InterruptAlreadyAllocated(line));
        }
        self.allocated_interrupts.insert(line);
        Ok(())
    }

    /// Get memory usage statistics
    pub fn get_memory_usage(&self) -> (u32, u32, f32) {
        let used = self.used_cells;
        let total = self.total_cells;
        let percentage = if total > 0 {
            (used as f32 / total as f32) * 100.0
        } else {
            0.0
        };
        (used, total, percentage)
    }
}

/// Hardware discovery result
#[derive(Debug, Clone)]
pub struct DiscoveryResult {
    pub devices: Vec<DeviceDescriptor>,
    pub total_memory: u32,
    pub available_interrupts: Vec<u8>,
    pub discovery_timestamp_ms: u64,
}

/// Hardware discovery engine
pub struct HardwareDiscovery {
    /// Scan ranges for device detection (address ranges in MMIO space)
    scan_ranges: Vec<(u32, u32)>,
    /// Known device signatures for identification
    device_signatures: HashMap<u32, (String, DeviceCaps)>,
}

impl HardwareDiscovery {
    pub fn new() -> Self {
        Self {
            scan_ranges: vec![
                // UART/console at 0x10000000
                (0x10000000, 0x10000100),
                // Timer at 0x20000000
                (0x20000000, 0x20000100),
                // SPI at 0x30000000
                (0x30000000, 0x30000100),
                // PCI config space at 0x40000000
                (0x40000000, 0x40100000),
            ],
            device_signatures: {
                let mut sigs = HashMap::new();
                // Console device signature
                sigs.insert(0x10000000, (
                    "UART Console".to_string(),
                    DeviceCaps {
                        can_read: true,
                        can_write: true,
                        supports_dma: false,
                        generates_interrupts: true,
                    }
                ));
                // Timer device signature
                sigs.insert(0x20000000, (
                    "System Timer".to_string(),
                    DeviceCaps {
                        can_read: true,
                        can_write: true,
                        supports_dma: false,
                        generates_interrupts: true,
                    }
                ));
                sigs
            },
        }
    }

    /// Scan MMIO space for devices
    pub fn discover_hardware(&self) -> Result<DiscoveryResult, IoError> {
        use std::time::{SystemTime, UNIX_EPOCH};

        let start = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;

        let mut devices = Vec::new();
        let mut device_id_counter = 1u16;

        // Scan each known device signature
        for (&base_addr, (name, caps)) in &self.device_signatures {
            let device = DeviceDescriptor {
                device_id: device_id_counter,
                base_addr: base_addr,
                register_count: 16, // 16 registers per device
                caps: *caps,
                interrupt_line: Some(device_id_counter as u8),
            };
            devices.push(device);
            device_id_counter += 1;
        }

        // Scan additional ranges for unknown devices
        for (start_addr, end_addr) in &self.scan_ranges {
            // In real implementation, would read MMIO at these addresses
            // For now, we just register known devices
        }

        let total_memory = (GRID_W * GRID_H) as u32;
        let available_interrupts: Vec<u8> = (0..=255u8).collect();

        Ok(DiscoveryResult {
            devices,
            total_memory,
            available_interrupts,
            discovery_timestamp_ms: start,
        })
    }
}

impl Default for HardwareDiscovery {
    fn default() -> Self {
        Self::new()
    }
}

/// Driver entry point
pub type DriverInitFn = fn(&DeviceDescriptor) -> Result<(), IoError>;

/// Driver metadata
#[derive(Debug, Clone)]
pub struct DriverInfo {
    pub name: String,
    pub version: String,
    pub supported_devices: Vec<String>,
    pub init_fn: Option<DriverInitFn>,
}

/// Driver registry
pub struct DriverRegistry {
    drivers: HashMap<String, DriverInfo>,
}

impl DriverRegistry {
    pub fn new() -> Self {
        Self {
            drivers: HashMap::new(),
        }
    }

    /// Register a driver
    pub fn register(&mut self, info: DriverInfo) {
        self.drivers.insert(info.name.clone(), info);
    }

    /// Find driver for a device
    pub fn find_driver(&self, device_name: &str) -> Option<&DriverInfo> {
        self.drivers.values().find(|driver| {
            driver.supported_devices.iter().any(|name| name.contains(device_name))
        })
    }

    /// List all registered drivers
    pub fn list_drivers(&self) -> Vec<&DriverInfo> {
        self.drivers.values().collect()
    }
}

impl Default for DriverRegistry {
    fn default() -> Self {
        Self::new()
    }
}

/// Service state
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ServiceState {
    Stopped = 0,
    Starting = 1,
    Running = 2,
    Stopping = 3,
    Failed = 4,
}

/// Service descriptor
#[derive(Debug, Clone)]
pub struct ServiceDescriptor {
    pub name: String,
    pub pid: u32,
    pub state: ServiceState,
    pub dependencies: Vec<String>,
}

/// Service manager
pub struct ServiceManager {
    services: HashMap<String, ServiceDescriptor>,
}

impl ServiceManager {
    pub fn new() -> Self {
        Self {
            services: HashMap::new(),
        }
    }

    /// Register a service
    pub fn register(&mut self, service: ServiceDescriptor) {
        self.services.insert(service.name.clone(), service);
    }

    /// Start a service and its dependencies
    pub fn start_service(&mut self, name: &str) -> Result<(), IoError> {
        if let Some(service) = self.services.get(name) {
            // Check dependencies
            for dep in &service.dependencies {
                if let Some(dep_service) = self.services.get(dep) {
                    if dep_service.state != ServiceState::Running {
                        return Err(IoError::ServiceDependencyFailed(
                            name.to_string(),
                            dep.to_string(),
                        ));
                    }
                }
            }

            // Start the service
            // In real implementation, would spawn process/ticket
            Ok(())
        } else {
            Err(IoError::ServiceNotFound(name.to_string()))
        }
    }

    /// Get service status
    pub fn get_status(&self, name: &str) -> Option<ServiceState> {
        self.services.get(name).map(|s| s.state)
    }

    /// List all services
    pub fn list_services(&self) -> Vec<&ServiceDescriptor> {
        self.services.values().collect()
    }
}

impl Default for ServiceManager {
    fn default() -> Self {
        Self::new()
    }
}

/// Self-configuration engine
pub struct SelfConfigurator {
    stage: ConfigStage,
    discovery: HardwareDiscovery,
    resources: ResourceAllocation,
    driver_registry: DriverRegistry,
    service_manager: ServiceManager,
    discovery_result: Option<DiscoveryResult>,
}

impl SelfConfigurator {
    pub fn new() -> Self {
        Self {
            stage: ConfigStage::Unconfigured,
            discovery: HardwareDiscovery::new(),
            resources: ResourceAllocation::new(),
            driver_registry: DriverRegistry::new(),
            service_manager: ServiceManager::new(),
            discovery_result: None,
        }
    }

    /// Get current configuration stage
    pub fn get_stage(&self) -> ConfigStage {
        self.stage
    }

    /// Perform full self-configuration pipeline
    pub fn configure(&mut self) -> Result<(), IoError> {
        self.discover_hardware()?;
        self.allocate_resources()?;
        self.load_drivers()?;
        self.start_services()?;
        self.stage = ConfigStage::Configured;
        Ok(())
    }

    /// Step 1: Discover hardware
    pub fn discover_hardware(&mut self) -> Result<(), IoError> {
        if self.stage.at_least(ConfigStage::HardwareDiscovered) {
            return Ok(());
        }

        let result = self.discovery.discover_hardware()?;
        self.discovery_result = Some(result.clone());
        self.stage = ConfigStage::HardwareDiscovered;

        log::info!(
            "Hardware discovery complete: {} devices found",
            result.devices.len()
        );

        Ok(())
    }

    /// Step 2: Allocate resources
    pub fn allocate_resources(&mut self) -> Result<(), IoError> {
        if !self.stage.at_least(ConfigStage::HardwareDiscovered) {
            return Err(IoError::StageTransitionError(
                "Cannot allocate resources before hardware discovery".to_string(),
            ));
        }

        let result = self.discovery_result.as_ref().unwrap();

        // Allocate kernel memory (first 4096 cells)
        self.resources.allocate_memory(4096, "kernel")?;

        // Allocate memory for each device
        for device in &result.devices {
            let device_memory = device.size_in_cells();
            self.resources.allocate_memory(device_memory, &format!("device_{}", device.device_id))?;
            self.resources.allocate_device(device.device_id)?;
            if let Some(interrupt) = device.interrupt_line {
                self.resources.allocate_interrupt(interrupt)?;
            }
        }

        // Allocate userspace memory (remaining space)
        let (used, total, _) = self.resources.get_memory_usage();
        let userspace = total - used;
        self.resources.allocate_memory(userspace, "userspace")?;

        self.stage = ConfigStage::ResourcesAllocated;

        let (used, total, percentage) = self.resources.get_memory_usage();
        log::info!(
            "Resource allocation complete: {}/{} cells ({:.1}%)",
            used,
            total,
            percentage
        );

        Ok(())
    }

    /// Step 3: Load drivers
    pub fn load_drivers(&mut self) -> Result<(), IoError> {
        if !self.stage.at_least(ConfigStage::ResourcesAllocated) {
            return Err(IoError::StageTransitionError(
                "Cannot load drivers before resource allocation".to_string(),
            ));
        }

        let result = self.discovery_result.as_ref().unwrap();

        // Register built-in drivers
        self.driver_registry.register(DriverInfo {
            name: "console_driver".to_string(),
            version: "1.0.0".to_string(),
            supported_devices: vec!["UART".to_string(), "Console".to_string()],
            init_fn: None, // In real implementation, would have init function
        });

        self.driver_registry.register(DriverInfo {
            name: "timer_driver".to_string(),
            version: "1.0.0".to_string(),
            supported_devices: vec!["Timer".to_string()],
            init_fn: None,
        });

        // Load drivers for discovered devices
        for device in &result.devices {
            let device_id = device.device_id;
            let base_addr = device.base_addr;

            if let Some(driver) = self.driver_registry.find_driver("UART") {
                log::info!(
                    "Loading driver '{}' for device {} at {:#x}",
                    driver.name,
                    device_id,
                    base_addr
                );
                // In real implementation, would call driver.init_fn(device)
            }
        }

        self.stage = ConfigStage::DriversLoaded;
        log::info!("Driver loading complete: {} drivers loaded", result.devices.len());

        Ok(())
    }

    /// Step 4: Start services
    pub fn start_services(&mut self) -> Result<(), IoError> {
        if !self.stage.at_least(ConfigStage::DriversLoaded) {
            return Err(IoError::StageTransitionError(
                "Cannot start services before driver loading".to_string(),
            ));
        }

        // Register core services
        self.service_manager.register(ServiceDescriptor {
            name: "init".to_string(),
            pid: 1,
            state: ServiceState::Running,
            dependencies: vec![],
        });

        self.service_manager.register(ServiceDescriptor {
            name: "console_service".to_string(),
            pid: 2,
            state: ServiceState::Running,
            dependencies: vec!["console_driver".to_string()],
        });

        self.service_manager.register(ServiceDescriptor {
            name: "timer_service".to_string(),
            pid: 3,
            state: ServiceState::Running,
            dependencies: vec!["timer_driver".to_string()],
        });

        self.stage = ConfigStage::ServicesRunning;
        log::info!("Service initialization complete: 3 services running");

        Ok(())
    }

    /// Get configuration report
    pub fn get_report(&self) -> ConfigReport {
        let (used_mem, total_mem, mem_pct) = self.resources.get_memory_usage();
        let device_count = self.discovery_result
            .as_ref()
            .map(|r| r.devices.len())
            .unwrap_or(0);
        let driver_count = self.driver_registry.list_drivers().len();
        let service_count = self.service_manager.list_services().len();

        ConfigReport {
            stage: self.stage,
            memory_used: used_mem,
            memory_total: total_mem,
            memory_percentage: mem_pct,
            devices_found: device_count,
            drivers_loaded: driver_count,
            services_running: service_count,
        }
    }
}

impl Default for SelfConfigurator {
    fn default() -> Self {
        Self::new()
    }
}

/// Configuration report
#[derive(Debug, Clone)]
pub struct ConfigReport {
    pub stage: ConfigStage,
    pub memory_used: u32,
    pub memory_total: u32,
    pub memory_percentage: f32,
    pub devices_found: usize,
    pub drivers_loaded: usize,
    pub services_running: usize,
}

/// Extend IoError with self-configuration errors
impl IoError {
    pub fn ResourceExhausted(msg: String) -> Self {
        IoError::Other(msg)
    }

    pub fn DeviceAlreadyAllocated(id: DeviceId) -> Self {
        IoError::Other(format!("Device {} already allocated", id))
    }

    pub fn InterruptAlreadyAllocated(line: u8) -> Self {
        IoError::Other(format!("Interrupt {} already allocated", line))
    }

    pub fn StageTransitionError(msg: String) -> Self {
        IoError::Other(msg)
    }

    pub fn ServiceNotFound(name: String) -> Self {
        IoError::Other(format!("Service '{}' not found", name))
    }

    pub fn ServiceDependencyFailed(service: String, dep: String) -> Self {
        IoError::Other(format!("Service '{}' depends on '{}' which is not running", service, dep))
    }

    pub fn Other(msg: String) -> Self {
        IoError::Custom(msg)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_config_stage_progression() {
        assert!(ConfigStage::HardwareDiscovered.at_least(ConfigStage::Unconfigured));
        assert!(ConfigStage::Configured.at_least(ConfigStage::ServicesRunning));
        assert!(!ConfigStage::Unconfigured.at_least(ConfigStage::HardwareDiscovered));
    }

    #[test]
    fn test_resource_allocation() {
        let mut resources = ResourceAllocation::new();
        let base1 = resources.allocate_memory(100, "test1").unwrap();
        let base2 = resources.allocate_memory(50, "test2").unwrap();
        assert_eq!(base1, 0);
        assert_eq!(base2, 100);
        assert_eq!(resources.used_cells, 150);
    }

    #[test]
    fn test_memory_exhaustion() {
        let mut resources = ResourceAllocation::new();
        let result = resources.allocate_memory(resources.total_cells + 1, "overflow");
        assert!(result.is_err());
    }

    #[test]
    fn test_hardware_discovery() {
        let discovery = HardwareDiscovery::new();
        let result = discovery.discover_hardware().unwrap();
        assert!(!result.devices.is_empty());
        assert!(result.total_memory > 0);
        assert_eq!(result.available_interrupts.len(), 256);
    }

    #[test]
    fn test_driver_registry() {
        let mut registry = DriverRegistry::new();
        registry.register(DriverInfo {
            name: "test_driver".to_string(),
            version: "1.0".to_string(),
            supported_devices: vec!["UART".to_string()],
            init_fn: None,
        });
        let driver = registry.find_driver("UART").unwrap();
        assert_eq!(driver.name, "test_driver");
    }

    #[test]
    fn test_service_manager() {
        let mut manager = ServiceManager::new();
        manager.register(ServiceDescriptor {
            name: "test".to_string(),
            pid: 1,
            state: ServiceState::Stopped,
            dependencies: vec![],
        });
        let status = manager.get_status("test").unwrap();
        assert_eq!(status, ServiceState::Stopped);
    }

    #[test]
    fn test_full_configuration() {
        let mut configurator = SelfConfigurator::new();
        configurator.configure().unwrap();
        assert_eq!(configurator.get_stage(), ConfigStage::Configured);

        let report = configurator.get_report();
        assert!(report.devices_found > 0);
        assert!(report.drivers_loaded > 0);
        assert!(report.services_running > 0);
    }

    #[test]
    fn test_stage_guards() {
        let mut configurator = SelfConfigurator::new();
        // Try to allocate resources before discovery
        let result = configurator.allocate_resources();
        assert!(result.is_err());

        // Now discover hardware
        configurator.discover_hardware().unwrap();

        // Should succeed now
        let result = configurator.allocate_resources();
        assert!(result.is_ok());
    }
}