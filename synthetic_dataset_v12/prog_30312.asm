; DESCRIPTION: Draws a yellow rectangle at (451, 0) with width 23 and height 101.
; PLAN: r0=451(x), r1=0(y), r2=23(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 0
LDI r2, 23
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
