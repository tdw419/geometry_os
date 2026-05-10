; DESCRIPTION: Composite: Sets a single yellow pixel at (409, 96) then Creates a yellow circular shape at (91, 96) with radius 61.
; PLAN: r0=409(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=96(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 409
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 91
LDI r6, 96
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
