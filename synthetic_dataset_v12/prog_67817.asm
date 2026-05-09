; DESCRIPTION: Draws a blue rectangle at (303, 41) with width 11 and height 81.
; PLAN: r0=303(x), r1=41(y), r2=11(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 41
LDI r2, 11
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
