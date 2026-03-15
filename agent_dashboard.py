#!/usr/bin/env python3
import asyncio
import json
import time
import os
from apps.mcp2cli.src.geos_mcp_server import tool_agent_status, tool_memory_map

async def clear_screen():
    print("\033[H\033[J", end="")

async def draw_dashboard():
    while True:
        await clear_screen()
        
        # 1. Get System Status
        status_resp = await tool_agent_status({})
        status = json.loads(status_resp[0].text)["multi_agent_system"]
        
        # 2. Get Memory Map
        map_resp = await tool_memory_map({})
        mem_map = json.loads(map_resp[0].text)["regions"]
        
        print("=" * 80)
        print(f" GEOMETRY OS - MULTI-AGENT MONITORING DASHBOARD   [{time.strftime('%H:%M:%S')}]")
        print("=" * 80)
        
        # Agent Table
        print("\n ACTIVE AGENT SESSIONS")
        print("-" * 80)
        print(f"{'AGENT ID':<30} | {'TYPE':<12} | {'REGIONS':<8} | {'LAST ACTIVITY'}")
        print("-" * 80)
        
        for agent_id, data in status["agents"].items():
            last_act = time.time() - data["last_activity"]
            print(f"{agent_id:<30} | {data['type']:<12} | {data['memory_regions']:<8} | {last_act:.1f}s ago")
            
        # Resource Stats
        print("\n RESOURCE UTILIZATION")
        print("-" * 40)
        print(f" Total Memory Regions: {status['total_memory_regions']}")
        print(f" Active Resource Locks: {status['active_locks']}")
        print(f" Recent Events (60s): {status['recent_events']}")
        
        # Memory Visualization (Simplified)
        print("\n SPATIAL SUBSTRATE MAP (VRAM)")
        print("-" * 80)
        for region in mem_map:
            color = "\033[92m" if region["type"] == "system" else "\033[94m"
            reset = "\033[0m"
            print(f" {color}[{region['start']} - {region['end']}] {region['name']}{reset}")
            
        print("\n" + "=" * 80)
        print(" [Ctrl+C] to Exit Dashboard")
        
        await asyncio.sleep(2)

if __name__ == "__main__":
    try:
        asyncio.run(draw_dashboard())
    except KeyboardInterrupt:
        print("\nDashboard closed.")
