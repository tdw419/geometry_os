; DESCRIPTION: Composite: Sets a single blue pixel at (65, 80) then Renders a white line between points (450, 51) and (505, 106) then Draws a white circle centered at (201, 177) with radius 13.
; PLAN: r0=65(x), r1=80(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=450(x1), r6=51(y1), r7=505(x2), r8=106(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=201(x), r11=177(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 80
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 450
LDI r6, 51
LDI r7, 505
LDI r8, 106
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 177
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
