import subprocess
import json
import re
import os

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

def generate_ascii_view():
    window = get_focused_window()
    if not window:
        # Fallback empty
        return "ERROR: Could not get focused window.", {}

    # Define ASCII grid size
    grid_w, grid_h = 80, 24
    grid = [[" " for _ in range(grid_w)] for _ in range(grid_h)]

    # Draw window boundary
    for i in range(grid_w):
        grid[0][i] = "-"
        grid[grid_h-1][i] = "-"
    for i in range(grid_h):
        grid[i][0] = "|"
        grid[i][grid_w-1] = "|"
    
    # Corners
    grid[0][0] = "+"
    grid[0][grid_w-1] = "+"
    grid[grid_h-1][0] = "+"
    grid[grid_h-1][grid_w-1] = "+"

    # Simple child scanning via xwininfo
    bindings = {}
    label_idx = 0
    labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    try:
        children_info = subprocess.check_output(["xwininfo", "-children", "-id", window["id"]]).decode()
        # Find lines like: 0x1234567 "name": ("class" "class") 100x200+10+20  +10+20
        # Using single quotes for regex string to allow double quotes inside
        pattern = r'(0x[0-9a-fA-F]+)\s+".*?":\s+\(".*?"\s+".*?"\)\s+(\d+)x(\d+)\+(\d+)\+(\d+)'
        matches = re.finditer(pattern, children_info)
        
        for match in matches:
            if label_idx >= len(labels): break
            child_id, cw, ch, cx, cy = match.groups()
            cw, ch, cx, cy = int(cw), int(ch), int(cx), int(cy)
            
            # Map screen coords to grid coords (relative to window)
            # cx, cy are relative to parent window in xwininfo output for children
            
            # Check if child is within bounds
            if cw > 0 and ch > 0:
                gx = int((cx / window["w"]) * grid_w)
                gy = int((cy / window["h"]) * grid_h)
                
                if 0 < gx < grid_w-1 and 0 < gy < grid_h-1:
                    char = labels[label_idx]
                    grid[gy][gx] = char
                    bindings[char] = {
                        "id": child_id,
                        # Absolute screen coords for clicking
                        "x": window["x"] + cx + (cw // 2),
                        "y": window["y"] + cy + (ch // 2),
                        "w": cw,
                        "h": ch
                    }
                    label_idx += 1

    except Exception:
        pass

    ascii_str = "\n".join(["".join(row) for row in grid])
    return ascii_str, bindings

if __name__ == "__main__":
    ascii_view, bindings = generate_ascii_view()
    print("--- ASCII MAP ---")
    print(ascii_view)
    print("--- BINDINGS ---")
    print(json.dumps(bindings, indent=2))
