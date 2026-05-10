; DESCRIPTION: Composite: Creates a purple circular shape at (170, 72) with radius 71 then Places a purple dot at position (305, 131).
; PLAN: r0=170(x), r1=72(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=131(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 170
LDI r1, 72
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 131
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
