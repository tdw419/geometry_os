; DESCRIPTION: Composite: Renders a cyan disk with center (315, 79) and radius 32 then Sets a single green pixel at (297, 31).
; PLAN: r0=315(x), r1=79(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=31(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 79
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 31
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
