; DESCRIPTION: Composite: Places a magenta circle of radius 30 at center (353, 109) then Sets a single yellow pixel at (312, 245).
; PLAN: r0=353(x), r1=109(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=245(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 109
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 245
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
