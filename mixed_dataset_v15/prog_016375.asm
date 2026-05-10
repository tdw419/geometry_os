; DESCRIPTION: Composite: Creates a magenta circular shape at (426, 168) with radius 31 then Sets a single blue pixel at (395, 201).
; PLAN: r0=426(x), r1=168(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=201(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 168
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 201
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
