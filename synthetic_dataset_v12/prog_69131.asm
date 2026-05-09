; DESCRIPTION: Draws a black rectangle at (47, 62) with width 22 and height 29.
; PLAN: r0=47(x), r1=62(y), r2=22(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 62
LDI r2, 22
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
