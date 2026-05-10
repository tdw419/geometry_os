; DESCRIPTION: Composite: Places a white circle of radius 60 at center (294, 182) then Sets a single blue pixel at (409, 239).
; PLAN: r0=294(x), r1=182(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=239(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 182
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 239
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
