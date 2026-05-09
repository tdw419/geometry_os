; DESCRIPTION: Draws a orange rectangle at (229, 123) with width 104 and height 44.
; PLAN: r0=229(x), r1=123(y), r2=104(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 123
LDI r2, 104
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
