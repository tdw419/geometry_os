"""PixelBrain backend for geos chat."""

import logging
from typing import Optional

logger = logging.getLogger(__name__)


class ChatBackend:
    """Wrapper around PixelBrainService for conversational queries."""

    def __init__(self):
        self._service = None
        self._available = False
        self._check_availability()

    def _check_availability(self):
        """Check if PixelBrain service is available."""
        try:
            from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
            self._service = get_pixel_brain_service()
            self._available = self._service.is_available()
        except Exception as e:
            logger.debug(f"PixelBrain not available: {e}")
            self._available = False

    @property
    def available(self) -> bool:
        return self._available

    def query(self, user_input: str, context: dict) -> str:
        """
        Send a query to PixelBrain with system context.

        Args:
            user_input: The user's natural language query
            context: System state (cycle, agents, mutations, etc.)

        Returns:
            Response string from PixelBrain
        """
        if not self._available:
            return self._fallback_response(user_input, context)

        try:
            import asyncio

            system_prompt = self._build_system_prompt(context)
            full_prompt = f"{system_prompt}\n\nUser: {user_input}\n\nAssistant:"

            # Run async generate in sync context
            loop = asyncio.new_event_loop()
            asyncio.set_event_loop(loop)
            try:
                result = loop.run_until_complete(
                    self._service.generate(full_prompt, max_tokens=256)
                )
                return result.get("text", "").strip()
            finally:
                loop.close()

        except Exception as e:
            logger.error(f"PixelBrain query failed: {e}")
            return self._fallback_response(user_input, context)

    def _build_system_prompt(self, context: dict) -> str:
        """Build system prompt with current state."""
        return f"""You are the Geometry OS Neural Bridge. You help users understand and control the autonomous evolution system.

Current system state:
- Evolution Cycle: {context.get('cycle', 'Unknown')}
- Active Agents: {context.get('agents', 'Unknown')}
- Pending Mutations: {context.get('mutations', 'Unknown')}
- Fractures: {context.get('fractures', 0)}

Respond concisely in 1-2 sentences. For queries about visual state, describe what you would show."""

    def _fallback_response(self, user_input: str, context: dict) -> str:
        """Fallback when PixelBrain is unavailable."""
        # Simple pattern matching for common queries
        input_lower = user_input.lower()

        if "cycle" in input_lower:
            return f"Evolution cycle: {context.get('cycle', 'Unknown')}"
        elif "agent" in input_lower:
            return f"Active agents: {context.get('agents', 'Unknown')}"
        elif "mutation" in input_lower:
            return f"Pending mutations: {context.get('mutations', 'Unknown')}"
        elif "status" in input_lower or "health" in input_lower:
            return f"System healthy. Cycle {context.get('cycle', '?')}, {context.get('agents', '?')} agents active."
        elif "help" in input_lower:
            return "Try: 'cycle count', 'active agents', 'mutations', 'status'"
        else:
            return "PixelBrain unavailable. Connect LM Studio for full conversational AI. Try 'help' for commands."
