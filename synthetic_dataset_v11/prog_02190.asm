; DESCRIPTION: Draws a black rectangle at (178, 170) with width 20 and height 62.
; PLAN: r0=178(x), r1=170(y), r2=20(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 170
LDI r2, 20
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
