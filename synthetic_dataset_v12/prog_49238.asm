; DESCRIPTION: Composite: Draws a purple line from (438, 18) to (171, 3) then Sets a single white pixel at (241, 37).
; PLAN: r0=438(x1), r1=18(y1), r2=171(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=37(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 438
LDI r1, 18
LDI r2, 171
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 37
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
