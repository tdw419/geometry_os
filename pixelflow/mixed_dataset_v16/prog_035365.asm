; DESCRIPTION: Composite: Places a yellow circle of radius 75 at center (301, 115) then Sets a single yellow pixel at (356, 252) then Places a orange line segment connecting (339, 61) to (90, 249).
; PLAN: r0=301(x), r1=115(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=252(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=339(x1), r11=61(y1), r12=90(x2), r13=249(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 115
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 252
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 339
LDI r11, 61
LDI r12, 90
LDI r13, 249
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
