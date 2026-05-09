; DESCRIPTION: Draws a yellow rectangle at (0, 135) with width 47 and height 119.
; PLAN: r0=0(x), r1=135(y), r2=47(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 135
LDI r2, 47
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
