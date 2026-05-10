; DESCRIPTION: Composite: Renders a black disk with center (355, 60) and radius 58 then Draws a purple line from (490, 248) to (35, 104).
; PLAN: r0=355(x), r1=60(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=248(y1), r7=35(x2), r8=104(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 60
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 248
LDI r7, 35
LDI r8, 104
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
