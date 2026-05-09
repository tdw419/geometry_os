; DESCRIPTION: Draws a magenta rectangle at (141, 109) with width 51 and height 26.
; PLAN: r0=141(x), r1=109(y), r2=51(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 109
LDI r2, 51
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
