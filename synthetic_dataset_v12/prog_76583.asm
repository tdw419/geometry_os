; DESCRIPTION: Draws a orange rectangle at (87, 137) with width 76 and height 116.
; PLAN: r0=87(x), r1=137(y), r2=76(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 137
LDI r2, 76
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
