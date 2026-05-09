; DESCRIPTION: Draws a magenta rectangle at (337, 53) with width 101 and height 75.
; PLAN: r0=337(x), r1=53(y), r2=101(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 53
LDI r2, 101
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
