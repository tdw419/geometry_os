; DESCRIPTION: Composite: Creates a purple circular shape at (273, 176) with radius 79 then Sets a single yellow pixel at (38, 94) then Places a red line segment connecting (111, 178) to (312, 66).
; PLAN: r0=273(x), r1=176(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=94(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=111(x1), r11=178(y1), r12=312(x2), r13=66(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 176
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 94
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 111
LDI r11, 178
LDI r12, 312
LDI r13, 66
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
