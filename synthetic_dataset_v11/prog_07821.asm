; DESCRIPTION: Draws a green rectangle at (84, 54) with width 96 and height 84.
; PLAN: r0=84(x), r1=54(y), r2=96(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 54
LDI r2, 96
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
