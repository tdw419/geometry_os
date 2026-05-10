; DESCRIPTION: Draws a orange rectangle at (47, 94) with width 44 and height 104.
; PLAN: r0=47(x), r1=94(y), r2=44(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 94
LDI r2, 44
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
