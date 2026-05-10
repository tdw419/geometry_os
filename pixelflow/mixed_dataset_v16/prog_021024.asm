; DESCRIPTION: Composite: Places a magenta dot at position (484, 78) then Places a purple circle of radius 75 at center (419, 133).
; PLAN: r0=484(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=133(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 133
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
