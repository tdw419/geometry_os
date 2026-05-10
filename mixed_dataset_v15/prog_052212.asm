; DESCRIPTION: Composite: Places a red line segment connecting (335, 52) to (468, 103) then Sets a single orange pixel at (14, 90) then Creates a orange circular shape at (80, 82) with radius 36.
; PLAN: r0=335(x1), r1=52(y1), r2=468(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=90(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=80(x), r11=82(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 335
LDI r1, 52
LDI r2, 468
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 90
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 80
LDI r11, 82
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
