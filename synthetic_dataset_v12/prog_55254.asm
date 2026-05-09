; DESCRIPTION: Draws a yellow circle centered at (252, 89) with radius 49.
; PLAN: r0=252(x), r1=89(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 89
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
