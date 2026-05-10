; DESCRIPTION: Draws a black rectangle at (144, 174) with width 22 and height 11.
; PLAN: r0=144(x), r1=174(y), r2=22(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 174
LDI r2, 22
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
