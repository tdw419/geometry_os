; DESCRIPTION: Draws a black rectangle at (457, 74) with width 41 and height 60.
; PLAN: r0=457(x), r1=74(y), r2=41(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 74
LDI r2, 41
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
