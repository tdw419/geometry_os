# Module 3: Process Management

> **Duration**: 45 minutes
> **Format**: Hands-on exercises
> **Prerequisites**: Module 2 completed

## Learning Objectives

After completing this module, you will be able to:
- Understand process lifecycle and states
- Monitor processes visually
- Manage system resources
- Control process interactions

---

## 3.1 Process Lifecycle

### Process States

In Geometry OS, processes go through distinct states, each with visual representation:

```
┌──────────┐
│  CREATED │ ──► New process spawned
└────┬─────┘
     │
     ▼
┌──────────┐     ┌──────────┐
│ RUNNING  │ ◄──►│ WAITING  │
└────┬─────┘     └──────────┘
     │
     ▼
┌──────────┐
│  DONE    │ ──► Process completed
└──────────┘
```

| State | Visual | Meaning |
|-------|--------|---------|
| CREATED | Yellow pulse | Process initializing |
| RUNNING | Green glow | Actively executing |
| WAITING | Blue dim | Waiting for I/O or event |
| DONE | Gray static | Completed execution |
| ERROR | Red flash | Failed execution |

### Process Control Block (PCB)

Each process has a PCB containing:

```bash
>>> ps show 42
Process 42: "evolution_daemon"
  State: RUNNING
  PC: 0x1A3F
  SP: 0xFF00
  Cycles: 1,234,567
  Memory: 4.2MB
  Priority: 10
  Parent: 1
  Children: [43, 44]
  Started: 2026-03-11 08:00:00
  [Visual: PCB overlay on process region]
```

### Process Creation

```bash
# Run a program
>>> run ./my_program.spv
Process 101 started
[Visual: New yellow region appears]

# Run with arguments
>>> run ./compute.spv --iterations 1000
Process 102 started

# Run in background
>>> run ./background_task.spv &
Process 103 started (background)

# Run with priority
>>> run --priority 5 ./important.spv
Process 104 started (priority: 5)
```

### Process Termination

```bash
# Normal exit
>>> kill 101
Process 101 terminated
[Visual: Region fades to gray]

# Force kill
>>> kill -9 102
Process 102 killed
[Visual: Region flashes red then disappears]

# Kill by name
>>> killall background_task
Killed 3 processes

# Graceful shutdown
>>> shutdown 103
Process 103 shutting down gracefully...
Process 103 terminated
```

---

## 3.2 Visual Process Monitoring

### Process List View

```bash
>>> ps
PID   NAME                STATE    CPU%   MEM      CYCLES
1     kernel              RUNNING  2.1%   1.2GB    89M
42    evolution_daemon    RUNNING  15.3%  4.2MB    1.2M
43    visual_shell        RUNNING  8.7%   128MB    456K
101   my_program          WAITING  0.0%   2.1MB    12K
102   compute             RUNNING  45.2%  8.4MB    890K
[Visual: Each row colored by state]
```

### Visual Process Map

```bash
# Enable process visualization
>>> visual processes on

# Show process regions
>>> visual processes
[Visual: Memory map with process regions highlighted]
┌────────────────────────────────────────┐
│ [KERNEL - Blue]                        │
├────────────────────────────────────────┤
│ [evolution_daemon - Green ▓▓▓▓]        │
│ [visual_shell - Green ▓▓▓▓▓▓▓▓]        │
│ [my_program - Blue ░░░░]               │
│ [compute - Green ▓▓▓▓▓▓]               │
└────────────────────────────────────────┘

# Focus on specific process
>>> visual focus 42
Centered on evolution_daemon (PID 42)

# Follow process activity
>>> visual follow process 102
Following compute (PID 102)
[Visual: View automatically tracks process]
```

### Real-Time Monitoring

