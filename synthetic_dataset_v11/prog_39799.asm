; DESCRIPTION: Draws a green rectangle at (6, 56) with width 96 and height 49.
; PLAN: r0=6(x), r1=56(y), r2=96(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 56
LDI r2, 96
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
