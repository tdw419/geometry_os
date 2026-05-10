; DESCRIPTION: Composite: Places a blue circle of radius 35 at center (325, 64) then Places a blue dot at position (269, 77).
; PLAN: r0=325(x), r1=64(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=77(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 64
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 77
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
