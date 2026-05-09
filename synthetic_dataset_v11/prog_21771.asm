; DESCRIPTION: Draws a magenta rectangle at (145, 29) with width 96 and height 95.
; PLAN: r0=145(x), r1=29(y), r2=96(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 29
LDI r2, 96
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
