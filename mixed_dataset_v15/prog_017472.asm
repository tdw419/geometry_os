; DESCRIPTION: Composite: Renders a cyan disk with center (235, 100) and radius 62 then Sets a single orange pixel at (505, 66).
; PLAN: r0=235(x), r1=100(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x), r6=66(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 100
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 66
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
