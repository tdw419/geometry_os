; DESCRIPTION: Composite: Renders a black line between points (311, 194) and (194, 151) then Sets a single red pixel at (358, 192) then Places a cyan circle of radius 43 at center (316, 191).
; PLAN: r0=311(x1), r1=194(y1), r2=194(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=191(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 311
LDI r1, 194
LDI r2, 194
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 316
LDI r11, 191
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
