; DESCRIPTION: Draws a black rectangle at (125, 181) with width 41 and height 17.
; PLAN: r0=125(x), r1=181(y), r2=41(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 181
LDI r2, 41
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
