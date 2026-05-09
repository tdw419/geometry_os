; DESCRIPTION: Draws a orange rectangle at (200, 140) with width 13 and height 15.
; PLAN: r0=200(x), r1=140(y), r2=13(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 140
LDI r2, 13
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
