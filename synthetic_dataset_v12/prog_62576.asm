; DESCRIPTION: Composite: Sets a single green pixel at (194, 138) then Places a blue circle of radius 53 at center (190, 91).
; PLAN: r0=194(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=91(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 190
LDI r6, 91
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
