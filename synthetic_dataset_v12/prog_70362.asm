; DESCRIPTION: Composite: Places a purple dot at position (104, 54) then Places a purple circle of radius 35 at center (139, 81).
; PLAN: r0=104(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=81(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 54
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 81
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
