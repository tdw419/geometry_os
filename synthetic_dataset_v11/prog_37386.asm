; DESCRIPTION: Draws a magenta rectangle at (137, 141) with width 84 and height 87.
; PLAN: r0=137(x), r1=141(y), r2=84(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 141
LDI r2, 84
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
