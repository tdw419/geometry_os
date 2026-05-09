; DESCRIPTION: Draws a yellow rectangle at (94, 102) with width 18 and height 41.
; PLAN: r0=94(x), r1=102(y), r2=18(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 102
LDI r2, 18
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
