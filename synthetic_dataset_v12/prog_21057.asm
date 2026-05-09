; DESCRIPTION: Draws a yellow rectangle at (201, 141) with width 87 and height 11.
; PLAN: r0=201(x), r1=141(y), r2=87(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 141
LDI r2, 87
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
