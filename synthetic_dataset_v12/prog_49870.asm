; DESCRIPTION: Composite: Sets a single blue pixel at (262, 241) then Draws a cyan circle centered at (312, 146) with radius 77.
; PLAN: r0=262(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=146(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 146
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
