; DESCRIPTION: Draws a magenta rectangle at (51, 145) with width 99 and height 31.
; PLAN: r0=51(x), r1=145(y), r2=99(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 145
LDI r2, 99
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
