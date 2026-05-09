; DESCRIPTION: Draws a yellow rectangle at (191, 41) with width 84 and height 21.
; PLAN: r0=191(x), r1=41(y), r2=84(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 41
LDI r2, 84
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
