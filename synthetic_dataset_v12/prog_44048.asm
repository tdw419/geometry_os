; DESCRIPTION: Draws a magenta rectangle at (227, 11) with width 56 and height 35.
; PLAN: r0=227(x), r1=11(y), r2=56(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 11
LDI r2, 56
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
