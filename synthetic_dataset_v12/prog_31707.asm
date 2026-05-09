; DESCRIPTION: Draws a green rectangle at (341, 145) with width 101 and height 30.
; PLAN: r0=341(x), r1=145(y), r2=101(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 145
LDI r2, 101
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
