; DESCRIPTION: Draws a yellow rectangle at (54, 65) with width 35 and height 116.
; PLAN: r0=54(x), r1=65(y), r2=35(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 65
LDI r2, 35
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
