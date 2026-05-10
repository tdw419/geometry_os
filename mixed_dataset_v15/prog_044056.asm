; DESCRIPTION: Composite: Draws a green circle centered at (383, 145) with radius 46 then Sets a single green pixel at (358, 247).
; PLAN: r0=383(x), r1=145(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=247(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 145
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 247
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
