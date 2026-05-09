; DESCRIPTION: Draws a orange rectangle at (155, 65) with width 55 and height 13.
; PLAN: r0=155(x), r1=65(y), r2=55(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 65
LDI r2, 55
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
