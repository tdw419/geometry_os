import re

with open('systems/infinite_map_rs/tests/self_spawning_test.rs', 'r') as f:
    content = f.read()

# Add code to check if VM 1 is active
verify_code = """
        // --- Verify VM 1 spawned ---
        println!("\\nVerifying VM 1 was spawned at address 100...");
        
        let stats = scheduler.read_scheduler_stats();
        assert_eq!(stats.active_count, 2, "Expected 2 active VMs, got {}", stats.active_count);
        println!("  ✓ Scheduler reports 2 active VMs");

        // Execute one more frame to let VM 1 do some work
        println!("Executing another frame for VM 1...");
        scheduler.execute_frame();
        println!("Frame 2 complete.");
        
        // We'd expect VM 1 to copy from 100 to 200, wait, it loads from its own r0=0.
        // It's still copying from 0. To make it truly recursive, we need relative addressing,
        // but spawning is proven.
"""

content = content.replace('println!("  ✓ Source pixels intact. Self-replication is non-destructive.");\n    }\n}', 'println!("  ✓ Source pixels intact. Self-replication is non-destructive.");\n' + verify_code + '    }\n}')

with open('systems/infinite_map_rs/tests/self_spawning_test.rs', 'w') as f:
    f.write(content)
