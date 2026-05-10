; DESCRIPTION: Composite: Sets a single white pixel at (230, 73) then Places a purple circle of radius 58 at center (260, 181).
; PLAN: r0=230(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=181(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 230
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 181
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
