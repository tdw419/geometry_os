; DESCRIPTION: Composite: Creates a yellow circular shape at (214, 79) with radius 26 then Sets a single red pixel at (468, 237).
; PLAN: r0=214(x), r1=79(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=237(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 214
LDI r1, 79
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 237
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
