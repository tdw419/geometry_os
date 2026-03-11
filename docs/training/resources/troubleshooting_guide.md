# Troubleshooting Guide: Native Glyph Shell

> Solutions to common problems

---

## Quick Diagnosis

Run this command to diagnose common issues:

```bash
>>> diagnose all
Running diagnostics...
✓ Shell: OK
✓ Visual: OK
✓ Memory: OK (4.2GB free)
✗ GPU: Warning - Low memory
✓ Config: OK

Recommendations:
- GPU memory low, reduce visual quality
```

---

## Installation Issues

### Problem: Shell won't start

**Symptoms:**
- Command not found
- Import errors
- Missing dependencies

**Solutions:**

```bash
# Check Python version (need 3.10+)
python3 --version

# Reinstall dependencies
pip install -r requirements.txt

# Check path
which python3
# Should point to .venv

# Rebuild virtual environment
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Problem: Glyphs display as boxes or question marks

**Symptoms:**
- ⊕ ⊖ ⊗ show as □ or ?

**Solutions:**

```bash
# Check terminal UTF-8 support
echo $LANG
# Should include UTF-8

# Set UTF-8
export LANG=en_US.UTF-8

# Try different terminal
# Recommended: Alacritty, Kitty, iTerm2

# Install Nerd Font for best support
# See: https://www.nerdfonts.com/
```

### Problem: Visual mode not working

**Symptoms:**
- "Visual mode not available"
- Black screen
- No rendering

**Solutions:**

```bash
# Check GPU support
python3 -c "import wgpu; print(wgpu.__version__)"

# Check WebGPU adapter
>>> visual check
GPU: Available
Driver: Mesa 23.0
Memory: 4GB

# Try software rendering
>>> config set visual.renderer software

# Check permissions (Linux)
ls -la /dev/dri/
# Should have render access
```

---

## Performance Issues

### Problem: Slow performance

**Symptoms:**
- High latency
- Stuttering
- Slow commands

**Diagnosis:**

```bash
>>> profile start
# ... perform actions ...
>>> profile stop
Profile saved to profile.json

>>> profile analyze
Slowest operations:
1. visual render: 45ms (should be <16ms)
2. memory scan: 120ms
3. history search: 80ms
```

**Solutions:**

```bash
# Enable foveated rendering
>>> config set visual.foveated_rendering true

# Reduce visual quality
>>> config set visual.quality low

# Disable effects
>>> config set effects.glow false
>>> config set effects.transitions false

# Clear history
>>> history clear

# Check memory
>>> memory
# If high usage, restart shell
```

### Problem: High memory usage

**Symptoms:**
- Out of memory errors
- System slowdown

**Diagnosis:**

```bash
>>> memory detail
Process Memory:
  visual_shell: 512MB
  history: 128MB
  cache: 64MB

Memory Regions:
  KERNEL: 1GB (50% used)
  SHELL: 256MB (80% used)
  MEMORY: 8GB (10% used)
```

**Solutions:**

```bash
# Clear cache
>>> cache clear

# Reduce history size
>>> config set shell.history_size 1000

# Disable visual features temporarily
>>> visual off

# Kill unnecessary processes
>>> ps | grep -v essential
>>> kill <pid>
```

### Problem: GPU memory issues

**Symptoms:**
- "GPU out of memory"
- Visual artifacts
- Crashes

**Solutions:**

```bash
# Check GPU memory
>>> gpu memory
Total: 8GB
Used: 7.5GB
Free: 0.5GB

# Reduce texture size
>>> config set visual.texture_size 1024

# Disable GPU features
>>> config set visual.gpu_accelerated false

# Close other GPU applications
```

---

## Process Issues

### Problem: Process won't start

**Symptoms:**
- "Permission denied"
- "File not found"
- Immediate exit

**Diagnosis:**

```bash
>>> run ./my_program.spv --verbose
Loading ./my_program.spv...
Error: Invalid SPIR-V header
```

**Solutions:**

```bash
# Check file exists
>>> ls -la ./my_program.spv

# Check file type
>>> file ./my_program.spv
# Should show SPIR-V or binary

# Check permissions
>>> chmod +x ./my_program.spv

# Validate SPIR-V
>>> spirv-val ./my_program.spv
```

### Problem: Process won't die

**Symptoms:**
- kill command fails
- Process persists

**Solutions:**

```bash
# Try graceful kill first
>>> kill <pid>

# Force kill
>>> kill -9 <pid>

# Kill by name
>>> killall process_name

# Kill process group
>>> kill -9 -<pgid>

