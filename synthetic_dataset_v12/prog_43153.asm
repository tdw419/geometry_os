; DESCRIPTION: Composite: Draws a white line from (0, 119) to (230, 201) then Creates a blue circular shape at (468, 169) with radius 39.
; PLAN: r0=0(x1), r1=119(y1), r2=230(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=169(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 119
LDI r2, 230
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 169
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
