; DESCRIPTION: Draws a magenta rectangle at (337, 81) with width 22 and height 85.
; PLAN: r0=337(x), r1=81(y), r2=22(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 81
LDI r2, 22
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
