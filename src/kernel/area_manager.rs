//! area_manager.rs -- Autonomous region coordination for the Vast Substrate.
//!
//! The AreaManager bridges VM-level area_agent entities with the Geometric
//! Intelligence stack. Each agent is assigned a rectangular sector of the
//! infinite world. The manager orchestrates inspection cycles:
//!
//!   1. Pan camera to the agent's sector (via TileStore blit)
//!   2. Capture framebuffer as base64 PNG
//!   3. Send to vision LLM for structural health analysis
//!   4. Parse diagnostic results into repair tasks
//!   5. Write tasks back to the agent's RAM table for VM-side execution
//!
//! Agent RAM layout (per agent, 16 bytes):
//!   +0x00: target_x   (i32) -- current task target X, -1 = idle
//!   +0x01: target_y   (i32) -- current task target Y
//!   +0x02: status     (u32) -- 0=idle, 1=inspecting, 2=repairing, 3=done
//!   +0x03: task_type  (u32) -- 0=none, 1=prune_noise, 2=repair_wire, 3=reinforce
//!   +0x04: home_x     (i32) -- sector origin X
//!   +0x05: home_y     (i32) -- sector origin Y
//!   +0x06: sector_w   (u32) -- sector width in pixels
//!   +0x07: sector_h   (u32) -- sector height in pixels
//!   +0x08: role       (u32) -- specialized role index
//!
//! The first agent table starts at RAM 0x7950, each agent occupies 0x10 bytes.

use crate::tile_store::TileStore;

/// RAM base address for the first agent task table.
pub const AGENT_TABLE_BASE: u32 = 0x7950;
/// Bytes per agent entry in RAM.
pub const AGENT_ENTRY_SIZE: u32 = 0x10;
/// Maximum number of concurrent area agents.
pub const MAX_AGENTS: usize = 8;

/// Agent status codes (matches VM entity system).
pub const STATUS_IDLE: u32 = 0;
pub const STATUS_INSPECTING: u32 = 1;
pub const STATUS_REPAIRING: u32 = 2;
pub const STATUS_DONE: u32 = 3;

/// Task types for area maintenance.
pub const TASK_NONE: u32 = 0;
pub const TASK_PRUNE_NOISE: u32 = 1;
pub const TASK_REPAIR_WIRE: u32 = 2;
pub const TASK_REINFORCE: u32 = 3;

/// Agent roles for specialized swarm management.
pub const ROLE_MAINTENANCE: u32 = 0;
pub const ROLE_CORE_COMPOSITOR: u32 = 1;
pub const ROLE_VISUAL_SHELL: u32 = 2;
pub const ROLE_NEURAL_COGNITIVE: u32 = 3;
pub const ROLE_GRAPHICS_RENDERING: u32 = 4;
pub const ROLE_INPUT_INTERACTION: u32 = 5;
pub const ROLE_SYSTEM_SERVICES: u32 = 6;
pub const ROLE_DEVELOPMENT_TOOLS: u32 = 7;

/// A single area agent's assignment and state.
#[derive(Debug, Clone)]
pub struct AreaAgent {
    /// Unique agent index (0..MAX_AGENTS).
    pub id: usize,
    /// Specialized role (0=Maintenance, 1=Compositor, etc.)
    pub role: u32,
    /// Sector origin in world pixel coordinates.
    pub home_x: i32,
    pub home_y: i32,
    /// Sector dimensions in pixels.
    pub sector_w: u32,
    pub sector_h: u32,
    /// Current status.
    pub status: u32,
    /// Current task type.
    pub task_type: u32,
    /// Current task target coordinates (-1 = no target).
    pub target_x: i32,
    pub target_y: i32,
    /// Number of inspection cycles completed.
    pub cycles_completed: u32,
    /// Issues found in last inspection.
    pub issues_found: Vec<DiagnosticIssue>,
}

/// A structural issue found by vision inspection.
#[derive(Debug, Clone)]
pub struct DiagnosticIssue {
    /// World pixel coordinates of the issue.
    pub x: i32,
    pub y: i32,
    /// Type of issue (maps to task_type).
    pub issue_type: u32,
    /// Confidence from vision model (0.0-1.0).
    pub confidence: f32,
    /// Human-readable description.
    pub description: String,
}

