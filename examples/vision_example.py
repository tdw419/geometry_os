"""
Example Agent Integration with VisionDaemon.

This demonstrates how an agent (like ShotcutAgent) would integrate
with the Vision-Based UI Understanding System.
"""

import asyncio
from dataclasses import dataclass
from typing import Any, Dict, Optional, Tuple

from PIL import Image

from systems.vision.clients.vision_client import VisionClient, VisionClientError


@dataclass
class AgentConfig:
    """Configuration for a vision-enabled agent."""
    name: str
    use_vision: bool = True
    vision_socket: str = "/tmp/vision_daemon.sock"
    fallback_to_hardcoded: bool = True


class VisionEnabledAgent:
    """
    Example agent that uses VisionDaemon for UI interaction.

    This is a template showing how to integrate vision-based
    UI understanding into an agent.

    Replace hardcoded coordinates with semantic queries:
    - Before: click(80, 50)  # "Open" button - brittle!
    - After:  click(await find_element("Open"))  # Robust!
    """

    def __init__(self, config: AgentConfig):
        self.config = config
        self._vision: Optional[VisionClient] = None
        self._last_screenshot: Optional[Image.Image] = None

        # Hardcoded fallback positions (legacy)
        self._hardcoded_positions = {
            "open": (80, 50),
            "export": (200, 50),
            "cancel": (300, 50),
        }

    @property
    def vision(self) -> VisionClient:
        """Get or create VisionClient."""
        if self._vision is None:
            self._vision = VisionClient(socket_path=self.config.vision_socket)
        return self._vision

    async def start(self) -> None:
        """Initialize the agent."""
        if self.config.use_vision:
            healthy = await self.vision.health_check()
            if not healthy:
                print(f"Warning: VisionDaemon not available at {self.config.vision_socket}")
                if not self.config.fallback_to_hardcoded:
                    raise RuntimeError("VisionDaemon required but not available")

    async def take_screenshot(self) -> Image.Image:
        """Take a screenshot of the target application."""
        # Placeholder - implement based on your screenshot mechanism
        # For example: pyautogui, mss, etc.
        self._last_screenshot = Image.new("RGB", (800, 600), color="white")
        return self._last_screenshot

    async def find_element(self, description: str) -> Tuple[int, int]:
        """
        Find an element by description and return click coordinates.

        This replaces hardcoded coordinate lookups with semantic queries.

        Args:
            description: Text description of the element (e.g., "Export", "Open")

        Returns:
            Tuple of (x, y) coordinates for clicking
        """
        if self.config.use_vision and self._last_screenshot:
            try:
                # Use vision to find the element
                return await self.vision.find_and_click(
                    self._last_screenshot,
                    description
                )
            except VisionClientError as e:
                print(f"Vision error: {e}")
                if not self.config.fallback_to_hardcoded:
                    raise

        # Fallback to hardcoded positions
        if description.lower() in self._hardcoded_positions:
            return self._hardcoded_positions[description.lower()]

        raise ValueError(f"Element '{description}' not found")

    async def find_element_by_type(
        self,
        element_type: str,
        index: int = 0
    ) -> Tuple[int, int]:
        """
        Find an element by type (button, input, etc.).

        Args:
            element_type: Type of element to find
            index: Index if multiple elements match

        Returns:
            Tuple of (x, y) coordinates for clicking
        """
        if self.config.use_vision and self._last_screenshot:
            try:
                elements = await self.vision.detect(
                    self._last_screenshot,
                    classes=[element_type]
                )
                if elements and index < len(elements):
                    return await self.vision.click_point(elements[index])
            except VisionClientError as e:
                print(f"Vision error: {e}")
                if not self.config.fallback_to_hardcoded:
                    raise

        raise ValueError(f"Element type '{element_type}' not found at index {index}")

    async def find_relative_element(
        self,
        anchor_text: str,
        direction: str,
        offset: int = 0
    ) -> Tuple[int, int]:
        """
        Find an element relative to another element.

        Example: Find the input field below the "Name" label.

        Args:
            anchor_text: Text of the anchor element
            direction: Direction to search (above, below, left, right)
            offset: Offset from anchor (0 = first match)

        Returns:
            Tuple of (x, y) coordinates for clicking
        """
        if self.config.use_vision and self._last_screenshot:
            try:
                result = await self.vision.query({
                    "image": self._last_screenshot,
                    "steps": [
                        {"op": "detect", "classes": ["button", "input"], "assign_to": "elements"},
                        {"op": "ground", "text": anchor_text, "assign_to": "anchor"},
                        {"op": "relative", "anchor": "$anchor", "direction": direction, "source": "$elements", "assign_to": "relative"},
                        {"op": "click_point", "source": "$relative", "assign_to": "click"}
                    ]
                })

                if result["success"] and "click" in result["results"]:
                    click = result["results"]["click"]
                    return (click["x"], click["y"])
            except VisionClientError as e:
                print(f"Vision error: {e}")
                if not self.config.fallback_to_hardcoded:
                    raise

        raise ValueError(f"Relative element not found")

    async def read_text_near(
        self,
        anchor_text: str,
        direction: str = "right"
    ) -> str:
        """
        Read text near an anchor element.

        Example: Read the value of a setting (text to the right of the label).

        Args:
            anchor_text: Text of the anchor element
            direction: Direction to search (above, below, left, right)

        Returns:
            Text content found
        """
        if self.config.use_vision and self._last_screenshot:
            try:
                result = await self.vision.query({
                    "image": self._last_screenshot,
                    "steps": [
                        {"op": "ocr", "assign_to": "text_elements"},
                        {"op": "ground", "text": anchor_text, "assign_to": "anchor"},
                        {"op": "relative", "anchor": "$anchor", "direction": direction, "source": "$text_elements", "assign_to": "nearby"}
                    ]
                })

                if result["success"] and "nearby" in result["results"]:
                    nearby = result["results"]["nearby"]
                    if nearby:
                        return nearby[0].get("text", "")
            except VisionClientError as e:
                print(f"Vision error: {e}")

        return ""

    async def click(self, x: int, y: int) -> None:
        """Perform a click at the specified coordinates."""
        # Placeholder - implement based on your click mechanism
        # For example: pyautogui.click(x, y)
        print(f"Clicking at ({x}, {y})")

    async def type_text(self, text: str) -> None:
        """Type text at the current cursor position."""
        # Placeholder - implement based on your typing mechanism
        # For example: pyautogui.typewrite(text)
        print(f"Typing: {text}")


async def demo():
    """Demonstrate the vision-enabled agent."""

    # Create agent with vision enabled
    config = AgentConfig(
        name="DemoAgent",
        use_vision=True,
        fallback_to_hardcoded=True
    )
    agent = VisionEnabledAgent(config)

    # Start agent
    await agent.start()

    # Take screenshot
    screenshot = await agent.take_screenshot()

    # Find and click an element (vision-based or fallback)
    try:
        coords = await agent.find_element("Export")
        print(f"Found 'Export' at: {coords}")
        await agent.click(*coords)
    except ValueError as e:
        print(f"Could not find element: {e}")

    # Find element by type
    try:
        coords = await agent.find_element_by_type("button", index=0)
        print(f"Found button at: {coords}")
    except ValueError as e:
        print(f"Could not find button: {e}")


if __name__ == "__main__":
    asyncio.run(demo())
