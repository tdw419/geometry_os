; DESCRIPTION: Composite: Places a yellow circle of radius 44 at center (355, 49) then Sets a single red pixel at (30, 183) then Places a purple line segment connecting (412, 122) to (11, 220).
; PLAN: r0=355(x), r1=49(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=183(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=412(x1), r11=122(y1), r12=11(x2), r13=220(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 49
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 183
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 412
LDI r11, 122
LDI r12, 11
LDI r13, 220
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
