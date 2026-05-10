; DESCRIPTION: Draws a yellow rectangle at (390, 32) with width 37 and height 101.
; PLAN: r0=390(x), r1=32(y), r2=37(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 32
LDI r2, 37
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
