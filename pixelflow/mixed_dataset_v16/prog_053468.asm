; DESCRIPTION: Composite: Sets a single green pixel at (142, 19) then Renders a black line between points (329, 127) and (236, 53) then Creates a purple circular shape at (143, 172) with radius 59.
; PLAN: r0=142(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=329(x1), r6=127(y1), r7=236(x2), r8=53(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=172(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 19
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 329
LDI r6, 127
LDI r7, 236
LDI r8, 53
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 172
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
