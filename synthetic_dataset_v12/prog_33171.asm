; DESCRIPTION: Composite: Sets a single black pixel at (270, 133) then Draws a red line from (286, 232) to (145, 253) then Creates a purple circular shape at (89, 80) with radius 74.
; PLAN: r0=270(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=286(x1), r6=232(y1), r7=145(x2), r8=253(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=80(y), r12=74(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 286
LDI r6, 232
LDI r7, 145
LDI r8, 253
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 80
LDI r12, 74
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
