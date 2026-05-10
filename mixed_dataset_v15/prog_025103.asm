; DESCRIPTION: Composite: Places a blue circle of radius 19 at center (432, 147) then Sets a single yellow pixel at (256, 64).
; PLAN: r0=432(x), r1=147(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=64(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 147
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 64
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
