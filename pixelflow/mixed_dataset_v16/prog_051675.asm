; DESCRIPTION: Composite: Draws a green circle centered at (341, 140) with radius 80 then Sets a single cyan pixel at (447, 173).
; PLAN: r0=341(x), r1=140(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=173(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 140
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 173
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
