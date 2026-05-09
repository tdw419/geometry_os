; DESCRIPTION: Draws a orange rectangle at (10, 123) with width 15 and height 90.
; PLAN: r0=10(x), r1=123(y), r2=15(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 123
LDI r2, 15
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
