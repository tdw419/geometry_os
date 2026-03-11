# Solution for Task: Overlay is created with proper styling

Here is the implementation plan for **Phase 40**, focusing on the creation of the visual overlay components required to display the CPU state and console output within the PixiJS environment.

### 1. File Paths

**New File to Create:**
*   `systems/visual_shell/web/assets/overlay_styles.css`
    *(Defines the styling for the CPU and console overlays to ensure they float correctly over the PixiJS canvas)*

**Files to Modify:**
*   `systems/visual_shell/web/index.html`
    *(To include the new CSS and the container DOM elements)*
*   `systems/visual_shell/web/infinite_map.js`
    *(To handle the resize logic ensuring the PixiJS view sits behind the HTML overlay)*

---

### 2. Implementation Code

#### **File: `systems/visual_shell/web/assets/overlay_styles.css`**
This CSS ensures the UI sits on top of the canvas without blocking interactions unnecessarily, using a "glassmorphism" aesthetic consistent with Geometry OS.

```css
/* systems/visual_shell/web/assets/overlay_styles.css */

:root {
  --os-bg-color: rgba(10, 10, 15, 0.85);
  --os-text-color: #00ffcc;
  --os-border-color: rgba(0, 255, 204, 0.3);
  --os-font-mono: 'Courier New', Courier, monospace;
}

body, html {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background-color: #000;
}

/* Container for the entire UI layer */
#ui-layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none; /* Let clicks pass through to PixiJS canvas where empty */
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  z-index: 10;
}

/* CPU Status Panel (Top Right) */
#cpu-status {
  pointer-events: auto;
  position: absolute;
  top: 20px;
  right: 20px;
  width: 280px;
  background: var(--os-bg-color);
  border: 1px solid var(--os-border-color);
  border-radius: 4px;
  padding: 15px;
  font-family: var(--os-font-mono);
  color: var(--os-text-color);
  box-shadow: 0 0 15px rgba(0, 255, 204, 0.1);
  backdrop-filter: blur(4px);
}

.cpu-row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
  font-size: 14px;
}

.cpu-label {
  opacity: 0.7;
}

.cpu-value {
  font-weight: bold;
}

/* Console Output (Bottom Left) */
#system-console {
  pointer-events: auto;
  position: absolute;
  bottom: 20px;
  left: 20px;
  width: 600px;
  height: 200px;
  background: var(--os-bg-color);
  border: 1px solid var(--os-border-color);
  border-radius: 4px;
  padding: 10px;
  font-family: var(--os-font-mono);
  color: #fff;
  font-size: 12px;
  overflow-y: auto;
  box-shadow: 0 0 15px rgba(0, 255, 204, 0.1);
}

.log-entry {
  margin: 2px 0;
}
.log-entry.kernel { color: #ffcc00; }
.log-entry.user { color: #ffffff; }
```

#### **Modification: `systems/visual_shell/web/index.html`**
Add the UI layer structure inside the `<body>`.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Geometry OS - Visual Shell</title>
    <!-- Link the new overlay styles -->
    <link rel="stylesheet" href="assets/overlay_styles.css">
</head>
<body>
    <!-- The PixiJS Canvas is injected here by the app -->
    
    <!-- The UI Overlay Layer -->
    <div id="ui-layer">
        <!-- CPU State Visualization -->
        <div id="cpu-status">
            <div style="text-align:center; border-bottom:1px solid var(--os-border-color); margin-bottom:10px; padding-bottom:5px;">
                PIXEL CPU
            </div>
            <div class="cpu-row">
                <span class="cpu-label">PC:</span>
                <span class="cpu-value" id="cpu-pc">0x00000000</span>
            </div>
            <div class="cpu-row">
                <span class="cpu-label">Registers:</span>
                <span class="cpu-value" id="cpu-regs">...</span>
            </div>
            <div class="cpu-row">
                <span class="cpu-label">State:</span>
                <span class="cpu-value" id="cpu-state" style="color: #0f0">HALTED</span>
            </div>
        </div>

        <!-- System Console -->
        <div id="system-console">
            <div class="log-entry kernel">Geometry OS Kernel v0.1.0 initialized...</div>
            <div class="log-entry kernel">Waiting for .brick file...</div>
        </div>
    </div>

    <script type="module" src="main.js"></script>
</body>
</html>
```

---

### 3. Next Step

**Command:**
```bash
mkdir -p systems/visual_shell/web/assets
touch systems/visual_shell/web/assets/overlay_styles.css
```

**Action:**
Copy the CSS content provided above into `overlay_styles.css` and update your `index.html` to include the link tag and the HTML structure. This will establish the visual container ("The Overlay") necessary for the next phase of integration.