/// Coordinated manager for all area agents.
pub struct AreaManager {
    /// Active agents.
    pub agents: Vec<AreaAgent>,
    /// Whether the manager is running inspection cycles.
    pub active: bool,
    /// Interval between full sweep cycles (in frames).
    pub sweep_interval: u32,
    /// Frame counter for scheduling.
    pub last_sweep_frame: u32,
}

impl AreaManager {
    /// Create a new AreaManager with no agents assigned.
    pub fn new() -> Self {
        Self {
            agents: Vec::new(),
            active: false,
            sweep_interval: 300, // inspect every 300 frames (~5s at 60fps)
            last_sweep_frame: 0,
        }
    }

    /// Assign an agent to a rectangular world sector.
    /// Returns the agent ID on success, or an error string if at capacity.
    pub fn assign_sector(
        &mut self,
        role: u32,
        home_x: i32,
        home_y: i32,
        sector_w: u32,
        sector_h: u32,
    ) -> Result<usize, String> {
        if self.agents.len() >= MAX_AGENTS {
            return Err(format!("Maximum {} agents already assigned", MAX_AGENTS));
        }

        // Check for overlapping sectors
        for existing in &self.agents {
            let overlap = !(home_x + sector_w as i32 <= existing.home_x
                || existing.home_x + existing.sector_w as i32 <= home_x
                || home_y + sector_h as i32 <= existing.home_y
                || existing.home_y + existing.sector_h as i32 <= home_y);
            if overlap {
                return Err(format!(
                    "Sector overlaps with agent {} ({},{}) {}x{}",
                    existing.id,
                    existing.home_x,
                    existing.home_y,
                    existing.sector_w,
                    existing.sector_h
                ));
            }
        }

        let id = self.agents.len();
        self.agents.push(AreaAgent {
            id,
            role,
            home_x,
            home_y,
            sector_w,
            sector_h,
            status: STATUS_IDLE,
            task_type: TASK_NONE,
            target_x: -1,
            target_y: -1,
            cycles_completed: 0,
            issues_found: Vec::new(),
        });

        Ok(id)
    }

    /// Auto-assign agents to tile the given world region.
    /// Divides the region into a grid of sectors, assigning different roles.
    pub fn auto_assign_grid(
        &mut self,
        origin_x: i32,
        origin_y: i32,
        total_w: u32,
        total_h: u32,
        sector_size: u32,
    ) -> Vec<usize> {
        let mut ids = Vec::new();
        let cols = (total_w + sector_size - 1) / sector_size;
        let rows = (total_h + sector_size - 1) / sector_size;

        let roles = [
            ROLE_CORE_COMPOSITOR,
            ROLE_VISUAL_SHELL,
            ROLE_NEURAL_COGNITIVE,
            ROLE_GRAPHICS_RENDERING,
            ROLE_INPUT_INTERACTION,
            ROLE_SYSTEM_SERVICES,
            ROLE_DEVELOPMENT_TOOLS,
            ROLE_MAINTENANCE,
        ];

        for row in 0..rows {
            for col in 0..cols {
                let idx = ids.len();
                if idx >= MAX_AGENTS {
                    break;
                }

                let sx = origin_x + (col * sector_size) as i32;
                let sy = origin_y + (row * sector_size) as i32;
                let sw = sector_size.min(total_w - col * sector_size);
                let sh = sector_size.min(total_h - row * sector_size);
                let role = roles[idx % roles.len()];

                if let Ok(id) = self.assign_sector(role, sx, sy, sw, sh) {
                    ids.push(id);
                }
            }
        }

        ids
    }

    /// Start the inspection loop.
    pub fn start(&mut self) {
        self.active = true;
    }

    /// Stop the inspection loop.
    pub fn stop(&mut self) {
        self.active = false;
        for agent in &mut self.agents {
            agent.status = STATUS_IDLE;
            agent.target_x = -1;
            agent.target_y = -1;
        }
    }

    /// Check if the manager is running.
    pub fn is_active(&self) -> bool {
        self.active
    }

    /// Get the current agent count.
    pub fn agent_count(&self) -> usize {
        self.agents.len()
    }

    /// Get a reference to a specific agent.
    pub fn get_agent(&self, id: usize) -> Option<&AreaAgent> {
        self.agents.get(id)
    }