# Last resort: restart shell
```

### Problem: Zombie processes

**Symptoms:**
- Processes show as "defunct"
- Can't be killed

**Solutions:**

```bash
# Find parent
>>> ps -ef | grep <pid>
# PPID column shows parent

# Kill parent (if safe)
>>> kill <ppid>

# Or wait for parent to reap
# Zombies don't consume resources
```

---

## Configuration Issues

### Problem: Settings not saving

**Symptoms:**
- Changes lost on restart
- Config reset to defaults

**Solutions:**

```bash
# Check config file
>>> cat ~/.glyph_shell/config.yaml

# Check permissions
>>> ls -la ~/.glyph_shell/
# Should be writable

# Save explicitly
>>> config save

# Check for syntax errors
>>> config validate
✓ config.yaml: Valid
✗ theme.yaml: Syntax error on line 15
```

### Problem: Theme not applying

**Symptoms:**
- Colors don't change
- Theme command fails

**Solutions:**

```bash
# List themes
>>> theme list

# Check theme file
>>> cat ~/.glyph_shell/themes/my_theme.yaml

# Validate theme
>>> theme validate my_theme
Error: Invalid color at 'primary': #xyz

# Apply with verbose
>>> theme apply my_theme --verbose
Loading theme...
Error: Missing required field 'background'
```

### Problem: Keybindings not working

**Symptoms:**
- Shortcuts do nothing
- Wrong action

**Solutions:**

```bash
# List current bindings
>>> keys list

# Check for conflicts
>>> keys check "Ctrl+P"
Conflict: Ctrl+P bound to:
  - command_palette
  - print (in editor mode)

# Reset to defaults
>>> keys reset

# Re-bind
>>> keys bind "Ctrl+P" "command_palette"
```

---

## Integration Issues

### Problem: LM Studio not connecting

**Symptoms:**
- "Connection refused"
- Timeouts
- No AI features

**Solutions:**

```bash
# Check LM Studio is running
curl http://localhost:1234/v1/models

# Check URL in config
>>> config get lm_studio.url
http://localhost:1234/v1

# Update URL
>>> config set lm_studio.url http://localhost:1234/v1

# Test connection
>>> lm_test
Connecting to http://localhost:1234/v1...
✓ Connected
✓ Model available: local-model
```

### Problem: Evolution daemon errors

**Symptoms:**
- "Daemon not responding"
- Evolution failures

**Solutions:**

```bash
# Check daemon status
>>> evo status
Daemon: Running
PID: 12345
Uptime: 2 hours

# Restart daemon
>>> evo restart

# Check logs
>>> tail -f logs/evolution.log
```

---

## Error Messages

### Common Errors and Solutions

| Error | Cause | Solution |
|-------|-------|----------|
| `Type mismatch` | Wrong data type | Check types, convert if needed |
| `Address out of range` | Invalid memory address | Use valid address (0x0000-0xFFFF) |
| `Process not found` | PID doesn't exist | Check with `ps` |
| `Permission denied` | Insufficient permissions | Check file/process permissions |
| `Resource busy` | In use by another process | Stop conflicting process |
| `Stack overflow` | Recursion too deep | Increase stack or reduce recursion |
| `Timeout` | Operation took too long | Increase timeout or optimize |

---

## Recovery Procedures

### Shell Recovery

If the shell becomes unresponsive:

```bash
# From another terminal:
# 1. Find shell process
ps aux | grep glyph_shell

# 2. Kill gracefully
kill <pid>

# 3. If that fails
kill -9 <pid>

# 4. Start fresh
python3 systems/visual_shell/enhanced_glyph_shell.py
```

### Config Recovery

If configuration is corrupted:

```bash
# Backup current
cp -r ~/.glyph_shell ~/.glyph_shell.bak

# Reset to defaults
rm -rf ~/.glyph_shell
python3 systems/visual_shell/enhanced_glyph_shell.py --init

# Restore what you need from backup
```

### Visual Recovery

If visual mode is stuck:

```bash
# Disable visual
>>> visual off

# Reset visual settings
>>> config reset visual

# Re-enable
>>> visual on
```

---

## Getting Help

### Before Asking

1. Run diagnostics: `diagnose all`
2. Check this guide
3. Search GitHub issues
4. Check documentation

### When Asking

Include:
- Error message (full text)
- Steps to reproduce
- System info (`version --full`)
- What you've tried

### Resources

- **Docs**: [DOCUMENTATION_INDEX.md](../../DOCUMENTATION_INDEX.md)
- **Issues**: https://github.com/tdw419/geometry_os/issues
- **Community**: GitHub Discussions

---

*Troubleshooting Guide v1.0*
