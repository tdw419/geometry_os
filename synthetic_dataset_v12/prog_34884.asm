; DESCRIPTION: Composite: Creates a black circular shape at (66, 161) with radius 33 then Sets a single magenta pixel at (489, 51).
; PLAN: r0=66(x), r1=161(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=51(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 66
LDI r1, 161
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 51
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
