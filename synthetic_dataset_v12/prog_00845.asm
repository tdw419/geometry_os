; DESCRIPTION: Draws a yellow rectangle at (204, 23) with width 15 and height 99.
; PLAN: r0=204(x), r1=23(y), r2=15(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 23
LDI r2, 15
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
