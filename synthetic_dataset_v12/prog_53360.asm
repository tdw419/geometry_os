; DESCRIPTION: Draws a orange rectangle at (231, 30) with width 75 and height 87.
; PLAN: r0=231(x), r1=30(y), r2=75(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 30
LDI r2, 75
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
