; DESCRIPTION: Composite: Renders a green disk with center (151, 150) and radius 77 then Sets a single orange pixel at (411, 124).
; PLAN: r0=151(x), r1=150(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=124(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 150
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 124
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
