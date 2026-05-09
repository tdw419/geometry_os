; DESCRIPTION: Draws a yellow rectangle at (141, 136) with width 41 and height 63.
; PLAN: r0=141(x), r1=136(y), r2=41(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 136
LDI r2, 41
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
