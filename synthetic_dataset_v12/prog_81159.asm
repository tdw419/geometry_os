; DESCRIPTION: Draws a black rectangle at (91, 54) with width 51 and height 89.
; PLAN: r0=91(x), r1=54(y), r2=51(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 54
LDI r2, 51
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
