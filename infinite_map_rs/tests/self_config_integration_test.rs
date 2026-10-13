//! Integration tests for Phase 12.5: Self-Configuration System

use geometry_os::spatial::self_config::{
    ConfigReport, ConfigStage, DiscoveryResult, HardwareDiscovery, MemoryRegion,
    ResourceAllocation, SelfConfigurator, ServiceDescriptor, ServiceManager, ServiceState,
};
use geometry_os::spatial::spatial_io::{DeviceCaps, DeviceDescriptor};

#[test]
fn test_hardware_discovery() {
    let discovery = HardwareDiscovery::new();
    let result = discovery.discover_hardware().unwrap();

    // Should discover at least 2 devices (console + timer)
    assert!(
        result.devices.len() >= 2,
        "Expected at least 2 devices, found {}",
        result.devices.len()
    );

    // Should have memory information
    assert!(result.total_memory > 0);

    // Should have all interrupt lines available
    assert_eq!(result.available_interrupts.len(), 256);

    // Check console device exists
    let console = result.devices.iter().find(|d| d.base_addr == 0x10000000);
    assert!(console.is_some(), "Console device not found");
    let console = console.unwrap();
    assert!(console.caps.can_read);
    assert!(console.caps.can_write);
    assert!(console.caps.generates_interrupts);

    // Check timer device exists
    let timer = result.devices.iter().find(|d| d.base_addr == 0x20000000);
    assert!(timer.is_some(), "Timer device not found");
}

#[test]
fn test_memory_allocation() {
    let mut resources = ResourceAllocation::new();

    // Allocate memory in chunks
    let kernel_base = resources.allocate_memory(4096, "kernel").unwrap();
    assert_eq!(kernel_base, 0);

    let device_base = resources.allocate_memory(256, "device").unwrap();
    assert_eq!(device_base, 4096);

    let userspace_base = resources.allocate_memory(1024, "userspace").unwrap();
    assert_eq!(userspace_base, 4096 + 256);

    // Check memory usage
    let (used, total, percentage) = resources.get_memory_usage();
    assert_eq!(used, 4096 + 256 + 1024);
    assert_eq!(total, (128 * 64) as u32);
    assert!(percentage > 0.0 && percentage < 100.0);

    // Check regions
    assert_eq!(resources.memory_regions.len(), 3);
    assert!(!resources.memory_regions[0].is_free);
    assert_eq!(resources.memory_regions[0].purpose, "kernel");
}

#[test]
fn test_memory_exhaustion() {
    let mut resources = ResourceAllocation::new();
    let total = resources.total_cells;

    // Try to allocate more than available
    let result = resources.allocate_memory(total + 1, "overflow");
    assert!(result.is_err());

    // Allocate all memory
    let base = resources.allocate_memory(total, "all").unwrap();
    assert_eq!(base, 0);

    // Second allocation should fail
    let result = resources.allocate_memory(1, "more");
    assert!(result.is_err());
}

#[test]
fn test_device_allocation() {
    let mut resources = ResourceAllocation::new();

    // Allocate devices
    resources.allocate_device(1).unwrap();
    resources.allocate_device(2).unwrap();

    // Duplicate allocation should fail
    let result = resources.allocate_device(1);
    assert!(result.is_err());

    // Different device should succeed
    resources.allocate_device(3).unwrap();
}

#[test]
fn test_interrupt_allocation() {
    let mut resources = ResourceAllocation::new();

    // Allocate interrupt lines
    resources.allocate_interrupt(1).unwrap();
    resources.allocate_interrupt(10).unwrap();
    resources.allocate_interrupt(255).unwrap();

    // Duplicate should fail
    let result = resources.allocate_interrupt(1);
    assert!(result.is_err());
}

#[test]
fn test_service_manager() {
    let mut manager = ServiceManager::new();

    // Register services
    manager.register(ServiceDescriptor {
        name: "init".to_string(),
        pid: 1,
        state: ServiceState::Running,
        dependencies: vec![],
    });

    manager.register(ServiceDescriptor {
        name: "console".to_string(),
        pid: 2,
        state: ServiceState::Stopped,
        dependencies: vec!["init".to_string()],
    });

    // Check status
    assert_eq!(manager.get_status("init"), Some(ServiceState::Running));
    assert_eq!(manager.get_status("console"), Some(ServiceState::Stopped));
    assert!(manager.get_status("nonexistent").is_none());

    // List services
    let services = manager.list_services();
    assert_eq!(services.len(), 2);
}

#[test]
fn test_config_stage_progression() {
    // Test stage ordering
    assert!(ConfigStage::Unconfigured.at_least(ConfigStage::Unconfigured));
    assert!(ConfigStage::HardwareDiscovered.at_least(ConfigStage::Unconfigured));
    assert!(
        ConfigStage::ResourcesAllocated.at_least(ConfigStage::HardwareDiscovered)
    );
    assert!(ConfigStage::Configured.at_least(ConfigStage::ServicesRunning));

    // Test reverse fails
    assert!(!ConfigStage::Unconfigured.at_least(ConfigStage::HardwareDiscovered));
}

