; DESCRIPTION: Composite: Sets a single green pixel at (322, 140) then Renders a orange disk with center (183, 99) and radius 56.
; PLAN: r0=322(x), r1=140(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=99(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 140
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 183
LDI r6, 99
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
