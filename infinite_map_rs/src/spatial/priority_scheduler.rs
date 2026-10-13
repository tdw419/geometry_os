// Priority-Based Task Scheduler - Phase 9.4
//
// Extends the multi-tile scheduler with:
// - Task prioritization (0-255, 0 = highest)
// - Preemption support
// - Dynamic load balancing
// - Resource monitoring

use super::tile_manager::{TileCoord, TileManager, TileStateInfo, TileManagerError};
use super::tile_state::TileState;
use std::cmp::Ordering;
use std::collections::BinaryHeap;
use std::sync::{Arc, Mutex};

/// Task execution result
pub enum TaskResult {
    /// Task completed successfully
    Completed,
    /// Task yielded (will be rescheduled)
    Yielded,
    /// Task failed with error
    Failed(String),
}

/// Task priority (0 = highest, 255 = lowest)
pub type TaskPriority = u8;

/// Task ID
pub type TaskId = u64;

/// Task function signature
pub type TaskFn = fn(&mut TileState, tile_id: TileCoord) -> TaskResult;

/// Priority task descriptor
#[derive(Debug, Clone)]
pub struct PriorityTask {
    /// Task ID
    pub id: TaskId,
    /// Task name
    pub name: String,
    /// Task function
    pub fn_ptr: TaskFn,
    /// Task priority (0 = highest)
    pub priority: TaskPriority,
    /// Execution statistics
    pub stats: TaskStats,
    /// Task state (for resumption after preemption)
    pub state: Option<TileState>,
}

/// Task execution statistics
#[derive(Debug, Clone, Default)]
pub struct TaskStats {
    /// Total execution ticks
    pub execution_ticks: u64,
    /// Number of preemptions
    pub preemptions: u32,
    /// Number of yields
    pub yields: u32,
    /// Last execution timestamp
    pub last_executed: Option<std::time::Instant>,
}

impl PriorityTask {
    /// Create a new priority task
    pub fn new(id: TaskId, name: String, fn_ptr: TaskFn, priority: TaskPriority) -> Self {
        Self {
            id,
            name,
            fn_ptr,
            priority,
            stats: TaskStats::default(),
            state: None,
        }
    }

    /// Update execution statistics
    pub fn tick(&mut self) {
        self.stats.execution_ticks += 1;
        self.stats.last_executed = Some(std::time::Instant::now());
    }

    /// Record a preemption
    pub fn preempt(&mut self) {
        self.stats.preemptions += 1;
    }

    /// Record a yield
    pub fn yield_task(&mut self) {
        self.stats.yields += 1;
    }
}

/// BinaryHeap ordering for priority tasks
/// Higher priority (lower value) tasks come first
impl PartialEq for PriorityTask {
    fn eq(&self, other: &Self) -> bool {
        self.priority == other.priority && self.id == other.id
    }
}

impl Eq for PriorityTask {}

