; DESCRIPTION: Draws a black rectangle at (210, 163) with width 41 and height 43.
; PLAN: r0=210(x), r1=163(y), r2=41(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 163
LDI r2, 41
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
