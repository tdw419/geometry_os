; DESCRIPTION: Composite: Creates a red circular shape at (463, 49) with radius 49 then Sets a single blue pixel at (186, 222).
; PLAN: r0=463(x), r1=49(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=222(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 463
LDI r1, 49
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 222
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
