; DESCRIPTION: Composite: Sets a single yellow pixel at (444, 251) then Places a yellow line segment connecting (116, 163) to (201, 1) then Renders a yellow disk with center (453, 56) and radius 17.
; PLAN: r0=444(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=116(x1), r6=163(y1), r7=201(x2), r8=1(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=453(x), r11=56(y), r12=17(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 116
LDI r6, 163
LDI r7, 201
LDI r8, 1
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 56
LDI r12, 17
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
