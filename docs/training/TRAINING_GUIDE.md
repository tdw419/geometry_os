# Native Glyph Shell Training Guide

> Comprehensive guide for trainers and self-learners

---

## Introduction

This guide provides everything needed to deliver effective training on the Native Glyph Shell. It's designed for both instructors leading training sessions and individuals learning on their own.

### Purpose

The Native Glyph Shell is a revolutionary interface that combines traditional command-line operations with visual computing. This training program enables users to:

- Navigate the shell efficiently
- Use glyph-based commands
- Manage processes visually
- Automate tasks with scripts
- Customize their environment

### Target Audiences

| Audience | Focus | Duration |
|----------|-------|----------|
| New Users | All modules | 4 hours |
| Developers | Modules 1-4 | 3 hours |
| Admins | Modules 1, 3, 5 | 2 hours |
| Advanced Users | Modules 4-5 | 1.5 hours |

---

## Training Delivery

### Preparation Checklist

Before training:

- [ ] Geometry OS installed on all systems
- [ ] All dependencies resolved
- [ ] Demo files prepared
- [ ] Visual aids ready
- [ ] Feedback forms available
- [ ] Backup exercises ready

### Room Setup (Instructor-Led)

Recommended setup:
- Projector/display for demonstrations
- Individual workstations for hands-on
- Network connectivity for all systems
- Whiteboard for diagramming concepts

### Timing Guide

| Module | Lecture | Practice | Q&A | Total |
|--------|---------|----------|-----|-------|
| 1. Introduction | 10 min | 15 min | 5 min | 30 min |
| 2. Basic Operations | 15 min | 25 min | 5 min | 45 min |
| 3. Process Management | 15 min | 25 min | 5 min | 45 min |
| 4. Advanced Features | 20 min | 35 min | 5 min | 60 min |
| 5. Customization | 10 min | 15 min | 5 min | 30 min |
| Assessment | - | 25 min | 5 min | 30 min |
| **Total** | **70 min** | **140 min** | **30 min** | **4 hours** |

---

## Module Teaching Notes

### Module 1: Introduction

**Key Points:**
1. Visual computing philosophy - "the screen IS the hard drive"
2. Glyph symbols as operations
3. Hilbert memory layout
4. Interface components

**Common Questions:**
- Q: Why use glyphs instead of text?
- A: Glyphs are language-independent and visually distinctive

**Demo Ideas:**
- Show side-by-side: traditional terminal vs. Native Glyph Shell
- Demonstrate visual feedback from simple commands
- Show memory visualization

**Pitfalls:**
- Don't spend too long on theory - get hands-on quickly
- Ensure UTF-8 terminal support before starting

### Module 2: Basic Operations

**Key Points:**
1. Glyph syntax and combinations
2. Memory operations (store/load)
3. File operations with visual feedback
4. Output interpretation

**Common Questions:**
- Q: How do I type glyphs?
- A: Use autocomplete (Tab) or input methods

**Demo Ideas:**
- Live calculation with glyphs
- Store and retrieve values visually
- File visualization

**Pitfalls:**
- Some users struggle with glyph input - provide cheat sheet
- Color blindness may affect visual interpretation - provide alternatives

### Module 3: Process Management

**Key Points:**
1. Process lifecycle and states
2. Visual process monitoring
3. Resource management
4. IPC basics

**Common Questions:**
- Q: What if I kill the wrong process?
- A: Use process groups and confirmations

**Demo Ideas:**
- Start, monitor, and stop processes
- Visual process map
- Resource graphs

**Pitfalls:**
- Process management can feel abstract - use plenty of visuals
- Some users may accidentally kill critical processes - use safe mode

### Module 4: Advanced Features

**Key Points:**
1. Geometry Script basics
2. Custom commands
3. Integration with external systems
4. Performance optimization

**Common Questions:**
- Q: Is Geometry Script like Python?
- A: Similar syntax but designed for visual computing

**Demo Ideas:**
- Write and run a script
- Create a custom command
- Connect to LM Studio

**Pitfalls:**
- This module is dense - encourage questions
- Some integrations may not be available - have fallbacks

### Module 5: Customization

**Key Points:**
1. Configuration files
2. Themes
3. Keyboard shortcuts
4. Workflow optimization

**Common Questions:**
- Q: Will my changes persist?
- A: Yes, if saved with `config save` or `alias save`

**Demo Ideas:**
- Create a custom theme
- Set up personalized shortcuts
- Save and load a workspace

**Pitfalls:**
- Customization can be overwhelming - focus on essentials
- Provide templates for common configurations

---

## Exercise Solutions

### Exercise 1.4.1: Basic Interaction

```bash
>>> whoami
geometry_os_user

>>> help
[Shows command list]

>>> ls
docs/  systems/  tests/  config.yaml

>>> cd systems
>>> ls
visual_shell/  evolution_daemon/  hypervisor/

>>> cd ~
```

### Exercise 1.4.2: Using Glyphs

```bash
>>> glyph list
[Shows available glyphs]

>>> calc 5 ⊕ 3
8

>>> store 42 → 0x1000
Stored 42 at 0x1000

>>> load 0x1000
42
```

### Exercise 2.5.1: Calculator

