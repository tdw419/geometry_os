; DESCRIPTION: Composite: Creates a green circular shape at (259, 189) with radius 67 then Sets a single blue pixel at (248, 76).
; PLAN: r0=259(x), r1=189(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=76(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 189
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 76
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
