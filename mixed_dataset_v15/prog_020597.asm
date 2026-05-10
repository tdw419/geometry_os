; DESCRIPTION: Composite: Places a orange dot at position (139, 112) then Renders a white disk with center (140, 147) and radius 71.
; PLAN: r0=139(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=147(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 139
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 140
LDI r6, 147
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
