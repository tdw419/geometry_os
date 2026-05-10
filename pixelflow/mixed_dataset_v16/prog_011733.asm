; DESCRIPTION: Draws a orange rectangle at (104, 94) with width 33 and height 27.
; PLAN: r0=104(x), r1=94(y), r2=33(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 94
LDI r2, 33
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
