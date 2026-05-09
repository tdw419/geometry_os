; DESCRIPTION: Composite: Sets a single green pixel at (272, 148) then Creates a yellow circular shape at (79, 190) with radius 44.
; PLAN: r0=272(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=190(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 148
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 79
LDI r6, 190
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
