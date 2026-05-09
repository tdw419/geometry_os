; DESCRIPTION: Draws a yellow circle centered at (245, 145) with radius 45.
; PLAN: r0=245(x), r1=145(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 145
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
