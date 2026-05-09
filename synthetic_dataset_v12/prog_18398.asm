; DESCRIPTION: Draws a black rectangle at (155, 9) with width 86 and height 66.
; PLAN: r0=155(x), r1=9(y), r2=86(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 9
LDI r2, 86
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
