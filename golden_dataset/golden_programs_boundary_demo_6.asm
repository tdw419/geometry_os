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

LDI r15, 0x000000      ; clear color
FILL r15               ; wipe screen
LDI r15, 0             ; counter
LDI r2, 10            ; bar X-offset
LDI r11, 50            ; chromatic pixel X
LDI r3, 200           ; Y row (below terminal text band)
LDI r7, 0x00FF00     ; bar color: green

loop:
    ADD  r14, r2, r15   ; bar_x = 10 + counter
    PSET r14, r3, r7  ; spatial bar pixel
    PSET r11,  r3, r15   ; chromatic pixel (blue=counter)
    ADDI r15, 1
    CMPI r15, 100
    JZ   r5, done
    FRAME
    JMP  loop

done:
    HALT
