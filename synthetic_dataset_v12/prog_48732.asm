; DESCRIPTION: Composite: Renders a purple line between points (51, 115) and (316, 226) then Sets a single blue pixel at (68, 242).
; PLAN: r0=51(x1), r1=115(y1), r2=316(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=242(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 115
LDI r2, 316
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 242
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
