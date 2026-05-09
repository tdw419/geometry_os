; DESCRIPTION: Composite: Sets a single red pixel at (185, 241) then Renders a green disk with center (414, 78) and radius 52.
; PLAN: r0=185(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=78(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 241
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 78
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
