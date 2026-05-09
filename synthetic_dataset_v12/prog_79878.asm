; DESCRIPTION: Draws a orange rectangle at (241, 10) with width 75 and height 45.
; PLAN: r0=241(x), r1=10(y), r2=75(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 10
LDI r2, 75
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
