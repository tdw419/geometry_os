; DESCRIPTION: Composite: Sets a single red pixel at (251, 29) then Places a black circle of radius 17 at center (88, 108).
; PLAN: r0=251(x), r1=29(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=108(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 29
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 88
LDI r6, 108
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
