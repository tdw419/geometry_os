; DESCRIPTION: Composite: Renders a purple line between points (246, 183) and (133, 63) then Sets a single blue pixel at (499, 45).
; PLAN: r0=246(x1), r1=183(y1), r2=133(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=45(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 246
LDI r1, 183
LDI r2, 133
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 45
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
