; DESCRIPTION: Composite: Draws a cyan circle centered at (448, 132) with radius 44 then Sets a single yellow pixel at (418, 184).
; PLAN: r0=448(x), r1=132(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=184(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 132
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 184
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
