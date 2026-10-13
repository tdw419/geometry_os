//! Phase 6.2: Spatial Orchestration
//!
//! Higher-level abstractions for managing spatial programs:
//! - Spatial Services: reusable secure regions with defined interfaces
//! - Spatial Channels: typed communication paths between regions
//! - Spatial Policies: declarative security rules governing interactions
//!
//! This module builds on the hypervisor bridge (Phase 5.2) and provides
//! a programming model suitable for real-world applications.

use crate::geoasm_materializer::{CellState, TYPE_WALL, TYPE_MEMBRANE, TYPE_DOOR};
use crate::spatial::hypervisor_bridge::{SpatialRegion, SpatialRegionTable};
use std::collections::{HashMap, HashSet};
use std::sync::Arc;

// ── Phase 6.2 Core Concepts ─────────────────────────────────────────────────────

/// Permission flags for spatial regions
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
#[repr(u32)]
pub enum RegionPermission {
    /// No permissions
    #[default]
    None = 0,
    /// Can be read by any region
    PublicRead = 1 << 0,
    /// Can be written by any region
    PublicWrite = 1 << 1,
    /// Trusted service region (elevated privileges)
    Trusted = 1 << 2,
    /// Immutable after creation
    Immutable = 1 << 3,
}

impl RegionPermission {
    /// Check if permission has a specific flag
    pub fn has(self, flag: RegionPermission) -> bool {
        (self as u32 & flag as u32) != 0
    }
}

/// Service interface definition
#[derive(Debug, Clone)]
pub struct ServiceInterface {
    /// Service name
    pub name: String,
    /// Input channels (channel_id -> allowed sender regions)
    pub inputs: HashMap<String, Vec<u64>>,
    /// Output channels (channel_id -> allowed receiver regions)
    pub outputs: HashMap<String, Vec<u64>>,
    /// Service permissions
    pub permissions: RegionPermission,
    /// Maximum concurrent requests
    pub max_concurrent: usize,
}

impl ServiceInterface {
    /// Create a new service interface
    pub fn new(name: impl Into<String>) -> Self {
        ServiceInterface {
            name: name.into(),
            inputs: HashMap::new(),
            outputs: HashMap::new(),
            permissions: RegionPermission::default(),
            max_concurrent: 1,
        }
    }

    /// Add an input channel
    pub fn add_input(mut self, channel: impl Into<String>, allowed_senders: Vec<u64>) -> Self {
        self.inputs.insert(channel.into(), allowed_senders);
        self
    }

    /// Add an output channel
    pub fn add_output(mut self, channel: impl Into<String>, allowed_receivers: Vec<u64>) -> Self {
        self.outputs.insert(channel.into(), allowed_receivers);
        self
    }

    /// Set permissions
    pub fn with_permissions(mut self, perm: RegionPermission) -> Self {
        self.permissions = perm;
        self
    }

    /// Set max concurrent requests
    pub fn with_concurrency(mut self, max: usize) -> Self {
        self.max_concurrent = max;
        self
    }
}

/// Spatial Service: a reusable secure region
#[derive(Debug, Clone)]
pub struct SpatialService {
    /// Service ID
    pub id: u64,
    /// Service interface
    pub interface: ServiceInterface,
    /// Underlying spatial region
    pub region: SpatialRegion,
    /// Current active request count
    pub active_requests: usize,
}

impl SpatialService {
    /// Create a new spatial service
    pub fn new(id: u64, interface: ServiceInterface, region: SpatialRegion) -> Self {
        SpatialService {
            id,
            interface,
            region,
            active_requests: 0,
        }
    }

    /// Check if service can accept a new request
    pub fn can_accept(&self) -> bool {
        self.active_requests < self.interface.max_concurrent
    }

    /// Increment request count
    pub fn acquire(&mut self) -> bool {
        if self.can_accept() {
            self.active_requests += 1;
            true
        } else {
            false
        }
    }

    /// Decrement request count
    pub fn release(&mut self) {
        if self.active_requests > 0 {
            self.active_requests -= 1;
        }
    }
}

