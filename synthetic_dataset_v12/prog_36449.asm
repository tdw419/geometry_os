; DESCRIPTION: Composite: Renders a black line between points (133, 37) and (130, 174) then Creates a black circular shape at (287, 150) with radius 27 then Sets a single yellow pixel at (438, 74).
; PLAN: r0=133(x1), r1=37(y1), r2=130(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=150(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=438(x), r11=74(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 37
LDI r2, 130
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 150
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 438
LDI r11, 74
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
