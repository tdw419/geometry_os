; DESCRIPTION: Composite: Places a purple line segment connecting (246, 213) to (195, 19) then Sets a single yellow pixel at (37, 184).
; PLAN: r0=246(x1), r1=213(y1), r2=195(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=184(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 246
LDI r1, 213
LDI r2, 195
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 184
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
