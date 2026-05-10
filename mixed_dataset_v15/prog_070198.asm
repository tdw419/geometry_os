; DESCRIPTION: Draws a orange rectangle at (478, 76) with width 22 and height 75.
; PLAN: r0=478(x), r1=76(y), r2=22(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 76
LDI r2, 22
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
