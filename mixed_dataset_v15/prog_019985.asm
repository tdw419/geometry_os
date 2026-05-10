; DESCRIPTION: Draws a magenta rectangle at (175, 52) with width 119 and height 47.
; PLAN: r0=175(x), r1=52(y), r2=119(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 52
LDI r2, 119
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
