; DESCRIPTION: Composite: Places a cyan line segment connecting (273, 251) to (334, 219) then Sets a single red pixel at (277, 16) then Places a purple circle of radius 49 at center (379, 168).
; PLAN: r0=273(x1), r1=251(y1), r2=334(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=16(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=379(x), r11=168(y), r12=49(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 251
LDI r2, 334
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 16
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 379
LDI r11, 168
LDI r12, 49
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
