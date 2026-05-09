; DESCRIPTION: Draws a yellow rectangle at (416, 70) with width 35 and height 83.
; PLAN: r0=416(x), r1=70(y), r2=35(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 70
LDI r2, 35
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
