; DESCRIPTION: Composite: Renders a green disk with center (207, 133) and radius 78 then Sets a single orange pixel at (104, 193).
; PLAN: r0=207(x), r1=133(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=193(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 133
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 193
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
