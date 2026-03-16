# Writing to Skills and MCP Tools Guide

This document provides guidance on how to extend and modify the skills and MCP tools in the Geometry OS system.

## Overview

Geometry OS uses two primary mechanisms for extending functionality:
1. **Skills** - Domain-specific instruction sets that teach AI agents how to use specific tools or frameworks
2. **MCP Tools** - Individual functions exposed via the Model Context Protocol server

## 1. Writing Skills

Skills are markdown files that teach AI agents how to use specific tools or systems. They follow a standard format.

### Skill File Structure

```markdown
---
name: skill-name
description: Brief description of what the skill does
---

# Skill Title

## Introduction
Explain what this skill enables the agent to do.

## Core Concepts
Explain the key concepts the agent needs to understand.

## Workflow
Step-by-step instructions for common tasks:
1. First step
2. Second step
3. etc.

## Examples
Provide concrete examples of how to use the tools.

## Reference
List of important commands, functions, or APIs.

## Best Practices
Tips and recommendations for effective use.
```

### Location
Skills are stored in:
- `/home/jericho/zion/projects/geometry_os/geometry_os/skills/` - Core skills
- `/home/jericho/zion/projects/geometry_os/geometry_os/apps/mcp2cli/skills/` - MCP2Cli specific skills

### Example: Adding a New Skill

To create a skill for a new MCP server endpoint:

1. Create the skill file:
   ```bash
   touch /home/jericho/zion/projects/geometry_os/geometry_os/skills/new-skill/SKILL.md
   ```

2. Fill in the template with information about how to use the endpoint.

3. The skill should teach agents to use mcp2cli to interact with the service:
   ```markdown
   ---
   name: new-skill
   description: Guidance for using the New Service API via mcp2cli
   ---

   # New Service API Skill

   ## Core Workflow
   1. **Connect**: `mcp2cli --mcp https://newservice.example.com/sse --list`
   2. **Discover**: `mcp2cli --mcp https://newservice.example.com/sse <endpoint> --help`
   3. **Execute**: `mcp2cli --mcp https://newservice.example.com/sse <endpoint> --param value`
   ```

## 2. Writing MCP Tools

MCP tools are individual functions exposed via the geos_mcp_server.py file. They follow a standard pattern.

### MCP Tool Structure

Each tool consists of:
1. Tool definition in the `list_tools()` function
2. Implementation function named `tool_<toolname>()`
3. Proper error handling and response formatting

### Location
The main MCP server implementation is at:
`/home/jericho/zion/projects/geometry_os/geometry_os/apps/mcp2cli/src/geos_mcp_server.py`

### Example: Adding a New MCP Tool

To add a new tool called "hello_world":

1. Add the tool definition to `list_tools()`:
   ```python
   Tool(name="hello_world", description="Say hello", inputSchema={"type": "object", "properties": {"name": {"type": "string"}}, "required": ["name"]}),
   ```

2. Implement the function:
   ```python
   async def tool_hello_world(args: dict) -> list[TextContent]:
       """Say hello to someone."""
       name = args.get("name", "World")
       return [
           TextContent(
               type="text",
               text=json.dumps({
                   "status": "success",
                   "message": f"Hello, {name}!",
               }),
               indent=2,
           )
       ]
   ```

3. Add the handler to the `call_tool()` function:
   ```python
   elif name == "hello_world": return await tool_hello_world(arguments)
   ```

### Tool Implementation Guidelines

1. **Input Validation**: Always validate input parameters
2. **Error Handling**: Catch exceptions and return proper error responses
3. **Consistent Format**: Use the standard JSON response format with status and action fields
4. **Logging**: Print useful information for debugging
5. **Timeouts**: Set appropriate timeouts for external calls
6. **Documentation**: Include clear docstrings

### Common Patterns

#### Accessing GPU Memory
```python
# Store data
async def tool_mem_store(args: dict) -> list[TextContent]:
    # Implementation uses _ensure_index_loaded() and requests.post()
    pass

# Retrieve data
async def tool_mem_retrieve(args: dict) -> list[TextContent]:
    # Implementation uses _ensure_index_loaded() and requests.get()
    pass
```

#### Making Daemon Requests
```python
# Use the built-in helper functions
resp = requests.post(f"{DAEMON_URL}/write?addr=0x{addr:08x}", data=hex_words, timeout=2)
```

#### Handling Connections
```python
try:
    resp = requests.get(url, timeout=2)
    if resp.status_code != 200:
        return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]
    # Process response
except requests.exceptions.ConnectionError:
    return [TextContent(type="text", text=f"Error: Cannot connect to Ouroboros daemon at {DAEMON_URL}")]
except Exception as e:
    return [TextContent(type="text", text=f"Error: {str(e)}")]
```

#### Using Hilbert Functions
```python
from geos_mcp_server import hilbert_d2xy, hilbert_xy2d

# Convert address to Hilbert coordinates
x, y = hilbert_d2xy(4096, addr)

# Convert coordinates to address
addr = hilbert_xy2d(4096, x, y)
```

## 3. Best Practices

### For Skills
- Keep skills focused on a specific domain or tool
- Include concrete examples agents can try immediately
- Reference related skills when appropriate
- Update skills when the underlying tools change
- Use clear, actionable language

### For MCP Tools
- Follow the existing code patterns in geos_mcp_server.py
- Handle errors gracefully and informatively
- Keep tools focused on a single responsibility
- Use descriptive names and parameter labels
- Add tools to the appropriate sections (memory, agent, GPU, etc.)
- Update the memory map documentation when adding persistent storage tools

## 4. Testing Changes

### Testing Skills
Skills are tested by having AI agents use them. To test:
1. Reload the skill in your AI agent interface
2. Try the examples provided in the skill
3. Verify the agent can successfully use the related tools

### Testing MCP Tools
1. Start the Ouroboros daemon: `cargo run --release --bin gpu_dev_daemon`
2. Start the MCP server: `python apps/mcp2cli/src/geos_mcp_server.py`
3. Test the tool directly:
   ```bash
   # Via MCP
   mcp2cli --mcp http://127.0.0.1:8769 <toolname> --help
   
   # Direct HTTP test (for simple tools)
   curl -X POST "http://127.0.0.1:8769/hello_world" -d '{"name": "World"}'
   ```

## 5. Related Files

- `/home/jericho/zion/projects/geometry_os/geometry_os/apps/mcp2cli/src/geos_mcp_server.py` - Main MCP server implementation
- `/home/jericho/zion/projects/geometry_os/geometry_os/skills/` - Core skills directory
- `/home/jericho/zion/projects/geometry_os/geometry_os/apps/mcp2cli/skills/` - MCP2Cli skills directory
- `/home/jericho/zion/projects/geometry_os/geometry_os/memory.md` - Session context tracking
- `/home/jericho/zion/projects/geometry_os/geometry_os/MEMORY_MAP.md` - GPU memory layout

## 6. Getting Started

To add a new feature to Geometry OS:

1. **Decide**: Should this be a skill, an MCP tool, or both?
2. **Plan**: What specific functionality should it provide?
3. **Implement**: Follow the patterns in this guide
4. **Document**: Update relevant documentation files
5. **Test**: Verify it works as expected
6. **Share**: Let others know about the new capability

Remember: Skills teach agents *how to use* tools, while MCP tools *are* the usable functions. Often you'll want both - a MCP tool that provides the functionality, and a skill that teaches agents how to use it effectively.