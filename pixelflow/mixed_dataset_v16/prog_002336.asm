; DESCRIPTION: Composite: Sets a single blue pixel at (406, 155) then Creates a green circular shape at (144, 100) with radius 73.
; PLAN: r0=406(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=100(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 100
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
