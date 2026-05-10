; DESCRIPTION: Composite: Places a purple dot at position (114, 26) then Renders a white disk with center (183, 119) and radius 53.
; PLAN: r0=114(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=119(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 119
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
