; DESCRIPTION: Draws a white rectangle at (441, 166) with width 63 and height 47.
; PLAN: r0=441(x), r1=166(y), r2=63(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 166
LDI r2, 63
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
