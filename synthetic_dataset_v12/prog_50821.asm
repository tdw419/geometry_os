; DESCRIPTION: Composite: Creates a blue circular shape at (440, 158) with radius 13 then Sets a single purple pixel at (51, 62).
; PLAN: r0=440(x), r1=158(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=62(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 158
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 62
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