impl PartialOrd for PriorityTask {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl Ord for PriorityTask {
    fn cmp(&self, other: &Self) -> Ordering {
        // BinaryHeap returns "largest" element first, so we need to invert
        // Lower priority value = higher priority
        match self.priority.cmp(&other.priority) {
            Ordering::Equal => {
                // For same priority, FIFO ordering (lower ID first)
                // Invert: smaller ID should be "larger" to come first
                other.id.cmp(&self.id)
            }
            Ordering::Less => Ordering::Greater,  // Lower priority value = higher priority
            Ordering::Greater => Ordering::Less,  // Higher priority value = lower priority
        }
    }
}

/// Tile load information
#[derive(Debug, Clone)]
pub struct TileLoad {
    /// Tile coordinate
    pub tile_id: TileCoord,
    /// Number of pending tasks
    pub pending_tasks: usize,
    /// Currently executing task ID
    pub executing_task: Option<TaskId>,
    /// Average task execution time (ms)
    pub avg_execution_time_ms: f64,
}

/// Priority-based scheduler
pub struct PriorityScheduler {
    /// Task queue per tile (priority-based)
    task_queues: HashMap<TileCoord, BinaryHeap<PriorityTask>>,
    /// Currently executing task per tile
    executing_tasks: HashMap<TileCoord, TaskId>,
    /// Tile manager for state management
    tile_manager: TileManager,
    /// Load tracking
    tile_loads: HashMap<TileCoord, TileLoad>,
    /// Load balance threshold (ratio: max_load / min_load)
    load_balance_threshold: f64,
    /// Preemption enabled
    preemption_enabled: bool,
    /// Task ID counter
    next_task_id: TaskId,
}

use std::collections::HashMap;

impl PriorityScheduler {
    /// Create a new priority scheduler
    pub fn new(
        tile_manager: TileManager,
        load_balance_threshold: f64,
        preemption_enabled: bool,
    ) -> Self {
        Self {
            task_queues: HashMap::new(),
            executing_tasks: HashMap::new(),
            tile_manager,
            tile_loads: HashMap::new(),
            load_balance_threshold,
            preemption_enabled,
            next_task_id: 1,
        }
    }

    /// Submit a task to a specific tile
    pub fn submit_task(
        &mut self,
        tile_id: TileCoord,
        name: String,
        fn_ptr: TaskFn,
        priority: TaskPriority,
    ) -> Result<TaskId, TileManagerError> {
        // Verify tile exists
        self.tile_manager.get_tile_info(tile_id)?;

        // Create task
        let task_id = self.next_task_id;
        self.next_task_id += 1;

        let task = PriorityTask::new(task_id, name, fn_ptr, priority);

        // Add to task queue
        self.task_queues
            .entry(tile_id)
            .or_insert_with(BinaryHeap::new)
            .push(task);

        // Update load tracking
        self.update_tile_load(tile_id);

        Ok(task_id)
    }

    /// Execute tasks for all tiles for one tick
    pub fn tick(&mut self) -> Result<(), TileManagerError> {
        let mut tasks_to_migrate: Vec<(TileCoord, PriorityTask)> = Vec::new();
        let mut tiles_with_updates: Vec<TileCoord> = Vec::new();

        // Collect current executing tasks before iteration
        let current_executing: HashMap<TileCoord, TaskId> = self.executing_tasks.clone();

        // Collect task priorities that might need preemption
        let mut preempt_candidates: Vec<(TileCoord, TaskId, TaskPriority)> = Vec::new();
        if self.preemption_enabled {
            for (tile_id, queue) in self.task_queues.iter() {
                if let Some(peeked_task) = queue.peek() {
                    if let Some(&current_id) = current_executing.get(tile_id) {
                        if peeked_task.id != current_id {
                            preempt_candidates.push((*tile_id, current_id, peeked_task.priority));
                        }
                    }
                }
            }
        }

        // Check for preemption needs
        for (tile_id, current_id, new_priority) in preempt_candidates {
            if let Some(queue) = self.task_queues.get_mut(&tile_id) {
                if let Some(current_task) = queue.iter().find(|t| t.id == current_id) {
                    if new_priority < current_task.priority {
                        // Preempt current task
                        self.executing_tasks.remove(&tile_id);
                        tiles_with_updates.push(tile_id);
                    }
                }
            }
        }

        // Execute tasks on each tile
        for (tile_id, queue) in self.task_queues.iter_mut() {
            // Execute highest priority task
            if let Some(mut task) = queue.pop() {
                // Mark as executing
                self.executing_tasks.insert(*tile_id, task.id);

                // Get tile state
                if let Ok(state_info) = self.tile_manager.get_tile_info_mut(*tile_id) {
                    task.tick();

                    // Execute task
                    match (task.fn_ptr)(&mut state_info.state, *tile_id) {
                        TaskResult::Completed => {
                            // Task completed, remove from executing
                            self.executing_tasks.remove(tile_id);
                        }
                        TaskResult::Yielded => {
                            task.yield_task();
                            queue.push(task);
                            self.executing_tasks.remove(tile_id);
                        }
                        TaskResult::Failed(err) => {
                            eprintln!("Task {} failed: {}", task.name, err);
                            self.executing_tasks.remove(tile_id);
                        }
                    }
                } else {
                    self.executing_tasks.remove(tile_id);
                }

                tiles_with_updates.push(*tile_id);
            }
        }

        // Update loads for all modified tiles
        for tile_id in tiles_with_updates {
            self.update_tile_load(tile_id);
        }

        // Load balance if needed
        if self.should_rebalance() {
            self.rebalance_tasks()?;
        }

        Ok(())
    }

