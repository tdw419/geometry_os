; DESCRIPTION: Draws a black rectangle at (41, 107) with width 21 and height 53.
; PLAN: r0=41(x), r1=107(y), r2=21(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 107
LDI r2, 21
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
