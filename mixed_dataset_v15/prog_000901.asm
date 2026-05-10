; DESCRIPTION: Draws a yellow rectangle at (39, 22) with width 39 and height 119.
; PLAN: r0=39(x), r1=22(y), r2=39(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 22
LDI r2, 39
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
