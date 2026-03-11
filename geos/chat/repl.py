"""GEOS Chat REPL using prompt_toolkit."""

import logging
from typing import Optional

from geos.backends.pixelbrain import ChatBackend
from geos.chat.context import gather_system_context

logger = logging.getLogger(__name__)


class ChatREPL:
    """Interactive chat REPL for Geometry OS."""

    PROMPT = "geos> "

    def __init__(self):
        self.backend = ChatBackend()
        self.running = True

    def run(self):
        """Start the REPL loop."""
        self._print_welcome()

        try:
            from prompt_toolkit import prompt as pt_prompt
            from prompt_toolkit.history import FileHistory
            from prompt_toolkit.auto_suggest import AutoSuggestFromHistory

            history_path = ".geos_history"

            while self.running:
                try:
                    user_input = pt_prompt(
                        self.PROMPT,
                        history=FileHistory(history_path),
                        auto_suggest=AutoSuggestFromHistory(),
                    ).strip()
                except KeyboardInterrupt:
                    print("\nUse 'exit' or 'quit' to leave.")
                    continue
                except EOFError:
                    print("\nGoodbye!")
                    break

                if not user_input:
                    continue

                if user_input.lower() in ("exit", "quit", "q"):
                    print("Goodbye!")
                    break

                self._handle_input(user_input)

        except ImportError:
            # Fallback to basic input
            logger.info("prompt_toolkit not available, using basic input")
            self._run_basic()

    def _run_basic(self):
        """Fallback REPL without prompt_toolkit."""
        while self.running:
            try:
                user_input = input(self.PROMPT).strip()
            except (KeyboardInterrupt, EOFError):
                print("\nGoodbye!")
                break

            if not user_input:
                continue

            if user_input.lower() in ("exit", "quit", "q"):
                print("Goodbye!")
                break

            self._handle_input(user_input)

    def _print_welcome(self):
        """Print welcome message."""
        print("=" * 50)
        print("GEOS CHAT - Geometry OS Neural Bridge")
        print("=" * 50)
        print()

        if self.backend.available:
            print("✅ PixelBrain: Connected")
        else:
            print("⚠️  PixelBrain: Using fallback mode")
            print("   Start LM Studio for full AI capabilities")

        print()
        print("Commands: exit, quit, help")
        print("-" * 50)

    def _handle_input(self, user_input: str):
        """Handle user input and print response."""
        context = gather_system_context()
        response = self.backend.query(user_input, context)
        print(f"\n{response}\n")
