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

LDI r13, 0x000000      ; clear color
FILL r13               ; wipe screen
LDI r13, 0             ; counter
LDI r3, 10            ; bar X-offset
LDI r15, 50            ; chromatic pixel X
LDI r11, 200           ; Y row (below terminal text band)
LDI r12, 0x00FF00     ; bar color: green

loop:
    ADD  r10, r3, r13   ; bar_x = 10 + counter
    PSET r10, r11, r12  ; spatial bar pixel
    PSET r15,  r11, r13   ; chromatic pixel (blue=counter)
    ADDI r13, 1
    CMPI r13, 100
    JZ   r4, done
    FRAME
    JMP  loop

done:
    HALT
