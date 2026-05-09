; DESCRIPTION: Draws a yellow rectangle at (13, 142) with width 26 and height 20.
; PLAN: r0=13(x), r1=142(y), r2=26(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 142
LDI r2, 26
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
