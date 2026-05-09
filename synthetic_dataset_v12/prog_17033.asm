; DESCRIPTION: Draws a magenta rectangle at (54, 102) with width 100 and height 51.
; PLAN: r0=54(x), r1=102(y), r2=100(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 102
LDI r2, 100
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
