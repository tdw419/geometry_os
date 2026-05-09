; DESCRIPTION: Draws a magenta rectangle at (0, 51) with width 89 and height 81.
; PLAN: r0=0(x), r1=51(y), r2=89(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 51
LDI r2, 89
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
