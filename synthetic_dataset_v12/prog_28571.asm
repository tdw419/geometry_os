; DESCRIPTION: Composite: Draws a cyan circle centered at (169, 89) with radius 40 then Sets a single purple pixel at (308, 26).
; PLAN: r0=169(x), r1=89(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=26(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 89
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 26
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
