; DESCRIPTION: Draws a orange rectangle at (347, 157) with width 105 and height 85.
; PLAN: r0=347(x), r1=157(y), r2=105(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 157
LDI r2, 105
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
