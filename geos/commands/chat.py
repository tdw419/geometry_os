"""geos chat - Conversational REPL."""

import sys


def run(args) -> int:
    """Start the chat REPL."""
    try:
        from geos.chat.repl import ChatREPL

        repl = ChatREPL()
        repl.run()
        return 0
    except Exception as e:
        print(f"Error starting chat: {e}")
        return 1
