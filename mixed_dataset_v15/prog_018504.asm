; DESCRIPTION: Composite: Sets a single orange pixel at (4, 158) then Creates a purple circular shape at (177, 125) with radius 51 then Renders a yellow line between points (60, 201) and (47, 145).
; PLAN: r0=4(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=125(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x1), r11=201(y1), r12=47(x2), r13=145(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 158
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 177
LDI r6, 125
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 201
LDI r12, 47
LDI r13, 145
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