/// Communication channel between regions
#[derive(Debug, Clone)]
pub struct SpatialChannel {
    /// Channel ID
    pub id: String,
    /// Source region ID
    pub source_region: u64,
    /// Destination region ID
    pub dest_region: u64,
    /// Channel type
    pub channel_type: ChannelType,
    /// Buffer size (in cells)
    pub buffer_size: usize,
    /// Current buffered items
    pub buffered: usize,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ChannelType {
    /// Unidirectional: source → destination
    Unidirectional,
    /// Bidirectional: source ↔ destination
    Bidirectional,
    /// Request-Response: request → destination, response → source
    RequestResponse,
}

impl SpatialChannel {
    /// Create a new spatial channel
    pub fn new(
        id: impl Into<String>,
        source_region: u64,
        dest_region: u64,
        channel_type: ChannelType,
    ) -> Self {
        SpatialChannel {
            id: id.into(),
            source_region,
            dest_region,
            channel_type,
            buffer_size: 1024, // Default buffer size
            buffered: 0,
        }
    }

    /// Set buffer size
    pub fn with_buffer_size(mut self, size: usize) -> Self {
        self.buffer_size = size;
        self
    }

    /// Check if channel can accept more data
    pub fn can_send(&self) -> bool {
        self.buffered < self.buffer_size
    }

    /// Check if channel has data to read
    pub fn can_receive(&self) -> bool {
        self.buffered > 0
    }
}

/// Security policy for region interactions
#[derive(Debug, Clone)]
pub struct SpatialPolicy {
    /// Policy ID
    pub id: String,
    /// Source region filter (None = any region)
    pub source_filter: Option<u64>,
    /// Destination region filter (None = any region)
    pub dest_filter: Option<u64>,
    /// Action to take
    pub action: PolicyAction,
    /// Cell types allowed in path
    pub allowed_cell_types: HashSet<u32>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PolicyAction {
    /// Allow the interaction
    Allow,
    /// Block the interaction
    Block,
    /// Require explicit authorization
    RequireAuth,
    /// Rate limit the interaction
    RateLimit { max_per_tick: usize },
}

impl SpatialPolicy {
    /// Create a new policy
    pub fn new(id: impl Into<String>, action: PolicyAction) -> Self {
        let mut allowed = HashSet::new();
        // By default, allow normal cells and MEMBRANE (porous for data)
        allowed.insert(TYPE_MEMBRANE);
        allowed.insert(TYPE_DOOR);

        SpatialPolicy {
            id: id.into(),
            source_filter: None,
            dest_filter: None,
            action,
            allowed_cell_types: allowed,
        }
    }

    /// Set source region filter
    pub fn with_source(mut self, region_id: u64) -> Self {
        self.source_filter = Some(region_id);
        self
    }

    /// Set destination region filter
    pub fn with_dest(mut self, region_id: u64) -> Self {
        self.dest_filter = Some(region_id);
        self
    }

    /// Add allowed cell type
    pub fn allow_cell_type(mut self, cell_type: u32) -> Self {
        self.allowed_cell_types.insert(cell_type);
        self
    }

    /// Check if policy matches an interaction
    pub fn matches(&self, source: u64, dest: u64) -> bool {
        if let Some(src_filter) = self.source_filter {
            if src_filter != source {
                return false;
            }
        }
        if let Some(dest_filter) = self.dest_filter {
            if dest_filter != dest {
                return false;
            }
        }
        true
    }
}

// ── Service Registry ───────────────────────────────────────────────────────────

/// Manages all spatial services
#[derive(Debug)]
pub struct ServiceRegistry {
    services: HashMap<u64, SpatialService>,
    channels: HashMap<String, SpatialChannel>,
    policies: Vec<SpatialPolicy>,
    next_service_id: u64,
}

impl ServiceRegistry {
    /// Create a new service registry
    pub fn new() -> Self {
        ServiceRegistry {
            services: HashMap::new(),
            channels: HashMap::new(),
            policies: Vec::new(),
            next_service_id: 1,
        }
    }

    /// Register a new service
    pub fn register_service(&mut self, interface: ServiceInterface, region: SpatialRegion) -> u64 {
        let id = self.next_service_id;
        self.next_service_id += 1;

        let service = SpatialService::new(id, interface, region);
        self.services.insert(id, service);
        id
    }

    /// Get a service by ID
    pub fn get_service(&self, id: u64) -> Option<&SpatialService> {
        self.services.get(&id)
    }

    /// Get a mutable service by ID
    pub fn get_service_mut(&mut self, id: u64) -> Option<&mut SpatialService> {
        self.services.get_mut(&id)
    }

