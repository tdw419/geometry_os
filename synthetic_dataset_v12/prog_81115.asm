; DESCRIPTION: Composite: Renders a purple line between points (104, 206) and (483, 142) then Sets a single purple pixel at (441, 103).
; PLAN: r0=104(x1), r1=206(y1), r2=483(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=103(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 104
LDI r1, 206
LDI r2, 483
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 103
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
