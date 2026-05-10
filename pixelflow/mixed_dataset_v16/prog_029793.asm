; DESCRIPTION: Composite: Sets a single orange pixel at (179, 124) then Places a black line segment connecting (457, 213) to (417, 179) then Places a green circle of radius 53 at center (387, 129).
; PLAN: r0=179(x), r1=124(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=213(y1), r7=417(x2), r8=179(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=129(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 124
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 457
LDI r6, 213
LDI r7, 417
LDI r8, 179
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 129
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
