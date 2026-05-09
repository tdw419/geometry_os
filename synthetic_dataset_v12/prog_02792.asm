; DESCRIPTION: Composite: Sets a single white pixel at (483, 147) then Places a green circle of radius 69 at center (76, 89).
; PLAN: r0=483(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=89(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 76
LDI r6, 89
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
