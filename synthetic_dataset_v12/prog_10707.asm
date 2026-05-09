; DESCRIPTION: Composite: Sets a single green pixel at (194, 252) then Renders a green disk with center (224, 45) and radius 36.
; PLAN: r0=194(x), r1=252(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=45(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 252
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 224
LDI r6, 45
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
