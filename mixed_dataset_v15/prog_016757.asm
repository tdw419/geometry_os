; DESCRIPTION: Composite: Creates a black circular shape at (350, 105) with radius 78 then Renders a yellow line between points (454, 202) and (31, 49).
; PLAN: r0=350(x), r1=105(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x1), r6=202(y1), r7=31(x2), r8=49(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 105
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 202
LDI r7, 31
LDI r8, 49
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
