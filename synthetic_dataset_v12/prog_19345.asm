; DESCRIPTION: Draws a green rectangle at (91, 51) with width 101 and height 22.
; PLAN: r0=91(x), r1=51(y), r2=101(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 51
LDI r2, 101
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
