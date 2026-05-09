; DESCRIPTION: Composite: Renders a white disk with center (373, 85) and radius 24 then Sets a single green pixel at (203, 24).
; PLAN: r0=373(x), r1=85(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=24(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 85
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 24
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
