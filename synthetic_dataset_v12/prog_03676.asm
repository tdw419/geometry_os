; DESCRIPTION: Composite: Places a black line segment connecting (251, 105) to (408, 169) then Places a purple dot at position (169, 191) then Places a green circle of radius 22 at center (410, 124).
; PLAN: r0=251(x1), r1=105(y1), r2=408(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=191(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=410(x), r11=124(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 105
LDI r2, 408
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 191
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 410
LDI r11, 124
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
