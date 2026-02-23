"""Request routing and task classification."""
import re
import logging
from typing import Dict, Any, List, Optional, Literal
from datetime import datetime
from .config import config

logger = logging.getLogger(__name__)


TaskType = Literal["background", "default", "think"]


class TaskClassifier:
    """Classify incoming requests based on task type."""

    def __init__(self, cfg: Optional[config.__class__] = None):
        self.cfg = cfg or config
        self._compile_patterns()

    def _compile_patterns(self):
        """Compile regex patterns from keywords for efficiency."""
        self.background_patterns = [
            re.compile(rf"\b{re.escape(keyword)}\b", re.IGNORECASE)
            for keyword in self.cfg.background_keywords
        ]
        self.default_patterns = [
            re.compile(rf"\b{re.escape(keyword)}\b", re.IGNORECASE)
            for keyword in self.cfg.default_keywords
        ]
        self.think_patterns = [
            re.compile(rf"\b{re.escape(keyword)}\b", re.IGNORECASE)
            for keyword in self.cfg.think_keywords
        ]

    def classify(self, request: Dict[str, Any]) -> TaskType:
        """
        Classify the request based on message content.

        Returns: "background", "default", or "think"
        """
        messages = request.get("messages", [])
        if not messages:
            return "default"

        # Combine all message content for analysis
        combined_content = " ".join(
            msg.get("content", "") for msg in messages
        ).lower()

        # Check for background task indicators (highest priority for local routing)
        for pattern in self.background_patterns:
            if pattern.search(combined_content):
                return "background"

        # Check for think task indicators (complex reasoning)
        for pattern in self.think_patterns:
            if pattern.search(combined_content):
                return "think"

        # Default to standard task
        return "default"

    def get_model_preference(self, task_type: TaskType) -> str:
        """Get the preferred model for a given task type."""
        preferences = {
            "background": "lm_studio",
            "default": "claude",
            "think": "claude",
        }
        return preferences.get(task_type, "claude")


class RequestRouter:
    """Route requests to appropriate backend (Claude API or LM Studio)."""

    def __init__(self, cfg: Optional[config.__class__] = None):
        self.cfg = cfg or config
        self.classifier = TaskClassifier(cfg)
        self._ctrm_available = False
        self._init_ctrm()

    def _init_ctrm(self):
        """Initialize CTRM integration if available."""
        try:
            import sys
            import os
            # Add src to path for imports
            src_path = os.path.join(os.path.dirname(__file__), "..")
            if src_path not in sys.path:
                sys.path.insert(0, src_path)

            from ctrm_core.database import CTRMDatabase
            self._ctrm_db = CTRMDatabase()
            self._ctrm_available = True
            logger.info("CTRM integration enabled")
        except Exception as e:
            logger.warning(f"CTRM integration not available: {e}")
            self._ctrm_available = False

    async def route(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """
        Route a request to the appropriate backend.

        Returns a routing decision dict with:
        - "backend": "claude" or "lm_studio"
        - "task_type": "background", "default", or "think"
        - "reason": explanation of the routing decision
        """
        task_type = self.classifier.classify(request)
        model_preference = self.classifier.get_model_preference(task_type)

        routing_decision = {
            "task_type": task_type,
            "backend": model_preference,
            "timestamp": datetime.now().isoformat(),
        }

        # Determine reason
        if task_type == "background":
            routing_decision["reason"] = "Background task detected - routing to local LM Studio"
        elif task_type == "think":
            routing_decision["reason"] = "Complex reasoning task - routing to Claude API"
        else:
            routing_decision["reason"] = "Standard task - routing to Claude API"

        # Log routing decision
        if self.cfg.log_routing:
            self._log_routing(request, routing_decision)

        # Store in CTRM if available
        if self._ctrm_available:
            await self._store_routing_decision(request, routing_decision)

        return routing_decision

    def _log_routing(self, request: Dict[str, Any], decision: Dict[str, Any]):
        """Log routing decision."""
        messages = request.get("messages", [])
        content_preview = ""
        if messages:
            content = messages[-1].get("content", "")[:100]
            content_preview = content[:97] + "..." if len(content) > 100 else content

        logger.info(
            f"Routing decision: {decision['backend']} | "
            f"Task: {decision['task_type']} | "
            f"Reason: {decision['reason']} | "
            f"Content: {content_preview}"
        )

    async def _store_routing_decision(self, request: Dict[str, Any], decision: Dict[str, Any]):
        """Store routing decision in CTRM for analysis."""
        try:
            import json
            messages = request.get("messages", [])
            content_preview = ""
            if messages:
                content = messages[-1].get("content", "")[:200]
                content_preview = content[:197] + "..." if len(content) > 200 else content

            truth_data = {
                "id": f"routing_{datetime.now().timestamp()}",
                "statement": f"Request routed to {decision['backend']} for {decision['task_type']} task",
                "confidence": 0.8,
                "importance_score": 0.3,
                "category": "routing_decision",
                "metadata": {
                    "task_type": decision["task_type"],
                    "backend": decision["backend"],
                    "reason": decision["reason"],
                    "content_preview": content_preview,
                },
                "created_at": datetime.now(),
                "updated_at": datetime.now(),
            }
            self._ctrm_db.store_truth(truth_data)
        except Exception as e:
            logger.warning(f"Failed to store routing decision in CTRM: {e}")
