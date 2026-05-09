; DESCRIPTION: Composite: Places a black line segment connecting (438, 68) to (158, 254) then Renders a purple disk with center (369, 134) and radius 80.
; PLAN: r0=438(x1), r1=68(y1), r2=158(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=134(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 68
LDI r2, 158
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 134
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
