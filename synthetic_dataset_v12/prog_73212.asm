; DESCRIPTION: Composite: Places a yellow circle of radius 18 at center (421, 123) then Sets a single purple pixel at (285, 84).
; PLAN: r0=421(x), r1=123(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=84(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 123
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 84
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
