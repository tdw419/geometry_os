; DESCRIPTION: Composite: Creates a black circular shape at (72, 76) with radius 22 then Sets a single yellow pixel at (462, 91).
; PLAN: r0=72(x), r1=76(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x), r6=91(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 76
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 91
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
