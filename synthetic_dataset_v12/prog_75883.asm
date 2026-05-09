; DESCRIPTION: Composite: Sets a single yellow pixel at (464, 175) then Renders a purple disk with center (391, 172) and radius 53.
; PLAN: r0=464(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=172(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 464
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 391
LDI r6, 172
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
