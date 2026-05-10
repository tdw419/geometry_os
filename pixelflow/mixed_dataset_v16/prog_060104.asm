; DESCRIPTION: Composite: Places a white line segment connecting (257, 201) to (265, 139) then Sets a single blue pixel at (337, 74).
; PLAN: r0=257(x1), r1=201(y1), r2=265(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=74(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 257
LDI r1, 201
LDI r2, 265
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 74
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
