; DESCRIPTION: Composite: Draws a blue circle centered at (186, 163) with radius 31 then Draws a black line from (332, 107) to (390, 83).
; PLAN: r0=186(x), r1=163(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=107(y1), r7=390(x2), r8=83(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 163
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 107
LDI r7, 390
LDI r8, 83
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
