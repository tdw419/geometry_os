; DESCRIPTION: Draws a magenta rectangle at (425, 141) with width 81 and height 51.
; PLAN: r0=425(x), r1=141(y), r2=81(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 141
LDI r2, 81
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
