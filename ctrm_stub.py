"""
CTRM Stub Interface
Bypasses CTRM connection errors (422) for development/testing
"""

class CTRMInterface:
    """Stub CTRM interface that simulates CTRM functionality without actual connection"""

    def __init__(self):
        self.stored_truths = {}
        self.truth_counter = 0
        self.connected = True
        print("🔧 CTRM Stub initialized (bypassing actual CTRM connection)")

    async def store_component_truth(self, component):
        """Simulate storing component truth in CTRM"""
        self.truth_counter += 1
        truth_id = f"stub_truth_{self.truth_counter}"

        # Store component info
        self.stored_truths[truth_id] = {
            "component_name": getattr(component, "__name__", "unknown"),
            "component_type": getattr(component, "__doc__", "").split("\n")[0] if hasattr(component, "__doc__") else "unknown",
            "timestamp": "2025-12-11T00:00:00Z",
            "status": "stored"
        }

        print(f"📤 [CTRM STUB] Stored component truth: {truth_id}")
        return truth_id

    async def query_similar_truths(self, vector, threshold=0.7):
        """Simulate querying similar truths from CTRM"""
        # Return empty results for now (no actual vector database)
        print(f"🔍 [CTRM STUB] Querying similar truths with threshold {threshold}")
        return []

    async def disconnect(self):
        """Simulate disconnecting from CTRM"""
        self.connected = False
        print("🔌 [CTRM STUB] Disconnected")

    def get_stored_truths(self):
        """Get all stored truths (for debugging)"""
        return self.stored_truths

    def clear(self):
        """Clear all stored truths"""
        self.stored_truths = {}
        self.truth_counter = 0
        print("🧹 [CTRM STUB] Cleared all stored truths")

# Singleton instance for easy access
ctrm_stub = CTRMInterface()

if __name__ == "__main__":
    # Demo the stub
    print("CTRM Stub Demo")
    print("=" * 30)

    class TestComponent:
        """Test component for demo"""
        pass

    # Test storing
    import asyncio

    async def test():
        truth_id = await ctrm_stub.store_component_truth(TestComponent)
        print(f"Stored truth ID: {truth_id}")

        similar = await ctrm_stub.query_similar_truths([1, 2, 3])
        print(f"Similar truths: {similar}")

        await ctrm_stub.disconnect()

    asyncio.run(test())