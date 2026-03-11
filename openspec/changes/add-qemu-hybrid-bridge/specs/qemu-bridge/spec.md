# QEMU Bridge Specification

**Component**: QEMU Memory Bridge  
**Version**: 1.0.0  
**Status**: Proposed  
**Updated**: 2026-01-17

## Overview

The QEMU Bridge provides zero-copy access to QEMU virtual machine guest RAM from the Geometry OS host process, enabling real-time visualization and introspection of running VMs.

## ADDED Requirements

### Requirement: Shared Memory Backend (REQ-QB-001)
**Priority**: MUST  
**Category**: Core Functionality

The system SHALL configure QEMU VMs with a shared memory backend that exposes guest physical RAM to the host via `/dev/shm`.

#### Scenario: Alpine Linux VM Launch
- **GIVEN** a QEMU launcher script
- **WHEN** spawning an Alpine Linux VM with 64MB RAM
- **THEN** the VM SHALL use `memory-backend-file` with:
  - `mem-path=/dev/shm/qemu_ram_{vm_id}`
  - `share=on` flag enabled
  - `size=64M` (configurable)
- **AND** the file SHALL be accessible from the host process
- **VISUAL** The VM appears as a new "brick" in the Infinite Map

### Requirement: Zero-Copy Memory Mapping (REQ-QB-002)
**Priority**: MUST  
**Category**: Performance

The system SHALL provide a Rust interface to map QEMU guest RAM without copying data.

#### Scenario: Memory Bridge Initialization
- **GIVEN** a running QEMU VM with shared memory backend
- **WHEN** the `SharedMemoryBridge::new(vm_id)` is called
- **THEN** the bridge SHALL:
  - Open `/dev/shm/qemu_ram_{vm_id}` as read-only
  - Use `memmap2::Mmap` for zero-copy mapping
  - Return a valid `SharedMemoryBridge` instance
- **AND** subsequent reads SHALL access guest RAM directly via pointer dereference

#### Scenario: Physical Address Read
- **GIVEN** a `SharedMemoryBridge` instance
- **WHEN** calling `read_physical(addr, len)`
- **THEN** the method SHALL return a `&[u8]` slice
- **AND** the slice SHALL contain guest RAM bytes at the specified physical address
- **AND** the operation SHALL complete in <1ms for any address range

### Requirement: Consistency Validation (REQ-QB-003)
**Priority**: SHOULD  
**Category**: Reliability

The system SHALL provide mechanisms to detect inconsistent reads due to concurrent guest modifications.

#### Scenario: Checksum Validation
- **GIVEN** a `SharedMemoryBridge` taking a RAM snapshot
- **WHEN** the guest modifies memory during the snapshot
- **THEN** the bridge SHOULD:
  - Calculate an atomic checksum before and after the read
  - Detect mismatches indicating torn reads
  - Optionally retry the snapshot
- **AND** the caller SHALL be notified of consistency status

### Requirement: QMP Integration (REQ-QB-004)
**Priority**: MUST  
**Category**: VM Management

The system SHALL integrate with QEMU Machine Protocol (QMP) to discover and monitor VMs.

#### Scenario: VM Discovery
- **GIVEN** a QEMU VM running with QMP socket enabled
- **WHEN** the QMP client connects
- **THEN** the client SHALL:
  - Query `query-memdev` to locate shared memory path
  - Query `query-status` to determine VM state (running/paused)
  - Expose this information to the Rust bridge
- **AND** the bridge SHALL automatically connect to discovered VMs

### Requirement: Performance Targets (REQ-QB-005)
**Priority**: MUST  
**Category**: Performance

The system SHALL meet the following performance benchmarks:

#### Scenario: Latency Benchmark
- **GIVEN** a 64MB guest RAM
- **WHEN** performing a full snapshot read
- **THEN** the operation SHALL complete in <1ms (median)
- **AND** 99th percentile latency SHALL be <5ms

#### Scenario: Throughput Benchmark
- **GIVEN** continuous RAM snapshots at 60 Hz
- **WHEN** measuring sustained read bandwidth
- **THEN** the system SHALL achieve >960 MB/s
- **AND** CPU overhead SHALL be <5% of one core

### Requirement: Multi-VM Support (REQ-QB-006)
**Priority**: SHOULD  
**Category**: Scalability

The system SHALL support multiple concurrent QEMU VMs.

