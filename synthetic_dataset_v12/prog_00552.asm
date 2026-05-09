; DESCRIPTION: Draws a orange rectangle at (170, 104) with width 79 and height 76.
; PLAN: r0=170(x), r1=104(y), r2=79(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 104
LDI r2, 79
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
