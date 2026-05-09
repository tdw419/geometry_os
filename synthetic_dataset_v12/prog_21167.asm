; DESCRIPTION: Composite: Renders a white disk with center (387, 101) and radius 16 then Sets a single yellow pixel at (87, 162).
; PLAN: r0=387(x), r1=101(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=162(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 101
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 162
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
