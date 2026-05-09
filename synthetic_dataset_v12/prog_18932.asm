; DESCRIPTION: Composite: Places a green circle of radius 10 at center (332, 158) then Renders a yellow line between points (87, 30) and (389, 141).
; PLAN: r0=332(x), r1=158(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=30(y1), r7=389(x2), r8=141(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 158
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 30
LDI r7, 389
LDI r8, 141
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
