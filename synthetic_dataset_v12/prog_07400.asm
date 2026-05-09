; DESCRIPTION: Composite: Sets a single green pixel at (157, 227) then Places a purple circle of radius 18 at center (50, 177).
; PLAN: r0=157(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=177(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 50
LDI r6, 177
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
