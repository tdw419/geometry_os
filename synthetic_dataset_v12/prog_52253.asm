; DESCRIPTION: Composite: Places a black line segment connecting (368, 133) to (201, 45) then Places a red circle of radius 46 at center (302, 145).
; PLAN: r0=368(x1), r1=133(y1), r2=201(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=145(y), r7=46(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 133
LDI r2, 201
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 145
LDI r7, 46
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
