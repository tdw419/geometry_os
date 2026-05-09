; DESCRIPTION: Draws a black rectangle at (52, 41) with width 33 and height 115.
; PLAN: r0=52(x), r1=41(y), r2=33(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 41
LDI r2, 33
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
