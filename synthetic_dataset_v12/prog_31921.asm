; DESCRIPTION: Composite: Places a yellow circle of radius 66 at center (408, 100) then Sets a single purple pixel at (20, 115) then Draws a purple line from (411, 127) to (112, 47).
; PLAN: r0=408(x), r1=100(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=115(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=411(x1), r11=127(y1), r12=112(x2), r13=47(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 100
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 115
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 411
LDI r11, 127
LDI r12, 112
LDI r13, 47
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
