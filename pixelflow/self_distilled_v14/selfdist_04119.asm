; DESCRIPTION: Draws a orange rectangle at (316, 149) with width 104 and height 36.
; PLAN: r0=316(x), r1=149(y), r2=104(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 149
LDI r2, 104
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
