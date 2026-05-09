; DESCRIPTION: Composite: Places a magenta circle of radius 23 at center (141, 152) then Sets a single black pixel at (225, 105).
; PLAN: r0=141(x), r1=152(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=105(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 152
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 105
LDI r7, 0x000000
PSET r5, r6, r7
HALT