    /// Get a mutable reference to a specific agent.
    pub fn get_agent_mut(&mut self, id: usize) -> Option<&mut AreaAgent> {
        self.agents.get_mut(id)
    }

    /// Process VM-side completions: read RAM to detect agents that wrote STATUS_DONE.
    /// Call this BEFORE tick() so that completed repairs are acknowledged before
    /// scheduling new inspections. Returns the list of agent IDs that completed.
    pub fn process_vm_completions(&mut self, ram: &[u32]) -> Vec<usize> {
        let mut completed = Vec::new();
        for agent in &mut self.agents {
            if agent.status != STATUS_REPAIRING {
                continue;
            }
            let base = AGENT_TABLE_BASE as usize + agent.id * AGENT_ENTRY_SIZE as usize;
            if base + 2 >= ram.len() {
                continue;
            }
            let vm_status = ram[base + 2];
            if vm_status == STATUS_DONE {
                // VM-side repair agent confirmed the task is done.
                // Advance to next issue (or mark fully done).
                let _agent_id = agent.id;
                // Remove the just-completed issue.
                if !agent.issues_found.is_empty() {
                    agent.issues_found.remove(0);
                }
                if let Some(next) = agent.issues_found.first() {
                    agent.target_x = next.x;
                    agent.target_y = next.y;
                    agent.task_type = next.issue_type;
                    // Stay in REPAIRING -- write_to_ram will push the new task.
                } else {
                    agent.status = STATUS_DONE;
                    agent.task_type = TASK_NONE;
                    agent.target_x = -1;
                    agent.target_y = -1;
                }
                completed.push(_agent_id);
            }
        }
        completed
    }

    /// Tick the manager. Should be called once per frame.
    /// Returns a list of (agent_id, action) pairs indicating what needs to happen.
    pub fn tick(&mut self, current_frame: u32) -> Vec<(usize, AgentAction)> {
        if !self.active {
            return Vec::new();
        }

        let mut actions = Vec::new();

        // Check if it's time for a new sweep
        // last_sweep_frame == 0 means "never swept" -- always trigger first sweep.
        let elapsed = current_frame.saturating_sub(self.last_sweep_frame);
        if self.last_sweep_frame == 0 || elapsed >= self.sweep_interval {
            self.last_sweep_frame = current_frame;

            // Start inspection for all idle/done agents
            for agent in &mut self.agents {
                if agent.status == STATUS_IDLE || agent.status == STATUS_DONE {
                    agent.status = STATUS_INSPECTING;
                    agent.issues_found.clear();
                    actions.push((agent.id, AgentAction::Inspect));
                }
            }
        }

        actions
    }

    /// Process vision inspection results for an agent.
    /// Called after the vision LLM returns diagnostics for a sector.
    pub fn process_inspection_results(&mut self, agent_id: usize, issues: Vec<DiagnosticIssue>) {
        if let Some(agent) = self.agents.get_mut(agent_id) {
            agent.issues_found = issues;
            agent.cycles_completed += 1;

            if agent.issues_found.is_empty() {
                // Clean sector, no action needed
                agent.status = STATUS_DONE;
            } else {
                // Queue the first issue for repair
                if let Some(first) = agent.issues_found.first() {
                    agent.target_x = first.x;
                    agent.target_y = first.y;
                    agent.task_type = first.issue_type;
                    agent.status = STATUS_REPAIRING;
                }
            }
        }
    }

    /// Mark the current repair task as completed, advance to next issue.
    pub fn advance_task(&mut self, agent_id: usize) {
        if let Some(agent) = self.agents.get_mut(agent_id) {
            if !agent.issues_found.is_empty() {
                agent.issues_found.remove(0);
            }

            if let Some(next) = agent.issues_found.first() {
                agent.target_x = next.x;
                agent.target_y = next.y;
                agent.task_type = next.issue_type;
            } else {
                agent.status = STATUS_DONE;
                agent.task_type = TASK_NONE;
                agent.target_x = -1;
                agent.target_y = -1;
            }
        }
    }

