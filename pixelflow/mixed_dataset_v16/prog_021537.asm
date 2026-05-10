; DESCRIPTION: Composite: Renders a blue line between points (201, 205) and (265, 222) then Sets a single black pixel at (438, 23) then Renders a purple disk with center (83, 103) and radius 34.
; PLAN: r0=201(x1), r1=205(y1), r2=265(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=23(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=103(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 205
LDI r2, 265
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 23
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 83
LDI r11, 103
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
