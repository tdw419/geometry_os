; DESCRIPTION: Composite: Draws a cyan circle centered at (321, 223) with radius 12 then Sets a single red pixel at (221, 199).
; PLAN: r0=321(x), r1=223(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=199(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 223
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 199
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
