; DESCRIPTION: Composite: Draws a purple line from (441, 57) to (99, 217) then Sets a single green pixel at (235, 176).
; PLAN: r0=441(x1), r1=57(y1), r2=99(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=176(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 57
LDI r2, 99
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 176
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
