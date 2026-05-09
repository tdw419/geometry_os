; DESCRIPTION: Draws a magenta rectangle at (115, 136) with width 56 and height 54.
; PLAN: r0=115(x), r1=136(y), r2=56(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 136
LDI r2, 56
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
