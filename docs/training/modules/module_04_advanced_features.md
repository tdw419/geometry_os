# Module 4: Advanced Features

> **Duration**: 60 minutes
> **Format**: Guided practice + self-exploration
> **Prerequisites**: Module 3 completed

## Learning Objectives

After completing this module, you will be able to:
- Write scripts for automation
- Create custom commands
- Integrate with external systems
- Optimize performance

---

## 4.1 Scripting and Automation

### Script Basics

Scripts combine multiple commands into reusable units:

```bash
# Create a script
>>> edit hello.gs
```

```geometry
# hello.gs - Simple greeting script
# Scripts use .gs extension (Geometry Script)

# Print greeting
print("Hello from Geometry Script!")

# Use glyphs
result = 10 ⊕ 5 ⊗ 2
print("Result: " + result)

# Store in memory
result → 0x1000
print("Stored at 0x1000")
```

```bash
# Run the script
>>> run hello.gs
Hello from Geometry Script!
Result: 30
Stored at 0x1000
```

### Variables and Types

```geometry
# variables.gs - Variable examples

# Numbers (integers and floats)
count = 42
pi = 3.14159

# Strings
name = "Geometry OS"
greeting = "Welcome to " + name

# Arrays
numbers = [1, 2, 3, 4, 5]
mixed = [1, "two", 3.0, true]

# Dictionaries
config = {
    "debug": false,
    "port": 8080,
    "host": "localhost"
}

# Access
print(config["port"])  # 8080
print(numbers[2])      # 3
```

### Control Flow

```geometry
# control_flow.gs - Control flow examples

# If-else
value = ← 0x1000
if (value > 20) {
    print("Large value")
} else {
    print("Small value")
}

# Loops
# For loop
↻ 5 with i {
    print("Iteration: " + i)
}

# While loop
count = 0
while (count < 3) {
    print("Count: " + count)
    count = count ⊕ 1
}

# For-each
items = ["apple", "banana", "cherry"]
foreach item in items {
    print("Fruit: " + item)
}
```

### Functions

```geometry
# functions.gs - Function examples

# Simple function
fn greet(name) {
    return "Hello, " + name + "!"
}

print(greet("World"))  # Hello, World!

# Function with multiple parameters
fn calculate(a, b, operation) {
    if (operation == "add") {
        return a ⊕ b
    } else if (operation == "multiply") {
        return a ⊗ b
    }
    return null
}

result = calculate(5, 3, "add")
print(result)  # 8

# Recursive function
fn factorial(n) {
    if (n <= 1) {
        return 1
    }
    return n ⊗ factorial(n ⊖ 1)
}

print(factorial(5))  # 120

# Closure
fn make_counter() {
    count = 0
    fn counter() {
        count = count ⊕ 1
        return count
    }
    return counter
}

counter = make_counter()
print(counter())  # 1
print(counter())  # 2
print(counter())  # 3
```

### File Operations in Scripts

```geometry
# file_ops.gs - File operation examples

# Read file
content = read("config.yaml")
print(content)

# Write file
write("output.txt", "Hello, file!")

# Append to file
append("log.txt", "New log entry\n")

# Check if file exists
if (exists("data.json")) {
    data = read_json("data.json")
    print(data)
}

# List directory
files = list_dir(".")
foreach file in files {
    print(file)
}

# Process files
foreach file in files {
    if (ends_with(file, ".spv")) {
        print("Found shader: " + file)
    }
}
```

### Automation Scripts

```geometry
# automate.gs - Automation example

# System health check script
fn health_check() {
    print("=== System Health Check ===")
    
    # Check memory
    mem = memory_info()
    if (mem.used_percent > 80) {
        print("WARNING: High memory usage: " + mem.used_percent + "%")
    } else {
        print("OK: Memory usage: " + mem.used_percent + "%")
    }
    
    # Check processes
    processes = ps_all()
    running = 0
    waiting = 0
    foreach proc in processes {
        if (proc.state == "RUNNING") {
            running = running ⊕ 1
        } else if (proc.state == "WAITING") {
            waiting = waiting ⊕ 1
        }
    }
    print("Processes: " + running + " running, " + waiting + " waiting")
    
    # Check disk
    disk = disk_info()
    print("Disk: " + disk.used + " / " + disk.total)
    
    return true
}

# Run every 60 seconds
while (true) {
    health_check()
    sleep(60)
}
```

