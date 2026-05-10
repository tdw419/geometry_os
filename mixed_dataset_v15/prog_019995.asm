; DESCRIPTION: Composite: Renders a yellow line between points (230, 86) and (179, 5) then Sets a single yellow pixel at (478, 48) then Places a purple circle of radius 39 at center (127, 87).
; PLAN: r0=230(x1), r1=86(y1), r2=179(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=48(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=87(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 86
LDI r2, 179
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 48
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 127
LDI r11, 87
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
