; DESCRIPTION: Composite: Places a white dot at position (136, 179) then Renders a orange disk with center (201, 96) and radius 78.
; PLAN: r0=136(x), r1=179(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=96(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 179
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 96
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
