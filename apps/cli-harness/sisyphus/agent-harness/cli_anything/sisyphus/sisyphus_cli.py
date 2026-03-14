#!/usr/bin/env python3
"""
Sisyphus Daemon CLI - Functional Implementation

Usage:
    g-sisyphus status              # Show sisyphus daemon and agent status
    g-sisyphus tasks               # List current tasks from Rust orchestrator
    g-sisyphus trigger             # Trigger an improvement cycle
    g-sisyphus start               # Start both Python daemon and Rust agent
    g-sisyphus stop                # Stop both Python daemon and Rust agent
"""

import json
import os
import signal
import subprocess
import sys
import time
from pathlib import Path

import click

# Find Geometry OS Root by looking for .git or Cargo.toml
def find_project_root():
    curr = Path(__file__).resolve().parent
    for _ in range(10):
        if (curr / ".git").exists() or (curr / "Cargo.toml").exists():
            return curr
        curr = curr.parent
    return Path(__file__).resolve().parent.parent.parent.parent.parent.parent.parent

GEO_OS_ROOT = find_project_root()
LOOP_DIR = GEO_OS_ROOT / ".loop"
PYTHON_DAEMON = GEO_OS_ROOT / "systems/sisyphus/daemon.py"
RUST_AGENT_DIR = GEO_OS_ROOT / "systems/sisyphus"

# State Files
CHECKPOINT_FILE = LOOP_DIR / "checkpoint.json"
TASKS_FILE = LOOP_DIR / "sisyphus_tasks.json"
DAEMON_PID_FILE = LOOP_DIR / "sisyphus_daemon.pid"
AGENT_PID_FILE = LOOP_DIR / "sisyphus_agent.pid"

@click.group()
@click.version_option(version="1.1.0")
@click.option("--json", "output_json", is_flag=True, help="Output in JSON format for AI agents")
@click.pass_context
def cli(ctx, output_json):
    """Geometry OS Sisyphus Orchestration CLI"""
    ctx.ensure_object(dict)
    ctx.obj["output_json"] = output_json
    
    # Ensure loop dir exists
    LOOP_DIR.mkdir(exist_ok=True)

def output_result(data):
    """Output data in JSON or plain text format"""
    if click.get_current_context().obj["output_json"]:
        click.echo(json.dumps(data, indent=2))
    else:
        if isinstance(data, dict):
            for key, value in data.items():
                if isinstance(value, dict):
                    click.echo(f"\n[{key.upper()}]")
                    for k, v in value.items():
                        click.echo(f"  {k}: {v}")
                elif isinstance(value, list):
                    click.echo(f"\n[{key.upper()}]")
                    for item in value:
                        click.echo(f"  - {item}")
                else:
                    click.echo(f"{key}: {value}")
        else:
            click.echo(data)

def is_process_running(pid_file):
    if not pid_file.exists():
        return False
    try:
        pid = int(pid_file.read_text().strip())
        os.kill(pid, 0)
        return pid
    except (ProcessLookupError, ValueError, PermissionError):
        return False

@cli.command()
def status():
    """Show sisyphus daemon and agent status"""
    daemon_pid = is_process_running(DAEMON_PID_FILE)
    agent_pid = is_process_running(AGENT_PID_FILE)
    
    status_data = {
        "daemon": {
            "status": "running" if daemon_pid else "stopped",
            "pid": daemon_pid or "N/A",
            "checkpoint": "found" if CHECKPOINT_FILE.exists() else "not found",
        },
        "agent": {
            "status": "running" if agent_pid else "stopped",
            "pid": agent_pid or "N/A",
            "tasks_file": "found" if TASKS_FILE.exists() else "not found",
        }
    }
    
    # Load additional info if available
    if CHECKPOINT_FILE.exists():
        try:
            with open(CHECKPOINT_FILE) as f:
                cp = json.load(f)
                status_data["daemon"]["last_update"] = cp.get("timestamp", "unknown")
                status_data["daemon"]["phase"] = cp.get("phase", "unknown")
        except: pass
        
    if TASKS_FILE.exists():
        try:
            with open(TASKS_FILE) as f:
                tasks = json.load(f)
                status_data["agent"]["total_tasks"] = len(tasks)
                status_data["agent"]["completed"] = sum(1 for t in tasks.values() if t.get("status") == "Completed")
        except: pass
        
    output_result(status_data)

@cli.command()
def tasks():
    """List current tasks from Rust orchestrator"""
    if not TASKS_FILE.exists():
        output_result({"error": "No tasks file found. Is the agent running?"})
        return
        
    try:
        with open(TASKS_FILE) as f:
            tasks_data = json.load(f)
            
        formatted_tasks = []
        for tid, task in tasks_data.items():
            status = task.get("status", "Unknown")
            priority = task.get("priority", "Unknown")
            name = task.get("name", "Unknown")
            formatted_tasks.append(f"[{tid}] ({priority}) {status}: {name}")
            
        output_result({"tasks": formatted_tasks})
    except Exception as e:
        output_result({"error": f"Failed to read tasks: {str(e)}"})

@cli.command()
def start():
    """Start both Python daemon and Rust agent"""
    # Environment with PYTHONPATH set to project root
    env = os.environ.copy()
    env["PYTHONPATH"] = str(GEO_OS_ROOT)
    
    if is_process_running(DAEMON_PID_FILE):
        click.echo("Daemon already running.")
    else:
        click.echo("Starting Sisyphus Python Daemon...")
        # Open log file in append mode
        log_f = open(LOOP_DIR / "daemon.log", "a")
        p = subprocess.Popen([sys.executable, str(PYTHON_DAEMON)], 
                             cwd=str(GEO_OS_ROOT),
                             stdout=log_f,
                             stderr=log_f,
                             env=env,
                             start_new_session=True)
        DAEMON_PID_FILE.write_text(str(p.pid))
        click.echo(f"Daemon started with PID {p.pid} (detached)")

    if is_process_running(AGENT_PID_FILE):
        click.echo("Agent already running.")
    else:
        click.echo("Starting Sisyphus Rust Agent...")
        # Open log file in append mode
        log_f = open(LOOP_DIR / "agent.log", "a")
        p = subprocess.Popen(["cargo", "run", "--manifest-path", str(RUST_AGENT_DIR / "Cargo.toml")], 
                             cwd=str(GEO_OS_ROOT),
                             stdout=log_f,
                             stderr=log_f,
                             env=env,
                             start_new_session=True)
        AGENT_PID_FILE.write_text(str(p.pid))
        click.echo(f"Agent started with PID {p.pid} (detached)")

@cli.command()
def stop():
    """Stop both Python daemon and Rust agent"""
    for name, pid_file in [("Daemon", DAEMON_PID_FILE), ("Agent", AGENT_PID_FILE)]:
        pid = is_process_running(pid_file)
        if pid:
            click.echo(f"Stopping {name} (PID {pid})...")
            try:
                os.kill(pid, signal.SIGTERM)
                pid_file.unlink()
                click.echo(f"{name} stopped.")
            except Exception as e:
                click.echo(f"Failed to stop {name}: {e}")
        else:
            click.echo(f"{name} is not running.")

if __name__ == "__main__":
    cli()
