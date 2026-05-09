; DESCRIPTION: Draws a green rectangle at (208, 46) with width 88 and height 119.
; PLAN: r0=208(x), r1=46(y), r2=88(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 46
LDI r2, 88
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
