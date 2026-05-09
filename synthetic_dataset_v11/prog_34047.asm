; DESCRIPTION: Draws a black rectangle at (80, 0) with width 44 and height 41.
; PLAN: r0=80(x), r1=0(y), r2=44(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 0
LDI r2, 44
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
