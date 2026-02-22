# AI Project Management System - Quick Reference

> **Cheat Sheet** - Common commands and workflows
> **Last Updated**: 2026-02-14

---

## 🚀 Quick Start Commands

```bash
# Navigate to project
cd /home/jericho/zion/projects/geometry_os/geometry_os/ai_project_management

# Activate virtual environment
source .venv/bin/activate

# Execute pending tasks (non-interactive)
python3 geometry_execute_auto.py

# Execute pending tasks (interactive)
python3 geometry_execute.py

# Start MCP server for Claude
ai-pm server

# Run tests
pytest tests/ -v

# Check system status
python3 -c "from src.ai_project_management.geometry_executor import GeometryOSTaskExecutor; print('OK')"
```

---

## 🧪 Test Commands

```bash
# Open test pages in Chrome
open systems/visual_shell/web/test_builder_tools.html
open systems/visual_shell/web/test_webmcp_bridge.html
open systems/visual_shell/web/test_a2a_tools.html
open systems/visual_shell/web/test_devtools_mcp.html

# Run Python tests
pytest tests/ -v --tb=short

# Run specific test
pytest tests/test_geometry_executor.py -v

# Run with coverage
pytest --cov=src/ai_project_management
```

---

## 📊 Status Checks

```bash
# Check pending TODO tasks
ls -la .todo_tasks/

# Check roadmap status
cat UNIFIED_ROADMAP_2026.md | grep -A 5 "## Phase"

# Check WebMCP bridge status
# (Open test_builder_tools.html in Chrome)

# Check git status
git status
git log --oneline -10
```

---

## 🔧 Common Workflows

### Workflow 1: Execute Roadmap Tasks

```bash
# 1. Activate environment
cd ai_project_management && source .venv/bin/activate

# 2. Run executor
python3 geometry_execute_auto.py

# 3. Review results
# (Check output for task completion status)

# 4. Commit changes (if any)
git add .
git commit -m "Completed roadmap tasks"
```

### Workflow 2: Test WebMCP Integration

```bash
# 1. Start local server (if needed)
cd systems/visual_shell/web
python3 -m http.server 8000

# 2. Open test page in Chrome 146+
# chrome://flags/#model-context-protocol (enable WebMCP)

# 3. Navigate to test page
open http://localhost:8000/test_builder_tools.html

# 4. Run all tests
# Click "Run All Tests" button

# 5. Review results
# Check test summary at bottom of page
```

### Workflow 3: Debug Task Execution

```bash
# 1. Check execution history
ls -la .ai-pm-execution-history/

# 2. Check state file
cat .ai-pm-state.json

# 3. Check logs
# (Logs are in structlog format, check console output)

# 4. Run specific task manually
python3 -c "
import asyncio
from pathlib import Path
from src.ai_project_management.geometry_executor import GeometryOSTaskExecutor
from src.ai_project_management.models import TaskItem, TaskStatus

async def test():
    executor = GeometryOSTaskExecutor(Path.cwd())
    task = TaskItem(
        id='test-1',
        title='Test task',
        description='Test description',
        status=TaskStatus.PENDING
    )
    result = await executor.execute_task(task)
    print(f'Result: {result}')

asyncio.run(test())
"
```

### Workflow 4: Update Roadmap

```bash
# 1. Edit roadmap file
vim UNIFIED_ROADMAP_2026.md

# 2. Validate markdown
# (Check for proper formatting)

# 3. Test parsing
python3 -c "
from src.ai_project_management.roadmap import parse_roadmap_file
roadmap = parse_roadmap_file('UNIFIED_ROADMAP_2026.md')
print(f'Phases: {len(roadmap.phases)}')
print(f'Features: {sum(len(p.features) for p in roadmap.phases)}')
"

# 4. Commit changes
git add UNIFIED_ROADMAP_2026.md
git commit -m "Update roadmap"
```

---

## 📝 Task Patterns

### Commit Tasks
```
Title: "Commit X changes"
Description: "Files: path/to/file1, path/to/file2"
```

### Implementation Tasks
```
Title: "Implement ClassName class"
Description: "Create new class with execute method"
```

### Test Tasks
```
Title: "Test feature_name functionality"
Description: "Run pytest with keyword 'feature_name'"
```

### Fix Tasks
```
Title: "Fix import error for module_name"
Description: "Error: Module 'module_name' not found"
```

---

## 🎯 WebMCP Tool Examples

