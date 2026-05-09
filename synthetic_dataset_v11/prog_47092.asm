; DESCRIPTION: Draws a yellow rectangle at (222, 132) with width 18 and height 69.
; PLAN: r0=222(x), r1=132(y), r2=18(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 132
LDI r2, 18
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
