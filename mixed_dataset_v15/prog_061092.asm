; DESCRIPTION: Draws a yellow rectangle at (341, 119) with width 49 and height 78.
; PLAN: r0=341(x), r1=119(y), r2=49(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 119
LDI r2, 49
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
