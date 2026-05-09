; DESCRIPTION: Composite: Sets a single black pixel at (454, 2) then Renders a white disk with center (418, 141) and radius 49.
; PLAN: r0=454(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=141(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 418
LDI r6, 141
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
