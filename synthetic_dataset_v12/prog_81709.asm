; DESCRIPTION: Draws a green rectangle at (169, 13) with width 47 and height 88.
; PLAN: r0=169(x), r1=13(y), r2=47(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 13
LDI r2, 47
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
