; DESCRIPTION: Composite: Sets a single green pixel at (298, 9) then Renders a yellow disk with center (253, 203) and radius 44.
; PLAN: r0=298(x), r1=9(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=203(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 9
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 253
LDI r6, 203
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
