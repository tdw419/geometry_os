; DESCRIPTION: Composite: Renders a magenta disk with center (68, 104) and radius 51 then Sets a single magenta pixel at (451, 32).
; PLAN: r0=68(x), r1=104(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=32(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 68
LDI r1, 104
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 32
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
