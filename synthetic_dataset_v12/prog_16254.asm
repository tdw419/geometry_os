; DESCRIPTION: Draws a orange rectangle at (35, 104) with width 117 and height 108.
; PLAN: r0=35(x), r1=104(y), r2=117(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 104
LDI r2, 117
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