    /// Unregister a service
    pub fn unregister_service(&mut self, id: u64) -> Option<SpatialService> {
        self.services.remove(&id)
    }

    /// Create a communication channel
    pub fn create_channel(&mut self, channel: SpatialChannel) -> Result<(), String> {
        // Verify source and destination regions exist
        if !self.services.contains_key(&channel.source_region) {
            return Err(format!("Source region {} not found", channel.source_region));
        }
        if !self.services.contains_key(&channel.dest_region) {
            return Err(format!("Destination region {} not found", channel.dest_region));
        }

        // Check policy compliance
        let allowed = self.check_policy(channel.source_region, channel.dest_region)?;
        if !allowed {
            return Err(format!(
                "Policy blocked channel from {} to {}",
                channel.source_region, channel.dest_region
            ));
        }

        self.channels.insert(channel.id.clone(), channel);
        Ok(())
    }

    /// Get a channel by ID
    pub fn get_channel(&self, id: &str) -> Option<&SpatialChannel> {
        self.channels.get(id)
    }

    /// Add a security policy
    pub fn add_policy(&mut self, policy: SpatialPolicy) {
        self.policies.push(policy);
    }

    /// Check if an interaction is allowed by policies
    pub fn check_policy(&self, source: u64, dest: u64) -> Result<bool, String> {
        // Find matching policies (later policies override earlier ones)
        let mut result = true; // Default allow

        for policy in &self.policies {
            if policy.matches(source, dest) {
                match policy.action {
                    PolicyAction::Allow => result = true,
                    PolicyAction::Block => {
                        return Ok(false);
                    }
                    PolicyAction::RequireAuth => {
                        // For now, treat as deny
                        return Err("Authorization required".to_string());
                    }
                    PolicyAction::RateLimit { max_per_tick } => {
                        // Rate limiting not yet implemented
                        // For now, just log it
                        log::debug!(
                            "Rate limit applied: {} operations per tick",
                            max_per_tick
                        );
                    }
                }
            }
        }

        Ok(result)
    }

    /// Get all services
    pub fn services(&self) -> impl Iterator<Item = &SpatialService> {
        self.services.values()
    }

    /// Get all channels
    pub fn channels(&self) -> impl Iterator<Item = &SpatialChannel> {
        self.channels.values()
    }

    /// Get all policies
    pub fn policies(&self) -> &[SpatialPolicy] {
        &self.policies
    }
}

impl Default for ServiceRegistry {
    fn default() -> Self {
        Self::new()
    }
}

// ── Service Discovery ──────────────────────────────────────────────────────────

/// Service discovery interface
pub struct ServiceDiscovery {
    registry: Arc<ServiceRegistry>,
}

impl ServiceDiscovery {
    /// Create a new service discovery
    pub fn new(registry: Arc<ServiceRegistry>) -> Self {
        ServiceDiscovery { registry }
    }

    /// Find services by name
    pub fn find_by_name(&self, name: &str) -> Vec<&SpatialService> {
        self.registry
            .services()
            .filter(|s| s.interface.name == name)
            .collect()
    }

    /// Find services with specific permission
    pub fn find_by_permission(&self, perm: RegionPermission) -> Vec<&SpatialService> {
        self.registry
            .services()
            .filter(|s| s.interface.permissions.has(perm))
            .collect()
    }

    /// Find services that can accept new requests
    pub fn find_available(&self) -> Vec<&SpatialService> {
        self.registry
            .services()
            .filter(|s| s.can_accept())
            .collect()
    }

    /// Find all services that have an output channel with given name
    pub fn find_with_output_channel(&self, channel: &str) -> Vec<&SpatialService> {
        self.registry
            .services()
            .filter(|s| s.interface.outputs.contains_key(channel))
            .collect()
    }

    /// Find all services that have an input channel with given name
    pub fn find_with_input_channel(&self, channel: &str) -> Vec<&SpatialService> {
        self.registry
            .services()
            .filter(|s| s.interface.inputs.contains_key(channel))
            .collect()
    }
}

// ── Tests ─────────────────────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_service_interface_builder() {
        let interface = ServiceInterface::new("test-service")
            .add_input("data", vec![1, 2, 3])
            .add_output("result", vec![4, 5])
            .with_permissions(RegionPermission::Trusted)
            .with_concurrency(10);

