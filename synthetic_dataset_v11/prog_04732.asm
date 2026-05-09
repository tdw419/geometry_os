; DESCRIPTION: Draws a orange rectangle at (132, 52) with width 66 and height 104.
; PLAN: r0=132(x), r1=52(y), r2=66(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 52
LDI r2, 66
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
