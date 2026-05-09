; DESCRIPTION: Composite: Sets a single black pixel at (138, 24) then Places a black circle of radius 80 at center (163, 133).
; PLAN: r0=138(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=133(y), r7=80(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 163
LDI r6, 133
LDI r7, 80
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
