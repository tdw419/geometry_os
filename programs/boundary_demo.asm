; ==========================================================
; BOUNDARY DEMO: Semantic Labeling vs. Chromatic Arithmetic
; ==========================================================
; This program renders a counter in two ways:
; 1. SPATIAL/STATE (The Good): A 1D bar where each pixel is a 
;    discrete state. Adjacency = Value proximity.
; 2. ARITHMETIC (The Bad): A single pixel where the value is 
;    encoded directly into the RGB components.
; ==========================================================

.org 0x1000
:main
    LDI r1, 0           ; r1 = The Counter (0-255)
    LDI r2, 10          ; r2 = X offset for Spatial Bar
    LDI r3, 50          ; r3 = X offset for Arithmetic Pixel
    LDI r4, 32          ; r4 = Y position

:loop
    ; --- 1. SPATIAL/STATE RENDERING ---
    ; We draw a bar. Each tick, we add a pixel of a DISCRETE color.
    ; The Vision Model can count these pixels or see the "fill level".
    LDI r10, 0x00FF00   ; Color: Green (State: Healthy/Active)
    ADD r11, r2, r1     ; X = Offset + Counter
    PSET r11, r4, r10   ; Draw the "State Bar"

    ; --- 2. CHROMATIC ARITHMETIC (The Failure Point) ---
    ; We encode the raw value into the Blue channel.
    ; A Vision Model cannot reliably distinguish 0x000040 from 0x000041.
    MOV r12, r1         ; r12 = Blue value (0-255)
    PSET r3, r4, r12    ; Draw the "Mixed Pixel"

    ; --- 3. HILBERT MAPPING (The Geometry OS Way) ---
    ; [Placeholder for future: Actual Hilbert LUT lookup]
    ; For now, we simulate spatial locality by moving a 2x2 block
    ; based on the counter bits.
    ; [Logic omitted for brevity in demo]

    ; --- LOOP CONTROL ---
    ADDI r1, r1, 1      ; Increment counter
    CMPI r1, 100        ; Stop at 100
    JZ r0, :done
    
    FRAME               ; Yield to GPU
    JMP :loop

:done
    HALT
