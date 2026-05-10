; DESCRIPTION: Draws a orange rectangle at (363, 145) with width 35 and height 23.
; PLAN: r0=363(x), r1=145(y), r2=35(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 145
LDI r2, 35
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
