; DESCRIPTION: Composite: Renders a black line between points (218, 188) and (121, 11) then Places a purple circle of radius 26 at center (189, 134) then Sets a single yellow pixel at (469, 219).
; PLAN: r0=218(x1), r1=188(y1), r2=121(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=134(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=219(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 188
LDI r2, 121
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 134
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 219
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
