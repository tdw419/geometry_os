; DESCRIPTION: Creates a black circular shape at (84, 229) with radius 11.
; PLAN: r0=84(x), r1=229(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 229
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