```bash
# Live process stats
>>> top
─── Geometry OS Process Monitor ───
Total: 5 processes | CPU: 71.3% | MEM: 1.4GB

PID   NAME              CPU%   MEM     STATE
102   compute           45.2%  8.4MB   RUNNING ▓▓▓▓▓▓▓▓
42    evolution_daemon  15.3%  4.2MB   RUNNING ▓▓▓
43    visual_shell      8.7%   128MB   RUNNING ▓
1     kernel            2.1%   1.2GB   RUNNING 
101   my_program        0.0%   2.1MB   WAITING 

[Updates every 1 second, press q to quit]

# Monitor specific process
>>> monitor 102
Monitoring process 102 (compute)...
[08:15:01] CPU: 45.2% | MEM: 8.4MB | State: RUNNING
[08:15:02] CPU: 47.1% | MEM: 8.6MB | State: RUNNING
[08:15:03] CPU: 44.8% | MEM: 8.4MB | State: RUNNING
^C
Monitoring stopped
```

### Process Tree View

```bash
# Show process hierarchy
>>> pstree
kernel(1)
├── evolution_daemon(42)
│   ├── mutate_worker(43)
│   └── fitness_eval(44)
├── visual_shell(45)
│   ├── renderer(46)
│   └── input_handler(47)
└── my_program(101)

# Visual tree
>>> visual tree
[Visual: Tree diagram with animated connections]
```

---

## 3.3 Resource Management

### Memory Management

```bash
# Show memory usage
>>> memory
Total: 16GB | Used: 4.2GB (26.3%) | Free: 11.8GB

Region      Used      Total    Utilization
KERNEL      512MB     1GB      ▓▓▓▓▓░░░░░ 50%
SHELL       128MB     256MB    ▓▓▓▓▓▓░░░░ 50%
PROCESSES   3.5GB     8GB      ▓▓▓▓░░░░░░ 44%
CACHE       64MB      2GB      ▓░░░░░░░░░ 3%
[Visual: Memory bar chart]

# Process memory breakdown
>>> memory by-process
PID   NAME              MEMORY    %TOTAL
1     kernel            1.2GB     28.6%
43    visual_shell      128MB     3.0%
42    evolution_daemon  4.2MB     0.1%
102   compute           8.4MB     0.2%

# Allocate memory for process
>>> alloc 102 16MB
Allocated 16MB for process 102

# Free memory
>>> free 102 8MB
Freed 8MB from process 102
```

### CPU Management

```bash
# CPU usage
>>> cpu
Total: 8 cores | Usage: 71.3%

Core 0: ▓▓▓▓▓▓▓▓░░ 80% [compute]
Core 1: ▓▓▓▓▓▓▓░░░ 70% [evolution_daemon]
Core 2: ▓▓▓▓▓░░░░░ 50% [visual_shell]
Core 3: ▓▓▓░░░░░░░ 30% [kernel]
Core 4-7: ░░░░░░░░░░ 0%  [idle]
[Visual: Core activity animation]

# Set process priority
>>> priority 102 5
Process 102 priority set to 5

# Limit CPU usage
>>> cpulimit 102 50%
Process 102 limited to 50% CPU

# Pin to core
>>> pin 102 0
Process 102 pinned to core 0
```

### I/O Management

```bash
# I/O stats
>>> iostat
Device     Read      Write     Queue
sda        12MB/s    8MB/s     2
gpu0       45MB/s    120MB/s   5
net0       1.2MB/s   0.8MB/s   1
[Visual: I/O flow animation]

# Process I/O
>>> iostat 102
Process 102 I/O:
  Read:  1.2GB total (12MB/s current)
  Write: 0.8GB total (8MB/s current)
  GPU:   4.5GB transferred
```

---

## 3.4 Process Interactions

### Inter-Process Communication (IPC)

```bash
# List IPC channels
>>> ipc list
Channel        Type      Processes
/mailbox/42    message   [42, 43]
/shm/evolution shared    [42, 44]
/pipe/log      pipe      [1, 45]

# Send message
>>> ipc send /mailbox/42 "Hello from shell"
Message sent to process 42

# Receive message
>>> ipc recv /mailbox/42
"Hello from shell"

# Visual IPC
>>> visual ipc on
[Visual: Animated lines between communicating processes]
```

### Signals

```bash
# Send signal
>>> signal 42 SIGTERM
Signal SIGTERM sent to process 42

# Common signals
>>> signal 102 SIGSTOP
Process 102 stopped
>>> signal 102 SIGCONT
Process 102 resumed
>>> signal 102 SIGUSR1
Custom signal sent

# Signal handlers
>>> signals 42
Process 42 signal handlers:
  SIGTERM: default
  SIGINT:  handler at 0x1A00
  SIGUSR1: handler at 0x1B00
```

