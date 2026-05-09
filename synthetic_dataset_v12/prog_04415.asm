; DESCRIPTION: Draws a blue rectangle at (11, 141) with width 41 and height 69.
; PLAN: r0=11(x), r1=141(y), r2=41(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 141
LDI r2, 41
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
