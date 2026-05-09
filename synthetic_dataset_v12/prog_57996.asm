; DESCRIPTION: Draws a orange rectangle at (399, 20) with width 99 and height 99.
; PLAN: r0=399(x), r1=20(y), r2=99(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 20
LDI r2, 99
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
