; DESCRIPTION: Draws a green rectangle at (162, 97) with width 76 and height 88.
; PLAN: r0=162(x), r1=97(y), r2=76(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 97
LDI r2, 76
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
