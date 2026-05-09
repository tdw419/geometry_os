; DESCRIPTION: Draws a black rectangle at (29, 52) with width 26 and height 118.
; PLAN: r0=29(x), r1=52(y), r2=26(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 52
LDI r2, 26
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
