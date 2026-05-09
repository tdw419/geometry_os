; DESCRIPTION: Draws a yellow rectangle at (41, 152) with width 84 and height 66.
; PLAN: r0=41(x), r1=152(y), r2=84(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 152
LDI r2, 84
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
