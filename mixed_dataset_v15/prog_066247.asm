; DESCRIPTION: Composite: Creates a red circular shape at (312, 73) with radius 30 then Sets a single red pixel at (181, 41).
; PLAN: r0=312(x), r1=73(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 73
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
