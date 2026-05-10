; DESCRIPTION: Draws a white rectangle at (140, 166) with width 17 and height 60.
; PLAN: r0=140(x), r1=166(y), r2=17(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 166
LDI r2, 17
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
