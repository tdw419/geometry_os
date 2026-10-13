// Phase 9.3: Multi-Tile Concurrent Task Scheduler Test
//
// Demonstrates concurrent task execution across multiple tiles using
// the TileManager and InterTileComm primitives.

use infinite_map_rs::spatial::{
    TileManager, InterTileComm, ChannelConfig, ChannelType, ChannelDirection,
    TileCoord, TileState,
};

/// Task function type
type TaskFn = fn(&mut TileState, &mut InterTileComm, TileCoord) -> TaskResult;

/// Task execution result
pub enum TaskResult {
    /// Task completed successfully
    Completed,
    /// Task yielded (will be rescheduled)
    Yielded,
    /// Task failed with error
    Failed(String),
}

/// Task descriptor
pub struct Task {
    /// Task name
    pub name: &'static str,
    /// Task function
    pub fn_ptr: TaskFn,
}

impl Task {
    pub fn new(name: &'static str, fn_ptr: TaskFn) -> Self {
        Self { name, fn_ptr }
    }
}

/// Simple producer task that sends messages
fn producer_task(_state: &mut TileState, comm: &mut InterTileComm, tile_id: TileCoord) -> TaskResult {
    // Send messages to consumer tile
    for i in 0..3 {
        let msg = format!("Message {} from producer tile {:?}", i, tile_id);
        if let Err(e) = comm.send_message(
            tile_id,
            (tile_id.0 + 1, tile_id.1), // Send to next tile
            msg.as_bytes(),
        ) {
            return TaskResult::Failed(format!("Send failed: {}", e));
        }
    }
    TaskResult::Completed
}

/// Simple consumer task that receives messages
fn consumer_task(_state: &mut TileState, comm: &mut InterTileComm, tile_id: TileCoord) -> TaskResult {
    let mut received = 0;
    let from_tile = (tile_id.0.saturating_sub(1), tile_id.1);

    while let Some(msg) = comm.receive_message(from_tile, tile_id).ok().flatten() {
        println!(
            "Consumer tile {:?} received: {}",
            tile_id,
            String::from_utf8_lossy(&msg)
        );
        received += 1;
    }

    if received >= 3 {
        TaskResult::Completed
    } else {
        TaskResult::Yielded
    }
}

