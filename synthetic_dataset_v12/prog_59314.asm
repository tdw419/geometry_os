; DESCRIPTION: Composite: Creates a black circular shape at (80, 73) with radius 71 then Sets a single cyan pixel at (471, 118).
; PLAN: r0=80(x), r1=73(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x), r6=118(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 73
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 118
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
