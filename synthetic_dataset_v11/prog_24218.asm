; DESCRIPTION: Draws a orange rectangle at (139, 9) with width 27 and height 75.
; PLAN: r0=139(x), r1=9(y), r2=27(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 9
LDI r2, 27
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
