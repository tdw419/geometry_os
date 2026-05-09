; DESCRIPTION: Composite: Draws a white line from (225, 191) to (273, 43) then Sets a single purple pixel at (397, 141).
; PLAN: r0=225(x1), r1=191(y1), r2=273(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=141(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 191
LDI r2, 273
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 141
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
