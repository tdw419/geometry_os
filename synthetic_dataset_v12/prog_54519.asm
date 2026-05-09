; DESCRIPTION: Composite: Sets a single green pixel at (372, 29) then Renders a black disk with center (254, 28) and radius 26.
; PLAN: r0=372(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=28(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 254
LDI r6, 28
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
