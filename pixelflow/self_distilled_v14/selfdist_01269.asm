; DESCRIPTION: Draws a magenta rectangle at (212, 115) with width 81 and height 100.
; PLAN: r0=212(x), r1=115(y), r2=81(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 115
LDI r2, 81
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
