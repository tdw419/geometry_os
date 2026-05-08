; DESCRIPTION: The GeOS assembly code renders a visual counter demonstration on row y=200 of the screen. It displays two representations: a spatial bar using 100 green pixels from x=10 to x=109, which can be visually counted by the model due to its length; and a chromatic pixel at (50,200) where the blue channel's intensity represents the counter value, which is not distinguishable for values like 99 vs. 100 by visual inspection.

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

LDI r0, 0x000000      ; clear color
FILL r0               ; wipe screen
LDI r0, 0             ; counter
LDI r7, 10            ; bar X-offset
LDI r14, 50            ; chromatic pixel X
LDI r1, 200           ; Y row (below terminal text band)
LDI r9, 0x00FF00     ; bar color: green

loop:
    ADD  r11, r7, r0   ; bar_x = 10 + counter
    PSET r11, r1, r9  ; spatial bar pixel
    PSET r14,  r1, r0   ; chromatic pixel (blue=counter)
    ADDI r0, 1
    CMPI r0, 100
    JZ   r2, done
    FRAME
    JMP  loop

done:
    HALT
