; DESCRIPTION: Draws a yellow rectangle at (55, 47) with width 35 and height 75.
; PLAN: r0=55(x), r1=47(y), r2=35(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 47
LDI r2, 35
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
