; DESCRIPTION: Draws a blue rectangle at (341, 166) with width 97 and height 49.
; PLAN: r0=341(x), r1=166(y), r2=97(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 166
LDI r2, 97
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
