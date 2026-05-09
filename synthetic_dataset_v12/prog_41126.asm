; DESCRIPTION: Composite: Draws a blue circle centered at (90, 201) with radius 10 then Creates a black rectangular region at (194, 89) spanning 44 by 64 pixels then Draws a red line from (40, 36) to (126, 115).
; PLAN: r0=90(x), r1=201(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=89(y), r7=44(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x1), r11=36(y1), r12=126(x2), r13=115(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 201
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 89
LDI r7, 44
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 36
LDI r12, 126
LDI r13, 115
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
