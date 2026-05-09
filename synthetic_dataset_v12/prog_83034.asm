; DESCRIPTION: Draws a yellow circle centered at (483, 37) with radius 11.
; PLAN: r0=483(x), r1=37(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 483
LDI r1, 37
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
