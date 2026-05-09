; DESCRIPTION: Draws a black rectangle at (66, 146) with width 53 and height 41.
; PLAN: r0=66(x), r1=146(y), r2=53(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 146
LDI r2, 53
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
