; DESCRIPTION: Composite: Renders a blue disk with center (258, 54) and radius 33 then Sets a single red pixel at (102, 194).
; PLAN: r0=258(x), r1=54(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=194(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 54
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 194
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
