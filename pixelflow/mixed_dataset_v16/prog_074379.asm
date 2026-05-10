; DESCRIPTION: Draws a orange rectangle at (159, 75) with width 12 and height 104.
; PLAN: r0=159(x), r1=75(y), r2=12(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 75
LDI r2, 12
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
