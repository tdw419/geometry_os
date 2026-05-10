; DESCRIPTION: Composite: Places a white dot at position (314, 127) then Creates a purple circular shape at (419, 161) with radius 26.
; PLAN: r0=314(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=161(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 161
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
