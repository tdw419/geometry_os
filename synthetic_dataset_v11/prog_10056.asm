; DESCRIPTION: Draws a orange rectangle at (52, 155) with width 105 and height 55.
; PLAN: r0=52(x), r1=155(y), r2=105(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 155
LDI r2, 105
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
