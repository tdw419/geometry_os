; DESCRIPTION: Draws a yellow rectangle at (232, 17) with width 22 and height 82.
; PLAN: r0=232(x), r1=17(y), r2=22(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 17
LDI r2, 22
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
