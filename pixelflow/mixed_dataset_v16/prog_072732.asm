; DESCRIPTION: Composite: Renders a purple line between points (470, 140) and (278, 17) then Places a yellow dot at position (350, 133).
; PLAN: r0=470(x1), r1=140(y1), r2=278(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 140
LDI r2, 278
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
