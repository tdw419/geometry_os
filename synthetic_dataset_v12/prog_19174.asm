; DESCRIPTION: Draws a magenta rectangle at (96, 11) with width 101 and height 118.
; PLAN: r0=96(x), r1=11(y), r2=101(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 11
LDI r2, 101
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