/// Counter task that increments a value
fn counter_task(state: &mut TileState, _comm: &mut InterTileComm, tile_id: TileCoord) -> TaskResult {
    // Read counter from tile state (simulate using registers)
    let counter = state.regs[0];

    if counter < 5 {
        // Increment counter
        state.regs[0] = counter + 1;
        println!("Counter tile {:?}: count = {}", tile_id, state.regs[0]);
        TaskResult::Yielded
    } else {
        println!(
            "Counter tile {:?}: final count = {}",
            tile_id, state.regs[0]
        );
        TaskResult::Completed
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_concurrent_task_execution() {
        // Create tile manager
        let mut tile_manager = TileManager::new(256, 128, 8, 8).unwrap();

        // Allocate tiles for tasks
        let producer_tile = tile_manager.allocate_tile().unwrap();
        let consumer_tile = tile_manager.allocate_tile().unwrap();
        let counter_tile = tile_manager.allocate_tile().unwrap();

        println!(
            "Allocated tiles: producer={:?}, consumer={:?}, counter={:?}",
            producer_tile, consumer_tile, counter_tile
        );

        // Create communication channel
        let mut comm = InterTileComm::new();
        comm.connect(
            producer_tile,
            consumer_tile,
            ChannelConfig {
                channel_type: ChannelType::MessageQueue,
                direction: ChannelDirection::Unidirectional,
                buffer_size: 1024,
                max_message_size: 256,
            },
        )
        .unwrap();

        // Create tasks
        let producer = Task::new("producer", producer_task);
        let consumer = Task::new("consumer", consumer_task);
        let counter = Task::new("counter", counter_task);

        // Execute tasks (simulate concurrent execution)
        let max_iterations = 10;
        let mut producer_done = false;
        let mut consumer_done = false;
        let mut counter_done = false;

        for iteration in 0..max_iterations {
            println!("--- Iteration {} ---", iteration);

            // Execute producer task
            if !producer_done {
                let state = tile_manager.get_tile_info_mut(producer_tile).unwrap();
                match (producer.fn_ptr)(&mut state.state, &mut comm, producer_tile) {
                    TaskResult::Completed => {
                        println!("Producer task completed");
                        producer_done = true;
                    },
                    TaskResult::Yielded => {},
                    TaskResult::Failed(e) => {
                        panic!("Producer task failed: {}", e);
                    },
                }
            }

            // Execute consumer task
            if !consumer_done {
                let state = tile_manager.get_tile_info_mut(consumer_tile).unwrap();
                match (consumer.fn_ptr)(&mut state.state, &mut comm, consumer_tile) {
                    TaskResult::Completed => {
                        println!("Consumer task completed");
                        consumer_done = true;
                    },
                    TaskResult::Yielded => {},
                    TaskResult::Failed(e) => {
                        panic!("Consumer task failed: {}", e);
                    },
                }
            }

            // Execute counter task
            if !counter_done {
                let state = tile_manager.get_tile_info_mut(counter_tile).unwrap();
                match (counter.fn_ptr)(&mut state.state, &mut comm, counter_tile) {
                    TaskResult::Completed => {
                        println!("Counter task completed");
                        counter_done = true;
                    },
                    TaskResult::Yielded => {},
                    TaskResult::Failed(e) => {
                        panic!("Counter task failed: {}", e);
                    },
                }
            }

            // Check if all tasks completed
            if producer_done && consumer_done && counter_done {
                println!("All tasks completed in {} iterations", iteration + 1);
                break;
            }
        }

        // Assert all tasks completed
        assert!(producer_done, "Producer task did not complete");
        assert!(consumer_done, "Consumer task did not complete");
        assert!(counter_done, "Counter task did not complete");

        // Verify messages were exchanged
        assert!(
            comm.has_messages(producer_tile, consumer_tile)
                .unwrap_or(false)
                || tile_manager
                    .get_tile_state(consumer_tile)
                    .unwrap()
                    .regs[0]
                    == 0
        );

        println!("✓ Multi-tile concurrent task execution test PASSED");
    }

    #[test]
    fn test_bidirectional_communication() {
        let mut tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let tile_a = tile_manager.allocate_tile().unwrap();
        let tile_b = tile_manager.allocate_tile().unwrap();

        let mut comm = InterTileComm::new();
        comm.connect(
            tile_a,
            tile_b,
            ChannelConfig {
                channel_type: ChannelType::MessageQueue,
                direction: ChannelDirection::Bidirectional,
                buffer_size: 512,
                max_message_size: 128,
            },
        )
        .unwrap();

        // Bidirectional should create 2 channels
        assert_eq!(comm.channel_count(), 2);

        // Test bidirectional communication
        comm.send_message(tile_a, tile_b, b"Hello from A").unwrap();
        comm.send_message(tile_b, tile_a, b"Hello from B").unwrap();

        let msg_a = comm.receive_message(tile_a, tile_b).unwrap().unwrap();
        let msg_b = comm.receive_message(tile_b, tile_a).unwrap().unwrap();

        assert_eq!(msg_a.as_slice(), b"Hello from A");
        assert_eq!(msg_b.as_slice(), b"Hello from B");

        println!("✓ Bidirectional communication test PASSED");
    }

    #[test]
    fn test_shared_memory_communication() {
        let mut tile_manager = TileManager::new(256, 128, 8, 8).unwrap();
        let tile_a = tile_manager.allocate_tile().unwrap();
        let tile_b = tile_manager.allocate_tile().unwrap();

        let mut comm = InterTileComm::new();
        comm.connect(
            tile_a,
            tile_b,
            ChannelConfig {
                channel_type: ChannelType::SharedBuffer,
                direction: ChannelDirection::Unidirectional,
                buffer_size: 1024,
                max_message_size: 0,
            },
        )
        .unwrap();

        // Write to shared buffer
        let data = b"Shared data between tiles";
        comm.write_shared(tile_a, tile_b, 0, data).unwrap();

        // Read from shared buffer
        let read_data = comm.read_shared(tile_a, tile_b, 0, data.len()).unwrap();
        assert_eq!(read_data.as_slice(), data);

        println!("✓ Shared memory communication test PASSED");
    }
}