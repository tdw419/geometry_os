; DESCRIPTION: Draws a red rectangle at (201, 31) with width 52 and height 37.
; PLAN: r0=201(x), r1=31(y), r2=52(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 31
LDI r2, 52
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
