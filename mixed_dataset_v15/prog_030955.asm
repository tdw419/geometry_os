; DESCRIPTION: Composite: Creates a white circular shape at (431, 120) with radius 14 then Sets a single yellow pixel at (308, 76).
; PLAN: r0=431(x), r1=120(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=76(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 120
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 76
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
