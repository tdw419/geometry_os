; DESCRIPTION: Draws a orange rectangle at (201, 24) with width 72 and height 34.
; PLAN: r0=201(x), r1=24(y), r2=72(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 24
LDI r2, 72
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
