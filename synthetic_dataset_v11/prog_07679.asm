; DESCRIPTION: Draws a magenta rectangle at (84, 100) with width 51 and height 100.
; PLAN: r0=84(x), r1=100(y), r2=51(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 100
LDI r2, 51
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
