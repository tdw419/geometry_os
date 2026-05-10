; DESCRIPTION: Draws a magenta rectangle at (337, 16) with width 119 and height 49.
; PLAN: r0=337(x), r1=16(y), r2=119(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 16
LDI r2, 119
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
