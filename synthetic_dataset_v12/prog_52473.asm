; DESCRIPTION: Composite: Places a orange dot at position (348, 242) then Renders a yellow disk with center (351, 175) and radius 44.
; PLAN: r0=348(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=175(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 348
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 351
LDI r6, 175
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
