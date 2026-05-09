; DESCRIPTION: Draws a magenta rectangle at (194, 75) with width 105 and height 81.
; PLAN: r0=194(x), r1=75(y), r2=105(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 75
LDI r2, 105
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
