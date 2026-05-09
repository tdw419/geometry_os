; DESCRIPTION: Draws a orange rectangle at (314, 104) with width 87 and height 15.
; PLAN: r0=314(x), r1=104(y), r2=87(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 104
LDI r2, 87
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
