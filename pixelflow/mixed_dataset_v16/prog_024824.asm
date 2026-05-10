; DESCRIPTION: Composite: Places a orange circle of radius 57 at center (103, 199) then Sets a single blue pixel at (322, 243).
; PLAN: r0=103(x), r1=199(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=243(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 199
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 243
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
