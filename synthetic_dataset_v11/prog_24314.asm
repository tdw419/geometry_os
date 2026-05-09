; DESCRIPTION: Draws a yellow rectangle at (98, 233) with width 119 and height 17.
; PLAN: r0=98(x), r1=233(y), r2=119(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 233
LDI r2, 119
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
