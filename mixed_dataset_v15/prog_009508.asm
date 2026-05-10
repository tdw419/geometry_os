; DESCRIPTION: Composite: Sets a single blue pixel at (487, 250) then Places a cyan circle of radius 66 at center (299, 142).
; PLAN: r0=487(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=142(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 487
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 142
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