### Place Tile
```javascript
// Via WebMCP
await navigator.modelContext.callTool('builder_place_tile', {
  tile_type: 'system',
  x: 5,
  y: 5,
  size: 100,
  metadata: { label: 'CPU' }
});
```

### Load Shader
```javascript
// Via WebMCP
await navigator.modelContext.callTool('builder_load_shader', {
  name: 'test_shader',
  wgsl_code: '@compute @workgroup_size(64) fn main() { }'
});
```

### Get OS State
```javascript
// Via WebMCP
const state = await navigator.modelContext.callTool('get_os_state', {
  include_tiles: true,
  include_shaders: true
});
```

---

## 🔍 Debugging Tips

### Issue: WebMCP API Not Available
```bash
# Check Chrome version
google-chrome --version

# Enable WebMCP flag
# chrome://flags/#model-context-protocol

# Restart Chrome
```

### Issue: Bridge Not Loaded
```html
<!-- Check if script is loaded -->
<script>
  if (typeof window.webmcpBridge === 'undefined') {
    console.error('WebMCP Bridge not loaded');
  }
</script>
```

### Issue: Task Execution Fails
```bash
# Check task format
cat .todo_tasks/task_name.md

# Verify file paths exist
ls -la path/to/file

# Check git status
git status
```

---

## 📈 Performance Monitoring

```bash
# Check execution time
time python3 geometry_execute_auto.py

# Monitor memory usage
python3 -c "
import psutil
import os
process = psutil.Process(os.getpid())
print(f'Memory: {process.memory_info().rss / 1024 / 1024:.1f} MB')
"

# Check tool latency
# (Open test_builder_tools.html and check tool timings)
```

---

## 🎨 BuilderPanel Quick Reference

### Tile Types
- `empty` - Clear tile
- `system` - System component
- `data` - Data storage
- `code` - Code module
- `cartridge` - PixelRTS cartridge
- `nursery` - Development area

### BuilderPanel Methods
```javascript
// Place tile
window.builderPanel.placeTile('system', 5, 5);

// Load shader
window.builderPanel.loadShader('test', wgsl_code);

// Get state
const state = window.builderPanel.getState();

// Preview
const preview = window.builderPanel.preview();

// Undo
window.builderPanel.undo();

// Clear
window.builderPanel.clear();
```

---

## 📚 File Locations

```
ai_project_management/
├── geometry_execute.py          # Interactive executor
├── geometry_execute_auto.py      # Non-interactive executor
├── config.yaml                  # System configuration
├── UNIFIED_ROADMAP_2026.md      # Main roadmap
├── .todo_tasks/                 # Pending tasks
├── .ai-pm-state.json            # Execution state
├── .ai-pm-execution-history/    # Execution logs
└── .ai-pm-telemetry/            # Performance data

systems/visual_shell/web/
├── webmcp_bridge.js            # WebMCP tools (20 tools)
├── BuilderPanel.js              # Builder UI (777 lines)
├── BuilderPanel.css             # Builder styling
├── test_builder_tools.html      # Builder tests
├── test_webmcp_bridge.html      # Bridge tests
├── test_a2a_tools.html         # A2A tests
└── test_devtools_mcp.html      # DevTools tests
```

---

## 🏆 Success Indicators

✅ **System Operational**:
- All 20 WebMCP tools registered
- BuilderPanel UI renders correctly
- Task executor runs without errors
- Test pages pass all checks

✅ **Phase F Complete**:
- 6 builder tools implemented
- BuilderPanel UI functional
- Tile placement works
- Shader loading works
- Cartridge assembly works

✅ **Roadmap Progress**:
- 23 pending tasks identified
- 10 TODO files created
- 5 tasks executed per run
- Automatic commits working

---

## 🆘 Emergency Commands

```bash
# Reset execution state
rm .ai-pm-state.json

# Clear execution history
rm -rf .ai-pm-execution-history/*

# Clear TODO tasks
rm .todo_tasks/*

# Reset git (careful!)
git reset --hard HEAD

# Reinstall dependencies
pip install -e ".[dev,mcp]"

# Rebuild virtual environment
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
pip install -e ".[dev,mcp]"
```

---

## 📞 Getting Help

```bash
# Check documentation
cat README.md
cat EXECUTION_GUIDE_COMPLETE.md

# Check research docs
ls /home/jericho/zion/docs/research/

# Check logs
ls .ai-pm-execution-history/

# Run help
python3 geometry_execute_auto.py --help  # (if available)
ai-pm --help
```

---

*Quick Reference - AI Project Management System*
*Version: 2.0.0 | Last Updated: 2026-02-14*
