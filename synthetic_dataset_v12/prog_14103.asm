; DESCRIPTION: Draws a yellow rectangle at (343, 148) with width 57 and height 41.
; PLAN: r0=343(x), r1=148(y), r2=57(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 148
LDI r2, 57
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
