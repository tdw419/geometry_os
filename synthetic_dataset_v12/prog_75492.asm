; DESCRIPTION: Composite: Places a yellow circle of radius 36 at center (270, 97) then Places a yellow line segment connecting (128, 174) to (418, 119) then Places a yellow dot at position (351, 85).
; PLAN: r0=270(x), r1=97(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x1), r6=174(y1), r7=418(x2), r8=119(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=85(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 97
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 174
LDI r7, 418
LDI r8, 119
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 85
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
