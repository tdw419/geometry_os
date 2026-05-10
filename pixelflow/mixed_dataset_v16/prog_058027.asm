; DESCRIPTION: Draws a blue rectangle at (341, 166) with width 105 and height 85.
; PLAN: r0=341(x), r1=166(y), r2=105(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 166
LDI r2, 105
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
