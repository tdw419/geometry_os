# Proposal: Expansion of PixelRTS Ecosystem
## 1. The Why
Currently, "PixelRTS" is limited to a boot container format. The user has requested to expand this "Linux .rts" concept to other OS subsystems, starting with the clipboard.
This aligns with the **Geometry OS Vision**: "The UI *is* the Computer."
By mapping invisible OS subsystems (Network, Logs, Processes) to visible Hilbert Textures (`.rts`), we create a "Glass Box" OS where the internal state is tangible, visible, and manipulatable by Neural Networks.

## 2. The What
We will define specifications for three new RTS subsystem mappings:
1.  **Clipboard (.clip.rts)**: 
    -   Maps current clipboard content to a transient texture.
    -   Allows "Visual Paste" (drag texture to input).
    -   Persistent history as a filmstrip of textures.

2.  **Network State (.net.rts)**: 
    -   Maps active TCP/UDP flows to a dynamic texture.
    -   X-axis: Port number / IP hash.
    -   Y-axis: Time (scrolling waterfall) or Connection ID.
    -   Color: Traffic type/Intensity.
    -   **Benefit**: Instant visual DDOS detection / traffic shaping via texture painting.

3.  **Process Hive (.hive.rts)**:
    -   Maps PID space to a Hilbert curve.
    -   Each block represents a process.
    -   Brightness = CPU usage.
    -   Hue = User vs Kernel space.
    -   **Benefit**: "See" a hung process as a stuck bright red pixel block; kill it by "erasing" the pixel.

## 3. Implementation Strategy
-   Reuse `rts_rs` FUSE driver logic.
-   Create virtual mount points: `/rts/clip`, `/rts/net`, `/rts/hive`.
-   The kernel (or fuse driver) continuously updates these textures.
-   The Compositor renders them as overlay layers.

## 4. Risks
-   **Performance**: Generating textures 60fps for network traffic is expensive.
    -   *Mitigation*: Use Compute Shaders (WGSL) for the mapping, not CPU.
-   **Usability**: "Erasing a pixel to kill a process" is dangerous if precision is low.
    -   *Mitigation*: Require high-zoom or "Safety Key" confirmation.
