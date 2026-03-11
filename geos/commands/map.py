"""geos map - ASCII map visualization."""

import time
import sys


def run(args) -> int:
    """Render ASCII map visualization."""
    try:
        from geos.backends.hilbert import HilbertRenderer

        renderer = HilbertRenderer()

        if args.watch:
            return _run_watch(renderer, args)
        else:
            map_str = renderer.render_ascii(
                view=args.view,
                zoom=args.zoom
            )
            print(map_str)
            return 0

    except Exception as e:
        print(f"Error rendering map: {e}")
        return 1


def _run_watch(renderer, args) -> int:
    """Run with live updates."""
    try:
        while True:
            # Clear screen
            print("\033[2J\033[H", end="")

            map_str = renderer.render_ascii(
                view=args.view,
                zoom=args.zoom
            )
            print(map_str)
            print("\nPress Ctrl+C to stop...")

            time.sleep(2)

    except KeyboardInterrupt:
        print("\nStopped.")
        return 0
