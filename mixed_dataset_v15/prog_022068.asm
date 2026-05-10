; DESCRIPTION: Composite: Places a purple circle of radius 35 at center (305, 107) then Sets a single black pixel at (486, 249).
; PLAN: r0=305(x), r1=107(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x), r6=249(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 107
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 249
LDI r7, 0x000000
PSET r5, r6, r7
HALT
