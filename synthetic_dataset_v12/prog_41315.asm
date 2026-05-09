; DESCRIPTION: Draws a black rectangle at (55, 43) with width 58 and height 58.
; PLAN: r0=55(x), r1=43(y), r2=58(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 43
LDI r2, 58
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
