; DESCRIPTION: Draws a black rectangle at (14, 118) with width 89 and height 35.
; PLAN: r0=14(x), r1=118(y), r2=89(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 118
LDI r2, 89
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
