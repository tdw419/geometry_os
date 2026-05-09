; DESCRIPTION: Composite: Draws a purple line from (417, 43) to (295, 165) then Sets a single blue pixel at (140, 53).
; PLAN: r0=417(x1), r1=43(y1), r2=295(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=53(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 43
LDI r2, 295
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 53
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
