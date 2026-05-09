; DESCRIPTION: Composite: Renders a orange disk with center (120, 227) and radius 22 then Sets a single orange pixel at (483, 118) then Places a green line segment connecting (324, 89) to (254, 13).
; PLAN: r0=120(x), r1=227(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=118(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=324(x1), r11=89(y1), r12=254(x2), r13=13(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 227
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 118
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 324
LDI r11, 89
LDI r12, 254
LDI r13, 13
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
