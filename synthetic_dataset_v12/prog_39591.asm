; DESCRIPTION: Composite: Creates a yellow rectangular region at (205, 140) spanning 112 by 110 pixels then Sets a single purple pixel at (379, 199) then Draws a purple line from (449, 137) to (285, 79).
; PLAN: r0=205(x), r1=140(y), r2=112(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=199(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=449(x1), r11=137(y1), r12=285(x2), r13=79(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 140
LDI r2, 112
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 199
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 449
LDI r11, 137
LDI r12, 285
LDI r13, 79
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
