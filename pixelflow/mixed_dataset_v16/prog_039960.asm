; DESCRIPTION: Composite: Renders a red disk with center (97, 177) and radius 70 then Sets a single blue pixel at (405, 59).
; PLAN: r0=97(x), r1=177(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 177
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
