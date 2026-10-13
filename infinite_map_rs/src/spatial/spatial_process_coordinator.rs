// Spatial Process Coordinator - Native Spatial OS Kernel Coordinator
//
// This module integrates Phase 16 components (ProcessScheduler, SpatialSecurity,
// SpatialFilesystem, SpatialIPC) to manage Alpine VM as a spatial process on the
// Spatial OS grid.
//
// This is a practical demonstration that Phase 16 is fully functional:
// - ProcessScheduler: schedules processes across spatial regions
// - SpatialSecurity: enforces hierarchical security (Untrusted < Basic < Trusted < Privileged)
// - SpatialFilesystem: stores process metadata in spatial cells
// - SpatialIPC: enables secure inter-process communication via pipes

use crate::spatial::{
    ProcessScheduler, ProcessRegion, SpatialFilesystem, PERM_READ, PERM_WRITE,
};
use crate::spatial::spatial_security::{SecurityLevel, SpatialSecurity, AuditEntry};
use crate::spatial::spatial_ipc::SpatialIpc;
use crate::spatial::vcc_validate::VccValidator;
use crate::spatial::vnc_live_tile::VncLiveTileManager;
use crate::geoasm_materializer::CellState;

use std::collections::HashMap;
use std::sync::{Arc, Mutex};

/// Types of spatial processes that can be managed by the coordinator
#[derive(Debug, Clone, PartialEq)]
pub enum SpatialProcessType {
    /// Native GeoASM program executing on spatial grid
    GeoasmProgram,
    /// Alpine Linux VM running as live tile
    AlpineVm,
    /// Ubuntu Linux VM running as live tile (VNC port 5901)
    UbuntuVm,
    /// RISC-V guest operating system
    RiscvGuest,
}

/// Process lifecycle states
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum SpatialProcessState {
    /// Process has been created but not started
    Created,
    /// Process is currently running
    Running,
    /// Process is paused
    Paused,
    /// Process has been stopped
    Stopped,
}

/// Metadata for a spatial process
#[derive(Debug, Clone)]
pub struct SpatialProcessMetadata {
    /// Process ID
    pub pid: u32,
    /// Process name
    pub name: String,
    /// Process type
    pub process_type: SpatialProcessType,
    /// Current state
    pub state: SpatialProcessState,
    /// Security level
    pub security_level: SecurityLevel,
    /// Process region on spatial grid
    pub region: ProcessRegion,
    /// Entry point (for programs)
    pub entry_point: Option<u32>,
    /// Associated window ID (for tile display)
    pub window_id: Option<usize>,
    /// Tile position on infinite map (x, y)
    pub tile_position: Option<(f64, f64)>,
}

/// Spatial Process Coordinator
///
/// Integrates Phase 16 components to manage spatial processes
pub struct SpatialProcessCoordinator {
    /// Process scheduler
    scheduler: ProcessScheduler,

    /// Security manager
    security: SpatialSecurity,

    /// Spatial filesystem
    filesystem: SpatialFilesystem,

    /// IPC system
    ipc: SpatialIpc,
    /// Phase Alignment Stability (PAS) Enforcer
    pub vcc: VccValidator,

    /// VNC Live Tile Manager (Phase 11A.5)
    pub vnc_manager: VncLiveTileManager,

    /// Process metadata registry
    processes: Arc<Mutex<HashMap<u32, SpatialProcessMetadata>>>,

    /// Spatial grid state
    grid: Arc<Mutex<Vec<CellState>>>,

    /// Grid dimensions
    grid_w: u32,
    grid_h: u32,
}

