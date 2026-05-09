; DESCRIPTION: Composite: Places a yellow line segment connecting (186, 201) to (201, 146) then Sets a single red pixel at (73, 13) then Renders a yellow disk with center (63, 79) and radius 20.
; PLAN: r0=186(x1), r1=201(y1), r2=201(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=13(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=63(x), r11=79(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 201
LDI r2, 201
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 13
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 63
LDI r11, 79
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
