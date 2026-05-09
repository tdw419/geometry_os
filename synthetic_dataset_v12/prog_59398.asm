; DESCRIPTION: Composite: Places a purple dot at position (315, 109) then Creates a yellow circular shape at (241, 98) with radius 18.
; PLAN: r0=315(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=98(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 98
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
