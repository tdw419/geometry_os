; DESCRIPTION: Composite: Renders a green disk with center (426, 49) and radius 28 then Sets a single purple pixel at (444, 233).
; PLAN: r0=426(x), r1=49(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=233(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 49
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 233
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
