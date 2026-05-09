; DESCRIPTION: Draws a red circle centered at (37, 216) with radius 30.
; PLAN: r0=37(x), r1=216(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 216
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
