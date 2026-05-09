; DESCRIPTION: Draws a orange rectangle at (357, 13) with width 62 and height 73.
; PLAN: r0=357(x), r1=13(y), r2=62(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 13
LDI r2, 62
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
