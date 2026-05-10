; DESCRIPTION: Composite: Sets a single black pixel at (85, 242) then Renders a blue line between points (96, 135) and (339, 48) then Renders a blue disk with center (250, 201) and radius 44.
; PLAN: r0=85(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=135(y1), r7=339(x2), r8=48(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=201(y), r12=44(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 96
LDI r6, 135
LDI r7, 339
LDI r8, 48
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 201
LDI r12, 44
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
