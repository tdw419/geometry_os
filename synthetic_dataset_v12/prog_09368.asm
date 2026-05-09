; DESCRIPTION: Composite: Renders a red disk with center (320, 114) and radius 14 then Sets a single blue pixel at (371, 241).
; PLAN: r0=320(x), r1=114(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=241(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 114
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 241
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