impl SpatialProcessCoordinator {
    /// Create a new spatial process coordinator
    pub fn new(grid_w: usize, grid_h: usize) -> Self {
        // Initialize grid with empty cells
        let grid = vec![CellState { 
            opcode_or_type: 0, 
            is_active: 0, 
            data_buffer: 0, 
            executing: 0 
        }; grid_w * grid_h];
        let grid = Arc::new(Mutex::new(grid));

        // Initialize Phase 16 components
        let scheduler = ProcessScheduler::new(grid_w as u32, grid_h as u32);
        let security = SpatialSecurity::new();
        let mut filesystem = SpatialFilesystem::new();
        let ipc = SpatialIpc::new();
        let vcc = VccValidator::new();
        let vnc_manager = VncLiveTileManager::new();

        SpatialProcessCoordinator {
            scheduler,
            security,
            filesystem,
            ipc,
            vcc,
            vnc_manager,
            processes: Arc::new(Mutex::new(HashMap::new())),
            grid,
            grid_w: grid_w as u32,
            grid_h: grid_h as u32,
        }
    }

    /// Create a spatial process
    pub fn create_process(
        &mut self,
        name: String,
        process_type: SpatialProcessType,
        security_level: SecurityLevel,
        region: ProcessRegion,
        entry_point: Option<u32>,
    ) -> Result<u32, String> {
        // Create process in scheduler
        let entry_addr = entry_point.unwrap_or(0x1000);
        let pid = self.scheduler.create_process(region.clone(), entry_addr);

        // Register process in security system
        self.security
            .register_process(pid, security_level.clone())
            .map_err(|e| format!("Security registration failed: {:?}", e))?;

        // Grant region access based on security level
        if security_level != SecurityLevel::Untrusted {
            let region_id = 100 + pid;
            self.security
                .grant_region_access(pid, region_id)
                .map_err(|e| format!("Region access grant failed: {:?}", e))?;
        }

        // Create process metadata
        let metadata = SpatialProcessMetadata {
            pid,
            name,
            process_type: process_type.clone(),
            state: SpatialProcessState::Created,
            security_level,
            region: region.clone(),
            entry_point,
            window_id: None,
            tile_position: None,
        };

        // Store metadata
        self.processes.lock().unwrap().insert(pid, metadata);

        log::info!(
            "Created spatial process {} ({:?}) at ({},{})-({},{})",
            pid,
            process_type,
            region.start_x,
            region.start_y,
            region.start_x + region.width,
            region.start_y + region.height
        );
        Ok(pid)
    }

    /// Create an Alpine VM as a spatial process
    pub fn create_alpine_vm_process(
        &mut self,
        name: String,
        security_level: SecurityLevel,
        region: ProcessRegion,
        vnc_port: u16,
    ) -> Result<u32, String> {
        // Create process metadata for Alpine VM
        let pid = self.create_process(
            name,
            SpatialProcessType::AlpineVm,
            security_level.clone(),
            region.clone(),
            None, // Alpine VM doesn't have a direct entry point
        )?;

        // Store VM-specific config in filesystem
        let vm_config = format!(
            "# Alpine VM Config (PID {})\nvnc_port={}\nregion={},{},{},{}\n",
            pid, 
            vnc_port, 
            region.start_x, 
            region.start_y, 
            region.width, 
            region.height
        );

        self.filesystem
            .create_file(
                &format!("vm_config_{}.dat", pid),
                vm_config.len(),
                PERM_READ | PERM_WRITE,
                region.start_x + 5,
                region.start_y + 5,
                10,
                5,
            )
            .map_err(|e| format!("Filesystem creation failed: {:?}", e))?;

        // Write config to grid
        let mut grid = self.grid.lock().unwrap();
        let mut offset = region.start_y * (self.grid_w as usize) + region.start_x;
        for byte in vm_config.bytes() {
            if offset < grid.len() {
                grid[offset] = CellState { 
                    opcode_or_type: 0, 
                    is_active: 1, 
                    data_buffer: byte as u32, 
                    executing: 0 
                };
                offset += 1;
            }
        }

        log::info!(
            "Created Alpine VM process {} with VNC port {}",
            pid,
            vnc_port
        );
        Ok(pid)
    }

