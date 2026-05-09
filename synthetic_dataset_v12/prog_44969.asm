; DESCRIPTION: Composite: Sets a single black pixel at (400, 220) then Draws a cyan line from (385, 109) to (431, 160) then Creates a purple circular shape at (216, 156) with radius 14.
; PLAN: r0=400(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=109(y1), r7=431(x2), r8=160(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=156(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 220
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 385
LDI r6, 109
LDI r7, 431
LDI r8, 160
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 156
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
