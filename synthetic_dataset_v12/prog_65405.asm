; DESCRIPTION: Composite: Places a green circle of radius 12 at center (497, 240) then Sets a single red pixel at (74, 13).
; PLAN: r0=497(x), r1=240(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=13(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 497
LDI r1, 240
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 13
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
