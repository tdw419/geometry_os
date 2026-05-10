; DESCRIPTION: Composite: Places a orange circle of radius 72 at center (403, 154) then Sets a single purple pixel at (478, 129).
; PLAN: r0=403(x), r1=154(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x), r6=129(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 154
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 129
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
