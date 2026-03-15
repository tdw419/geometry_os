#!/usr/bin/env python3
import requests
import time
import os
from rich.console import Console
from rich.table import Table
from rich.live import Live
from rich.panel import Panel
from rich.layout import Layout

# Ouroboros Daemon URL
URL = "http://127.0.0.1:8769/peek"

console = Console()

def get_substrate_state():
    """Poll the daemon for the live machine state."""
    try:
        # 1. Peek Guest PC and State (0x14000)
        r_pc = requests.get(f"{URL}?addr=0x14000&size=16", timeout=0.1)
        # 2. Peek Guest Registers (0x14100)
        r_regs = requests.get(f"{URL}?addr=0x14100&size=64", timeout=0.1)
        # 3. Peek UART (0x0200)
        r_uart = requests.get(f"{URL}?addr=0x0200&size=64", timeout=0.1)
        
        if r_pc.status_code == 200 and r_regs.status_code == 200:
            pc_data = r_pc.text.strip().split()
            reg_data = r_regs.text.strip().split()
            uart_data = r_uart.text.strip().split()
            return pc_data, reg_data, uart_data
    except Exception:
        return None, None, None
    return None, None, None

def generate_layout(pc_data, reg_data, uart_data):
    """Create the rich layout for the dashboard."""
    layout = Layout()
    layout.split_column(
        Layout(name="header", size=3),
        Layout(name="main", ratio=1),
        Layout(name="footer", size=3)
    )
    layout["main"].split_row(
        Layout(name="registers", ratio=2),
        Layout(name="console", ratio=1)
    )

    # Header: PC and Status
    pc_val = pc_data[0] if pc_data else "OFFLINE"
    hw_flag = pc_data[4] if (pc_data and len(pc_data) > 4) else "0"
    layout["header"].update(Panel(f"[bold cyan]GEOS SUBSTRATE[/] | [bold green]GUEST PC:[/] 0x{pc_val}.{hw_flag} | [bold yellow]HZ:[/] 60 (Fixed)", style="white on blue"))

    # Registers Table
    reg_table = Table(title="RV64I Registers (x0-x31)", expand=True)
    for i in range(4):
        reg_table.add_column(f"R{i*8}-{i*8+7}", justify="left", style="green")
    
    if reg_data:
        for row in range(8):
            cells = []
            for col in range(4):
                idx = (col * 8 + row) * 2 # 64-bit registers (Low/High)
                if idx < len(reg_data):
                    val_low = reg_data[idx]
                    cells.append(f"x{col*8+row:02d}: [bold white]{val_low}[/]")
                else:
                    cells.append("")
            reg_table.add_row(*cells)
    layout["registers"].update(Panel(reg_table))

    # Console / UART
    uart_output = ""
    if uart_data:
        for word_hex in uart_data:
            try:
                val = int(word_hex, 16)
                if val != 0:
                    char = chr(val & 0xFF)
                    uart_output += char if char.isprintable() or char == '\n' else '.'
            except:
                pass
    layout["console"].update(Panel(uart_output, title="[bold red]UART CONSOLE", border_style="red"))

    # Footer
    layout["footer"].update(Panel("[bold]OUROBOROS ACTIVE[/] | Press Ctrl+C to detach | [dim]Waiting for Ubuntu boot...[/]"))

    return layout

def main():
    with Live(console=console, refresh_per_second=10) as live:
        while True:
            pc, regs, uart = get_substrate_state()
            if pc:
                live.update(generate_layout(pc, regs, uart))
            else:
                live.update(Panel("[bold red]DAEMON OFFLINE[/]\nStart Ouroboros: cargo run --release --bin gpu_dev_daemon", style="white on red"))
            time.sleep(0.1)

if __name__ == "__main__":
    main()
