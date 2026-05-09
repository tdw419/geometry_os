; DESCRIPTION: Composite: Sets a single blue pixel at (133, 34) then Creates a yellow circular shape at (330, 119) with radius 49.
; PLAN: r0=133(x), r1=34(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=119(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 34
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 330
LDI r6, 119
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
