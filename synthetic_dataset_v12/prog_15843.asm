; DESCRIPTION: Draws a black rectangle at (429, 37) with width 66 and height 41.
; PLAN: r0=429(x), r1=37(y), r2=66(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 37
LDI r2, 66
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
