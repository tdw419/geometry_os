; DESCRIPTION: Composite: Draws a black line from (112, 67) to (211, 218) then Draws a blue circle centered at (419, 153) with radius 75 then Sets a single blue pixel at (332, 130).
; PLAN: r0=112(x1), r1=67(y1), r2=211(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=153(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x), r11=130(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 67
LDI r2, 211
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 153
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 130
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