    /// Get task priority
    fn get_task_priority(&self, tile_id: TileCoord, task_id: TaskId) -> Result<TaskPriority, TileManagerError> {
        if let Some(queue) = self.task_queues.get(&tile_id) {
            for task in queue.iter() {
                if task.id == task_id {
                    return Ok(task.priority);
                }
            }
        }
        Err(TileManagerError::TileNotFound(tile_id))
    }

    /// Remove task from executing (preempt)
    fn remove_task_from_executing(&mut self, tile_id: TileCoord, task_id: TaskId) -> Option<PriorityTask> {
        self.executing_tasks.remove(&tile_id)?;
        // Note: This is a simplified version - in real implementation,
        // we'd need to save the task's state for resumption
        None
    }

    /// Update tile load information
    fn update_tile_load(&mut self, tile_id: TileCoord) {
        let pending_count = self.task_queues.get(&tile_id).map(|q| q.len()).unwrap_or(0);
        let executing_task = self.executing_tasks.get(&tile_id).copied();

        self.tile_loads.insert(
            tile_id,
            TileLoad {
                tile_id,
                pending_tasks: pending_count,
                executing_task,
                avg_execution_time_ms: 0.0, // TODO: Track actual execution times
            },
        );
    }

    /// Check if rebalancing is needed
    fn should_rebalance(&self) -> bool {
        if self.tile_loads.is_empty() {
            return false;
        }

        let max_load = self.tile_loads.values().map(|l| l.pending_tasks).max().unwrap_or(0);
        let min_load = self.tile_loads.values().map(|l| l.pending_tasks).min().unwrap_or(0);

        if min_load == 0 {
            return max_load > 0;
        }

        (max_load as f64 / min_load as f64) > self.load_balance_threshold
    }

    /// Rebalance tasks across tiles
    fn rebalance_tasks(&mut self) -> Result<(), TileManagerError> {
        let mut all_tasks: Vec<(TileCoord, PriorityTask)> = Vec::new();

        // Collect all tasks from all tiles
        for (tile_id, queue) in self.task_queues.drain() {
            for task in queue.into_vec() {
                all_tasks.push((tile_id, task));
            }
        }

        // Clear executing tasks
        self.executing_tasks.clear();

        // Sort tiles by load (least loaded first)
        let mut tile_loads: Vec<_> = self.tile_loads.drain().collect();
        tile_loads.sort_by_key(|(_, load)| load.pending_tasks);

        // Redistribute tasks evenly
        let num_tiles = tile_loads.len();
        let tasks_per_tile = all_tasks.len() / num_tiles.max(1);
        let remainder = all_tasks.len() % num_tiles.max(1);

        let mut task_index = 0;

        for (i, (tile_id, _)) in tile_loads.iter().enumerate() {
            let count = tasks_per_tile + if i < remainder { 1 } else { 0 };
            let mut queue = BinaryHeap::new();

            for _ in 0..count {
                if task_index < all_tasks.len() {
                    let (_, task) = all_tasks.remove(task_index);
                    queue.push(task);
                }
            }

            self.task_queues.insert(*tile_id, queue);
            self.update_tile_load(*tile_id);
        }

        Ok(())
    }

