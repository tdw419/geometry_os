# Exercise 3: Process Management

> **Module**: Module 3 - Process Management
> **Duration**: 25 minutes
> **Difficulty**: Intermediate

---

## Objectives

By completing this exercise, you will:
- Start and stop processes
- Monitor process state
- Manage resources
- Use IPC

---

## Prerequisites

- Completed Exercises 1-2
- Shell running

---

## Part 1: Process Lifecycle

### Task 1.1: Start a Process

```bash
>>> run examples/cli_preview.py &
Process 201 started
```

**Question:** What is the PID? _____________

### Task 1.2: Check Process Status

```bash
>>> ps
>>> ps -a
>>> ps | grep cli_preview
```

**Questions:**
1. What state is the process in? _____________
2. How much memory is it using? _____________

### Task 1.3: Process Information

```bash
>>> ps show 201
```

**Record the following:**
- State: _____________
- PC (Program Counter): _____________
- Cycles: _____________
- Memory: _____________

### Task 1.4: Stop the Process

```bash
>>> kill 201
>>> ps | grep cli_preview
```

**Question:** Did the process terminate? _____________

---

## Part 2: Process Monitoring

### Task 2.1: Real-time Monitoring

```bash
>>> top
```

Observe the display for 30 seconds, then press `q` to quit.

**Questions:**
1. What was the highest CPU process? _____________
2. How much memory was used? _____________

### Task 2.2: Process Tree

```bash
>>> pstree
```

**Question:** Draw the process tree for your current session:

```
kernel(1)
├── _____________(___)
│   └── _____________(___)
└── _____________(___)
```

### Task 2.3: Visual Process Monitoring

```bash
>>> visual on
>>> visual processes on
>>> visual focus 201
```

**Questions:**
1. What color is a running process? _____________
2. What happens when you focus on a process? _____________

---

## Part 3: Resource Management

### Task 3.1: Memory Monitoring

```bash
>>> memory
>>> memory by-process
```

**Questions:**
1. What's total memory? _____________
2. How much is used? _____________
3. What's the largest process? _____________

### Task 3.2: CPU Management

```bash
>>> cpu
>>> cpu cores
```

**Questions:**
1. How many cores are available? _____________
2. What's the current CPU usage? _____________

### Task 3.3: Limit a Process

```bash
# Start a CPU-intensive process
>>> run examples/stress_test.spv &
Process 202 started

# Limit to 25% CPU
>>> cpulimit 202 25%

# Monitor
>>> top
# Observe CPU is limited

# Remove limit
>>> cpulimit 202 100%

# Clean up
>>> kill 202
```

### Task 3.4: Priority Management

```bash
>>> run examples/cli_preview.py &
Process 203 started

>>> priority 203 5
>>> ps show 203 | grep Priority
>>> kill 203
```

---

## Part 4: Process Groups

### Task 4.1: Create a Group

```bash
>>> group create test_group
>>> run examples/cli_preview.py &
>>> run examples/cli_preview.py &
>>> run examples/cli_preview.py &
>>> group add test_group 204 205 206
>>> group list
```

### Task 4.2: Group Operations

```bash
>>> group stop test_group
>>> ps | grep cli_preview
>>> group resume test_group
>>> ps | grep cli_preview
>>> group kill test_group
>>> group delete test_group
```

**Question:** Did all processes in the group respond? _____________

---

## Part 5: IPC

### Task 5.1: Create Shared Memory

```bash
>>> ipc create /shm/exercise 1MB
Shared memory created: /shm/exercise
```

### Task 5.2: Use Shared Memory

```bash
# Write data
>>> 42 → /shm/exercise:0
>>> 100 → /shm/exercise:4
>>> [1, 2, 3, 4, 5] → /shm/exercise:8

# Read data
>>> ← /shm/exercise:0
>>> ← /shm/exercise:4
>>> ← /shm/exercise:8:5
```

**Questions:**
1. What value is at offset 0? _____________
2. What values are at offset 8? _____________

### Task 5.3: Message Queue

```bash
>>> ipc create /mq/exercise queue
>>> ipc send /mq/exercise "Hello, World!"
>>> ipc recv /mq/exercise
>>> ipc delete /mq/exercise
>>> ipc delete /shm/exercise
```

---

## Completion Checklist

- [ ] Started and stopped processes
- [ ] Used `ps`, `top`, `pstree` for monitoring
- [ ] Limited CPU usage of a process
- [ ] Set process priority
- [ ] Created and managed process groups
- [ ] Used IPC (shared memory and message queues)

---

## Challenge (Optional)

### Challenge 1: Process Farm

Start 5 processes, each calculating part of a problem, and collect results.

```bash
>>> # Start 5 workers
>>> run workers/worker_1.spv &
>>> run workers/worker_2.spv &
>>> run workers/worker_3.spv &
>>> run workers/worker_4.spv &
>>> run workers/worker_5.spv &

>>> # Collect results from shared memory
>>> result = ← /shm/results:0
>>> # ...
```

### Challenge 2: Resource Optimization

A process is using too much memory. Reduce its usage while maintaining functionality.

**Hint:** Look for memory leaks, caching, or buffer sizes.

---

## Common Issues

| Issue | Solution |
|-------|----------|
| Process won't die | Use `kill -9 <pid>` |
| IPC not working | Check permissions |
| High CPU | Use `cpulimit` or optimize code |
| Memory leak | Profile and fix |

---

## Next Steps

After completing this exercise, proceed to:
- [Exercise 4: Scripting](exercise_04_scripting.md)

---

*Exercise 3.0*
