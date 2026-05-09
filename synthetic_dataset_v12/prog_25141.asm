; DESCRIPTION: Composite: Sets a single green pixel at (366, 126) then Renders a white disk with center (137, 202) and radius 18.
; PLAN: r0=366(x), r1=126(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=202(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 126
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 137
LDI r6, 202
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
