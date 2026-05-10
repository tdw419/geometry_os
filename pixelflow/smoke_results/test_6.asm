; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
; PLAN: r0=100(x), r1=100(y), r2=40(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 100
LDI r2, 40
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT