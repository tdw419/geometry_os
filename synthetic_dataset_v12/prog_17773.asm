; DESCRIPTION: Composite: Draws a purple circle centered at (419, 84) with radius 79 then Sets a single red pixel at (391, 251).
; PLAN: r0=419(x), r1=84(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=251(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 84
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 251
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
