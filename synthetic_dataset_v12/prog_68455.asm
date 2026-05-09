; DESCRIPTION: Draws a yellow rectangle at (312, 176) with width 28 and height 69.
; PLAN: r0=312(x), r1=176(y), r2=28(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 176
LDI r2, 28
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