#[test]
fn test_discovery_standalone() {
    let discovery = HardwareDiscovery::new();
    let result = discovery.discover_hardware().unwrap();

    // Verify discovery results structure
    assert!(!result.devices.is_empty());
    assert!(result.total_memory > 0);
    assert!(!result.available_interrupts.is_empty());
    assert!(result.discovery_timestamp_ms > 0);

    // Verify device structure
    for device in &result.devices {
        assert!(device.device_id > 0);
        assert!(device.base_addr > 0);
        assert!(device.register_count > 0);
    }
}

#[test]
fn test_full_configuration_pipeline() {
    let mut configurator = SelfConfigurator::new();

    // Initial state
    assert_eq!(configurator.get_stage(), ConfigStage::Unconfigured);

    // Run full configuration
    configurator.configure().unwrap();

    // Final state
    assert_eq!(configurator.get_stage(), ConfigStage::Configured);

    // Get report
    let report = configurator.get_report();
    assert!(report.devices_found >= 2);
    assert!(report.drivers_loaded >= 2);
    assert!(report.services_running >= 3);
    assert!(report.memory_used > 0);
    assert!(report.memory_total > 0);
    assert!(report.memory_percentage > 0.0);
}

#[test]
fn test_stepwise_configuration() {
    let mut configurator = SelfConfigurator::new();

    // Step 1: Hardware discovery
    configurator.discover_hardware().unwrap();
    assert_eq!(configurator.get_stage(), ConfigStage::HardwareDiscovered);

    // Step 2: Resource allocation
    configurator.allocate_resources().unwrap();
    assert_eq!(
        configurator.get_stage(),
        ConfigStage::ResourcesAllocated
    );

    // Step 3: Driver loading
    configurator.load_drivers().unwrap();
    assert_eq!(configurator.get_stage(), ConfigStage::DriversLoaded);

    // Step 4: Service startup
    configurator.start_services().unwrap();
    assert_eq!(configurator.get_stage(), ConfigStage::ServicesRunning);
}

#[test]
fn test_stage_guards() {
    let mut configurator = SelfConfigurator::new();

    // Cannot allocate resources before discovery
    let result = configurator.allocate_resources();
    assert!(result.is_err());

    // Cannot load drivers before allocation
    let result = configurator.load_drivers();
    assert!(result.is_err());

    // Cannot start services before driver loading
    let result = configurator.start_services();
    assert!(result.is_err());

    // Now discover hardware
    configurator.discover_hardware().unwrap();

    // Allocation should now work
    let result = configurator.allocate_resources();
    assert!(result.is_ok());
}

#[test]
fn test_configuration_report() {
    let mut configurator = SelfConfigurator::new();
    configurator.configure().unwrap();

    let report = configurator.get_report();

    // Verify report structure
    assert_eq!(report.stage, ConfigStage::Configured);
    assert!(report.memory_used > 0);
    assert!(report.memory_total > 0);
    assert!(report.memory_percentage > 0.0 && report.memory_percentage <= 100.0);
    assert!(report.devices_found > 0);
    assert!(report.drivers_loaded > 0);
    assert!(report.services_running > 0);
}

#[test]
fn test_resource_tracking() {
    let mut configurator = SelfConfigurator::new();
    configurator.discover_hardware().unwrap();
    configurator.allocate_resources().unwrap();

    // Verify devices are allocated
    let discovery = configurator.discovery_result.as_ref().unwrap();
    assert_eq!(
        configurator.resources.allocated_devices.len(),
        discovery.devices.len()
    );

    // Verify memory is allocated
    assert!(configurator.resources.used_cells > 0);
    assert!(configurator.resources.memory_regions.len() > 0);
}

#[test]
fn test_service_dependencies() {
    let mut manager = ServiceManager::new();

    // Register service with dependency
    manager.register(ServiceDescriptor {
        name: "dep".to_string(),
        pid: 1,
        state: ServiceState::Running,
        dependencies: vec![],
    });

    manager.register(ServiceDescriptor {
        name: "consumer".to_string(),
        pid: 2,
        state: ServiceState::Stopped,
        dependencies: vec!["dep".to_string()],
    });

    // Starting service with running dependency should work
    let result = manager.start_service("consumer");
    assert!(result.is_ok());
}

#[test]
fn test_service_missing_dependency() {
    let mut manager = ServiceManager::new();

    // Register service with missing dependency
    manager.register(ServiceDescriptor {
        name: "consumer".to_string(),
        pid: 2,
        state: ServiceState::Stopped,
        dependencies: vec!["missing".to_string()],
    });

    // Should fail
    let result = manager.start_service("consumer");
    assert!(result.is_err());
}

#[test]
fn test_region_layout() {
    let mut resources = ResourceAllocation::new();

    resources.allocate_memory(100, "region1").unwrap();
    resources.allocate_memory(200, "region2").unwrap();
    resources.allocate_memory(50, "region3").unwrap();

    // Check layout
    assert_eq!(resources.memory_regions.len(), 3);
    assert_eq!(resources.memory_regions[0].base_addr, 0);
    assert_eq!(resources.memory_regions[0].size_cells, 100);
    assert_eq!(resources.memory_regions[1].base_addr, 100);
    assert_eq!(resources.memory_regions[1].size_cells, 200);
    assert_eq!(resources.memory_regions[2].base_addr, 300);
    assert_eq!(resources.memory_regions[2].size_cells, 50);
}