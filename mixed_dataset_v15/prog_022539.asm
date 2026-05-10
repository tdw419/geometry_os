; DESCRIPTION: Draws a yellow rectangle at (201, 25) with width 108 and height 26.
; PLAN: r0=201(x), r1=25(y), r2=108(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 25
LDI r2, 108
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
