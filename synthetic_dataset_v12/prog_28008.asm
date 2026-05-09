; DESCRIPTION: Composite: Places a yellow circle of radius 61 at center (247, 140) then Sets a single orange pixel at (338, 54) then Places a blue line segment connecting (208, 192) to (221, 79).
; PLAN: r0=247(x), r1=140(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=208(x1), r11=192(y1), r12=221(x2), r13=79(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 140
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 208
LDI r11, 192
LDI r12, 221
LDI r13, 79
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
