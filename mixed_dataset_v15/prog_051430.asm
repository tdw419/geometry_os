; DESCRIPTION: Draws a black rectangle at (414, 162) with width 20 and height 43.
; PLAN: r0=414(x), r1=162(y), r2=20(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 162
LDI r2, 20
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
