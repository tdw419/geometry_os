; DESCRIPTION: Draws a magenta rectangle at (141, 61) with width 51 and height 55.
; PLAN: r0=141(x), r1=61(y), r2=51(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 61
LDI r2, 51
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
