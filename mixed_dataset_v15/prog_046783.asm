; DESCRIPTION: Composite: Places a red line segment connecting (285, 4) to (491, 214) then Sets a single magenta pixel at (357, 160) then Renders a blue disk with center (322, 56) and radius 31.
; PLAN: r0=285(x1), r1=4(y1), r2=491(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=160(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=56(y), r12=31(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 4
LDI r2, 491
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 160
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 322
LDI r11, 56
LDI r12, 31
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
