; DESCRIPTION: Composite: Renders a orange line between points (55, 127) and (393, 223) then Sets a single purple pixel at (246, 211).
; PLAN: r0=55(x1), r1=127(y1), r2=393(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=211(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 127
LDI r2, 393
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 211
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
