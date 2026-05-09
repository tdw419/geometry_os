; DESCRIPTION: Draws a blue rectangle at (95, 83) with width 41 and height 23.
; PLAN: r0=95(x), r1=83(y), r2=41(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 83
LDI r2, 41
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
