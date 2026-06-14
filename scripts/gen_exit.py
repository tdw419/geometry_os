#!/usr/bin/env python3
"""Generate 20 exit examples via direct Ollama HTTP API."""
import subprocess, json, requests
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

system_prompt = """You are an expert in RISC-V XV6 exit syscall semantics and Memory Palace spatial operations.
The exit syscall finalizes process termination by freeing memory, closing resources, and updating process structures.

IMPORTANT: Provide diverse spatial_ops for different exit scenarios:
- Success paths: free_user_memory, free_process_struct, free_file_table
- Error paths: free_user_memory, free_process_struct
- Edge cases: free_all_pixel_buffers, free_temporal_hilbert_segments

Generate diverse exit syscall traces with varied patterns:
- Different exit codes (0 for success, 1-255 for errors)
- Different resource states (open files, allocated buffers)
- Different return paths (normal, error, signal)

Return ONLY valid JSON. No explanation."""

user_prompt = """Generate 20 synthetic exit syscall traces for XV6 RISC-V.

Return ONLY valid JSON in this format:
{
  "trace_name": "synthetic_exit_diverse",
  "syscalls": [
    {
      "syscall": {"name": "exit", "number": 93},
      "arguments": {"a0": <exit_code>, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
      "return_value": 0,
      "semantics": {"spatial_ops": ["op1", "op2"]}
    }
  ]
}

Pure JSON only. No explanation."""

print("Calling Ollama API...")
response = requests.post(
    "http://localhost:11434/api/generate",
    json={
        "model": "qwen2.5-coder:14b",
        "system": system_prompt,
        "prompt": user_prompt,
        "stream": False,
        "options": {"num_predict": 5000}
    },
    timeout=300
)

if response.status_code != 200:
    print(f"ERROR: Ollama API failed: {response.status_code}")
    print(response.text)
    exit(1)

response_text = response.json()["response"].strip()

# Strip markdown code blocks if present
if response_text.startswith("```"):
    response_text = response_text.split("```")[1]
    if response_text.startswith("json"):
        response_text = response_text[4:].strip()

try:
    data = json.loads(response_text)
    # Merge with existing
    existing_file = SYNTHETIC_DIR / "synthetic_exit.json"
    existing_data = {"syscalls": []}
    if existing_file.exists():
        existing_data = json.loads(existing_file.read_text())
    existing_data["syscalls"].extend(data.get("syscalls", []))
    existing_file.write_text(json.dumps(existing_data, indent=2))
    total = len(existing_data["syscalls"])
    added = len(data.get("syscalls", []))
    print(f"✓ Added {added} exit examples (total: {total})")
except json.JSONDecodeError as e:
    print(f"ERROR: JSON parse error: {e}")
    print(f"Raw response (first 500 chars): {response_text[:500]}")
    exit(1)