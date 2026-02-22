"""
Geometry OS: AI Agent Control Surface

Exposes Geometry OS capabilities (TerminalManager, FileBrowser) to AI agents
via both WebMCP tools and Pyodide Python APIs.

Usage:
    from agent_control_surface import register_control_surface
    register_control_surface(terminal_manager, file_browser)
"""

import sys
from typing import Optional, List, Dict, Any
from dataclasses import asdict


class GeminiModule:
    """
    The 'gemini' module exposed to Pyodide Python environment.

    Provides:
        - terminal_manager: TerminalManager instance
        - file_browser: FileBrowser instance (when running)
        - Convenience functions for common operations
    """

    def __init__(self, terminal_manager, file_browser=None):
        self._terminal_manager = terminal_manager
        self._file_browser = file_browser

    @property
    def terminal_manager(self):
        """Access the TerminalManager instance."""
        return self._terminal_manager

    @property
    def file_browser(self):
        """Access the FileBrowser instance (may be None)."""
        return self._file_browser

    @property
    def terminals(self) -> Dict:
        """Shorthand for terminal_manager.terminals."""
        return self._terminal_manager.terminals

    @property
    def active_terminal(self):
        """Get the currently active terminal."""
        return self._terminal_manager.get_active()

    async def run_command(self, command: str, term_id: int = None):
        """
        Execute a command in a terminal.

        Args:
            command: Shell command to execute
            term_id: Terminal ID (uses active if None)

        Returns:
            CommandResult with stdout, stderr, exit_code
        """
        if term_id is not None:
            terminal = self._terminal_manager.get_terminal(term_id)
        else:
            terminal = self._terminal_manager.get_active()

        if not terminal:
            raise ValueError(f"Terminal {term_id} not found" if term_id else "No active terminal")

        return await terminal.execute(command)

    def create_terminal(self, x: int = 100, y: int = 100):
        """
        Create a new terminal window.

        Args:
            x: X position on map
            y: Y position on map

        Returns:
            MapTerminal instance
        """
        return self._terminal_manager.create_terminal(x=x, y=y)

    def get_terminal_state(self, term_id: int = None) -> Dict[str, Any]:
        """
        Get state of a terminal (or all terminals).

        Args:
            term_id: Specific terminal ID (all if None)

        Returns:
            Dict with terminal state(s)
        """
        if term_id is not None:
            terminal = self._terminal_manager.get_terminal(term_id)
            if not terminal:
                return {"error": f"Terminal {term_id} not found"}
            return {
                "id": terminal.term_id,
                "working_dir": terminal.working_dir,
                "focused": terminal.focused,
                "x": terminal.x,
                "y": terminal.y,
                "width": terminal.width,
                "height": terminal.height,
                "history_count": len(terminal.command_history),
            }

        # Return all terminals
        return {
            "terminals": [
                self.get_terminal_state(t.term_id)
                for t in self._terminal_manager.terminals.values()
            ],
            "active_id": self._terminal_manager.active_terminal_id,
        }


def register_control_surface(terminal_manager, file_browser=None):
    """
    Register the control surface with Pyodide.

    Call this after creating the TerminalManager in map_terminal.py.

    Args:
        terminal_manager: TerminalManager instance
        file_browser: Optional FileBrowser instance

    Returns:
        GeminiModule instance
    """
    gemini = GeminiModule(terminal_manager, file_browser)
    sys.modules['gemini'] = gemini

    print("✓ Agent Control Surface registered")
    print(f"  - gemini.terminal_manager: {type(terminal_manager).__name__}")
    if file_browser:
        print(f"  - gemini.file_browser: {type(file_browser).__name__}")

    return gemini
