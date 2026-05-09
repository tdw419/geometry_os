; DESCRIPTION: Draws a magenta rectangle at (28, 1) with width 118 and height 66.
; PLAN: r0=28(x), r1=1(y), r2=118(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 1
LDI r2, 118
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
