; DESCRIPTION: Composite: Sets a single blue pixel at (484, 52) then Creates a yellow circular shape at (125, 129) with radius 75.
; PLAN: r0=484(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=129(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 129
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