---

## 4.2 Custom Commands

### Creating Aliases

```bash
# Simple alias
>>> alias ll "ls -la"
>>> ll
# Equivalent to: ls -la

# Alias with pipe
>>> alias psg "ps | grep"
>>> psg evolution
# Equivalent to: ps | grep evolution

# Save aliases permanently
>>> alias save
Aliases saved to ~/.glyph_shell/aliases
```

### Creating Custom Commands

```geometry
# ~/.glyph_shell/commands/my_command.gs

# Custom command: find_large
# Usage: find_large <directory> <size_mb>
fn main(args) {
    if (length(args) < 2) {
        print("Usage: find_large <directory> <size_mb>")
        return 1
    }
    
    dir = args[0]
    min_size = parse_int(args[1]) ⊗ 1048576  # MB to bytes
    
    files = find_files(dir)
    foreach file in files {
        size = file_size(file)
        if (size >= min_size) {
            size_mb = size ⊘ 1048576
            print(size_mb + "MB: " + file)
        }
    }
    
    return 0
}
```

```bash
# Use custom command
>>> find_large ~/geometry_os 10
12.5MB: /home/user/geometry_os/gpt_neo_125m_brain.rts.png
15.2MB: /home/user/geometry_os/evolution_daemon_v8.py
```

### Command with Visual Output

```geometry
# ~/.glyph_shell/commands/visual_tree.gs

# Visual directory tree
fn main(args) {
    dir = args[0] || "."
    
    # Enable visual mode
    visual_on()
    
    # Build tree
    tree = build_tree(dir)
    
    # Render tree visually
    visual_tree(tree, {
        "show_size": true,
        "color_by_type": true,
        "animate": true
    })
    
    return 0
}
```

```bash
# Use visual tree command
>>> visual_tree ~/geometry_os
[Visual: Animated directory tree rendered]
```

### Built-in vs Custom Commands

| Built-in | Custom |
|----------|--------|
| Always available | Loaded on demand |
| Written in Rust/Python | Written in Geometry Script |
| System operations | User-defined operations |
| `ls`, `cd`, `ps` | `find_large`, `visual_tree` |

---

## 4.3 Integration with Other Systems

### LM Studio Integration

```geometry
# lm_studio.gs - LLM integration

# Configure connection
lm_configure({
    "url": "http://localhost:1234/v1",
    "model": "local-model"
})

# Simple completion
response = lm_complete("What is 2 + 2?")
print(response)  # "4"

# Chat completion
messages = [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "Explain glyphs."}
]
response = lm_chat(messages)
print(response)

# Streaming completion
lm_stream("Tell me a story", fn(chunk) {
    print(chunk, newline=false)
})
```

### Evolution Daemon Integration

```geometry
# evolution.gs - Evolution system integration

# Connect to evolution daemon
evo_connect()

# Start evolution
evo_start({
    "target": "my_function.py",
    "generations": 100,
    "population": 20,
    "mutation_rate": 0.1
})

# Monitor progress
while (evo_running()) {
    status = evo_status()
    print("Generation: " + status.generation + "/" + status.total)
    print("Best fitness: " + status.best_fitness)
    sleep(1)
}

# Get results
result = evo_result()
print("Best solution: " + result.best_solution)
print("Final fitness: " + result.best_fitness)

# Visualize evolution
visual_evolution(result.history)
```

### Visual Shell Integration

