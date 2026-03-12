"""GEOS Chat REPL using prompt_toolkit with ReplSkin styling."""

import logging
from typing import Optional

from geos.backends.pixelbrain import ChatBackend
from geos.chat.context import gather_system_context
from geos.chat.repl_skin import ReplSkin

logger = logging.getLogger(__name__)


class ChatREPL:
    """Interactive chat REPL for Geometry OS."""

    PROMPT = "geos> "

    def __init__(self):
        self.backend = ChatBackend()
        self.running = True
        self.skin = ReplSkin("geos", version="0.1.0")

    def run(self):
        """Start the REPL loop."""
        self._print_welcome()

        try:
            from prompt_toolkit import PromptSession
            from prompt_toolkit.history import FileHistory
            from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
            from prompt_toolkit.formatted_text import FormattedText

            history_path = ".geos_history"
            pt_session = self.skin.create_prompt_session()

            while self.running:
                try:
                    user_input = self.skin.get_input(
                        pt_session, project_name="", modified=False, context="neural bridge"
                    ).strip()
                except KeyboardInterrupt:
                    self.skin.hint("Use 'exit' or 'quit' to leave.")
                    continue
                except EOFError:
                    self.skin.print_goodbye()
                    break

                if not user_input:
                    continue

                if user_input.lower() in ("exit", "quit", "q"):
                    self.skin.print_goodbye()
                    break

                self._handle_input(user_input)

        except ImportError:
            # Fallback to basic input
            logger.info("prompt_toolkit not available, using basic input")
            self._run_basic()

    def _run_basic(self):
        """Fallback REPL without prompt_toolkit."""
        self.skin.print_banner()

        while self.running:
            try:
                user_input = input(self.skin.prompt()).strip()
            except (KeyboardInterrupt, EOFError):
                self.skin.print_goodbye()
                break

            if not user_input:
                continue

            if user_input.lower() in ("exit", "quit", "q"):
                self.skin.print_goodbye()
                break

            self._handle_input(user_input)

    def _print_welcome(self):
        """Print welcome message using ReplSkin."""
        self.skin.print_banner()

        if self.backend.available:
            self.skin.status("PixelBrain", "Connected")
        else:
            self.skin.warning("PixelBrain: Using fallback mode")
            self.skin.info("Start LM Studio for full AI capabilities")

        self.skin.hint("Commands: exit, quit, help")
        print()

    def _handle_input(self, user_input: str):
        """Handle user input and print response."""
        context = gather_system_context()
        response = self.backend.query(user_input, context)
        print(f"\n{response}\n")
