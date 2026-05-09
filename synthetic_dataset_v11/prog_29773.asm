; DESCRIPTION: Draws a black rectangle at (166, 142) with width 49 and height 62.
; PLAN: r0=166(x), r1=142(y), r2=49(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 142
LDI r2, 49
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
