; DESCRIPTION: Composite: Renders a magenta line between points (163, 45) and (124, 96) then Sets a single yellow pixel at (511, 105) then Draws a blue circle centered at (150, 75) with radius 46.
; PLAN: r0=163(x1), r1=45(y1), r2=124(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=105(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=150(x), r11=75(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 45
LDI r2, 124
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 105
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 150
LDI r11, 75
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
