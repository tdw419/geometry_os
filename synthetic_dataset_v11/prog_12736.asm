; DESCRIPTION: Draws a orange rectangle at (81, 33) with width 88 and height 99.
; PLAN: r0=81(x), r1=33(y), r2=88(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 33
LDI r2, 88
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