        assert_eq!(interface.name, "test-service");
        assert!(interface.inputs.contains_key("data"));
        assert!(interface.outputs.contains_key("result"));
        assert_eq!(interface.permissions, RegionPermission::Trusted);
        assert_eq!(interface.max_concurrent, 10);
    }

    #[test]
    fn test_service_concurrency() {
        let interface = ServiceInterface::new("test").with_concurrency(3);
        let region = SpatialRegion {
            id: 1,
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            permissions: 0,
        };
        let mut service = SpatialService::new(1, interface, region);

        assert!(service.can_accept());
        assert!(service.acquire());
        assert_eq!(service.active_requests, 1);

        assert!(service.acquire());
        assert!(service.acquire());
        assert_eq!(service.active_requests, 3);

        // Should be full
        assert!(!service.can_accept());
        assert!(!service.acquire());
        assert_eq!(service.active_requests, 3);

        service.release();
        assert_eq!(service.active_requests, 2);
        assert!(service.can_accept());
    }

    #[test]
    fn test_channel_buffer() {
        let channel = SpatialChannel::new("test-channel", 1, 2, ChannelType::Unidirectional)
            .with_buffer_size(5);

        assert!(channel.can_send());
        assert_eq!(channel.buffer_size, 5);

        // Simulate filling buffer
        let mut full_channel = channel.clone();
        full_channel.buffered = 5;
        assert!(!full_channel.can_send());
        assert!(full_channel.can_receive());
    }

    #[test]
    fn test_policy_matching() {
        let policy = SpatialPolicy::new("test-policy", PolicyAction::Allow)
            .with_source(1)
            .with_dest(2);

        assert!(policy.matches(1, 2));
        assert!(!policy.matches(2, 1)); // Wrong source
        assert!(!policy.matches(1, 3)); // Wrong dest
    }

    #[test]
    fn test_service_registry() {
        let mut registry = ServiceRegistry::new();

        // Add a blocking policy
        let block_policy = SpatialPolicy::new("block-policy", PolicyAction::Block)
            .with_source(1)
            .with_dest(3);
        registry.add_policy(block_policy);

        // Register services
        let interface1 = ServiceInterface::new("service-1");
        let region1 = SpatialRegion {
            id: 1,
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            permissions: 0,
        };
        registry.register_service(interface1, region1);

        let interface2 = ServiceInterface::new("service-2");
        let region2 = SpatialRegion {
            id: 2,
            x: 20,
            y: 0,
            width: 10,
            height: 10,
            permissions: 0,
        };
        registry.register_service(interface2, region2);

        // Check policy: 1 → 2 should be allowed
        assert!(registry.check_policy(1, 2).unwrap());

        // Create channel
        let channel = SpatialChannel::new("ch1-2", 1, 2, ChannelType::Unidirectional);
        assert!(registry.create_channel(channel).is_ok());

        // Check policy: 1 → 3 should be blocked (service 3 doesn't exist, but policy blocks it)
        let result = registry.check_policy(1, 3);
        assert!(result.is_err() || !result.unwrap());
    }

    #[test]
    fn test_service_discovery() {
        let mut registry = ServiceRegistry::new();

        // Register services
        let interface1 = ServiceInterface::new("compute")
            .with_permissions(RegionPermission::PublicRead)
            .add_output("result", vec![2]);
        let region1 = SpatialRegion {
            id: 1,
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            permissions: 0,
        };
        registry.register_service(interface1, region1);

        let interface2 = ServiceInterface::new("compute")
            .with_permissions(RegionPermission::Trusted)
            .add_output("result", vec![1]);
        let region2 = SpatialRegion {
            id: 2,
            x: 20,
            y: 0,
            width: 10,
            height: 10,
            permissions: 0,
        };
        registry.register_service(interface2, region2);

        let discovery = ServiceDiscovery::new(Arc::new(registry));

        // Find by name
        let compute_services = discovery.find_by_name("compute");
        assert_eq!(compute_services.len(), 2);

        // Find by permission
        let trusted_services = discovery.find_by_permission(RegionPermission::Trusted);
        assert_eq!(trusted_services.len(), 1);

        // Find with output channel
        let with_result = discovery.find_with_output_channel("result");
        assert_eq!(with_result.len(), 2);
    }
}