    /// Write all agent states to VM RAM so the substrate can read them.
    pub fn write_to_ram(&self, ram: &mut [u32]) {
        for agent in &self.agents {
            let base = AGENT_TABLE_BASE as usize + agent.id * AGENT_ENTRY_SIZE as usize;
            if base + 8 < ram.len() {
                ram[base + 0] = agent.target_x as u32;
                ram[base + 1] = agent.target_y as u32;
                ram[base + 2] = agent.status;
                ram[base + 3] = agent.task_type;
                ram[base + 4] = agent.home_x as u32;
                ram[base + 5] = agent.home_y as u32;
                ram[base + 6] = agent.sector_w;
                ram[base + 7] = agent.sector_h;
                ram[base + 8] = agent.role;
            }
        }
    }

    /// Read agent states from VM RAM (e.g., after VM-side execution modified them).
    pub fn read_from_ram(&mut self, ram: &[u32]) {
        for agent in &mut self.agents {
            let base = AGENT_TABLE_BASE as usize + agent.id * AGENT_ENTRY_SIZE as usize;
            if base + 8 < ram.len() {
                agent.target_x = ram[base + 0] as i32;
                agent.target_y = ram[base + 1] as i32;
                agent.status = ram[base + 2];
                agent.task_type = ram[base + 3];
                agent.role = ram[base + 8];
                // home/sector are read-only, written only by assign_sector
            }
        }
    }

    /// Blit an agent's sector into a 256x256 framebuffer for vision inspection.
    /// Returns the screen buffer ready for base64 PNG encoding.
    pub fn blit_sector_to_screen(
        &self,
        agent_id: usize,
        tile_store: &mut TileStore,
        screen: &mut [u32],
        screen_w: usize,
        screen_h: usize,
    ) -> bool {
        let agent = match self.agents.get(agent_id) {
            Some(a) => a,
            None => return false,
        };

        // Center the sector in the framebuffer
        let src_x = agent.home_x;
        let src_y = agent.home_y;

        tile_store.blit_to_screen(
            screen,
            src_x,
            src_y,
            0,
            0,
            screen_w.min(agent.sector_w as usize),
            screen_h.min(agent.sector_h as usize),
        );

        true
    }

    /// Get a summary of all agent states.
    pub fn summary(&self) -> AreaManagerSummary {
        let mut idle = 0;
        let mut inspecting = 0;
        let mut repairing = 0;
        let mut done = 0;
        let mut total_issues = 0;

        for agent in &self.agents {
            match agent.status {
                STATUS_IDLE => idle += 1,
                STATUS_INSPECTING => inspecting += 1,
                STATUS_REPAIRING => repairing += 1,
                STATUS_DONE => done += 1,
                _ => {},
            }
            total_issues += agent.issues_found.len();
        }

        AreaManagerSummary {
            total_agents: self.agents.len(),
            idle,
            inspecting,
            repairing,
            done,
            total_issues,
            active: self.active,
        }
    }
}

/// Actions that the manager requests the host to perform.
#[derive(Debug, Clone)]
pub enum AgentAction {
    /// Capture and inspect this agent's sector with vision.
    Inspect,
}

/// Summary of the manager's state for display.
#[derive(Debug, Clone)]
pub struct AreaManagerSummary {
    pub total_agents: usize,
    pub idle: usize,
    pub inspecting: usize,
    pub repairing: usize,
    pub done: usize,
    pub total_issues: usize,
    pub active: bool,
}

