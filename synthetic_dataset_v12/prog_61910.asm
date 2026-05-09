; DESCRIPTION: Composite: Renders a white disk with center (373, 111) and radius 67 then Sets a single black pixel at (439, 114).
; PLAN: r0=373(x), r1=111(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=114(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 111
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 114
LDI r7, 0x000000
PSET r5, r6, r7
HALT
