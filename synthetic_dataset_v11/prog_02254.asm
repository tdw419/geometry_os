; DESCRIPTION: Draws a orange rectangle at (201, 18) with width 16 and height 89.
; PLAN: r0=201(x), r1=18(y), r2=16(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 18
LDI r2, 16
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
