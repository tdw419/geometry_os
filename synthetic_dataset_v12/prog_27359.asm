; DESCRIPTION: Draws a orange rectangle at (201, 98) with width 88 and height 66.
; PLAN: r0=201(x), r1=98(y), r2=88(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 98
LDI r2, 88
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