```bash
>>> calc 15 ⊕ 27
42

>>> calc 100 ⊖ 37
63

>>> calc 12 ⊗ 8
96

>>> calc 144 ⊘ 12
12

>>> calc (10 ⊕ 5) ⊗ (20 ⊖ 8) ⊘ 3
60
```

### Exercise 2.5.2: Memory Game

```bash
>>> 35 → 0x1000
>>> 2026 → 0x1001
>>> calc ← 0x1001 ⊖ ← 0x1000
1991
>>> calc ← 0x1001 ⊖ ← 0x1000 → 0x1002
>>> ← 0x1000:3
[35, 2026, 1991]
```

### Exercise 3.5.1: Process Lifecycle

```bash
>>> run ./examples/compute_demo.spv &
Process 201 started

>>> ps | grep compute_demo
201   compute_demo       RUNNING  12.3%  2.1MB

>>> signal 201 SIGSTOP
Process 201 stopped

>>> ps | grep compute_demo
201   compute_demo       WAITING  0.0%   2.1MB

>>> signal 201 SIGCONT
Process 201 resumed

>>> kill 201
Process 201 terminated
```

### Exercise 4.5.1: Automated Backup Script

```geometry
# backup.gs
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
    
    compress(backup_dir, backup_dir + ".tar.gz")
    remove_dir(backup_dir)
    
    print("Backup complete: " + backup_dir + ".tar.gz")
}

backup("~/geometry_os/systems", "~/backups")
```

### Exercise 5.5.1: Personal Configuration

```bash
>>> config set shell.prompt "[$USER@geometry] $ "
>>> config set visual.default_zoom 1.5

>>> alias ck "config get"
>>> alias vs "visual on"
>>> alias psa "ps -a"

>>> alias save

>>> theme create
[Interactive theme creation]

>>> workspace save "my_setup"
```

---

## Assessment Rubric

### Practical Exam Grading

| Task | Points | Criteria |
|------|--------|----------|
| 1.1 Navigation | 2 | Correct directory, correct listing |
| 1.2 Visual Nav | 3 | All three operations (enable, goto, zoom) |
| 2.1 Arithmetic | 2 | Correct result with glyphs |
| 2.2 Memory | 3 | Store, load, sum all correct |
| 3.1 Process Start | 2 | Started and found PID |
| 3.2 Process Control | 3 | Monitor, limit, terminate |
| 4.1 Script | 3 | Script works, correct output |
| 4.2 Execution | 2 | Clean execution, correct exit code |
| 5.1 Files | 2 | All file operations complete |
| 5.2 Config | 3 | Config set, alias created, saved |
| 6.1 Debug | 3 | Issue identified and fixed |
| 6.2 Resource | 2 | Top process identified |

### Pass Criteria

- **Pass**: 24+ points (80%)
- **Partial**: 21-23 points (70-79%)
- **Fail**: <21 points (<70%)

---

## Troubleshooting Training Issues

### Common Training Problems

| Problem | Solution |
|---------|----------|
| Glyphs not displaying | Install Nerd Font, check UTF-8 |
| Visual mode not working | Check GPU support, use software fallback |
| Scripts failing | Check syntax, verify dependencies |
| Slow performance | Enable foveated rendering, reduce quality |

### Recovery Procedures

If training is disrupted:

1. **System Crash**: Restart shell, reload workspace
2. **Config Corruption**: Reset to defaults, reapply changes
3. **Network Issues**: Use offline exercises
4. **GPU Issues**: Switch to software rendering

---

## Feedback Collection

### During Training

Watch for:
- Confusion or frustration
- Questions asked repeatedly
- Exercises taking too long
- Technical issues

### After Training

Collect:
- Completed feedback surveys
- Assessment results
- Informal comments
- Follow-up questions

### Using Feedback

1. Identify common pain points
2. Update exercises for clarity
3. Adjust timing based on actual duration
4. Add content for frequently asked topics

---

## Resources for Trainers

### Presentation Materials

- Slide deck: `training/presentations/training_slides.pptx`
- Demo scripts: `training/demos/`
- Exercise templates: `training/exercises/templates/`

### Reference Materials

- Quick reference cards: `resources/quick_reference.md`
- Keyboard shortcuts: `resources/keyboard_shortcuts.md`
- Troubleshooting: `resources/troubleshooting_guide.md`

### Community Resources

- GitHub Issues: https://github.com/tdw419/geometry_os/issues
- Documentation: DOCUMENTATION_INDEX.md

---

## Appendix: Training Effectiveness Metrics

### Key Metrics

| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| Completion Rate | >85% | Post-assessment submissions |
| Knowledge Gain | >50% improvement | Pre/post score comparison |
| Confidence Increase | >2 points | Self-rated confidence |
| Satisfaction | >4.0/5.0 | Survey responses |
| Time to Proficiency | <4 hours | Self-reported learning time |
| Retention (30-day) | >80% | Follow-up assessment |

### Data Collection

```bash
# Record training metrics
>>> training metrics record --completion true
>>> training metrics record --pre-score <score>
>>> training metrics record --post-score <score>
>>> training metrics report
```

### Analysis

Metrics are analyzed to:
1. Identify module effectiveness
2. Find improvement opportunities
3. Track training quality over time
4. Personalize future training paths

---

*Training Guide v1.0*
*For Trainers and Self-Learners*
