; DESCRIPTION: Composite: Renders a purple disk with center (400, 112) and radius 45 then Places a red line segment connecting (278, 101) to (264, 85).
; PLAN: r0=400(x), r1=112(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x1), r6=101(y1), r7=264(x2), r8=85(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 112
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 101
LDI r7, 264
LDI r8, 85
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
