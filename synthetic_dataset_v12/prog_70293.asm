; DESCRIPTION: Composite: Places a white line segment connecting (338, 112) to (428, 218) then Places a purple dot at position (163, 246) then Places a cyan circle of radius 65 at center (360, 96).
; PLAN: r0=338(x1), r1=112(y1), r2=428(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=246(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=360(x), r11=96(y), r12=65(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 338
LDI r1, 112
LDI r2, 428
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 246
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 360
LDI r11, 96
LDI r12, 65
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
