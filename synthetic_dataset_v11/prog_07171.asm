; DESCRIPTION: Draws a black rectangle at (139, 123) with width 108 and height 87.
; PLAN: r0=139(x), r1=123(y), r2=108(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 123
LDI r2, 108
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
