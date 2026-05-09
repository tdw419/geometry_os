; DESCRIPTION: Draws a red rectangle at (56, 118) with width 43 and height 81.
; PLAN: r0=56(x), r1=118(y), r2=43(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 118
LDI r2, 43
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
