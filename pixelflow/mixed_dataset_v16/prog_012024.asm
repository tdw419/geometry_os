; DESCRIPTION: Composite: Sets a single red pixel at (16, 100) then Creates a red circular shape at (312, 190) with radius 51.
; PLAN: r0=16(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=190(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 16
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 312
LDI r6, 190
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