    /// Create an Ubuntu VM as a spatial process
    pub fn create_ubuntu_vm_process(
        &mut self,
        name: String,
        security_level: SecurityLevel,
        region: ProcessRegion,
        vnc_port: u16,
    ) -> Result<u32, String> {
        let pid = self.create_process(
            name,
            SpatialProcessType::UbuntuVm,
            security_level.clone(),
            region.clone(),
            None,
        )?;

        let vm_config = format!(
            "# Ubuntu VM Config (PID {})\nvnc_port={}\nregion={},{},{},{}\n",
            pid, vnc_port, region.start_x, region.start_y, region.width, region.height
        );

        self.filesystem
            .create_file(
                &format!("vm_config_{}.dat", pid),
                vm_config.len(),
                PERM_READ | PERM_WRITE,
                region.start_x + 5,
                region.start_y + 5,
                10,
                5,
            )
            .map_err(|e| format!("Filesystem creation failed: {:?}", e))?;

        let mut grid = self.grid.lock().unwrap();
        let mut offset = region.start_y * (self.grid_w as usize) + region.start_x;
        for byte in vm_config.bytes() {
            if offset < grid.len() {
                grid[offset] = CellState {
                    opcode_or_type: 0,
                    is_active: 1,
                    data_buffer: byte as u32,
                    executing: 0,
                };
                offset += 1;
            }
        }

        log::info!("Created Ubuntu VM process {} with VNC port {}", pid, vnc_port);
        Ok(pid)
    }

    /// Start a spatial process
    pub fn start_process(&mut self, pid: u32) -> Result<(), String> {
        let mut processes = self.processes.lock().unwrap();

        let metadata = processes
            .get_mut(&pid)
            .ok_or_else(|| format!("Process {} not found", pid))?;

        if metadata.state == SpatialProcessState::Running {
            return Err(format!("Process {} is already running", pid));
        }

        metadata.state = SpatialProcessState::Running;

        log::info!("Started spatial process {} ({})", pid, metadata.name);
        Ok(())
    }

    /// Pause a spatial process
    pub fn pause_process(&mut self, pid: u32) -> Result<(), String> {
        let mut processes = self.processes.lock().unwrap();

        let metadata = processes
            .get_mut(&pid)
            .ok_or_else(|| format!("Process {} not found", pid))?;

        if metadata.state != SpatialProcessState::Running {
            return Err(format!("Process {} is not running", pid));
        }

        metadata.state = SpatialProcessState::Paused;

        log::info!("Paused spatial process {} ({})", pid, metadata.name);
        Ok(())
    }

    /// Stop a spatial process
    pub fn stop_process(&mut self, pid: u32) -> Result<(), String> {
        let mut processes = self.processes.lock().unwrap();

        let metadata = processes
            .get_mut(&pid)
            .ok_or_else(|| format!("Process {} not found", pid))?;

        metadata.state = SpatialProcessState::Stopped;

        log::info!("Stopped spatial process {} ({})", pid, metadata.name);
        Ok(())
    }

    /// Set process tile position on infinite map
    pub fn set_tile_position(&mut self, pid: u32, x: f64, y: f64) -> Result<(), String> {
        let mut processes = self.processes.lock().unwrap();

        let metadata = processes
            .get_mut(&pid)
            .ok_or_else(|| format!("Process {} not found", pid))?;

        metadata.tile_position = Some((x, y));

        log::info!("Set tile position for process {} to ({}, {})", pid, x, y);
        Ok(())
    }

    /// Set process window ID
    pub fn set_window_id(&mut self, pid: u32, window_id: usize) -> Result<(), String> {
        let mut processes = self.processes.lock().unwrap();

        let metadata = processes
            .get_mut(&pid)
            .ok_or_else(|| format!("Process {} not found", pid))?;

        metadata.window_id = Some(window_id);

        log::info!("Set window ID {} for process {}", window_id, pid);
        Ok(())
    }

    /// Get process metadata
    pub fn get_process(&self, pid: u32) -> Option<SpatialProcessMetadata> {
        self.processes.lock().unwrap().get(&pid).cloned()
    }

    /// Get all processes
    pub fn get_all_processes(&self) -> Vec<SpatialProcessMetadata> {
        self.processes.lock().unwrap().values().cloned().collect()
    }

