; DESCRIPTION: Composite: Places a purple dot at position (410, 199) then Renders a black line between points (147, 236) and (96, 40) then Creates a purple circular shape at (226, 96) with radius 54.
; PLAN: r0=410(x), r1=199(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=236(y1), r7=96(x2), r8=40(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=226(x), r11=96(y), r12=54(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 199
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 236
LDI r7, 96
LDI r8, 40
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 96
LDI r12, 54
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
