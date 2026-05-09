; DESCRIPTION: Composite: Renders a cyan disk with center (433, 117) and radius 72 then Sets a single green pixel at (494, 240).
; PLAN: r0=433(x), r1=117(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=240(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 433
LDI r1, 117
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 240
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
