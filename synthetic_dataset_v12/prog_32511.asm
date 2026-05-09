; DESCRIPTION: Composite: Sets a single red pixel at (72, 76) then Creates a red circular shape at (207, 121) with radius 74.
; PLAN: r0=72(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=121(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 121
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
