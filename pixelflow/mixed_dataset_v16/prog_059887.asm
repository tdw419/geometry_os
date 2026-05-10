; DESCRIPTION: Composite: Sets a single green pixel at (163, 251) then Renders a white disk with center (199, 86) and radius 68.
; PLAN: r0=163(x), r1=251(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=86(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 251
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 199
LDI r6, 86
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