#### Scenario: Multiple VM Instances
- **GIVEN** 3 QEMU VMs running simultaneously
- **WHEN** each VM has a unique `vm_id`
- **THEN** the bridge SHALL:
  - Maintain separate `SharedMemoryBridge` instances
  - Isolate memory mappings (no cross-VM access)
  - Update all VMs at 60 FPS (20 FPS per VM minimum)
- **VISUAL** Each VM appears as a separate brick in the Infinite Map

## API Specification

### Rust API

```rust
pub struct SharedMemoryBridge {
    mmap: memmap2::Mmap,
    vm_id: String,
    size: usize,
}

impl SharedMemoryBridge {
    /// Create a new bridge to a QEMU VM's shared memory
    pub fn new(vm_id: &str) -> Result<Self, BridgeError>;
    
    /// Read guest physical memory at the specified address
    pub fn read_physical(&self, addr: u64, len: usize) -> &[u8];
    
    /// Take a full snapshot of guest RAM
    pub fn snapshot(&self) -> Vec<u8>;
    
    /// Get the total size of guest RAM
    pub fn size(&self) -> usize;
}
```

### Python API (QMP Client)

```python
class QMPClient:
    def __init__(self, socket_path: str):
        """Connect to QEMU QMP socket."""
        
    def query_memdev(self) -> dict:
        """Query memory backend configuration."""
        
    def query_status(self) -> str:
        """Get VM state: running, paused, stopped."""
        
    def get_shared_memory_path(self) -> str:
        """Extract shared memory path from memdev info."""
```

## Error Handling

### BridgeError Enum

```rust
pub enum BridgeError {
    /// Shared memory file not found
    FileNotFound(String),
    
    /// Permission denied accessing /dev/shm
    PermissionDenied,
    
    /// Memory mapping failed
    MmapFailed(io::Error),
    
    /// Invalid address range
    InvalidAddress { addr: u64, len: usize, max: usize },
}
```

## Testing Requirements

### Unit Tests
- [ ] `test_bridge_creation`: Verify successful mapping of mock shared memory
- [ ] `test_read_physical`: Validate correct byte reads at various addresses
- [ ] `test_invalid_address`: Ensure out-of-bounds reads are rejected
- [ ] `test_snapshot_consistency`: Verify checksum validation logic

### Integration Tests
- [ ] `test_qemu_vm_launch`: Spawn real QEMU VM and connect bridge
- [ ] `test_concurrent_reads`: Verify thread-safe access to shared memory
- [ ] `test_multi_vm`: Validate isolation between multiple VMs
- [ ] `test_performance_latency`: Benchmark <1ms snapshot time
- [ ] `test_performance_throughput`: Benchmark >960 MB/s sustained reads

## Security Considerations

### Isolation
- **Read-Only Mapping**: Host process MUST NOT write to guest RAM
- **Process Separation**: QEMU runs as unprivileged user
- **Resource Limits**: cgroups enforce CPU/RAM quotas on VMs

### Validation
- **Address Bounds**: All reads MUST validate address ranges
- **Checksum Verification**: Detect torn reads from concurrent modifications
- **Audit Logging**: Log all VMI operations for forensics

## Dependencies

### External
- **QEMU**: Version 9.0.x (LTS)
- **memmap2**: Rust crate `0.9+`

### Internal
- **Infinite Map**: Integration point for VM visualization
- **Hilbert Visualizer**: Consumer of RAM snapshots

## Migration Path

### Phase 1: Single VM
- Support one Alpine Linux VM
- Manual VM launch via script
- Basic read-only access

### Phase 2: Multi-VM
- Automatic VM discovery via QMP
- Support 3+ concurrent VMs
- Per-VM resource management

### Phase 3: Production
- VM lifecycle management (start/stop/reset)
- Snapshot/restore functionality
- Integration with Geometry OS security model

## Acceptance Criteria

- [ ] QEMU VM boots with shared memory backend
- [ ] Rust bridge successfully maps `/dev/shm/qemu_ram_*`
- [ ] `read_physical()` returns correct guest RAM bytes
- [ ] Latency <1ms for 64MB snapshot
- [ ] Throughput >960 MB/s sustained
- [ ] Multi-VM support (3+ VMs)
- [ ] Integration tests pass
- [ ] Documentation complete

---

**Status**: Ready for implementation pending proposal approval.
