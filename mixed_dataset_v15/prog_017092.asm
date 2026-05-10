; DESCRIPTION: Composite: Creates a magenta circular shape at (308, 195) with radius 31 then Sets a single purple pixel at (419, 127).
; PLAN: r0=308(x), r1=195(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=127(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 195
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 127
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
