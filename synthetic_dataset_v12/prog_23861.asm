; DESCRIPTION: Draws a black rectangle at (455, 49) with width 41 and height 34.
; PLAN: r0=455(x), r1=49(y), r2=41(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 49
LDI r2, 41
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
