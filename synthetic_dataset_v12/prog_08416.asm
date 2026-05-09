; DESCRIPTION: Draws a blue rectangle at (212, 91) with width 26 and height 88.
; PLAN: r0=212(x), r1=91(y), r2=26(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 91
LDI r2, 26
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
