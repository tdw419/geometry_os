; DESCRIPTION: Composite: Renders a white disk with center (93, 121) and radius 80 then Sets a single magenta pixel at (111, 87).
; PLAN: r0=93(x), r1=121(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=87(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 121
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 87
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
