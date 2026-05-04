; ==========================================================
; BOUNDARY DEMO: Spatial Encoding vs. Chromatic Encoding
; ==========================================================
; Renders a counter two ways on row y=200 (below terminal text):
;  1. SPATIAL BAR (good): 100 green pixels, x=10..109.
;     A vision model can count pixel length to verify state.
;  2. CHROMATIC DOT (bad): one pixel at (120,200) whose blue
;     channel = counter value (red base 0xFF0000 | counter).
;     Always visible as a red dot, but blue=99 vs blue=100
;     is imperceptible — vision model cannot verify exact state.
; ==========================================================

LDI r1, 0x000000      ; color: black
FILL r1               ; wipe screen
LDI r1, 0             ; counter (0-99)
LDI r5, 10            ; bar X start
LDI r3, 120           ; chromatic dot X (offset right of bar)
LDI r4, 200           ; Y row (safe from terminal text)
LDI r10, 0x00FF00     ; bar color: green
LDI r6, 0xFF0000      ; chromatic base: red (always visible)

loop:
    ; -- Spatial bar: green pixel, one per counter tick --
    PSET r5, r4, r10

    ; -- Chromatic dot: red | counter (counter in blue channel) --
    MOV r7, r6          ; r7 = 0xFF0000 (red base)
    OR r7, r1           ; r7 = 0xFF0000 | counter
    PSET r3, r4, r7     ; always visible, blue varies 0-99

    ADDI r5, 1          ; advance bar X
    ADDI r1, 1          ; increment counter

    CMPI r1, 100        ; compare counter with 100
    JZ r0, done         ; r0=0 when equal -> exit loop

    FRAME               ; yield to host for rendering
    JMP loop

done:
    HALT
