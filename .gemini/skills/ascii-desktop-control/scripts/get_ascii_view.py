import subprocess
import json
import re
import os
import tempfile


def get_focused_window():
    try:
        # Get active window ID
        window_id = subprocess.check_output(["xdotool", "getactivewindow"]).decode().strip()
        # Get window info
        info = subprocess.check_output(["xwininfo", "-id", window_id]).decode()

        # Parse geometry
        geometry = re.search(r"-geometry\s+(\d+)x(\d+)\+(\d+)\+(\d+)", info)
        if geometry:
            w, h, x, y = map(int, geometry.groups())
            return {"id": window_id, "w": w, "h": h, "x": x, "y": y, "name": "Active Window"}
    except Exception as e:
        return None


def detect_black_box_window(window_id):
    """Detect if window has no accessible children (black box like browser/Electron)."""
    try:
        children_info = subprocess.check_output(
            ["xwininfo", "-children", "-id", window_id],
            stderr=subprocess.DEVNULL
        ).decode()

        # Count child windows with meaningful geometry
        pattern = r'(0x[0-9a-fA-F]+)\s+".*?":\s+\(".*?"\s+".*?"\)\s+(\d+)x(\d+)\+(\d+)\+(\d+)'
        matches = list(re.finditer(pattern, children_info))

        # If fewer than 2 accessible children, treat as black box
        return len(matches) < 2
    except Exception:
        return True  # Assume black box on error


def capture_screenshot_ascii(window=None, grid_w=80, grid_h=24):
    """Capture window screenshot and convert to ASCII using ImageMagick."""
    try:
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as tmp:
            tmp_path = tmp.name

        # Capture window screenshot
        if window:
            subprocess.run(
                ["import", "-window", window['id'], tmp_path],
                check=True,
                capture_output=True,
                timeout=10
            )
        else:
            # Capture root window (full screen)
            subprocess.run(
                ["import", "-window", "root", tmp_path],
                check=True,
                capture_output=True,
                timeout=10
            )

        # Convert to ASCII using ImageMagick
        # Resize to grid dimensions, convert to grayscale, then ASCII
        result = subprocess.check_output([
            "convert", tmp_path,
            "-resize", f"{grid_w}x{grid_h}!",
            "-colorspace", "Gray",
            "-contrast-stretch", "0%",
            "txt:-"
        ], timeout=10).decode()

        # Parse ImageMagick output to ASCII characters
        ascii_chars = " .:-=+*#%@"
        lines = []
        current_line = []

        for line in result.split('\n'):
            if "gray" in line.lower():
                # Extract gray value - handle both "gray(128)" and "gray(16.7742%)" formats
                match = re.search(r'gray\((\d+(?:\.\d+)?%?)\)', line, re.IGNORECASE)
                if match:
                    val_str = match.group(1)
                    is_percent = '%' in val_str
                    val = float(val_str.rstrip('%'))

                    if is_percent:
                        # Percentage: 0-100%
                        gray_val = int((val / 100.0) * 255)
                    else:
                        # Absolute: 0-255
                        gray_val = int(val)

                    # Map 0-255 to ASCII character
                    char_idx = int((gray_val / 255) * (len(ascii_chars) - 1))
                    current_line.append(ascii_chars[char_idx])

                    if len(current_line) >= grid_w:
                        lines.append(''.join(current_line[:grid_w]))
                        current_line = []

        # Clean up temp file
        os.unlink(tmp_path)

        return '\n'.join(lines[:grid_h])

    except Exception as e:
        return f"Screenshot capture failed: {e}"


def generate_ascii_view():
    """Generate ASCII view of focused window with smart fallback."""
    window = get_focused_window()
    if not window:
        return "ERROR: Could not get focused window.", {}

    grid_w, grid_h = 80, 24
    bindings = {}
    use_screenshot = False

    # Check if this is a black-box window
    if detect_black_box_window(window['id']):
        use_screenshot = True
        ascii_view = capture_screenshot_ascii(window, grid_w, grid_h)
    else:
        # Traditional X11 child scanning
        grid = [[" " for _ in range(grid_w)] for _ in range(grid_h)]

        # Draw window boundary
        for i in range(grid_w):
            grid[0][i] = "-"
            grid[grid_h-1][i] = "-"
        for i in range(grid_h):
            grid[i][0] = "|"
            grid[i][grid_w-1] = "|"

        grid[0][0] = grid[0][grid_w-1] = "+"
        grid[grid_h-1][0] = grid[grid_h-1][grid_w-1] = "+"

        label_idx = 0
        labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

        try:
            children_info = subprocess.check_output(
                ["xwininfo", "-children", "-id", window["id"]]
            ).decode()

            pattern = r'(0x[0-9a-fA-F]+)\s+".*?":\s+\(".*?"\s+".*?"\)\s+(\d+)x(\d+)\+(\d+)\+(\d+)'
            matches = re.finditer(pattern, children_info)

            for match in matches:
                if label_idx >= len(labels):
                    break
                child_id, cw, ch, cx, cy = match.groups()
                cw, ch, cx, cy = int(cw), int(ch), int(cx), int(cy)

                if cw > 0 and ch > 0:
                    gx = int((cx / window["w"]) * grid_w)
                    gy = int((cy / window["h"]) * grid_h)

                    if 0 < gx < grid_w-1 and 0 < gy < grid_h-1:
                        char = labels[label_idx]
                        grid[gy][gx] = char
                        bindings[char] = {
                            "id": child_id,
                            "x": window["x"] + cx + (cw // 2),
                            "y": window["y"] + cy + (ch // 2),
                            "w": cw,
                            "h": ch
                        }
                        label_idx += 1

        except Exception:
            use_screenshot = True
            ascii_view = capture_screenshot_ascii(window, grid_w, grid_h)

        if not use_screenshot:
            ascii_view = "\n".join(["".join(row) for row in grid])

    # Add metadata header
    header = f"WINDOW: {window['id']} | SIZE: {window['w']}x{window['h']} | MODE: {'screenshot' if use_screenshot else 'x11'}\n"
    return header + ascii_view, bindings

if __name__ == "__main__":
    ascii_view, bindings = generate_ascii_view()
    print("--- ASCII MAP ---")
    print(ascii_view)
    print("--- BINDINGS ---")
    print(json.dumps(bindings, indent=2))
