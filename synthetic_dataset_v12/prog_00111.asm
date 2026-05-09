; DESCRIPTION: Draws a orange rectangle at (318, 10) with width 10 and height 18.
; PLAN: r0=318(x), r1=10(y), r2=10(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 10
LDI r2, 10
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
