; DESCRIPTION: Composite: Creates a white rectangular region at (194, 109) spanning 64 by 58 pixels then Renders a white line between points (315, 190) and (369, 192) then Sets a single yellow pixel at (270, 72).
; PLAN: r0=194(x), r1=109(y), r2=64(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=190(y1), r7=369(x2), r8=192(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=72(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 109
LDI r2, 64
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 190
LDI r7, 369
LDI r8, 192
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 72
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
