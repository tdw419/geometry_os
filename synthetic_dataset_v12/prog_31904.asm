; DESCRIPTION: Draws a green rectangle at (105, 148) with width 88 and height 25.
; PLAN: r0=105(x), r1=148(y), r2=88(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 148
LDI r2, 88
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
