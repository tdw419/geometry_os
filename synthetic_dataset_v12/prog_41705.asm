; DESCRIPTION: Composite: Places a yellow circle of radius 21 at center (436, 208) then Sets a single red pixel at (293, 94).
; PLAN: r0=436(x), r1=208(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=94(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 208
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 94
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
