; DESCRIPTION: Draws a blue rectangle at (110, 43) with width 41 and height 68.
; PLAN: r0=110(x), r1=43(y), r2=41(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 43
LDI r2, 41
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
