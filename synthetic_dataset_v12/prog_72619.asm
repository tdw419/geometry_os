; DESCRIPTION: Draws a yellow rectangle at (55, 70) with width 74 and height 68.
; PLAN: r0=55(x), r1=70(y), r2=74(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 70
LDI r2, 74
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
