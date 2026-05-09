; DESCRIPTION: Draws a yellow rectangle at (55, 142) with width 74 and height 31.
; PLAN: r0=55(x), r1=142(y), r2=74(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 142
LDI r2, 74
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
