; DESCRIPTION: Composite: Renders a purple disk with center (228, 121) and radius 80 then Sets a single yellow pixel at (278, 8).
; PLAN: r0=228(x), r1=121(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 121
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
