; DESCRIPTION: Draws a magenta rectangle at (67, 110) with width 49 and height 52.
; PLAN: r0=67(x), r1=110(y), r2=49(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 110
LDI r2, 49
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
