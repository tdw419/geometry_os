#!/usr/bin/env python3
"""
Native Glyph Shell Interactive Tutorial

An interactive, self-paced tutorial that teaches users how to use
the Native Glyph Shell through hands-on exercises.

Usage:
    python3 scripts/glyph_shell_tutorial.py

Modes:
    --module N    Start at specific module (1-7)
    --skip-intro  Skip the introduction
    --practice    Practice mode (no scoring)
"""

import sys
import os
import time
import subprocess
from pathlib import Path
from typing import Optional, Callable
from dataclasses import dataclass
from enum import Enum

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

# ANSI Colors
class Colors:
    RESET = "\033[0m"
    BOLD = "\033[1m"
    DIM = "\033[2m"
    
    RED = "\033[31m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    BLUE = "\033[34m"
    MAGENTA = "\033[35m"
    CYAN = "\033[36m"
    WHITE = "\033[37m"
    
    BRIGHT_GREEN = "\033[92m"
    BRIGHT_YELLOW = "\033[93m"
    BRIGHT_BLUE = "\033[94m"
    BRIGHT_CYAN = "\033[96m"
    
    BG_BLUE = "\033[44m"
    BG_CYAN = "\033[46m"


class TutorialState(Enum):
    INTRO = "intro"
    MODULE = "module"
    EXERCISE = "exercise"
    COMPLETE = "complete"


@dataclass
class Exercise:
    """Represents a tutorial exercise."""
    title: str
    description: str
    hint: str
    expected_command: str
    success_message: str
    points: int = 10


@dataclass
class Module:
    """Represents a training module."""
    number: int
    title: str
    description: str
    content: str
    exercises: list[Exercise]
    duration_minutes: int


class GlyphShellTutorial:
    """Interactive tutorial for the Native Glyph Shell."""
    
    def __init__(self, start_module: int = 1, skip_intro: bool = False, practice_mode: bool = False):
        self.current_module = start_module
        self.skip_intro = skip_intro
        self.practice_mode = practice_mode
        self.score = 0
        self.max_score = 0
        self.completed_exercises: set[str] = set()
        
        self.modules = self._create_modules()
        self.state = TutorialState.INTRO
        
    def _create_modules(self) -> list[Module]:
        """Create all tutorial modules."""
        return [
            Module(
                number=1,
                title="Getting Started",
                description="Learn to launch and configure the G-Shell",
                content="""
Welcome to Module 1: Getting Started

The Native Glyph Shell (G-Shell) is Geometry OS's AI-native terminal
interface. It bridges standard Bash with spatial/AI-native architecture.

Key Features:
• Automatic AI context injection
• Visual command palette (Ctrl+P)
• Geometry OS commands (g prefix)
• GNB state synchronization

Let's begin by verifying your setup.
""",
                exercises=[
                    Exercise(
                        title="Check G-Shell Version",
                        description="Display the G-Shell version information",
                        hint="Use the 'g version' command",
                        expected_command="g version",
                        success_message="Great! G-Shell is properly installed.",
                        points=10
                    ),
                    Exercise(
                        title="View Available Commands",
                        description="List all available Geometry OS commands",
                        hint="Use 'g help' to see all commands",
                        expected_command="g help",
                        success_message="Excellent! You now know how to access help.",
                        points=10
                    ),
                ],
                duration_minutes=15
            ),
            Module(
                number=2,
                title="Keyboard Navigation",
                description="Master essential keyboard shortcuts",
                content="""
Welcome to Module 2: Keyboard Navigation

The Enhanced Glyph Shell provides powerful keyboard shortcuts for
efficient navigation and command execution.

Essential Shortcuts:
• Ctrl+P - Open command palette
• Ctrl+H - Toggle history panel
• Ctrl+L - Clear screen
• ?      - Show help overlay
• Esc    - Close overlays
• Tab    - Autocomplete

Practice these shortcuts to build muscle memory!
""",
                exercises=[
                    Exercise(
                        title="Clear the Screen",
                        description="Use a keyboard shortcut to clear the terminal",
                        hint="Press Ctrl+L to clear the screen",
                        expected_command="<CTRL+L>",
                        success_message="Screen cleared! Ctrl+L is handy for a fresh start.",
                        points=5
                    ),
                    Exercise(
                        title="Navigate with Arrow Keys",
                        description="Use arrow keys to navigate command history",
                        hint="Press the Up arrow to see previous commands",
                        expected_command="<UP>",
                        success_message="Arrow keys let you quickly reuse commands.",
                        points=5
                    ),
                ],
                duration_minutes=20
            ),
            Module(
                number=3,
                title="Geometry OS Commands",
                description="Learn the 'g' prefix command system",
                content="""
Welcome to Module 3: Geometry OS Commands

All Geometry OS commands use the 'g' prefix. These commands provide
access to spatial operations and AI features.

Core Commands:
• g map <x> <y>  - Navigate infinite map
• g spawn        - Create terminal tile
• g gls [path]   - Geometric file listing
• g ai <prompt>  - AI intent command
• g status       - Show system status

Let's practice these commands!
""",
                exercises=[
                    Exercise(
                        title="Navigate the Map",
                        description="Navigate to coordinates (1024, 1024)",
                        hint="Use 'g map 1024 1024'",
                        expected_command="g map 1024 1024",
                        success_message="Perfect! You've navigated the infinite map.",
                        points=15
                    ),
                    Exercise(
                        title="Geometric File Listing",
                        description="List files in the current directory with entropy",
                        hint="Use 'g gls' without arguments",
                        expected_command="g gls",
                        success_message="Great! You can see file entropy values.",
                        points=15
                    ),
                    Exercise(
                        title="Check System Status",
                        description="Display the current system status",
                        hint="Use 'g status'",
                        expected_command="g status",
                        success_message="Excellent! Status shows your current context.",
                        points=10
                    ),
                ],
                duration_minutes=30
            ),
            Module(
                number=4,
                title="AI Context Injection",
                description="Use AI commands with automatic context",
                content="""
Welcome to Module 4: AI Context Injection

G-Shell automatically provides terminal context to AI assistants.
When you use 'gemini' or 'claude' commands, the AI receives your
current screen state.

Benefits:
• No need to copy-paste errors
• AI understands your environment
• Faster debugging and problem-solving

Note: This requires 'gemini' or 'claude' CLI to be installed.
""",
                exercises=[
                    Exercise(
                        title="AI Intent Command",
                        description="Write an intent for AI processing",
                        hint="Use 'g ai' followed by your request",
                        expected_command="g ai test",
                        success_message="Intent written! AI can now process your request.",
                        points=20
                    ),
                    Exercise(
                        title="View Intent File",
                        description="Check the contents of the intent file",
                        hint="Use 'cat .geometry/intent/last_ai_request.json'",
                        expected_command="cat .geometry/intent/last_ai_request.json",
                        success_message="You can see the structured AI request!",
                        points=15
                    ),
                ],
                duration_minutes=25
            ),
            Module(
                number=5,
                title="GNB State Synchronization",
                description="Understand the Geometric Neural Buffer",
                content="""
Welcome to Module 5: GNB State Synchronization

The Geometric Neural Buffer (GNB) is a state file that captures
your terminal for AI consumption.

Location: .geometry/gnb_state.ascii
Update: Every 0.5 seconds (configurable)

The GNB contains:
• Screen buffer contents
• Cursor position
• Timestamp
• Metadata

External tools and AI agents can read this file to understand
your terminal state.
""",
                exercises=[
                    Exercise(
                        title="View GNB State",
                        description="Display the current GNB state file",
                        hint="Use 'cat' on the GNB file path",
                        expected_command="cat .geometry/gnb_state.ascii",
                        success_message="You can see the full terminal state!",
                        points=15
                    ),
                    Exercise(
                        title="Check GNB Directory",
                        description="List the contents of the .geometry directory",
                        hint="Use 'ls -la .geometry/'",
                        expected_command="ls -la .geometry/",
                        success_message="The .geometry directory contains all state files.",
                        points=10
                    ),
                ],
                duration_minutes=20
            ),
            Module(
                number=6,
                title="Advanced Features",
                description="Explore advanced G-Shell capabilities",
                content="""
Welcome to Module 6: Advanced Features

The Enhanced Glyph Shell provides advanced features for power users:

Visual Command Palette (Ctrl+P):
• Search and filter commands
• Quick execution
• Keyboard navigation

History Panel (Ctrl+H):
• View past commands
• Re-execute commands
• Search history

Customization:
• Configuration file at ~/.gshell/config.yaml
• Custom shortcuts
• Theme support
""",
                exercises=[
                    Exercise(
                        title="Spawn a Terminal Tile",
                        description="Create a new terminal tile on the infinite map",
                        hint="Use 'g spawn'",
                        expected_command="g spawn",
                        success_message="Terminal tile created on the infinite map!",
                        points=20
                    ),
                    Exercise(
                        title="List Active Tiles",
                        description="Show all active terminal tiles",
                        hint="Use 'g tiles' command",
                        expected_command="g tiles",
                        success_message="You can see all your terminal tiles.",
                        points=15
                    ),
                ],
                duration_minutes=30
            ),
            Module(
                number=7,
                title="Troubleshooting",
                description="Learn to diagnose and fix common issues",
                content="""
Welcome to Module 7: Troubleshooting

Common Issues and Solutions:

1. G-Shell won't start
   → Check Python version (needs 3.10+)

2. GNB not updating
   → Verify .geometry/ directory exists

3. AI commands not working
   → Install gemini or claude CLI

4. Commands not found
   → Remember the 'g' prefix

5. Terminal size wrong
   → Check 'stty size' and resize

Use 'g status --verbose' for diagnostics.
""",
                exercises=[
                    Exercise(
                        title="Run Diagnostics",
                        description="Execute verbose status check",
                        hint="Use 'g status --verbose'",
                        expected_command="g status --verbose",
                        success_message="Diagnostics complete! Check for any issues.",
                        points=15
                    ),
                    Exercise(
                        title="Check Python Version",
                        description="Verify your Python version",
                        hint="Use 'python3 --version'",
                        expected_command="python3 --version",
                        success_message="Python version confirmed!",
                        points=5
                    ),
                ],
                duration_minutes=15
            ),
        ]
    
    def clear_screen(self):
        """Clear the terminal screen."""
        os.system('clear' if os.name == 'posix' else 'cls')
    
    def print_header(self, title: str):
        """Print a styled header."""
        width = 60
        print()
        print(f"{Colors.BG_BLUE}{Colors.WHITE}{'═' * width}{Colors.RESET}")
        print(f"{Colors.BG_BLUE}{Colors.WHITE}  {title.center(width - 2)}  {Colors.RESET}")
        print(f"{Colors.BG_BLUE}{Colors.WHITE}{'═' * width}{Colors.RESET}")
        print()
    
    def print_section(self, title: str, content: str):
        """Print a styled section."""
        print(f"\n{Colors.BRIGHT_CYAN}{Colors.BOLD}▶ {title}{Colors.RESET}")
        print(f"{Colors.DIM}{'─' * 50}{Colors.RESET}")
        print(content)
    
    def print_success(self, message: str):
        """Print a success message."""
        print(f"\n{Colors.BRIGHT_GREEN}✓ {message}{Colors.RESET}")
    
    def print_error(self, message: str):
        """Print an error message."""
        print(f"\n{Colors.RED}✗ {message}{Colors.RESET}")
    
    def print_hint(self, hint: str):
        """Print a hint."""
        print(f"\n{Colors.YELLOW}💡 Hint: {hint}{Colors.RESET}")
    
    def wait_for_enter(self, prompt: str = "Press Enter to continue..."):
        """Wait for user to press Enter."""
        input(f"{Colors.DIM}{prompt}{Colors.RESET}")
    
    def get_command_input(self) -> str:
        """Get a command from the user."""
        try:
            return input(f"\n{Colors.BRIGHT_CYAN}$ {Colors.RESET}").strip()
        except EOFError:
            return "exit"
    
    def show_intro(self):
        """Show the tutorial introduction."""
        self.clear_screen()
        self.print_header("Native Glyph Shell Interactive Tutorial")
        
        print(f"""
{Colors.BOLD}Welcome to the Native Glyph Shell Training Program!{Colors.RESET}

This interactive tutorial will teach you how to use the G-Shell,
Geometry OS's AI-native terminal interface.

{Colors.CYAN}What you'll learn:{Colors.RESET}
  • Launch and configure G-Shell
  • Navigate with keyboard shortcuts
  • Execute Geometry OS commands
  • Use AI context injection
  • Understand GNB synchronization
  • Troubleshoot common issues

{Colors.CYAN}Duration:{Colors.RESET} Approximately 2.5 hours (7 modules)

{Colors.CYAN}Scoring:{Colors.RESET} Complete exercises to earn points
  {'(Practice mode - no scoring)' if self.practice_mode else ''}

{Colors.CYAN}Navigation:{Colors.RESET}
  • Type commands at the $ prompt
  • Type 'skip' to skip current exercise
  • Type 'menu' to return to module menu
  • Type 'exit' to quit tutorial
  • Type 'hint' if you're stuck
""")
        self.wait_for_enter()
    
    def show_module_menu(self, module: Module) -> str:
        """Show the module menu and get user choice."""
        self.clear_screen()
        self.print_header(f"Module {module.number}: {module.title}")
        
        print(f"{Colors.DIM}Duration: ~{module.duration_minutes} minutes{Colors.RESET}\n")
        print(module.content)
        
        print(f"\n{Colors.CYAN}Exercises in this module:{Colors.RESET}")
        for i, ex in enumerate(module.exercises, 1):
            status = f"{Colors.GREEN}✓{Colors.RESET}" if f"{module.number}-{i}" in self.completed_exercises else "○"
            print(f"  {status} {i}. {ex.title} ({ex.points} pts)")
        
        print(f"\n{Colors.DIM}─" * 50 + Colors.RESET)
        print(f"""
{Colors.CYAN}Options:{Colors.RESET}
  1-{len(module.exercises)}  - Start specific exercise
  all  - Complete all exercises in sequence
  skip - Skip to next module
  exit - Exit tutorial
""")
        
        return input(f"{Colors.BRIGHT_CYAN}Choice: {Colors.RESET}").strip().lower()
    
    def run_exercise(self, module: Module, exercise_index: int) -> bool:
        """Run a single exercise. Returns True if completed successfully."""
        exercise = module.exercises[exercise_index]
        exercise_id = f"{module.number}-{exercise_index + 1}"
        
        self.clear_screen()
        self.print_header(f"Exercise: {exercise.title}")
        
        print(f"{Colors.DIM}Module {module.number} • Exercise {exercise_index + 1} • {exercise.points} points{Colors.RESET}\n")
        
        print(f"{Colors.CYAN}Task:{Colors.RESET} {exercise.description}\n")
        
        if exercise_id in self.completed_exercises:
            print(f"{Colors.GREEN}✓ Already completed{Colors.RESET}\n")
        
        attempts = 0
        max_attempts = 3
        
        while attempts < max_attempts:
            command = self.get_command_input()
            
            if command.lower() == 'exit':
                return False
            elif command.lower() == 'skip':
                self.print_error("Exercise skipped.")
                return True
            elif command.lower() == 'hint':
                self.print_hint(exercise.hint)
                continue
            elif command.lower() == 'menu':
                return True
            
            # Check if command matches (allowing for variations)
            if self._check_command(command, exercise.expected_command):
                self.print_success(exercise.success_message)
                if exercise_id not in self.completed_exercises:
                    self.completed_exercises.add(exercise_id)
                    if not self.practice_mode:
                        self.score += exercise.points
                self.wait_for_enter()
                return True
            else:
                attempts += 1
                remaining = max_attempts - attempts
                if remaining > 0:
                    self.print_error(f"Incorrect. {remaining} attempt(s) remaining.")
                    print(f"   {Colors.DIM}Type 'hint' for help or 'skip' to continue{Colors.RESET}")
                else:
                    self.print_error("Maximum attempts reached. Moving to next exercise.")
                    self.wait_for_enter()
                    return True
        
        return True
    
    def _check_command(self, user_command: str, expected: str) -> bool:
        """Check if user command matches expected (with flexibility)."""
        # Normalize commands
        user = user_command.strip().lower()
        exp = expected.strip().lower()
        
        # Direct match
        if user == exp:
            return True
        
        # Handle keyboard shortcuts (allow various representations)
        if exp.startswith('<') and exp.endswith('>'):
            # This is a keyboard shortcut - just check if they did something
            return True
        
        # Handle commands with variable arguments
        # e.g., "g ai test" should match "g ai anything"
        exp_parts = exp.split()
        user_parts = user.split()
        
        if len(exp_parts) >= 2 and exp_parts[0] == 'g':
            # For g commands, check the command part matches
            if len(user_parts) >= 2 and user_parts[0] == 'g' and user_parts[1] == exp_parts[1]:
                return True
        
        return False
    
    def run_module(self, module: Module) -> bool:
        """Run a complete module. Returns True if should continue."""
        while True:
            choice = self.show_module_menu(module)
            
            if choice == 'exit':
                return False
            elif choice == 'skip':
                return True
            elif choice == 'all':
                # Run all exercises
                for i in range(len(module.exercises)):
                    if not self.run_exercise(module, i):
                        return False
                return True
            else:
                # Try to parse as exercise number
                try:
                    ex_num = int(choice)
                    if 1 <= ex_num <= len(module.exercises):
                        if not self.run_exercise(module, ex_num - 1):
                            return False
                    else:
                        print(f"{Colors.RED}Invalid exercise number{Colors.RESET}")
                        time.sleep(1)
                except ValueError:
                    print(f"{Colors.RED}Invalid choice{Colors.RESET}")
                    time.sleep(1)
    
    def show_completion(self):
        """Show the tutorial completion screen."""
        self.clear_screen()
        self.print_header("🎉 Tutorial Complete! 🎉")
        
        total_exercises = sum(len(m.exercises) for m in self.modules)
        completed = len(self.completed_exercises)
        
        print(f"""
{Colors.GREEN}Congratulations!{Colors.RESET} You have completed the Native Glyph Shell Tutorial.

{Colors.CYAN}Your Progress:{Colors.RESET}
  Exercises Completed: {completed}/{total_exercises}
  {'Score: ' + str(self.score) + '/' + str(self._calculate_max_score()) if not self.practice_mode else 'Practice Mode'}

{Colors.CYAN}Next Steps:{Colors.RESET}
  1. Try using G-Shell for your daily work
  2. Explore the command palette (Ctrl+P)
  3. Practice AI context injection
  4. Customize your ~/.gshell/config.yaml

{Colors.CYAN}Resources:{Colors.RESET}
  • Documentation: docs/training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md
  • Quick Help: Press '?' in G-Shell
  • Feedback: python3 scripts/training_feedback_survey.py

{Colors.DIM}Thank you for completing the training!{Colors.RESET}
""")
        
        # Offer to launch feedback survey
        if input(f"\n{Colors.CYAN}Launch feedback survey? (y/n): {Colors.RESET}").lower() == 'y':
            self.launch_feedback_survey()
    
    def _calculate_max_score(self) -> int:
        """Calculate the maximum possible score."""
        return sum(ex.points for m in self.modules for ex in m.exercises)
    
    def launch_feedback_survey(self):
        """Launch the feedback survey."""
        survey_path = Path(__file__).parent / "training_feedback_survey.py"
        if survey_path.exists():
            subprocess.run([sys.executable, str(survey_path)])
        else:
            print(f"\n{Colors.YELLOW}Survey script not found at: {survey_path}{Colors.RESET}")
            print(f"{Colors.DIM}You can provide feedback at: https://geometry.os/training/feedback{Colors.RESET}")
    
    def run(self):
        """Run the complete tutorial."""
        try:
            # Show introduction
            if not self.skip_intro:
                self.show_intro()
            
            # Run modules
            for i, module in enumerate(self.modules[self.current_module - 1:], start=self.current_module):
                self.current_module = i
                if not self.run_module(module):
                    break
            
            # Show completion
            self.show_completion()
            
        except KeyboardInterrupt:
            print(f"\n\n{Colors.YELLOW}Tutorial interrupted. Progress saved.{Colors.RESET}")
            print(f"Resume with: python3 scripts/glyph_shell_tutorial.py --module {self.current_module}")


def main():
    """Main entry point."""
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Native Glyph Shell Interactive Tutorial"
    )
    parser.add_argument(
        "--module", "-m",
        type=int,
        default=1,
        help="Start at specific module (1-7)"
    )
    parser.add_argument(
        "--skip-intro",
        action="store_true",
        help="Skip the introduction"
    )
    parser.add_argument(
        "--practice",
        action="store_true",
        help="Practice mode (no scoring)"
    )
    
    args = parser.parse_args()
    
    tutorial = GlyphShellTutorial(
        start_module=args.module,
        skip_intro=args.skip_intro,
        practice_mode=args.practice
    )
    tutorial.run()


if __name__ == "__main__":
    main()
