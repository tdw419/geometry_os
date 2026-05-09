; DESCRIPTION: Composite: Places a purple circle of radius 32 at center (359, 213) then Sets a single blue pixel at (139, 146).
; PLAN: r0=359(x), r1=213(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=146(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 213
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 146
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