### Process Groups

```bash
# Create process group
>>> group create computation
Group 'computation' created

# Add processes
>>> group add computation 102 103 104
Added processes to 'computation'

# Group operations
>>> group stop computation
Stopped 3 processes in 'computation'

>>> group resume computation
Resumed 3 processes in 'computation'

>>> group kill computation
Killed 3 processes in 'computation'
```

---

## 3.5 Practical Exercises

### Exercise 3.5.1: Process Lifecycle

Create and manage a process through its lifecycle:

```bash
# 1. Start a process
>>> run ./examples/compute_demo.spv &
Process 201 started

# 2. Monitor it
>>> ps | grep compute_demo
201   compute_demo       RUNNING  12.3%  2.1MB

# 3. Pause it
>>> signal 201 SIGSTOP
Process 201 stopped

# 4. Check state
>>> ps | grep compute_demo
201   compute_demo       WAITING  0.0%   2.1MB

# 5. Resume it
>>> signal 201 SIGCONT
Process 201 resumed

# 6. Terminate it
>>> kill 201
Process 201 terminated
```

### Exercise 3.5.2: Resource Monitoring

Monitor system resources during computation:

```bash
# 1. Start monitoring
>>> top &
Process 202 started (top)

# 2. Start a compute-intensive process
>>> run ./examples/stress_test.spv &
Process 203 started

# 3. Watch CPU usage
[Observe top output showing CPU spike]

# 4. Limit the process
>>> cpulimit 203 25%
Process 203 limited to 25% CPU

# 5. Verify limit
[Observe top showing reduced CPU]

# 6. Clean up
>>> kill 203 202
Processes terminated
```

### Exercise 3.5.3: Process Communication

Set up IPC between processes:

```bash
# 1. Create shared memory
>>> ipc create /shm/training 1MB
Shared memory created: /shm/training

# 2. Write data
>>> 42 → /shm/training:0
OK: Wrote to shared memory

# 3. Read data
>>> ← /shm/training:0
42

# 4. Create message queue
>>> ipc create /mq/training queue
Message queue created: /mq/training

# 5. Send message
>>> ipc send /mq/training "Hello, World!"
Message sent

# 6. Receive message
>>> ipc recv /mq/training
"Hello, World!"

# 7. Clean up
>>> ipc delete /shm/training
>>> ipc delete /mq/training
```

---

## 3.6 Module Summary

### What You Learned

- ✅ Process lifecycle and states
- ✅ Visual process monitoring
- ✅ Resource management (CPU, memory, I/O)
- ✅ Process interactions and IPC

### Key Takeaways

1. **States**: CREATED → RUNNING ↔ WAITING → DONE
2. **Visual**: Each state has a distinct visual representation
3. **Monitoring**: Use `ps`, `top`, and visual modes
4. **Resources**: Monitor and limit CPU, memory, I/O
5. **IPC**: Use channels, signals, and groups for coordination

### Common Pitfalls

| Issue | Solution |
|-------|----------|
| Process won't die | Use `kill -9` for force kill |
| High CPU usage | Use `cpulimit` to throttle |
| Memory leak | Monitor with `memory by-process` |
| IPC blocked | Check queue with `ipc list` |

### Next Steps

Proceed to [Module 4: Advanced Features](module_04_advanced_features.md) to learn:
- Scripting and automation
- Custom commands
- Integration with other systems
- Performance optimization

---

## Self-Assessment

Before moving on, verify you can:

- [ ] Start and stop processes
- [ ] Monitor processes with `ps` and `top`
- [ ] Use visual process monitoring
- [ ] Manage CPU and memory resources
- [ ] Set up IPC between processes
- [ ] Use signals to control processes

### Quick Quiz

1. What visual indicates a RUNNING process?
2. How do you limit a process to 50% CPU?
3. What command shows process hierarchy?
4. How do you create a shared memory region?

<details>
<summary>Answers</summary>

1. Green glow
2. `cpulimit <pid> 50%`
3. `pstree`
4. `ipc create /shm/name size`

</details>

---

*[Continue to Module 4: Advanced Features →](module_04_advanced_features.md)*
