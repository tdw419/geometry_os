"""geos inspect - Inspect Hilbert sectors."""


def run(args) -> int:
    """Inspect a Hilbert sector."""
    try:
        from geos.backends.hilbert import HilbertInspector

        inspector = HilbertInspector()
        result = inspector.inspect(args.address, args.format)
        print(result)
        return 0

    except Exception as e:
        print(f"Error inspecting sector: {e}")
        return 1
