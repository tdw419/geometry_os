# Visual Design: The Glass Box Subsystems

## 1. Clipboard (.clip.rts)
**Concept**: "Data Fragments"
-   **Visual**: Small 64x64 or 128x128 tiles floating on the left edge of the screen.
-   **Texture**: Hilbert-mapped text. ASCII looks like structured noise; Images look like downsampled thumbnails.
-   **Interaction**: Drag a tile into a terminal or text field to "Paste".

## 2. Network (.net.rts)
**Concept**: "The Digital Ether"
-   **Visual**: A scrolling "Waterfall" or "Spectrogram" at the bottom edge.
-   **Mapping**: 
    -   R channel: Inbound traffic size.
    -   G channel: Outbound traffic size.
    -   B channel: Latency/Errors.
-   **Aesthetic**: Matrix digital rain meets radio spectrogram.

## 3. Process Hive (.hive.rts)
**Concept**: "The Living substrate"
-   **Visual**: A Hilbert Matrix in the top-right corner.
-   **Mapping**:
    -   Position: PID (Process ID) mapped via Hilbert Curve.
    -   Color: 
        -   Green: Normal running.
        -   Blue: Sleeping/Idle.
        -   Red: High CPU / Stuck.
        -   Grey: Zombie.
-   **Interaction**: Hover to see PID/Name. Click "Zap" to kill.

## PAS Impact
-   **Score**: Neutral (0.0). These are visualizations of *existing* state, not new arbitrary geometry.
-   **Texture Size**: Power-of-two textures (128², 256²) compliant with PixelRTS.
