; DESCRIPTION: Composite: Creates a blue circular shape at (317, 139) with radius 63 then Sets a single red pixel at (316, 158) then Places a purple line segment connecting (262, 34) to (255, 128).
; PLAN: r0=317(x), r1=139(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=158(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=262(x1), r11=34(y1), r12=255(x2), r13=128(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 139
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 158
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 262
LDI r11, 34
LDI r12, 255
LDI r13, 128
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
