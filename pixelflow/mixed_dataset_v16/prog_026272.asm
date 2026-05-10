; DESCRIPTION: Composite: Renders a cyan line between points (238, 255) and (136, 84) then Creates a purple circular shape at (248, 118) with radius 58 then Sets a single blue pixel at (463, 141).
; PLAN: r0=238(x1), r1=255(y1), r2=136(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=118(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x), r11=141(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 255
LDI r2, 136
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 118
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 141
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
