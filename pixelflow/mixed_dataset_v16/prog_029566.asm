; DESCRIPTION: Composite: Places a red line segment connecting (130, 70) to (179, 29) then Places a red circle of radius 22 at center (347, 145).
; PLAN: r0=130(x1), r1=70(y1), r2=179(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=145(y), r7=22(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 70
LDI r2, 179
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 145
LDI r7, 22
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
