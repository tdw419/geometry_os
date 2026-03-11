# Exercise 5: Integration

> **Module**: Module 4-5 - Advanced Features & Customization
> **Duration**: 25 minutes
> **Difficulty**: Advanced

---

## Objectives

By completing this exercise, you will:
- Integrate with LM Studio
- Create custom commands
- Build a complete workflow
- Configure your environment

---

## Prerequisites

- Completed Exercises 1-4
- LM Studio (optional, for AI features)
- Shell running

---

## Part 1: LM Studio Integration

### Task 1.1: Configure Connection

```bash
# Check if LM Studio is configured
>>> config get lm_studio.url

# Set URL if needed
>>> config set lm_studio.url http://localhost:1234/v1
```

### Task 1.2: Test Connection

```bash
>>> lm_test
```

**Result:** _____________

### Task 1.3: Simple Completion

```bash
>>> lm complete "What is 2 + 2?"
```

**Response:** _____________

### Task 1.4: Create AI Helper Script

Create `ai_helper.gs`:

```geometry
# ai_helper.gs - AI-powered helper

fn explain(code) {
    prompt = "Explain this code: " + code
    response = lm_complete(prompt)
    return response
}

fn suggest(problem) {
    prompt = "Suggest a solution for: " + problem
    response = lm_complete(prompt)
    return response
}

# Interactive mode
print("AI Helper - Type 'exit' to quit")
while (true) {
    input = prompt("Ask: ")
    if (input == "exit") {
        break
    }
    
    response = lm_complete(input)
    print("AI: " + response)
}
```

---

## Part 2: Custom Commands

### Task 2.1: Create a Custom Command

Create `~/.glyph_shell/commands/weather.gs`:

```geometry
# weather.gs - Weather command

fn main(args) {
    if (length(args) < 1) {
        print("Usage: weather <city>")
        return 1
    }
    
    city = args[0]
    
    # Simulated weather (would connect to API in real use)
    print("Weather for " + city + ":")
    print("  Temperature: 72°F")
    print("  Conditions: Sunny")
    print("  Humidity: 45%")
    
    return 0
}
```

Test it:

```bash
>>> weather London
>>> weather --help
```

### Task 2.2: Create a System Info Command

Create `~/.glyph_shell/commands/sysinfo.gs`:

```geometry
# sysinfo.gs - System information

fn main(args) {
    print("=== System Information ===")
    print("")
    
    # CPU
    cpu_info = cpu()
    print("CPU:")
    print("  Cores: " + cpu_info.cores)
    print("  Usage: " + cpu_info.usage + "%")
    print("")
    
    # Memory
    mem_info = memory()
    print("Memory:")
    print("  Total: " + mem_info.total)
    print("  Used: " + mem_info.used)
    print("  Free: " + mem_info.free)
    print("")
    
    # Processes
    processes = ps_all()
    print("Processes: " + length(processes) + " running")
    
    return 0
}
```

---

## Part 3: Aliases and Shortcuts

### Task 3.1: Create Useful Aliases

```bash
>>> alias ck "config get"
>>> alias cs "config set"
>>> alias psa "ps -a"
>>> alias m "memory"
>>> alias t "top"
>>> alias save "alias save"
```

### Task 3.2: Save Aliases

```bash
>>> alias save
```

### Task 3.3: Create Keyboard Shortcuts

```bash
>>> keys bind "F1" "help"
>>> keys bind "F5" "clear"
>>> keys bind "Ctrl+Shift+S" "sysinfo"
>>> keys save
```

Test each shortcut.

---

## Part 4: Workflow Automation

### Task 4.1: Create a Development Workflow

Create `~/.glyph_shell/workflows/dev.yaml`:

```yaml
name: development
description: Development workflow

steps:
  - name: Clear environment
    command: clear
    
  - name: Check system
    command: sysinfo
    
  - name: Start services
    commands:
      - run monitor.gs &
      - visual on
      
  - name: Load workspace
    command: workspace load dev
    
  - name: Ready
    command: print "Development environment ready!"
```

Run the workflow:

```bash
>>> workflow run dev
```

### Task 4.2: Create a Monitoring Script

Create `monitor.gs`:

