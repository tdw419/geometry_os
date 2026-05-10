; DESCRIPTION: Draws a green rectangle at (51, 118) with width 99 and height 113.
; PLAN: r0=51(x), r1=118(y), r2=99(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 118
LDI r2, 99
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
