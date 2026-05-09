; DESCRIPTION: Draws a orange rectangle at (457, 158) with width 37 and height 20.
; PLAN: r0=457(x), r1=158(y), r2=37(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 158
LDI r2, 37
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
