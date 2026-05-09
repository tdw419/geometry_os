; DESCRIPTION: Draws a magenta rectangle at (36, 66) with width 79 and height 100.
; PLAN: r0=36(x), r1=66(y), r2=79(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 66
LDI r2, 79
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
