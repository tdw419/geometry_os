; DESCRIPTION: Draws a orange rectangle at (129, 71) with width 106 and height 99.
; PLAN: r0=129(x), r1=71(y), r2=106(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 71
LDI r2, 106
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
