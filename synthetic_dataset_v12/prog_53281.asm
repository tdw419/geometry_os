; DESCRIPTION: Composite: Creates a green circular shape at (264, 160) with radius 52 then Sets a single blue pixel at (265, 173).
; PLAN: r0=264(x), r1=160(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=173(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 160
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 173
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
