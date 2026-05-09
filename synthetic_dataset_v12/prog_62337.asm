; DESCRIPTION: Composite: Places a purple circle of radius 21 at center (328, 77) then Places a yellow dot at position (199, 233).
; PLAN: r0=328(x), r1=77(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=233(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 77
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 233
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
