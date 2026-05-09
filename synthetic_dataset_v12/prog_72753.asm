; DESCRIPTION: Draws a orange rectangle at (363, 105) with width 91 and height 115.
; PLAN: r0=363(x), r1=105(y), r2=91(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 105
LDI r2, 91
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
