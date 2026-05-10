; DESCRIPTION: Composite: Draws a yellow circle centered at (161, 126) with radius 15 then Sets a single orange pixel at (498, 76).
; PLAN: r0=161(x), r1=126(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=76(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 126
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 76
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
