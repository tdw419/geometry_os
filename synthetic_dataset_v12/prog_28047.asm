; DESCRIPTION: Composite: Renders a red line between points (263, 60) and (450, 104) then Sets a single white pixel at (14, 184) then Renders a blue disk with center (477, 179) and radius 20.
; PLAN: r0=263(x1), r1=60(y1), r2=450(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=184(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=477(x), r11=179(y), r12=20(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 263
LDI r1, 60
LDI r2, 450
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 184
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 477
LDI r11, 179
LDI r12, 20
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
