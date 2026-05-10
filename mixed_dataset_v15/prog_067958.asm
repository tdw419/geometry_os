; DESCRIPTION: Draws a orange rectangle at (351, 48) with width 43 and height 43.
; PLAN: r0=351(x), r1=48(y), r2=43(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 48
LDI r2, 43
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
