; DESCRIPTION: Draws a magenta rectangle at (79, 54) with width 15 and height 56.
; PLAN: r0=79(x), r1=54(y), r2=15(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 54
LDI r2, 15
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
