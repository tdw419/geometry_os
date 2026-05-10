; DESCRIPTION: Composite: Draws a blue line from (507, 211) to (453, 128) then Sets a single red pixel at (201, 101) then Renders a orange disk with center (244, 123) and radius 44.
; PLAN: r0=507(x1), r1=211(y1), r2=453(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=244(x), r11=123(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 507
LDI r1, 211
LDI r2, 453
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 244
LDI r11, 123
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
