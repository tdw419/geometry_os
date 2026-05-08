; DESCRIPTION: Geometry OS program to draw a green object.

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

LDI r5, 0x000000      ; clear color
FILL r5               ; wipe screen
LDI r5, 0             ; counter
LDI r10, 10            ; bar X-offset
LDI r4, 50            ; chromatic pixel X
LDI r14, 200           ; Y row (below terminal text band)
LDI r15, 0x00FF00     ; bar color: green

loop:
    ADD  r11, r10, r5   ; bar_x = 10 + counter
    PSET r11, r14, r15  ; spatial bar pixel
    PSET r4,  r14, r5   ; chromatic pixel (blue=counter)
    ADDI r5, 1
    CMPI r5, 100
    JZ   r7, done
    FRAME
    JMP  loop

done:
    HALT
