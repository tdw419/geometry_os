; DESCRIPTION: Draws a orange rectangle at (314, 17) with width 58 and height 104.
; PLAN: r0=314(x), r1=17(y), r2=58(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 17
LDI r2, 58
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