impl std::fmt::Display for AreaManagerSummary {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "AreaManager: {} agents ({} idle, {} inspecting, {} repairing, {} done), {} issues pending [{}]",
            self.total_agents,
            self.idle,
            self.inspecting,
            self.repairing,
            self.done,
            self.total_issues,
            if self.active { "ACTIVE" } else { "STOPPED" }
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_assign_sector() {
        let mut mgr = AreaManager::new();
        let id = mgr
            .assign_sector(ROLE_CORE_COMPOSITOR, 0, 0, 1024, 1024)
            .unwrap();
        assert_eq!(id, 0);
        assert_eq!(mgr.agent_count(), 1);

        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.role, ROLE_CORE_COMPOSITOR);
        assert_eq!(agent.home_x, 0);
        assert_eq!(agent.home_y, 0);
        assert_eq!(agent.sector_w, 1024);
        assert_eq!(agent.sector_h, 1024);
        assert_eq!(agent.status, STATUS_IDLE);
    }

    #[test]
    fn test_reject_overlap() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_MAINTENANCE, 0, 0, 1024, 1024)
            .unwrap();
        let result = mgr.assign_sector(ROLE_MAINTENANCE, 512, 512, 1024, 1024);
        assert!(result.is_err());
    }

    #[test]
    fn test_auto_assign_grid() {
        let mut mgr = AreaManager::new();
        let ids = mgr.auto_assign_grid(0, 0, 2048, 2048, 1024);
        assert_eq!(ids.len(), 4); // 2x2 grid
        assert_eq!(mgr.agent_count(), 4);
        assert_eq!(mgr.get_agent(0).unwrap().role, ROLE_CORE_COMPOSITOR);
        assert_eq!(mgr.get_agent(1).unwrap().role, ROLE_VISUAL_SHELL);
    }

    #[test]
    fn test_tick_triggers_inspection() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_MAINTENANCE, 0, 0, 1024, 1024)
            .unwrap();
        mgr.start();

        // First tick at frame 0 should trigger inspection
        let actions = mgr.tick(0);
        assert_eq!(actions.len(), 1);
        assert!(matches!(actions[0].1, AgentAction::Inspect));

        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.status, STATUS_INSPECTING);
    }

    #[test]
    fn test_inspection_to_repair() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_MAINTENANCE, 0, 0, 1024, 1024)
            .unwrap();
        mgr.start();
        mgr.tick(0);

        // Simulate vision finding issues
        let issues = vec![
            DiagnosticIssue {
                x: 100,
                y: 200,
                issue_type: TASK_PRUNE_NOISE,
                confidence: 0.92,
                description: "Stray pixel cluster".into(),
            },
            DiagnosticIssue {
                x: 500,
                y: 300,
                issue_type: TASK_REPAIR_WIRE,
                confidence: 0.85,
                description: "Broken signal path".into(),
            },
        ];

        mgr.process_inspection_results(0, issues);

        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.status, STATUS_REPAIRING);
        assert_eq!(agent.target_x, 100);
        assert_eq!(agent.target_y, 200);
        assert_eq!(agent.task_type, TASK_PRUNE_NOISE);
    }

    #[test]
    fn test_advance_task() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_MAINTENANCE, 0, 0, 1024, 1024)
            .unwrap();
        mgr.start();
        mgr.tick(0);

        let issues = vec![
            DiagnosticIssue {
                x: 100,
                y: 200,
                issue_type: TASK_PRUNE_NOISE,
                confidence: 0.9,
                description: "noise".into(),
            },
            DiagnosticIssue {
                x: 500,
                y: 300,
                issue_type: TASK_REPAIR_WIRE,
                confidence: 0.8,
                description: "broken".into(),
            },
        ];
        mgr.process_inspection_results(0, issues);

        // Complete first task
        mgr.advance_task(0);
        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.target_x, 500);
        assert_eq!(agent.target_y, 300);
        assert_eq!(agent.task_type, TASK_REPAIR_WIRE);

        // Complete second task
        mgr.advance_task(0);
        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.status, STATUS_DONE);
        assert_eq!(agent.target_x, -1);
    }

    #[test]
    fn test_ram_roundtrip() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_NEURAL_COGNITIVE, 100, 200, 512, 512)
            .unwrap();
        mgr.start();
        mgr.tick(0);
        mgr.process_inspection_results(
            0,
            vec![DiagnosticIssue {
                x: 150,
                y: 250,
                issue_type: TASK_REINFORCE,
                confidence: 0.95,
                description: "weak".into(),
            }],
        );

        let mut ram = vec![0u32; 0x8000];
        mgr.write_to_ram(&mut ram);

        let base = AGENT_TABLE_BASE as usize;
        assert_eq!(ram[base + 0], 150); // target_x
        assert_eq!(ram[base + 1], 250); // target_y
        assert_eq!(ram[base + 2], STATUS_REPAIRING);
        assert_eq!(ram[base + 3], TASK_REINFORCE);
        assert_eq!(ram[base + 4], 100); // home_x
        assert_eq!(ram[base + 5], 200); // home_y
        assert_eq!(ram[base + 6], 512); // sector_w
        assert_eq!(ram[base + 7], 512); // sector_h
        assert_eq!(ram[base + 8], ROLE_NEURAL_COGNITIVE);
    }

    #[test]
    fn test_summary_display() {
        let mut mgr = AreaManager::new();
        mgr.auto_assign_grid(0, 0, 2048, 2048, 1024);
        mgr.start();

        let summary = mgr.summary();
        assert_eq!(summary.total_agents, 4);
        assert!(summary.active);
        assert!(summary.idle == 4);

        let display = format!("{}", summary);
        assert!(display.contains("4 agents"));
        assert!(display.contains("ACTIVE"));
    }

    #[test]
    fn test_vm_completion_single_issue() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_MAINTENANCE, 0, 0, 1024, 1024)
            .unwrap();
        mgr.start();
        mgr.tick(0); // triggers inspection

        // Simulate vision finding one issue
        mgr.process_inspection_results(
            0,
            vec![DiagnosticIssue {
                x: 100,
                y: 200,
                issue_type: TASK_PRUNE_NOISE,
                confidence: 0.9,
                description: "noise".into(),
            }],
        );
        assert_eq!(mgr.get_agent(0).unwrap().status, STATUS_REPAIRING);

        // Write to RAM
        let mut ram = vec![0u32; 0x8000];
        mgr.write_to_ram(&mut ram);
        assert_eq!(ram[AGENT_TABLE_BASE as usize + 2], STATUS_REPAIRING);

        // Simulate VM-side repair agent writing STATUS_DONE to RAM
        ram[AGENT_TABLE_BASE as usize + 2] = STATUS_DONE;

        // Host detects completion
        let completed = mgr.process_vm_completions(&ram);
        assert_eq!(completed.len(), 1);
        assert_eq!(completed[0], 0);

        // Agent should now be fully done (no more issues)
        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.status, STATUS_DONE);
        assert_eq!(agent.target_x, -1);
        assert_eq!(agent.target_y, -1);
        assert_eq!(agent.task_type, TASK_NONE);
    }

    #[test]
    fn test_vm_completion_multiple_issues() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_MAINTENANCE, 0, 0, 1024, 1024)
            .unwrap();
        mgr.start();
        mgr.tick(0);

        // Vision finds two issues
        mgr.process_inspection_results(
            0,
            vec![
                DiagnosticIssue {
                    x: 100,
                    y: 200,
                    issue_type: TASK_PRUNE_NOISE,
                    confidence: 0.9,
                    description: "noise".into(),
                },
                DiagnosticIssue {
                    x: 500,
                    y: 300,
                    issue_type: TASK_REPAIR_WIRE,
                    confidence: 0.85,
                    description: "broken".into(),
                },
            ],
        );

        assert_eq!(mgr.get_agent(0).unwrap().target_x, 100);
        assert_eq!(mgr.get_agent(0).unwrap().task_type, TASK_PRUNE_NOISE);

        let mut ram = vec![0u32; 0x8000];
        mgr.write_to_ram(&mut ram);

        // VM completes first task
        ram[AGENT_TABLE_BASE as usize + 2] = STATUS_DONE;
        let completed = mgr.process_vm_completions(&ram);
        assert_eq!(completed.len(), 1);

        // Agent should still be REPAIRING with second issue
        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.status, STATUS_REPAIRING);
        assert_eq!(agent.target_x, 500);
        assert_eq!(agent.target_y, 300);
        assert_eq!(agent.task_type, TASK_REPAIR_WIRE);

        // Write new task to RAM
        mgr.write_to_ram(&mut ram);
        assert_eq!(ram[AGENT_TABLE_BASE as usize + 2], STATUS_REPAIRING);
        assert_eq!(ram[AGENT_TABLE_BASE as usize + 0], 500); // target_x

        // VM completes second task
        ram[AGENT_TABLE_BASE as usize + 2] = STATUS_DONE;
        let completed = mgr.process_vm_completions(&ram);
        assert_eq!(completed.len(), 1);

        // Now fully done
        let agent = mgr.get_agent(0).unwrap();
        assert_eq!(agent.status, STATUS_DONE);
        assert_eq!(agent.target_x, -1);
        assert_eq!(agent.issues_found.len(), 0);
    }

    #[test]
    fn test_vm_completion_ignores_non_repairing() {
        let mut mgr = AreaManager::new();
        mgr.assign_sector(ROLE_MAINTENANCE, 0, 0, 1024, 1024)
            .unwrap();

        // Agent is IDLE, not REPAIRING
        let ram = vec![0u32; 0x8000];
        let completed = mgr.process_vm_completions(&ram);
        assert!(completed.is_empty());
    }
}
