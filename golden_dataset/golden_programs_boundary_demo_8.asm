; DESCRIPTION: Draw object: pos=the screen, color=green, size=fixed size.

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

LDI r3, 0x000000      ; clear color
FILL r3               ; wipe screen
LDI r3, 0             ; counter
LDI r10, 10            ; bar X-offset
LDI r9, 50            ; chromatic pixel X
LDI r0, 200           ; Y row (below terminal text band)
LDI r5, 0x00FF00     ; bar color: green

loop:
    ADD  r4, r10, r3   ; bar_x = 10 + counter
    PSET r4, r0, r5  ; spatial bar pixel
    PSET r9,  r0, r3   ; chromatic pixel (blue=counter)
    ADDI r3, 1
    CMPI r3, 100
    JZ   r13, done
    FRAME
    JMP  loop

done:
    HALT