```geometry
# visual_integration.gs - Visual shell features

# Create visualization
visual_create("my_viz", {
    "type": "heatmap",
    "data": memory_region(0x1000, 256),
    "colors": ["blue", "green", "yellow", "red"]
})

# Update visualization
visual_update("my_viz", {
    "data": memory_region(0x1000, 256)
})

# Create dashboard
dashboard_create("system_monitor", {
    "widgets": [
        {"type": "gauge", "source": "cpu_percent"},
        {"type": "graph", "source": "memory_history"},
        {"type": "table", "source": "process_list"}
    ]
})

# Export visualization
visual_export("my_viz", "heatmap.png")
```

### External API Integration

```geometry
# api.gs - External API integration

# HTTP requests
response = http_get("https://api.example.com/data")
data = parse_json(response.body)
print(data)

response = http_post("https://api.example.com/submit", {
    "name": "Geometry OS",
    "version": "4.0"
})

# WebSocket connection
ws = websocket_connect("wss://stream.example.com")
ws.on_message(fn(msg) {
    data = parse_json(msg)
    process_data(data)
})
ws.send({"subscribe": "updates"})

# File watching
watch_directory("~/geometry_os", fn(event) {
    if (event.type == "modified") {
        print("File changed: " + event.path)
        reload_config()
    }
})
```

---

## 4.4 Performance Optimization

### Profiling

```bash
# Profile a script
>>> profile run my_script.gs
Profiling my_script.gs...
Execution time: 1.234s

Function        Calls   Time    %Total
main            1       1.2s    97.4%
helper          100     0.02s   1.6%
init            1       0.01s   0.8%

# Visual profiling
>>> profile visual on
>>> run my_script.gs
[Visual: Execution flow with timing highlighted]
>>> profile visual off
```

### Optimization Techniques

```geometry
# optimization.gs - Performance tips

# BAD: Multiple memory accesses
↻ 1000 with i {
    value = ← 0x1000      # Memory read every iteration
    result = value ⊕ i
    result → 0x2000 ⊕ i   # Memory write every iteration
}

# GOOD: Cache value, batch writes
value = ← 0x1000          # Read once
results = []
↻ 1000 with i {
    results.append(value ⊕ i)
}
results → 0x2000          # Write once

# BAD: String concatenation in loop
output = ""
↻ 1000 with i {
    output = output + "Item " + i + "\n"  # Creates new string each time
}

# GOOD: Use array and join
lines = []
↻ 1000 with i {
    lines.append("Item " + i)
}
output = join(lines, "\n")

# GOOD: Use string builder
builder = StringBuilder()
↻ 1000 with i {
    builder.append("Item " + i + "\n")
}
output = builder.to_string()
```

### GPU Acceleration

```geometry
# gpu.gs - GPU acceleration

# Run computation on GPU
result = gpu_compute({
    "shader": "compute.wgsl",
    "input": data,
    "workgroups": [64, 64, 1]
})

# Parallel processing
items = [1, 2, 3, ..., 1000]
results = gpu_map(items, fn(x) {
    return x ⊗ x  # Square each item in parallel
})

# Visual processing
image = load_image("input.png")
processed = gpu_filter(image, {
    "kernel": "blur",
    "radius": 5
})
save_image("output.png", processed)
```

### Memory Optimization

```geometry
# memory_opt.gs - Memory optimization

# Use memory pools for frequent allocations
pool = MemoryPool(1024 * 1024)  # 1MB pool

fn process_data(data) {
    # Allocate from pool instead of heap
    buffer = pool.alloc(length(data))
    # ... process data ...
    pool.free(buffer)  # Return to pool
}

# Use memory views for large data
large_data = memory_map("large_file.bin")
# Process without copying
foreach chunk in large_data.chunks(4096) {
    process_chunk(chunk)
}
memory_unmap(large_data)

# Garbage collection hints
gc_hint("low_latency")  # Prefer responsiveness
gc_hint("low_memory")   # Prefer memory efficiency
```

---

## 4.5 Practical Exercises

### Exercise 4.5.1: Automated Backup Script

Create a script that backs up important files:

