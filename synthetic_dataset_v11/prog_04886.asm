; DESCRIPTION: Draws a black rectangle at (192, 41) with width 12 and height 114.
; PLAN: r0=192(x), r1=41(y), r2=12(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 41
LDI r2, 12
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
