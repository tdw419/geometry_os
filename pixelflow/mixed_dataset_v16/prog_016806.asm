; DESCRIPTION: Composite: Sets a single yellow pixel at (351, 56) then Places a purple circle of radius 17 at center (293, 127) then Renders a green line between points (72, 97) and (463, 86).
; PLAN: r0=351(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=127(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x1), r11=97(y1), r12=463(x2), r13=86(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 293
LDI r6, 127
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 97
LDI r12, 463
LDI r13, 86
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
