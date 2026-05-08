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

LDI r2, 0x000000      ; clear color
FILL r2               ; wipe screen
LDI r2, 0             ; counter
LDI r13, 10            ; bar X-offset
LDI r11, 50            ; chromatic pixel X
LDI r8, 200           ; Y row (below terminal text band)
LDI r0, 0x00FF00     ; bar color: green

loop:
    ADD  r12, r13, r2   ; bar_x = 10 + counter
    PSET r12, r8, r0  ; spatial bar pixel
    PSET r11,  r8, r2   ; chromatic pixel (blue=counter)
    ADDI r2, 1
    CMPI r2, 100
    JZ   r9, done
    FRAME
    JMP  loop

done:
    HALT
