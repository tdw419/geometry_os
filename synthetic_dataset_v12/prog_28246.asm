; DESCRIPTION: Draws a black rectangle at (364, 30) with width 108 and height 110.
; PLAN: r0=364(x), r1=30(y), r2=108(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 30
LDI r2, 108
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
