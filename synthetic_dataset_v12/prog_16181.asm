; DESCRIPTION: Composite: Sets a single magenta pixel at (351, 155) then Creates a yellow circular shape at (207, 182) with radius 59.
; PLAN: r0=351(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=182(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 351
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 182
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
