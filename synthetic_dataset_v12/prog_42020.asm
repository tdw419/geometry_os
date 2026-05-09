; DESCRIPTION: Composite: Creates a blue circular shape at (63, 51) with radius 23 then Sets a single orange pixel at (326, 227).
; PLAN: r0=63(x), r1=51(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=227(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 63
LDI r1, 51
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 227
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
