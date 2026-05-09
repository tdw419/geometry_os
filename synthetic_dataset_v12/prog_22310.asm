; DESCRIPTION: Composite: Places a green circle of radius 46 at center (225, 147) then Sets a single orange pixel at (96, 237).
; PLAN: r0=225(x), r1=147(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=237(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 147
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 237
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
