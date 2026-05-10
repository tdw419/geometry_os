; DESCRIPTION: Draws a orange rectangle at (231, 52) with width 22 and height 104.
; PLAN: r0=231(x), r1=52(y), r2=22(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 52
LDI r2, 22
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
