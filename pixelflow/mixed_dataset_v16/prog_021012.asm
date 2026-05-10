; DESCRIPTION: Composite: Places a white dot at position (351, 212) then Places a red line segment connecting (402, 80) to (173, 104) then Places a green circle of radius 38 at center (334, 107).
; PLAN: r0=351(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=402(x1), r6=80(y1), r7=173(x2), r8=104(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=107(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 80
LDI r7, 173
LDI r8, 104
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 107
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
