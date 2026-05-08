; DESCRIPTION: Draws a green object at the screen with fixed size.

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

LDI r10, 0x000000      ; clear color
FILL r10               ; wipe screen
LDI r10, 0             ; counter
LDI r8, 10            ; bar X-offset
LDI r14, 50            ; chromatic pixel X
LDI r0, 200           ; Y row (below terminal text band)
LDI r12, 0x00FF00     ; bar color: green

loop:
    ADD  r6, r8, r10   ; bar_x = 10 + counter
    PSET r6, r0, r12  ; spatial bar pixel
    PSET r14,  r0, r10   ; chromatic pixel (blue=counter)
    ADDI r10, 1
    CMPI r10, 100
    JZ   r1, done
    FRAME
    JMP  loop

done:
    HALT