    /// Get tile load information
    pub fn get_tile_load(&self, tile_id: TileCoord) -> Option<&TileLoad> {
        self.tile_loads.get(&tile_id)
    }

    /// Get all tile loads
    pub fn get_all_tile_loads(&self) -> Vec<TileLoad> {
        self.tile_loads.values().cloned().collect()
    }

    /// Get total pending tasks across all tiles
    pub fn total_pending_tasks(&self) -> usize {
        self.task_queues.values().map(|q| q.len()).sum()
    }

    /// Get total executing tasks
    pub fn total_executing_tasks(&self) -> usize {
        self.executing_tasks.len()
    }

    /// Get task queue for a tile (for inspection)
    pub fn get_task_queue(&self, tile_id: TileCoord) -> Option<&BinaryHeap<PriorityTask>> {
        self.task_queues.get(&tile_id)
    }

    /// Get task statistics by ID
    pub fn get_task_stats(&self, task_id: TaskId) -> Option<TaskStats> {
        for queue in self.task_queues.values() {
            for task in queue.iter() {
                if task.id == task_id {
                    return Some(task.stats.clone());
                }
            }
        }
        None
    }

    /// Clear all tasks
    pub fn clear_all(&mut self) {
        self.task_queues.clear();
        self.executing_tasks.clear();
        self.tile_loads.clear();
    }

    /// Get tile manager reference
    pub fn tile_manager(&self) -> &TileManager {
        &self.tile_manager
    }

