; DESCRIPTION: Composite: Sets a single green pixel at (505, 107) then Renders a purple line between points (342, 244) and (372, 83) then Renders a black disk with center (423, 154) and radius 20.
; PLAN: r0=505(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=342(x1), r6=244(y1), r7=372(x2), r8=83(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=423(x), r11=154(y), r12=20(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 505
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 342
LDI r6, 244
LDI r7, 372
LDI r8, 83
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 154
LDI r12, 20
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
