; DESCRIPTION: Composite: Renders a yellow disk with center (447, 209) and radius 18 then Sets a single magenta pixel at (371, 241).
; PLAN: r0=447(x), r1=209(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=241(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 209
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 241
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
