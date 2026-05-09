; DESCRIPTION: Draws a yellow rectangle at (58, 139) with width 55 and height 105.
; PLAN: r0=58(x), r1=139(y), r2=55(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 139
LDI r2, 55
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
