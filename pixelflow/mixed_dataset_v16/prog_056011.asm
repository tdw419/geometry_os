; DESCRIPTION: Draws a magenta rectangle at (312, 76) with width 100 and height 25.
; PLAN: r0=312(x), r1=76(y), r2=100(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 76
LDI r2, 100
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
