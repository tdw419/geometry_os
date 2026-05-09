; DESCRIPTION: Composite: Places a cyan dot at position (51, 133) then Places a purple circle of radius 44 at center (139, 200).
; PLAN: r0=51(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=200(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 51
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 200
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