```geometry
# backup.gs - Automated backup

fn backup(source, dest) {
    timestamp = format_time(now(), "%Y%m%d_%H%M%S")
    backup_dir = dest + "/" + timestamp
    
    print("Creating backup: " + backup_dir)
    mkdir(backup_dir)
    
    files = find_files(source)
    foreach file in files {
        if (ends_with(file, ".py") || ends_with(file, ".gs")) {
            copy(file, backup_dir + "/" + basename(file))
            print("  Backed up: " + file)
        }
    }
    
    # Compress
    compress(backup_dir, backup_dir + ".tar.gz")
    remove_dir(backup_dir)
    
    print("Backup complete: " + backup_dir + ".tar.gz")
}

# Run backup
backup("~/geometry_os/systems", "~/backups")
```

### Exercise 4.5.2: System Monitor Dashboard

Create a real-time system monitor:

```geometry
# monitor.gs - System dashboard

fn create_dashboard() {
    dashboard = dashboard_create("system_monitor")
    
    # CPU gauge
    dashboard.add_widget({
        "id": "cpu",
        "type": "gauge",
        "position": [0, 0],
        "size": [200, 150],
        "source": fn() { return cpu_percent() },
        "refresh": 1000
    })
    
    # Memory graph
    dashboard.add_widget({
        "id": "memory",
        "type": "line_graph",
        "position": [210, 0],
        "size": [300, 150],
        "source": fn() { return memory_percent() },
        "refresh": 1000,
        "history": 60
    })
    
    # Process table
    dashboard.add_widget({
        "id": "processes",
        "type": "table",
        "position": [0, 160],
        "size": [510, 200],
        "source": fn() { return ps_all() },
        "refresh": 2000
    })
    
    return dashboard
}

# Run dashboard
dash = create_dashboard()
dash.show()
```

### Exercise 4.5.3: LLM-Powered Assistant

Create an AI assistant using LM Studio:

```geometry
# assistant.gs - AI assistant

fn chat_loop() {
    history = []
    
    print("AI Assistant (type 'exit' to quit)")
    print("=====================================")
    
    while (true) {
        # Get user input
        input = prompt("You: ")
        if (input == "exit") {
            break
        }
        
        # Add to history
        history.append({"role": "user", "content": input})
        
        # Get response
        print("AI: ", newline=false)
        response = ""
        lm_stream(input, history, fn(chunk) {
            print(chunk, newline=false)
            response = response + chunk
        })
        print("")
        
        # Add response to history
        history.append({"role": "assistant", "content": response})
    }
    
    print("Goodbye!")
}

# Start assistant
chat_loop()
```

---

## 4.6 Module Summary

### What You Learned

- ✅ Scripting with Geometry Script
- ✅ Creating custom commands and aliases
- ✅ Integrating with external systems
- ✅ Performance optimization techniques

### Key Takeaways

1. **Scripts**: Use .gs files for automation
2. **Commands**: Create custom commands in ~/.glyph_shell/commands/
3. **Integration**: Connect to LM Studio, Evolution Daemon, Visual Shell
4. **Optimization**: Profile, cache, use GPU, manage memory

### Best Practices

| Area | Best Practice |
|------|---------------|
| Scripts | Modular functions, clear comments |
| Commands | Validate input, provide help |
| Integration | Handle errors, use timeouts |
| Performance | Profile first, optimize hotspots |

### Next Steps

Proceed to [Module 5: Customization](module_05_customization.md) to learn:
- Environment configuration
- Custom themes
- Keyboard shortcuts
- Workflow optimization

---

## Self-Assessment

Before moving on, verify you can:

- [ ] Write and run a Geometry Script
- [ ] Create custom aliases and commands
- [ ] Integrate with at least one external system
- [ ] Profile and optimize a script
- [ ] Use GPU acceleration

### Quick Quiz

1. What extension do Geometry Script files use?
2. How do you create a permanent alias?
3. What function streams LLM output?
4. How do you profile a script?

<details>
<summary>Answers</summary>

1. `.gs`
2. `alias <name> <command>` then `alias save`
3. `lm_stream()`
4. `profile run <script>`

</details>

---

*[Continue to Module 5: Customization →](module_05_customization.md)*
