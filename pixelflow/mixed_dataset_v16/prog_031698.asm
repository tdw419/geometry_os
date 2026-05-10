; DESCRIPTION: Draws a orange rectangle at (110, 191) with width 65 and height 84.
; PLAN: r0=110(x), r1=191(y), r2=65(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 191
LDI r2, 65
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
