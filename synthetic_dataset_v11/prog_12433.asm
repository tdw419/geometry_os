; DESCRIPTION: Draws a orange rectangle at (83, 31) with width 110 and height 79.
; PLAN: r0=83(x), r1=31(y), r2=110(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 31
LDI r2, 110
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
