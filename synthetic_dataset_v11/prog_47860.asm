; DESCRIPTION: Draws a yellow rectangle at (111, 83) with width 73 and height 119.
; PLAN: r0=111(x), r1=83(y), r2=73(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 83
LDI r2, 73
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
