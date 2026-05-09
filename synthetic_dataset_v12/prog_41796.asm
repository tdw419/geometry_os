; DESCRIPTION: Composite: Places a red line segment connecting (271, 62) to (158, 87) then Places a black circle of radius 40 at center (448, 147).
; PLAN: r0=271(x1), r1=62(y1), r2=158(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=147(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 62
LDI r2, 158
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 147
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
