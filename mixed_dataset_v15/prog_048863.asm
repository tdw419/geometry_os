; DESCRIPTION: Composite: Renders a yellow disk with center (196, 91) and radius 68 then Sets a single black pixel at (83, 84) then Renders a blue line between points (484, 254) and (439, 199).
; PLAN: r0=196(x), r1=91(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=84(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=484(x1), r11=254(y1), r12=439(x2), r13=199(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 91
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 84
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 484
LDI r11, 254
LDI r12, 439
LDI r13, 199
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
