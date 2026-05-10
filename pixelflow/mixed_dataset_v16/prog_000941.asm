; DESCRIPTION: Composite: Places a green line segment connecting (81, 200) to (288, 19) then Sets a single white pixel at (490, 89) then Creates a green circular shape at (273, 74) with radius 38.
; PLAN: r0=81(x1), r1=200(y1), r2=288(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=89(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=273(x), r11=74(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 200
LDI r2, 288
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 89
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 273
LDI r11, 74
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
