; DESCRIPTION: Composite: Renders a green line between points (322, 200) and (195, 11) then Creates a black circular shape at (328, 101) with radius 29.
; PLAN: r0=322(x1), r1=200(y1), r2=195(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=101(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 200
LDI r2, 195
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 101
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
