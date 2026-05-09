; DESCRIPTION: Composite: Renders a blue disk with center (95, 153) and radius 44 then Sets a single cyan pixel at (496, 212).
; PLAN: r0=95(x), r1=153(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x), r6=212(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 153
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 212
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
