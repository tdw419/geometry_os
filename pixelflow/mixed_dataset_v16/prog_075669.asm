; DESCRIPTION: Composite: Places a blue line segment connecting (483, 237) to (14, 226) then Sets a single magenta pixel at (1, 216) then Creates a magenta circular shape at (183, 56) with radius 12.
; PLAN: r0=483(x1), r1=237(y1), r2=14(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=216(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=56(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 483
LDI r1, 237
LDI r2, 14
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 216
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 183
LDI r11, 56
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
