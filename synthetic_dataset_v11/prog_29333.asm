; DESCRIPTION: Draws a green rectangle at (160, 69) with width 41 and height 118.
; PLAN: r0=160(x), r1=69(y), r2=41(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 69
LDI r2, 41
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
