#!/usr/bin/env python3
"""
🌌 OMNI-GEOMETRY SHELL (v1.0)
The Human Interface for the Hyper-Graph OS.
"""

import sys
import os
import time
import asyncio
from src.interface.avatar import OmniAvatar

# ANSI Colors
CYAN = "\033[96m"
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
RESET = "\033[0m"
BOLD = "\033[1m"

def type_writer(text, delay=0.01):
    for char in text:
        sys.stdout.write(char)
        sys.stdout.flush()
        time.sleep(delay)
    print()

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def print_banner():
    # Use raw string for ascii art to avoid escape sequence issues
    banner = f"""{CYAN}
   ___  __  ___ _   _ ___         ___  ___ 
  / _ \|  \/  || \ | |_ _|       / _ \/ __|
 | (_) | |\/| ||  \| || |  ___  | (_) \__ \\\\
  \___/|_|  |_||_|\_|___| |___|  \___/|___/
                                           
{RESET}{BOLD}   GEOMETRY • INTELLIGENCE • EVOLUTION{RESET}
    """
    print(banner)

def main():
    clear_screen()
    print_banner()
    
    print(f"{YELLOW}⚡ Initializing Avatar...{RESET}")
    try:
        avatar = OmniAvatar()
    except Exception as e:
        print(f"{RED}❌ Initialization Failed: {e}{RESET}")
        return

    # Initial Pulse
    pulse = avatar.get_status_pulse()
    print(f"{GREEN}🟢 System Online{RESET}")
    print(f"   🧠 Nodes: {pulse['nodes']} | 🔗 Edges: {pulse['connections']}")
    print(f"   💖 Health: {pulse['health_score']:.2f} | 🎭 Mood: {pulse['mood']}")
    print("-" * 50)
    
    while True:
        try:
            try:
                user_input = input(f"{CYAN}{BOLD}omni>{RESET} ").strip()
            except EOFError:
                # Handle non-interactive mode or Ctrl+D
                print()
                break
            
            if not user_input:
                continue
                
            if user_input.lower() in ['exit', 'quit', 'q']:
                print(f"{YELLOW}👋 Disconnecting from Hyper-Graph...{RESET}")
                avatar.close()
                break
                
            if user_input.lower() in ['status', 'health']:
                p = avatar.get_status_pulse()
                print(f"\n📊 {BOLD}SYSTEM STATUS{RESET}")
                print(f"   State:  {p['state']}")
                print(f"   Mood:   {p['mood']}")
                print(f"   Health: {p['health_score']:.2f}")
                print(f"   Nodes:  {p['nodes']}")
                print(f"   Edges:  {p['connections']}")
                print(f"   Uptime: {p['uptime']}")
                print()
                continue
                
            if user_input.lower() == 'dashboard':
                print(f"\n{YELLOW}🎨 Generating Dashboard artifact...{RESET}")
                import tools.generate_dashboard
                tools.generate_dashboard.generate_dashboard()
                continue

            # Default: Treat as Intent
            print(f"{YELLOW}🤔 Analyzing Intent...{RESET}")
            resolution = avatar.perceive_intent(user_input)
            
            if resolution.get('is_conversation', False):
                # Conversational Response
                print(f"{GREEN}🤖 AVATAR:{RESET} {resolution['response']}")
            
            elif resolution['success']:
                # Geometric Intent Resolution
                
                # OMNI-GEOMETRY: VISUAL CORTEX INTEGRATION
                # Fetch full node data to get the vector for rendering
                pixel_visualization = ""
                try:
                    from src.interface.visual_cortex import VisualCortex
                    if 'node_id' in resolution:
                        node_data = avatar.weaver.get_node_by_id(resolution['node_id'])
                        if node_data:
                            pixel_visualization = VisualCortex.render_node_pixel(node_data)
                except Exception as e:
                    pixel_visualization = "⬜"

                print(f"{GREEN}🎯 Intent Resolved: {resolution['node_name']} {pixel_visualization}{RESET}")
                print(f"   📄 File: {resolution['file_path']}")
                print(f"   🤖 Confidence: {resolution['confidence']:.2f}")
                
                # Here we would trigger the Daemon or Action
                print(f"   💡 {BOLD}Action:{RESET} Ready to engage Daemon on this node.")
            else:
                print(f"{RED}❌ Intent Unclear.{RESET} The Oracle could not find a matching geometric path.")
                
            print()
            
        except KeyboardInterrupt:
            print("\n")
            break
        except Exception as e:
            print(f"{RED}⚠️ Error: {e}{RESET}")

if __name__ == "__main__":
    main()
