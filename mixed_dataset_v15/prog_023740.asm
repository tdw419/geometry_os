; DESCRIPTION: Draws a orange rectangle at (2, 201) with width 43 and height 32.
; PLAN: r0=2(x), r1=201(y), r2=43(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 201
LDI r2, 43
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
