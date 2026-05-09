; DESCRIPTION: Draws a black rectangle at (132, 123) with width 31 and height 43.
; PLAN: r0=132(x), r1=123(y), r2=31(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 123
LDI r2, 31
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
