; DESCRIPTION: Composite: Renders a purple disk with center (421, 135) and radius 56 then Sets a single blue pixel at (385, 59).
; PLAN: r0=421(x), r1=135(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 135
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
