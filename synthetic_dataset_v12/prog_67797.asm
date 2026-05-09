; DESCRIPTION: Composite: Places a purple dot at position (76, 141) then Creates a purple circular shape at (230, 96) with radius 26.
; PLAN: r0=76(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=96(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 141
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 96
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
