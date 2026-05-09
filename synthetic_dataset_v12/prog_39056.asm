; DESCRIPTION: Composite: Sets a single yellow pixel at (18, 81) then Creates a purple circular shape at (246, 172) with radius 25 then Renders a purple line between points (140, 18) and (321, 236).
; PLAN: r0=18(x), r1=81(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=172(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x1), r11=18(y1), r12=321(x2), r13=236(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 81
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 246
LDI r6, 172
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 18
LDI r12, 321
LDI r13, 236
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
