; DESCRIPTION: Composite: Sets a single green pixel at (80, 227) then Renders a purple disk with center (438, 59) and radius 15.
; PLAN: r0=80(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=59(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 438
LDI r6, 59
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
