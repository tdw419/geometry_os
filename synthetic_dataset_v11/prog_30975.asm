; DESCRIPTION: Draws a black rectangle at (125, 41) with width 114 and height 112.
; PLAN: r0=125(x), r1=41(y), r2=114(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 41
LDI r2, 114
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
