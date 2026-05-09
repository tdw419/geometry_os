; DESCRIPTION: Draws a black rectangle at (41, 108) with width 104 and height 98.
; PLAN: r0=41(x), r1=108(y), r2=104(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 108
LDI r2, 104
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
