; DESCRIPTION: Composite: Places a purple circle of radius 58 at center (278, 197) then Sets a single yellow pixel at (132, 255).
; PLAN: r0=278(x), r1=197(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=255(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 197
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 255
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
