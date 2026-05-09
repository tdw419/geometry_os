; DESCRIPTION: Composite: Renders a purple line between points (289, 255) and (358, 107) then Sets a single blue pixel at (98, 192).
; PLAN: r0=289(x1), r1=255(y1), r2=358(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=192(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 255
LDI r2, 358
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 192
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
