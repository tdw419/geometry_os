; DESCRIPTION: Draws a yellow rectangle at (286, 36) with width 88 and height 84.
; PLAN: r0=286(x), r1=36(y), r2=88(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 36
LDI r2, 88
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
