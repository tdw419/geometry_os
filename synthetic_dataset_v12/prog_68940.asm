; DESCRIPTION: Composite: Sets a single purple pixel at (97, 50) then Places a green line segment connecting (363, 104) to (188, 61) then Creates a white circular shape at (305, 115) with radius 74.
; PLAN: r0=97(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=363(x1), r6=104(y1), r7=188(x2), r8=61(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=115(y), r12=74(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 104
LDI r7, 188
LDI r8, 61
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 115
LDI r12, 74
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
