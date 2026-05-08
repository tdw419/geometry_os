; DESCRIPTION: A green object centered at the screen with fixed size.

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

LDI r11, 0x000000      ; clear color
FILL r11               ; wipe screen
LDI r11, 0             ; counter
LDI r14, 10            ; bar X-offset
LDI r8, 50            ; chromatic pixel X
LDI r12, 200           ; Y row (below terminal text band)
LDI r6, 0x00FF00     ; bar color: green

loop:
    ADD  r15, r14, r11   ; bar_x = 10 + counter
    PSET r15, r12, r6  ; spatial bar pixel
    PSET r8,  r12, r11   ; chromatic pixel (blue=counter)
    ADDI r11, 1
    CMPI r11, 100
    JZ   r3, done
    FRAME
    JMP  loop

done:
    HALT
