; DESCRIPTION: Composite: Places a black circle of radius 33 at center (362, 119) then Sets a single orange pixel at (29, 165).
; PLAN: r0=362(x), r1=119(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=165(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 119
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 165
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
