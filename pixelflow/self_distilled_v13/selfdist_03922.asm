; DESCRIPTION: Draws a orange rectangle at (274, 174) with width 104 and height 100.
; PLAN: r0=274(x), r1=174(y), r2=104(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 174
LDI r2, 104
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
