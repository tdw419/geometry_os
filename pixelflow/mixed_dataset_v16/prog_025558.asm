; DESCRIPTION: Draws a green rectangle at (51, 181) with width 89 and height 70.
; PLAN: r0=51(x), r1=181(y), r2=89(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 181
LDI r2, 89
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
