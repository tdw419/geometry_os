; DESCRIPTION: Render a green object at the screen.

; ==========================================================
; BOUNDARY DEMO: Semantic Labeling vs. Chromatic Arithmetic
; ==========================================================
; Renders a counter two ways on row y=200 (below terminal text):
;  1. SPATIAL BAR (good): 100 green pixels, x=10..109. The
;     vision model can count length / see fill level.
;  2. CHROMATIC PIXEL (bad): one pixel at (50,200) whose blue
;     channel = counter value. The vision model cannot
;     decompose blue=99 vs blue=100 by eye.
; ==========================================================

LDI r8, 0x000000      ; clear color
FILL r8               ; wipe screen
LDI r8, 0             ; counter
LDI r10, 10            ; bar X-offset
LDI r4, 50            ; chromatic pixel X
LDI r14, 200           ; Y row (below terminal text band)
LDI r9, 0x00FF00     ; bar color: green

loop:
    ADD  r3, r10, r8   ; bar_x = 10 + counter
    PSET r3, r14, r9  ; spatial bar pixel
    PSET r4,  r14, r8   ; chromatic pixel (blue=counter)
    ADDI r8, 1
    CMPI r8, 100
    JZ   r5, done
    FRAME
    JMP  loop

done:
    HALT
