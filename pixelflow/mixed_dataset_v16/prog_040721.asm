; DESCRIPTION: Composite: Renders a black disk with center (471, 142) and radius 19 then Renders a purple line between points (63, 217) and (264, 46) then Sets a single yellow pixel at (307, 13).
; PLAN: r0=471(x), r1=142(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x1), r6=217(y1), r7=264(x2), r8=46(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=307(x), r11=13(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 471
LDI r1, 142
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 217
LDI r7, 264
LDI r8, 46
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 13
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