    /// Get tile manager mutable reference
    pub fn tile_manager_mut(&mut self) -> &mut TileManager {
        &mut self.tile_manager
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn dummy_task(_state: &mut TileState, _tile_id: TileCoord) -> TaskResult {
        TaskResult::Completed
    }

    fn yielding_task(_state: &mut TileState, _tile_id: TileCoord) -> TaskResult {
        TaskResult::Yielded
    }

    #[test]
    fn test_priority_task_ordering() {
        let task_low = PriorityTask::new(1, "low".to_string(), dummy_task, 255);
        let task_high = PriorityTask::new(2, "high".to_string(), dummy_task, 0);
        let task_medium = PriorityTask::new(3, "medium".to_string(), dummy_task, 128);

        let mut heap = BinaryHeap::new();
        heap.push(task_low);
        heap.push(task_high);
        heap.push(task_medium);

        // Tasks should come out in priority order
        let first = heap.pop().unwrap();
        assert_eq!(first.priority, 0); // Highest priority first
        assert_eq!(first.name, "high");

        let second = heap.pop().unwrap();
        assert_eq!(second.priority, 128);

        let third = heap.pop().unwrap();
        assert_eq!(third.priority, 255);
    }

    #[test]
    fn test_scheduler_task_submission() {
        let tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let mut scheduler = PriorityScheduler::new(tile_manager, 2.0, true);

        let tile_id = scheduler.tile_manager_mut().allocate_tile().unwrap();

        let task_id = scheduler
            .submit_task(tile_id, "test_task".to_string(), dummy_task, 128)
            .unwrap();

        assert_eq!(task_id, 1);
        assert_eq!(scheduler.total_pending_tasks(), 1);
    }

    #[test]
    fn test_scheduler_tick_execution() {
        let tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let mut scheduler = PriorityScheduler::new(tile_manager, 2.0, false);

        let tile_id = scheduler.tile_manager_mut().allocate_tile().unwrap();

        scheduler
            .submit_task(tile_id, "test_task".to_string(), dummy_task, 128)
            .unwrap();

        // Execute one tick
        scheduler.tick().unwrap();

        // Task should have completed
        assert_eq!(scheduler.total_pending_tasks(), 0);
    }

    #[test]
    fn test_yielding_task_rescheduling() {
        let tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let mut scheduler = PriorityScheduler::new(tile_manager, 2.0, false);

        let tile_id = scheduler.tile_manager_mut().allocate_tile().unwrap();

        scheduler
            .submit_task(tile_id, "yielding".to_string(), yielding_task, 128)
            .unwrap();

        // Task should yield and be rescheduled
        scheduler.tick().unwrap();
        assert_eq!(scheduler.total_pending_tasks(), 1); // Still pending

        scheduler.tick().unwrap();
        assert_eq!(scheduler.total_pending_tasks(), 1); // Still pending
    }

    #[test]
    fn test_load_balancing() {
        let tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let mut scheduler = PriorityScheduler::new(tile_manager, 1.5, false);

        let tile1 = scheduler.tile_manager_mut().allocate_tile().unwrap();
        let tile2 = scheduler.tile_manager_mut().allocate_tile().unwrap();

        // Add many tasks to tile 1, few to tile 2
        for i in 0..10 {
            scheduler
                .submit_task(tile1, format!("task_{}", i), dummy_task, 128)
                .unwrap();
        }

        for i in 0..2 {
            scheduler
                .submit_task(tile2, format!("task2_{}", i), dummy_task, 128)
                .unwrap();
        }

        assert_eq!(scheduler.total_pending_tasks(), 12);

        // Load balance should trigger
        let loads_before = scheduler.get_all_tile_loads();
        let max_before = loads_before.iter().map(|l| l.pending_tasks).max().unwrap();
        let min_before = loads_before.iter().map(|l| l.pending_tasks).min().unwrap();
        let load_ratio = max_before as f64 / min_before as f64;
        assert!(load_ratio > 1.5); // Should be imbalanced (10 vs 2)

        // Force rebalance
        scheduler.rebalance_tasks().unwrap();

        let loads_after = scheduler.get_all_tile_loads();
        // After rebalancing, loads should be more even (6 and 6)
        assert!(loads_after[0].pending_tasks >= 4 && loads_after[0].pending_tasks <= 8);
        assert!(loads_after[1].pending_tasks >= 4 && loads_after[1].pending_tasks <= 8);
    }

    #[test]
    fn test_task_statistics() {
        let tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let mut scheduler = PriorityScheduler::new(tile_manager, 2.0, false);

        let tile_id = scheduler.tile_manager_mut().allocate_tile().unwrap();

        let task_id = scheduler
            .submit_task(tile_id, "stats_test".to_string(), dummy_task, 128)
            .unwrap();

        // Get stats before execution
        let stats_before = scheduler.get_task_stats(task_id);
        assert!(stats_before.is_some()); // Task is in queue before execution

        // Execute task
        scheduler.tick().unwrap();

        // Get stats after execution (task should be completed and removed)
        let stats_after = scheduler.get_task_stats(task_id);
        assert!(stats_after.is_none()); // Completed task is gone

        // Submit a yielding task
        let task_id2 = scheduler
            .submit_task(tile_id, "stats_test2".to_string(), yielding_task, 128)
            .unwrap();

        scheduler.tick().unwrap();

        // Check stats after execution (yielding task is still in queue)
        let stats_after_yield = scheduler.get_task_stats(task_id2);
        assert!(stats_after_yield.is_some());
        let stats = stats_after_yield.unwrap();
        assert_eq!(stats.execution_ticks, 1);
        assert_eq!(stats.yields, 1);
    }

    #[test]
    fn test_multiple_tiles_execution() {
        let tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let mut scheduler = PriorityScheduler::new(tile_manager, 2.0, false);

        let tile1 = scheduler.tile_manager_mut().allocate_tile().unwrap();
        let tile2 = scheduler.tile_manager_mut().allocate_tile().unwrap();

        scheduler
            .submit_task(tile1, "tile1_task".to_string(), dummy_task, 128)
            .unwrap();
        scheduler
            .submit_task(tile2, "tile2_task".to_string(), dummy_task, 128)
            .unwrap();

        // Execute both tasks
        scheduler.tick().unwrap();

        // Both should have completed
        assert_eq!(scheduler.total_pending_tasks(), 0);
    }
}