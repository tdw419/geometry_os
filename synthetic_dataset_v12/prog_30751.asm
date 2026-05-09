; DESCRIPTION: Composite: Draws a green line from (338, 109) to (379, 227) then Sets a single blue pixel at (124, 132) then Creates a yellow rectangular region at (373, 106) spanning 20 by 59 pixels.
; PLAN: r0=338(x1), r1=109(y1), r2=379(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=132(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=106(y), r12=20(width), r13=59(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 109
LDI r2, 379
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 132
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 373
LDI r11, 106
LDI r12, 20
LDI r13, 59
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
