; DESCRIPTION: Composite: Renders a purple line between points (332, 186) and (161, 130) then Sets a single yellow pixel at (469, 200) then Renders a purple disk with center (136, 150) and radius 51.
; PLAN: r0=332(x1), r1=186(y1), r2=161(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=136(x), r11=150(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 332
LDI r1, 186
LDI r2, 161
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 136
LDI r11, 150
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
