# Solution for Task: - [/] **Task 3: Memory Pruning & Persistence Fixes**

Here is the concrete implementation plan for **Phase 46.5: Memory Pruning & Persistence Fixes**.

### 1. File Paths

**New Files:**
*   `src/agent/telemetry.rs` (Contains `AgentTelemetry` struct and update logic)
*   `src/core/memory/pruner.rs` (Contains the `MemoryPruner` and decay logic)
*   `src/core/memory/persistence.rs` (Contains `save_state` and `load_state` utilities)
*   `src/cmd/stress_test.rs` (CLI command for the Stress Test Rig)

**Modified Files:**
*   `src/agent/manager.rs` (Integrate `AgentTelemetry`, update `update` loop)
*   `src/core/synapse.rs` (Update `SynapticLayer` to use new pruning logic)
*   `src/cmd/mod.rs` (Register new `StressTest` command)

---

### 2. Implementation Snippets

#### A. Memory Pruning & Persistence (`src/core/memory/pruner.rs`)
This module ensures that the `SynapticLayer` does not grow infinitely, addressing the memory leak concerns.

```rust
use crate::core::synapse::Synapse;
use std::time::{Duration, Instant};

pub struct MemoryPruner {
    // Threshold for a signal to be considered "stale" (e.g., 30 seconds of inactivity)
    stale_threshold: Duration,
    // Probability of pruning a specific synapse per tick to save CPU cycles
    decay_rate: f32, 
}

impl MemoryPruner {
    pub fn new() -> Self {
        Self {
            stale_threshold: Duration::from_secs(30),
            decay_rate: 0.1, // 10% chance per tick to prune
        }
    }

    pub fn prune(&self, synapses: &mut Vec<Synapse>) {
        synapses.retain(|synapse| {
            let is_stale = synapse.last_updated.elapsed() > self.stale_threshold;
            
            // If not stale, probabilistically keep it (simulating decay)
            // This prevents the vector from growing to massive sizes over time
            if !is_stale {
                return (0.0..1.0).contains(&(self.decay_rate / 10.0));
            }
            
            false
        });
    }
}
```

#### B. Agent Pulse Telemetry (`src/agent/telemetry.rs`)
This module aggregates data from agents to satisfy the Observability goal.

```rust
use std::collections::HashMap;

pub struct AgentTelemetry {
    pub role_counts: HashMap<String, usize>,
    pub completed_tasks: usize,
    pub total_distance: f32,
    pub memory_usage_mb: usize,
}

impl AgentTelemetry {
    pub fn new() -> Self {
        AgentTelemetry {
            role_counts: HashMap::new(),
            completed_tasks: 0,
            total_distance: 0.0,
            memory_usage_mb: 0,
        }
    }

    pub fn record_tick(&mut self, agents: &[crate::agent::CityAgent]) {
        self.role_counts.clear();
        self.completed_tasks = 0;
        self.total_distance = 0.0;

        for agent in agents {
            // Aggregate Role Counts
            *self.role_counts.entry(agent.role.clone()).or_insert(0) += 1;
            
            // Aggregate Metrics
            self.completed_tasks += agent.stats.tasks_completed;
            self.total_distance += agent.stats.distance_traveled;
        }
    }
    
    // Console output formatter
    pub fn report(&self) {
        println!("--- System Pulse ---");
        for (role, count) in &self.role_counts {
            println!("Scouts: {}, Engineers: {}, Archivists: {}", 
                     self.role_counts.get("Scout").unwrap_or(&0),
                     self.role_counts.get("Engineer").unwrap_or(&0),
                     self.role_counts.get("Archivist").unwrap_or(&0));
        }
        println!("Tasks Completed (1m): {}", self.completed_tasks);
        println!("---------------------");
    }
}
```

#### C. Stress Test Rig (`src/cmd/stress_test.rs`)
This command allows the developer to force high-density congestion.

```rust
use crate::agent::CityAgentManager;
use crate::world::District;

pub fn run_stress_test(manager: &mut CityAgentManager, target_district_id: u32) {
    println!("Initiating Stress Test: Targeting District {}", target_district_id);
    
    // 1. Clear existing agents
    manager.clear_agents();
    
    // 2. Spawn 100 Agents into the specific district
    for _ in 0..100 {
        // Find the target district in the world graph
        if let Some(district) = manager.world.get_district(target_district_id) {
            let start_pos = district.center;
            
            // Create a new agent with a specific "Scout" role to test pathfinding
            let scout = crate::agent::CityAgent::new(
                "Scout".to_string(), 
                start_pos, 
                manager.world.clone()
            );
            
            // Force a target that is very close to cause immediate congestion logic
            let target = district.center; 
            scout.set_goal(target);
            
            manager.add_agent(scout);
        }
    }
    
    println!("Stress test active. Monitoring FPS and CPU load...");
}
```

#### D. Integration (`src/agent/manager.rs` update loop)
This snippet shows how to inject the telemetry and pruning into the main loop.

```rust
use crate::core::memory::pruner::MemoryPruner;
use crate::agent::telemetry::AgentTelemetry;

pub struct CityAgentManager {
    // ... existing fields ...
    pub telemetry: AgentTelemetry,
    memory_pruner: MemoryPruner,
}

impl CityAgentManager {
    pub fn update(&mut self) {
        // 1. Update all agents
        for agent in &mut self.agents {
            agent.update(&self.world);
        }

        // 2. Prune Synaptic Memory
        // This runs periodically to prevent memory leaks
        if let Some(synapses) = self.world.get_mut_synapses() {
            self.memory_pruner.prune(synapses);
        }

        // 3. Record Telemetry
        self.telemetry.record_tick(&self.agents);
    }
}
```

---

### 3. Next Step

**Action:** Create the `src/core/memory/pruner.rs` file and implement the `MemoryPruner` struct.

```bash
# Create the file
touch src/core/memory/pruner.rs
```