    /// Get processes by type
    pub fn get_processes_by_type(
        &self,
        process_type: SpatialProcessType,
    ) -> Vec<SpatialProcessMetadata> {
        self.processes
            .lock()
            .unwrap()
            .values()
            .filter(|p| p.process_type == process_type)
            .cloned()
            .collect()
    }

    /// Get processes by security level
    pub fn get_processes_by_security(
        &self,
        security_level: SecurityLevel,
    ) -> Vec<SpatialProcessMetadata> {
        self.processes
            .lock()
            .unwrap()
            .values()
            .filter(|p| p.security_level == security_level)
            .cloned()
            .collect()
    }

    /// Tick the coordinator (advance scheduler by one tick)
    pub fn tick(&mut self) -> Option<usize> {
        // VCC Validation check every tick
        if let Ok(grid_lock) = self.grid.lock() {
            let mut regions_map = std::collections::HashMap::new();
            if let Ok(processes_lock) = self.processes.lock() {
                for (pid, p) in processes_lock.iter() {
                    regions_map.insert(*pid, p.region.clone());
                }
            }
            self.vcc
                .validate_all(&grid_lock, self.grid_w as usize, &regions_map);
        }

        // Update VNC Live Tiles (Phase 11A.5)
        if let Ok(mut grid) = self.grid.lock() {
            if let Err(e) = self
                .vnc_manager
                .tick(&mut grid, self.grid_w as usize)
            {
                log::warn!("VNC Live Tile update failed: {}", e);
            }
        }

        self.scheduler.tick()
    }
    /// Run the coordinator for N ticks
    pub fn run(&mut self, ticks: usize) {
        log::info!("Running spatial coordinator for {} ticks", ticks);

        for tick in 0..ticks {
            // Tick the scheduler
            if let Some(cell_index) = self.tick() {
                // Find the active process
                let processes = self.processes.lock().unwrap();
                if let Some((pid, _)) = processes
                    .iter()
                    .find(|(_, p)| {
                        p.region.start_y * (self.grid_w as usize) + p.region.start_x == cell_index
                    })
                {
                    log::trace!("Tick {}: Process {} active", tick, pid);
                }
            }
        }
    }

    /// Create an IPC pipe between two processes
    pub fn create_pipe_between_processes(
        &mut self,
        writer_pid: u32,
        reader_pid: u32,
        capacity: usize,
    ) -> Result<u32, String> {
        // Create pipe
        let pipe_id = self
            .ipc
            .create_pipe(capacity)
            .map_err(|e| format!("Pipe creation failed: {}", e))?;

        // Grant permissions based on security levels
        let writer_level = self
            .security
            .process_levels
            .get(&writer_pid)
            .ok_or_else(|| {
                format!(
                    "Writer process {} not found in security registry",
                    writer_pid
                )
            })?;

        let reader_level = self
            .security
            .process_levels
            .get(&reader_pid)
            .ok_or_else(|| {
                format!(
                    "Reader process {} not found in security registry",
                    reader_pid
                )
            })?;

        // Only grant access if both processes have appropriate security
        if writer_level >= &SecurityLevel::Basic && reader_level >= &SecurityLevel::Basic {
            self.ipc
                .grant_pipe_access(pipe_id, writer_pid, false, true)
                .map_err(|e| format!("Grant write access failed: {}", e))?;

            self.ipc
                .grant_pipe_access(pipe_id, reader_pid, true, false)
                .map_err(|e| format!("Grant read access failed: {}", e))?;

            log::info!(
                "Created pipe {} between {} (writer) and {} (reader)",
                pipe_id,
                writer_pid,
                reader_pid
            );

            Ok(pipe_id)
        } else {
            Err(format!(
                "Insufficient security level for IPC: writer={:?}, reader={:?}",
                writer_level, reader_level
            ))
        }
    }

    /// Get security audit log
    pub fn get_audit_log(&self) -> Vec<String> {
        self.security
            .get_audit_log()
            .iter()
            .map(|e| {
                format!(
                    "PID {}: {} - {}",
                    e.pid,
                    e.action,
                    if e.success { "OK" } else { "DENIED" }
                )
            })
            .collect()
    }

