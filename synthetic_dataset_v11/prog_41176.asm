; DESCRIPTION: Draws a yellow rectangle at (53, 153) with width 119 and height 13.
; PLAN: r0=53(x), r1=153(y), r2=119(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 153
LDI r2, 119
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
