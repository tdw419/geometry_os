; DESCRIPTION: Composite: Renders a orange disk with center (331, 162) and radius 53 then Places a orange line segment connecting (189, 226) to (448, 169) then Sets a single green pixel at (66, 52).
; PLAN: r0=331(x), r1=162(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=226(y1), r7=448(x2), r8=169(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=52(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 162
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 226
LDI r7, 448
LDI r8, 169
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 52
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
