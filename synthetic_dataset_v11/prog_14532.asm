; DESCRIPTION: Draws a black rectangle at (65, 123) with width 62 and height 92.
; PLAN: r0=65(x), r1=123(y), r2=62(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 123
LDI r2, 62
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