```geometry
# monitor.gs - System monitor

fn monitor_loop(interval = 5) {
    print("Starting system monitor (Ctrl+C to stop)")
    print("")
    
    while (true) {
        # Clear line
        clear_line()
        
        # Get stats
        cpu_pct = cpu_percent()
        mem_pct = memory_percent()
        procs = length(ps_all())
        
        # Display
        print("[Monitor] CPU: " + cpu_pct + "% | MEM: " + mem_pct + "% | Procs: " + procs)
        
        # Alert if high
        if (cpu_pct > 80) {
            print(" WARNING: High CPU!")
        }
        if (mem_pct > 80) {
            print(" WARNING: High Memory!")
        }
        
        sleep(interval)
    }
}

monitor_loop(2)
```

---

## Part 5: Theme Customization

### Task 5.1: Create a Custom Theme

Create `~/.glyph_shell/themes/my_theme.yaml`:

```yaml
# my_theme.yaml - Custom theme

colors:
  background: "#0d1117"
  foreground: "#c9d1d9"
  primary: "#58a6ff"
  secondary: "#8b949e"
  accent: "#f78166"
  
  success: "#3fb950"
  warning: "#d29922"
  error: "#f85149"
  info: "#58a6ff"

fonts:
  main: "JetBrains Mono"
  size: 14

effects:
  glow: true
  glow_intensity: 0.3
  transitions: true
  transition_duration: 150
```

Apply the theme:

```bash
>>> theme apply my_theme
```

### Task 5.2: Customize Prompt

```bash
>>> config set shell.prompt "[\t] \w $ "
```

**Test:** What does your prompt look like now? _____________

---

## Part 6: Complete Integration

### Task 6.1: Build an Integrated Dashboard

Create `dashboard.gs`:

```geometry
# dashboard.gs - Integrated dashboard

fn create_dashboard() {
    print("╔════════════════════════════════════════════════════╗")
    print("║        Geometry OS Dashboard                       ║")
    print("╠════════════════════════════════════════════════════╣")
    print("║                                                    ║")
    
    # System stats
    cpu = cpu_percent()
    mem = memory_percent()
    
    print("║  System Status                                     ║")
    print("║  ─────────────────────────────────────────────     ║")
    print("║  CPU:  [" + bar(cpu, 20) + "] " + cpu + "%     ║")
    print("║  MEM:  [" + bar(mem, 20) + "] " + mem + "%     ║")
    print("║                                                    ║")
    
    # Processes
    procs = ps_all()
    running = count(procs, fn(p) { return p.state == "RUNNING" })
    waiting = count(procs, fn(p) { return p.state == "WAITING" })
    
    print("║  Processes: " + length(procs) + " total                 ║")
    print("║    Running: " + running + "                              ║")
    print("║    Waiting: " + waiting + "                              ║")
    print("║                                                    ║")
    
    # Network
    print("║  Network: Connected ✓                              ║")
    print("║                                                    ║")
    print("╚════════════════════════════════════════════════════╝")
}

fn bar(percent, width) {
    filled = round(percent / 100 * width)
    empty = width - filled
    return repeat("█", filled) + repeat("░", empty)
}

# Run dashboard
create_dashboard()
```

---

## Completion Checklist

- [ ] Configured LM Studio connection
- [ ] Created custom commands
- [ ] Set up aliases and shortcuts
- [ ] Created a workflow automation
- [ ] Customized theme and prompt
- [ ] Built an integrated dashboard

---

## Final Challenge

### Build a Complete Development Environment

Create a setup that includes:

1. **Custom theme** with your preferred colors
2. **Aliases** for all common tasks
3. **Keyboard shortcuts** for efficiency
4. **Custom commands** for your workflow
5. **Startup script** that initializes everything
6. **Dashboard** for monitoring

Save as a workspace:

```bash
>>> workspace save "my_environment"
```

---

## Training Complete!

Congratulations! You've completed all exercises.

### Next Steps

1. **Take the Assessment**: [Practical Exam](../assessments/practical_exam.md)
2. **Provide Feedback**: Run the feedback survey
3. **Start Using**: Apply your skills to real projects

```bash
# Run feedback survey
python3 docs/training/resources/feedback_survey.py

# Generate completion certificate
>>> training certificate generate
```

---

*Exercise 5.0*
*Training Program Complete!*
