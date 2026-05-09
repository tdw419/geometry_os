; DESCRIPTION: Composite: Renders a red line between points (249, 60) and (293, 84) then Creates a black rectangular region at (226, 1) spanning 38 by 13 pixels then Sets a single yellow pixel at (476, 175).
; PLAN: r0=249(x1), r1=60(y1), r2=293(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=1(y), r7=38(width), r8=13(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=476(x), r11=175(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 249
LDI r1, 60
LDI r2, 293
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 1
LDI r7, 38
LDI r8, 13
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 175
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
