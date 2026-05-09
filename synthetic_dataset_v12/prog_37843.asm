; DESCRIPTION: Composite: Sets a single yellow pixel at (341, 6) then Places a white circle of radius 33 at center (329, 106).
; PLAN: r0=341(x), r1=6(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=106(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 6
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 329
LDI r6, 106
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
