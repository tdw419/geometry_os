; DESCRIPTION: Composite: Draws a purple circle centered at (197, 13) with radius 12 then Sets a single magenta pixel at (247, 110).
; PLAN: r0=197(x), r1=13(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=110(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 197
LDI r1, 13
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 110
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
