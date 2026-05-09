; DESCRIPTION: Composite: Draws a blue line from (112, 71) to (250, 4) then Sets a single blue pixel at (38, 112) then Draws a red circle centered at (273, 131) with radius 66.
; PLAN: r0=112(x1), r1=71(y1), r2=250(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=112(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=273(x), r11=131(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 71
LDI r2, 250
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 112
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 273
LDI r11, 131
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
