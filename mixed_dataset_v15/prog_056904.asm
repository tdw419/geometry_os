; DESCRIPTION: Draws a orange rectangle at (10, 21) with width 35 and height 75.
; PLAN: r0=10(x), r1=21(y), r2=35(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 21
LDI r2, 35
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
