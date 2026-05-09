; DESCRIPTION: Draws a magenta rectangle at (114, 63) with width 80 and height 115.
; PLAN: r0=114(x), r1=63(y), r2=80(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 63
LDI r2, 80
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
