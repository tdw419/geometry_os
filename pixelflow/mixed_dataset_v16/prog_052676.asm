; DESCRIPTION: Draws a yellow rectangle at (74, 105) with width 108 and height 55.
; PLAN: r0=74(x), r1=105(y), r2=108(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 105
LDI r2, 108
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
