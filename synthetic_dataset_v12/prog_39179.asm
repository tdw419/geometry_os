; DESCRIPTION: Composite: Renders a blue line between points (182, 96) and (362, 165) then Sets a single yellow pixel at (490, 112) then Creates a blue circular shape at (385, 77) with radius 65.
; PLAN: r0=182(x1), r1=96(y1), r2=362(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=112(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=77(y), r12=65(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 96
LDI r2, 362
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 112
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 385
LDI r11, 77
LDI r12, 65
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
