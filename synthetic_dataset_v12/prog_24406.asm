; DESCRIPTION: Composite: Creates a green circular shape at (423, 223) with radius 25 then Sets a single yellow pixel at (247, 35).
; PLAN: r0=423(x), r1=223(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=35(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 223
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 35
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
