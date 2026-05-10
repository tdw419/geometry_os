; DESCRIPTION: Composite: Draws a orange line from (440, 131) to (260, 14) then Creates a white circular shape at (297, 54) with radius 49 then Sets a single purple pixel at (504, 139).
; PLAN: r0=440(x1), r1=131(y1), r2=260(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=54(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x), r11=139(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 131
LDI r2, 260
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 54
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 139
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
