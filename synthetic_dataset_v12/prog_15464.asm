; DESCRIPTION: Composite: Sets a single black pixel at (111, 113) then Creates a black circular shape at (30, 221) with radius 26.
; PLAN: r0=111(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=221(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 30
LDI r6, 221
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
