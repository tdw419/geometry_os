; DESCRIPTION: Draws a yellow rectangle at (97, 172) with width 117 and height 21.
; PLAN: r0=97(x), r1=172(y), r2=117(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 172
LDI r2, 117
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
