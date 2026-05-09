; DESCRIPTION: Draws a magenta rectangle at (28, 3) with width 51 and height 84.
; PLAN: r0=28(x), r1=3(y), r2=51(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 3
LDI r2, 51
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
