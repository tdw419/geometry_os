; DESCRIPTION: Composite: Renders a red line between points (140, 255) and (282, 57) then Sets a single green pixel at (147, 41) then Creates a yellow circular shape at (60, 124) with radius 52.
; PLAN: r0=140(x1), r1=255(y1), r2=282(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=41(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=60(x), r11=124(y), r12=52(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 255
LDI r2, 282
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 41
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 60
LDI r11, 124
LDI r12, 52
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
