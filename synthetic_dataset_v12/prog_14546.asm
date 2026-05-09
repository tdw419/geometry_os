; DESCRIPTION: Composite: Draws a cyan circle centered at (319, 189) with radius 51 then Sets a single cyan pixel at (363, 237).
; PLAN: r0=319(x), r1=189(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=237(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 189
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 237
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
