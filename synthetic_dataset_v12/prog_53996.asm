; DESCRIPTION: Composite: Sets a single green pixel at (501, 189) then Creates a black circular shape at (226, 169) with radius 10.
; PLAN: r0=501(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=169(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 501
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 226
LDI r6, 169
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
