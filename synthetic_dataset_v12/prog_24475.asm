; DESCRIPTION: Composite: Places a purple line segment connecting (27, 81) to (403, 63) then Sets a single black pixel at (343, 241).
; PLAN: r0=27(x1), r1=81(y1), r2=403(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=241(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 27
LDI r1, 81
LDI r2, 403
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 241
LDI r7, 0x000000
PSET r5, r6, r7
HALT
