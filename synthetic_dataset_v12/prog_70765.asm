; DESCRIPTION: Draws a black rectangle at (310, 41) with width 28 and height 34.
; PLAN: r0=310(x), r1=41(y), r2=28(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 41
LDI r2, 28
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
