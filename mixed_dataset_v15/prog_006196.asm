; DESCRIPTION: Draws a black rectangle at (100, 155) with width 11 and height 91.
; PLAN: r0=100(x), r1=155(y), r2=11(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 155
LDI r2, 11
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
