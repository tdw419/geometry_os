; DESCRIPTION: Composite: Places a white line segment connecting (436, 147) to (417, 14) then Places a yellow circle of radius 23 at center (439, 123).
; PLAN: r0=436(x1), r1=147(y1), r2=417(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=123(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 436
LDI r1, 147
LDI r2, 417
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 123
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
