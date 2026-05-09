; DESCRIPTION: Composite: Places a yellow line segment connecting (158, 200) to (188, 222) then Renders a orange disk with center (91, 136) and radius 41 then Sets a single red pixel at (176, 227).
; PLAN: r0=158(x1), r1=200(y1), r2=188(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=136(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x), r11=227(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 200
LDI r2, 188
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 136
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 227
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
