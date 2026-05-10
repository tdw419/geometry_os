; DESCRIPTION: Composite: Sets a single yellow pixel at (129, 158) then Creates a purple circular shape at (194, 95) with radius 38 then Draws a yellow line from (163, 88) to (441, 130).
; PLAN: r0=129(x), r1=158(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=95(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x1), r11=88(y1), r12=441(x2), r13=130(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 158
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 95
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 88
LDI r12, 441
LDI r13, 130
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
