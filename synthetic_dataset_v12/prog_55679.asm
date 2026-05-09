; DESCRIPTION: Draws a black rectangle at (341, 36) with width 101 and height 55.
; PLAN: r0=341(x), r1=36(y), r2=101(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 36
LDI r2, 101
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
