; DESCRIPTION: Composite: Renders a black disk with center (279, 122) and radius 30 then Draws a red line from (287, 147) to (75, 200).
; PLAN: r0=279(x), r1=122(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x1), r6=147(y1), r7=75(x2), r8=200(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 122
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 147
LDI r7, 75
LDI r8, 200
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
