; DESCRIPTION: Composite: . Then Sets a single green pixel at (114, 254). Then Renders a purple disk with center (141, 66) and radius 58.
; PLAN: r0=114(x), r1=254(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=141(x), r1=66(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (114, 254).
; PLAN: r0=114(x), r1=254(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 254
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (141, 66) and radius 58.
; PLAN: r0=141(x), r1=66(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 66
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
