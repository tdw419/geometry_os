; DESCRIPTION: Composite: Sets a single purple pixel at (18, 99) then Places a purple line segment connecting (414, 40) to (498, 145) then Creates a purple circular shape at (456, 151) with radius 52.
; PLAN: r0=18(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=40(y1), r7=498(x2), r8=145(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=151(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 40
LDI r7, 498
LDI r8, 145
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 151
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
