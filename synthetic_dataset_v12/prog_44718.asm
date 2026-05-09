; DESCRIPTION: Draws a black rectangle at (70, 49) with width 89 and height 52.
; PLAN: r0=70(x), r1=49(y), r2=89(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 49
LDI r2, 89
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
