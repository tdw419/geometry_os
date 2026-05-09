; DESCRIPTION: Composite: Sets a single black pixel at (259, 80) then Renders a yellow disk with center (270, 53) and radius 24.
; PLAN: r0=259(x), r1=80(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=53(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 80
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 270
LDI r6, 53
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
