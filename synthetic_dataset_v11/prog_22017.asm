; DESCRIPTION: Creates a yellow circular shape at (100, 145) with radius 21.
; PLAN: r0=100(x), r1=145(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 145
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
