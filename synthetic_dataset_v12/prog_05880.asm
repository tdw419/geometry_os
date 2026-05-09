; DESCRIPTION: Draws a orange rectangle at (351, 31) with width 23 and height 116.
; PLAN: r0=351(x), r1=31(y), r2=23(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 31
LDI r2, 23
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
