; DESCRIPTION: Draws a yellow rectangle at (200, 184) with width 17 and height 35.
; PLAN: r0=200(x), r1=184(y), r2=17(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 184
LDI r2, 17
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
