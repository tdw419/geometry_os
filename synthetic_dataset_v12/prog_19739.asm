; DESCRIPTION: Composite: Renders a white line between points (309, 187) and (43, 192) then Sets a single yellow pixel at (373, 85).
; PLAN: r0=309(x1), r1=187(y1), r2=43(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=85(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 187
LDI r2, 43
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 85
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
