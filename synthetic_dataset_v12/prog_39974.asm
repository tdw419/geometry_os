; DESCRIPTION: Composite: Places a red line segment connecting (22, 147) to (141, 227) then Places a white circle of radius 60 at center (318, 185).
; PLAN: r0=22(x1), r1=147(y1), r2=141(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=185(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 147
LDI r2, 141
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 185
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