    /// Get security violation count for a process
    pub fn get_violation_count(&self, pid: u32) -> usize {
        self.security.get_violation_count(pid)
    }

    /// Get filesystem statistics
    pub fn get_filesystem_stats(&self) -> (usize, usize, usize, usize) {
        let stats = &self.filesystem.stats;
        (
            stats.files_count,
            stats.total_space_used,
            stats.read_operations,
            stats.write_operations,
        )
    }

    /// Create VNC Live Tile for an existing VM process (Phase 11A.5)
    pub fn create_vnc_live_tile(
        &mut self,
        pid: u32,
        vnc_port: u16,
    ) -> Result<(), String> {
        let process = self
            .processes
            .lock()
            .unwrap()
            .get(&pid)
            .ok_or_else(|| format!("Process {} not found", pid))?
            .clone();

        match process.process_type {
            SpatialProcessType::AlpineVm | SpatialProcessType::UbuntuVm => {
                self.vnc_manager
                    .create_tile(vnc_port, pid, process.region)?;
                log::info!("Created VNC Live Tile for PID {} on port {}", pid, vnc_port);
                Ok(())
            }
            _ => Err(format!(
                "Process {} is not a VM ({:?})",
                pid, process.process_type
            )),
        }
    }

    /// Remove VNC Live Tile for a VM process
    pub fn remove_vnc_live_tile(&mut self, pid: u32) {
        self.vnc_manager.remove_tile(pid);
        log::info!("Removed VNC Live Tile for PID {}", pid);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_coordinator_creation() {
        let coordinator = SpatialProcessCoordinator::new(128, 64);

        assert_eq!(coordinator.grid_w, 128);
        assert_eq!(coordinator.grid_h, 64);
    }

    #[test]
    fn test_create_process() {
        let mut coordinator = SpatialProcessCoordinator::new(128, 64);

        let region = ProcessRegion::new(10, 10, 20, 20);
        let pid = coordinator
            .create_process(
                "test_process".to_string(),
                SpatialProcessType::GeoasmProgram,
                SecurityLevel::Trusted,
                region,
                Some(0x2000),
            )
            .unwrap();

        assert!(pid > 0);

        let process = coordinator.get_process(pid);
        assert!(process.is_some());
        assert_eq!(process.unwrap().name, "test_process");
    }

    #[test]
    fn test_alpine_vm_process() {
        let mut coordinator = SpatialProcessCoordinator::new(128, 64);

        let region = ProcessRegion::new(40, 10, 30, 30);
        let pid = coordinator
            .create_alpine_vm_process(
                "alpine_live_tile".to_string(),
                SecurityLevel::Privileged,
                region,
                5900,
            )
            .unwrap();

        let process = coordinator.get_process(pid);
        assert!(process.is_some());
        assert_eq!(process.unwrap().process_type, SpatialProcessType::AlpineVm);
    }

    #[test]
    fn test_process_lifecycle() {
        let mut coordinator = SpatialProcessCoordinator::new(128, 64);

        let region = ProcessRegion::new(10, 10, 20, 20);
        let pid = coordinator
            .create_process(
                "test_lifecycle".to_string(),
                SpatialProcessType::GeoasmProgram,
                SecurityLevel::Basic,
                region,
                Some(0x1000),
            )
            .unwrap();

        // Start process
        coordinator.start_process(pid).unwrap();
        let process = coordinator.get_process(pid).unwrap();
        assert_eq!(process.state, SpatialProcessState::Running);

        // Pause process
        coordinator.pause_process(pid).unwrap();
        let process = coordinator.get_process(pid).unwrap();
        assert_eq!(process.state, SpatialProcessState::Paused);

        // Stop process
        coordinator.stop_process(pid).unwrap();
        let process = coordinator.get_process(pid).unwrap();
        assert_eq!(process.state, SpatialProcessState::Stopped);
    }

    #[test]
    fn test_ipc_between_processes() {
        let mut coordinator = SpatialProcessCoordinator::new(128, 64);

        // Create two processes
        let region1 = ProcessRegion::new(10, 10, 20, 20);
        let pid1 = coordinator
            .create_process(
                "writer".to_string(),
                SpatialProcessType::GeoasmProgram,
                SecurityLevel::Trusted,
                region1,
                Some(0x1000),
            )
            .unwrap();

        let region2 = ProcessRegion::new(40, 10, 20, 20);
        let pid2 = coordinator
            .create_process(
                "reader".to_string(),
                SpatialProcessType::GeoasmProgram,
                SecurityLevel::Trusted,
                region2,
                Some(0x2000),
            )
            .unwrap();

        // Create pipe between processes
        let pipe_id = coordinator
            .create_pipe_between_processes(pid1, pid2, 256)
            .unwrap();
        assert!(pipe_id > 0);

        // Verify IPC was created successfully
        assert_eq!(coordinator.ipc.pipes.len(), 1);
    }

    #[test]
    fn test_security_enforcement() {
        let mut coordinator = SpatialProcessCoordinator::new(128, 64);

        // Create untrusted process
        let region = ProcessRegion::new(10, 10, 20, 20);
        let untrusted_pid = coordinator
            .create_process(
                "untrusted".to_string(),
                SpatialProcessType::GeoasmProgram,
                SecurityLevel::Untrusted,
                region,
                Some(0x1000),
            )
            .unwrap();

        // Create trusted process
        let region2 = ProcessRegion::new(40, 10, 20, 20);
        let trusted_pid = coordinator
            .create_process(
                "trusted".to_string(),
                SpatialProcessType::GeoasmProgram,
                SecurityLevel::Trusted,
                region2,
                Some(0x2000),
            )
            .unwrap();

        // Try to create pipe with untrusted process (should fail)
        let result = coordinator.create_pipe_between_processes(untrusted_pid, trusted_pid, 256);
        assert!(result.is_err());

        // Verify violation was logged
        let violations = coordinator.get_violation_count(untrusted_pid);
        assert!(violations > 0);
    }

    #[test]
    fn test_tile_positioning() {
        let mut coordinator = SpatialProcessCoordinator::new(128, 64);

        let region = ProcessRegion::new(10, 10, 20, 20);
        let pid = coordinator
            .create_process(
                "tile_test".to_string(),
                SpatialProcessType::AlpineVm,
                SecurityLevel::Privileged,
                region,
                None,
            )
            .unwrap();

        // Set tile position
        coordinator.set_tile_position(pid, 100.0, 200.0).unwrap();
        coordinator.set_window_id(pid, 42).unwrap();

        let process = coordinator.get_process(pid).unwrap();
        assert_eq!(process.tile_position, Some((100.0, 200.0)));
        assert_eq!(process.window_id, Some(42));
    }

    #[test]
    fn test_process_filtering() {
        let mut coordinator = SpatialProcessCoordinator::new(128, 64);

        // Create processes of different types
        let region1 = ProcessRegion::new(10, 10, 20, 20);
        coordinator
            .create_process(
                "geoasm1".to_string(),
                SpatialProcessType::GeoasmProgram,
                SecurityLevel::Basic,
                region1,
                Some(0x1000),
            )
            .unwrap();

        let region2 = ProcessRegion::new(40, 10, 20, 20);
        let alpine_pid = coordinator
            .create_alpine_vm_process(
                "alpine1".to_string(),
                SecurityLevel::Privileged,
                region2,
                5900,
            )
            .unwrap();

        let region3 = ProcessRegion::new(70, 10, 20, 20);
        coordinator
            .create_process(
                "riscv1".to_string(),
                SpatialProcessType::RiscvGuest,
                SecurityLevel::Trusted,
                region3,
                Some(0x3000),
            )
            .unwrap();

        // Filter by type
        let alpine_processes = coordinator.get_processes_by_type(SpatialProcessType::AlpineVm);
        assert_eq!(alpine_processes.len(), 1);
        assert_eq!(alpine_processes[0].pid, alpine_pid);

        // Filter by security level
        let privileged_processes = coordinator.get_processes_by_security(SecurityLevel::Privileged);
        assert_eq!(privileged_processes.len(), 1);
    }
}