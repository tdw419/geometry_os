; DESCRIPTION: Draws a black rectangle at (339, 128) with width 69 and height 99.
; PLAN: r0=339(x), r1=128(y), r2=69(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 128
LDI r2, 69
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
